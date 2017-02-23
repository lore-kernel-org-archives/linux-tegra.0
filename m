From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 2/5] clk: tegra: define Tegra210 DMIC sync clocks
Date: Thu, 23 Feb 2017 14:39:36 +0200
Message-ID: <1487853585-17934-3-git-send-email-pdeschrijver@nvidia.com>
References: <1487853585-17934-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487853585-17934-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 has 3 DMIC inputs which can be clocked from the recovered clock
of several other audio inputs (eg. i2s0, i2s1, ...). To model this, we add
a 3 new clocks similar to the audio* clocks which handle the same function
for the i2s and spdif clocks.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-id.h               |  8 ++-
 drivers/clk/tegra/clk-tegra-audio.c      | 85 +++++++++++++++++++++++---------
 drivers/clk/tegra/clk-tegra210.c         |  6 +++
 include/dt-bindings/clock/tegra210-car.h |  9 +++-
 4 files changed, 82 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index fc978b2..ab9b347 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -307,8 +307,14 @@ enum clk_id {
 	tegra_clk_xusb_ssp_src,
 	tegra_clk_sclk_mux,
 	tegra_clk_sor_safe,
-	tegra_clk_ispa,
 	tegra_clk_cec,
+	tegra_clk_ispa,
+	tegra_clk_dmic1_sync_clk,
+	tegra_clk_dmic2_sync_clk,
+	tegra_clk_dmic3_sync_clk,
+	tegra_clk_dmic1_sync_clk_mux,
+	tegra_clk_dmic2_sync_clk_mux,
+	tegra_clk_dmic3_sync_clk_mux,
 	tegra_clk_max,
 };
 
diff --git a/drivers/clk/tegra/clk-tegra-audio.c b/drivers/clk/tegra/clk-tegra-audio.c
index e2bfa9b..b4da6e0 100644
--- a/drivers/clk/tegra/clk-tegra-audio.c
+++ b/drivers/clk/tegra/clk-tegra-audio.c
@@ -31,6 +31,9 @@
 #define AUDIO_SYNC_CLK_I2S3 0x4ac
 #define AUDIO_SYNC_CLK_I2S4 0x4b0
 #define AUDIO_SYNC_CLK_SPDIF 0x4b4
+#define AUDIO_SYNC_CLK_DMIC1 0x560
+#define AUDIO_SYNC_CLK_DMIC2 0x564
+#define AUDIO_SYNC_CLK_DMIC3 0x6b8
 
 #define AUDIO_SYNC_DOUBLER 0x49c
 
@@ -91,8 +94,14 @@ struct tegra_audio2x_clk_initdata {
 
 static DEFINE_SPINLOCK(clk_doubler_lock);
 
-static const char *mux_audio_sync_clk[] = { "spdif_in_sync", "i2s0_sync",
-	"i2s1_sync", "i2s2_sync", "i2s3_sync", "i2s4_sync", "vimclk_sync",
+static const char * const mux_audio_sync_clk[] = { "spdif_in_sync",
+	"i2s0_sync", "i2s1_sync", "i2s2_sync", "i2s3_sync", "i2s4_sync",
+	"pll_a_out0", "vimclk_sync",
+};
+
+static const char * const mux_dmic_sync_clk[] = { "unused", "i2s0_sync",
+	"i2s1_sync", "i2s2_sync", "i2s3_sync", "i2s4_sync", "pll_a_out0",
+	"vimclk_sync",
 };
 
 static struct tegra_sync_source_initdata sync_source_clks[] __initdata = {
@@ -114,6 +123,12 @@ struct tegra_audio2x_clk_initdata {
 	AUDIO(spdif, AUDIO_SYNC_CLK_SPDIF),
 };
 
+static struct tegra_audio_clk_initdata dmic_clks[] = {
+	AUDIO(dmic1_sync_clk, AUDIO_SYNC_CLK_DMIC1),
+	AUDIO(dmic2_sync_clk, AUDIO_SYNC_CLK_DMIC2),
+	AUDIO(dmic3_sync_clk, AUDIO_SYNC_CLK_DMIC3),
+};
+
 static struct tegra_audio2x_clk_initdata audio2x_clks[] = {
 	AUDIO2X(audio0, 113, 24),
 	AUDIO2X(audio1, 114, 25),
@@ -123,6 +138,41 @@ struct tegra_audio2x_clk_initdata {
 	AUDIO2X(spdif, 118, 29),
 };
 
+static void __init tegra_audio_sync_clk_init(void __iomem *clk_base,
+				      struct tegra_clk *tegra_clks,
+				      struct tegra_audio_clk_initdata *sync,
+				      int num_sync_clks,
+				      const char **mux_names,
+				      int num_mux_inputs)
+{
+	struct clk *clk;
+	struct clk **dt_clk;
+	struct tegra_audio_clk_initdata *data;
+	int i;
+
+	for (i = 0, data = sync; i < num_sync_clks; i++, data++) {
+		dt_clk = tegra_lookup_dt_id(data->mux_clk_id, tegra_clks);
+		if (!dt_clk)
+			continue;
+
+		clk = clk_register_mux(NULL, data->mux_name, mux_names,
+					num_mux_inputs,
+					CLK_SET_RATE_NO_REPARENT,
+					clk_base + data->offset, 0, 3, 0,
+					NULL);
+		*dt_clk = clk;
+
+		dt_clk = tegra_lookup_dt_id(data->gate_clk_id, tegra_clks);
+		if (!dt_clk)
+			continue;
+
+		clk = clk_register_gate(NULL, data->gate_name, data->mux_name,
+					0, clk_base + data->offset, 4,
+					CLK_GATE_SET_TO_DISABLE, NULL);
+		*dt_clk = clk;
+	}
+}
+
 void __init tegra_audio_clk_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
 			struct tegra_audio_clk_info *audio_info,
@@ -176,30 +226,17 @@ void __init tegra_audio_clk_init(void __iomem *clk_base,
 		*dt_clk = clk;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(audio_clks); i++) {
-		struct tegra_audio_clk_initdata *data;
+	tegra_audio_sync_clk_init(clk_base, tegra_clks, audio_clks,
+				  ARRAY_SIZE(audio_clks), mux_audio_sync_clk,
+				  ARRAY_SIZE(mux_audio_sync_clk));
 
-		data = &audio_clks[i];
-		dt_clk = tegra_lookup_dt_id(data->mux_clk_id, tegra_clks);
+	/* make sure the DMIC sync clocks have a valid parent */
+	for (i = 0; i < ARRAY_SIZE(dmic_clks); i++)
+		writel_relaxed(1, clk_base + dmic_clks[i].offset);
 
-		if (!dt_clk)
-			continue;
-		clk = clk_register_mux(NULL, data->mux_name, mux_audio_sync_clk,
-					ARRAY_SIZE(mux_audio_sync_clk),
-					CLK_SET_RATE_NO_REPARENT,
-					clk_base + data->offset, 0, 3, 0,
-					NULL);
-		*dt_clk = clk;
-
-		dt_clk = tegra_lookup_dt_id(data->gate_clk_id, tegra_clks);
-		if (!dt_clk)
-			continue;
-
-		clk = clk_register_gate(NULL, data->gate_name, data->mux_name,
-					0, clk_base + data->offset, 4,
-					CLK_GATE_SET_TO_DISABLE, NULL);
-		*dt_clk = clk;
-	}
+	tegra_audio_sync_clk_init(clk_base, tegra_clks, dmic_clks,
+				  ARRAY_SIZE(dmic_clks), mux_dmic_sync_clk,
+				  ARRAY_SIZE(mux_dmic_sync_clk));
 
 	for (i = 0; i < ARRAY_SIZE(audio2x_clks); i++) {
 		struct tegra_audio2x_clk_initdata *data;
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index bdb296a..ca63901 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2223,6 +2223,12 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	[tegra_clk_pll_a1] = { .dt_id = TEGRA210_CLK_PLL_A1, .present = true },
 	[tegra_clk_ispa] = { .dt_id = TEGRA210_CLK_ISPA, .present = true },
 	[tegra_clk_cec] = { .dt_id = TEGRA210_CLK_CEC, .present = true },
+	[tegra_clk_dmic1_sync_clk] = { .dt_id = TEGRA210_CLK_DMIC1_SYNC_CLK, .present = true },
+	[tegra_clk_dmic2_sync_clk] = { .dt_id = TEGRA210_CLK_DMIC2_SYNC_CLK, .present = true },
+	[tegra_clk_dmic3_sync_clk] = { .dt_id = TEGRA210_CLK_DMIC3_SYNC_CLK, .present = true },
+	[tegra_clk_dmic1_sync_clk_mux] = { .dt_id = TEGRA210_CLK_DMIC1_SYNC_CLK_MUX, .present = true },
+	[tegra_clk_dmic2_sync_clk_mux] = { .dt_id = TEGRA210_CLK_DMIC2_SYNC_CLK_MUX, .present = true },
+	[tegra_clk_dmic3_sync_clk_mux] = { .dt_id = TEGRA210_CLK_DMIC3_SYNC_CLK_MUX, .present = true },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index e7a2578..5aa1027 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -396,6 +396,13 @@
 #define TEGRA210_CLK_PLL_C_UD 364
 #define TEGRA210_CLK_SCLK_MUX 365
 
-#define TEGRA210_CLK_CLK_MAX 366
+#define TEGRA210_CLK_DMIC1_SYNC_CLK 388
+#define TEGRA210_CLK_DMIC1_SYNC_CLK_MUX 389
+#define TEGRA210_CLK_DMIC2_SYNC_CLK 390
+#define TEGRA210_CLK_DMIC2_SYNC_CLK_MUX 391
+#define TEGRA210_CLK_DMIC3_SYNC_CLK 392
+#define TEGRA210_CLK_DMIC3_SYNC_CLK_MUX 393
+
+#define TEGRA210_CLK_CLK_MAX 394
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA210_CAR_H */
-- 
1.9.1
