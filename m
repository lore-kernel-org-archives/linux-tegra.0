From: Andrew Bresticker <abrestic@chromium.org>
Subject: [RFC PATCH 03/10] clk: tegra: Fix xusb_hs_src clock hierarchy
Date: Wed, 14 May 2014 17:32:59 -0700
Message-ID: <1400113986-339-4-git-send-email-abrestic@chromium.org>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400113986-339-1-git-send-email-abrestic@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Mathias Nyman <mathias.nyman@intel.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>
List-Id: linux-tegra@vger.kernel.org

Currently the Tegra1x4 clock init code hard-codes the mux setting
for xusb_hs_src and treats it as a fixed-factor clock.  It is,
however, a mux which can be parented by either xusb_ss_src/2 or
pll_u_60M.  Add the fixed-factor clock xusb_ss_div2 and put an
entry in periph_clks[] for the xusb_hs_src mux.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 drivers/clk/tegra/clk-id.h               |  1 +
 drivers/clk/tegra/clk-tegra-periph.c     |  6 ++++++
 drivers/clk/tegra/clk-tegra114.c         | 15 +++++----------
 drivers/clk/tegra/clk-tegra124.c         | 15 +++++----------
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 include/dt-bindings/clock/tegra124-car.h |  3 ++-
 6 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index c39613c..0011d54 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -233,6 +233,7 @@ enum clk_id {
 	tegra_clk_xusb_hs_src,
 	tegra_clk_xusb_ss,
 	tegra_clk_xusb_ss_src,
+	tegra_clk_xusb_ss_div2,
 	tegra_clk_max,
 };
 
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index a4063bc..adf6b81 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -340,6 +340,11 @@ static u32 mux_clkm_pllre_clk32_480M_pllc_ref_idx[] = {
 	[0] = 0, [1] = 1, [2] = 3, [3] = 3, [4] = 4, [5] = 7,
 };
 
+static const char *mux_ss_60M[] = {
+	"xusb_ss_div2", "pll_u_60M"
+};
+#define mux_ss_60M_idx NULL
+
 static const char *mux_d_audio_clk[] = {
 	"pll_a_out0", "pll_p", "clk_m", "spdif_in_sync", "i2s0_sync",
 	"i2s1_sync", "i2s2_sync", "i2s3_sync", "i2s4_sync", "vimclk_sync",
@@ -501,6 +506,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	XUSB("xusb_falcon_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_FALCON_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_falcon_src),
 	XUSB("xusb_fs_src", mux_clkm_48M_pllp_480M, CLK_SOURCE_XUSB_FS_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_fs_src),
 	XUSB("xusb_ss_src", mux_clkm_pllre_clk32_480M_pllc_ref, CLK_SOURCE_XUSB_SS_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_ss_src),
+	NODIV("xusb_hs_src", mux_ss_60M, CLK_SOURCE_XUSB_SS_SRC, 25, MASK(1), 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_hs_src, NULL),
 	XUSB("xusb_dev_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_DEV_SRC, 95, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_dev_src),
 };
 
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 80431f0..841f54f 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -142,7 +142,6 @@
 #define UTMIPLL_HW_PWRDN_CFG0_IDDQ_SWCTL	BIT(0)
 
 #define CLK_SOURCE_CSITE 0x1d4
-#define CLK_SOURCE_XUSB_SS_SRC 0x610
 #define CLK_SOURCE_EMC 0x19c
 
 /* PLLM override registers */
@@ -834,6 +833,7 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_xusb_falcon_src] = { .dt_id = TEGRA114_CLK_XUSB_FALCON_SRC, .present = true },
 	[tegra_clk_xusb_fs_src] = { .dt_id = TEGRA114_CLK_XUSB_FS_SRC, .present = true },
 	[tegra_clk_xusb_ss_src] = { .dt_id = TEGRA114_CLK_XUSB_SS_SRC, .present = true },
+	[tegra_clk_xusb_ss_div2] = { .dt_id = TEGRA114_CLK_XUSB_SS_DIV2, .present = true},
 	[tegra_clk_xusb_dev_src] = { .dt_id = TEGRA114_CLK_XUSB_DEV_SRC, .present = true },
 	[tegra_clk_xusb_dev] = { .dt_id = TEGRA114_CLK_XUSB_DEV, .present = true },
 	[tegra_clk_xusb_hs_src] = { .dt_id = TEGRA114_CLK_XUSB_HS_SRC, .present = true },
@@ -1182,16 +1182,11 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
 	struct clk *clk;
-	u32 val;
-
-	/* xusb_hs_src */
-	val = readl(clk_base + CLK_SOURCE_XUSB_SS_SRC);
-	val |= BIT(25); /* always select PLLU_60M */
-	writel(val, clk_base + CLK_SOURCE_XUSB_SS_SRC);
 
-	clk = clk_register_fixed_factor(NULL, "xusb_hs_src", "pll_u_60M", 0,
-					1, 1);
-	clks[TEGRA114_CLK_XUSB_HS_SRC] = clk;
+	/* xusb_ss_div2 */
+	clk = clk_register_fixed_factor(NULL, "xusb_ss_div2", "xusb_ss_src", 0,
+					1, 2);
+	clks[TEGRA114_CLK_XUSB_SS_DIV2] = clk;
 
 	/* dsia mux */
 	clk = clk_register_mux(NULL, "dsia_mux", mux_plld_out0_plld2_out0,
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 166e02f..6cabc3d 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -30,7 +30,6 @@
 
 #define CLK_SOURCE_CSITE 0x1d4
 #define CLK_SOURCE_EMC 0x19c
-#define CLK_SOURCE_XUSB_SS_SRC 0x610
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -927,6 +926,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_xusb_falcon_src] = { .dt_id = TEGRA124_CLK_XUSB_FALCON_SRC, .present = true },
 	[tegra_clk_xusb_fs_src] = { .dt_id = TEGRA124_CLK_XUSB_FS_SRC, .present = true },
 	[tegra_clk_xusb_ss_src] = { .dt_id = TEGRA124_CLK_XUSB_SS_SRC, .present = true },
+	[tegra_clk_xusb_ss_div2] = { .dt_id = TEGRA124_CLK_XUSB_SS_DIV2, .present = true },
 	[tegra_clk_xusb_dev_src] = { .dt_id = TEGRA124_CLK_XUSB_DEV_SRC, .present = true },
 	[tegra_clk_xusb_dev] = { .dt_id = TEGRA124_CLK_XUSB_DEV, .present = true },
 	[tegra_clk_xusb_hs_src] = { .dt_id = TEGRA124_CLK_XUSB_HS_SRC, .present = true },
@@ -1108,16 +1108,11 @@ static __init void tegra124_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
 	struct clk *clk;
-	u32 val;
-
-	/* xusb_hs_src */
-	val = readl(clk_base + CLK_SOURCE_XUSB_SS_SRC);
-	val |= BIT(25); /* always select PLLU_60M */
-	writel(val, clk_base + CLK_SOURCE_XUSB_SS_SRC);
 
-	clk = clk_register_fixed_factor(NULL, "xusb_hs_src", "pll_u_60M", 0,
-					1, 1);
-	clks[TEGRA124_CLK_XUSB_HS_SRC] = clk;
+	/* xusb_ss_div2 */
+	clk = clk_register_fixed_factor(NULL, "xusb_ss_div2", "xusb_ss_src", 0,
+					1, 2);
+	clks[TEGRA124_CLK_XUSB_SS_DIV2] = clk;
 
 	/* dsia mux */
 	clk = clk_register_mux(NULL, "dsia_mux", mux_plld_out0_plld2_out0,
diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index 6d0d8d8..fc12621 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -337,6 +337,7 @@
 #define TEGRA114_CLK_CLK_OUT_3_MUX 308
 #define TEGRA114_CLK_DSIA_MUX 309
 #define TEGRA114_CLK_DSIB_MUX 310
-#define TEGRA114_CLK_CLK_MAX 311
+#define TEGRA114_CLK_XUSB_SS_DIV2 311
+#define TEGRA114_CLK_CLK_MAX 312
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA114_CAR_H */
diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
index 8c1603b..159fd44 100644
--- a/include/dt-bindings/clock/tegra124-car.h
+++ b/include/dt-bindings/clock/tegra124-car.h
@@ -336,6 +336,7 @@
 #define TEGRA124_CLK_DSIA_MUX 309
 #define TEGRA124_CLK_DSIB_MUX 310
 #define TEGRA124_CLK_SOR0_LVDS 311
-#define TEGRA124_CLK_CLK_MAX 312
+#define TEGRA124_CLK_XUSB_SS_DIV2 312
+#define TEGRA124_CLK_CLK_MAX 313
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA124_CAR_H */
-- 
1.9.1.423.g4596e3a
