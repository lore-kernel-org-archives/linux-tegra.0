From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH] clk: tegra210: Add SLCG override gate clocks
Date: Thu, 10 Mar 2016 14:38:05 -0500
Message-ID: <1457638685-31007-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Bill Huang <bilhuang@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

Add some SLCG (Second Level Clock Gating) override clocks to control
gating and un-gating their logics.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-id.h               | 16 ++++++
 drivers/clk/tegra/clk-tegra210.c         | 91 ++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/tegra210-car.h | 32 +++++------
 3 files changed, 123 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 62ea38187b71..d0b928d5b183 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -306,6 +306,22 @@ enum clk_id {
 	tegra_clk_xusb_ss_div2,
 	tegra_clk_xusb_ssp_src,
 	tegra_clk_sclk_mux,
+	tegra_clk_disp1_slcg_ovr,
+	tegra_clk_disp2_slcg_ovr,
+	tegra_clk_vi_slcg_ovr,
+	tegra_clk_ispa_slcg_ovr,
+	tegra_clk_ispb_slcg_ovr,
+	tegra_clk_nvdec_slcg_ovr,
+	tegra_clk_msenc_slcg_ovr,
+	tegra_clk_nvjpg_slcg_ovr,
+	tegra_clk_vic03_slcg_ovr,
+	tegra_clk_xusb_dev_slcg_ovr,
+	tegra_clk_xusb_host_slcg_ovr,
+	tegra_clk_d_audio_slcg_ovr,
+	tegra_clk_ape_slcg_ovr,
+	tegra_clk_sata_slcg_ovr,
+	tegra_clk_sata_slcg_ovr_ipfs,
+	tegra_clk_sata_slcg_ovr_fpci,
 	tegra_clk_max,
 };
 
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 637041fd53ad..bf5c93497ef2 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -151,6 +151,11 @@
 #define PLLDP_SS_CTRL1	0x59c
 #define PLLDP_SS_CTRL2	0x5a0
 
+#define LVL2_CLK_GATE_OVRA 0xf8
+#define LVL2_CLK_GATE_OVRC 0x3a0
+#define LVL2_CLK_GATE_OVRD 0x3a4
+#define LVL2_CLK_GATE_OVRE 0x554
+
 #define PMC_PLLM_WB0_OVERRIDE 0x1dc
 #define PMC_PLLM_WB0_OVERRIDE_2 0x2b0
 
@@ -2208,6 +2213,22 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_pll_c4_out2] = { .dt_id = TEGRA210_CLK_PLL_C4_OUT2, .present = true },
 	[tegra_clk_pll_c4_out3] = { .dt_id = TEGRA210_CLK_PLL_C4_OUT3, .present = true },
 	[tegra_clk_apb2ape] = { .dt_id = TEGRA210_CLK_APB2APE, .present = true },
+	[tegra_clk_disp1_slcg_ovr] = { .dt_id = TEGRA210_CLK_DISP1_SLCG_OVR, .present = true },
+	[tegra_clk_disp2_slcg_ovr] = { .dt_id = TEGRA210_CLK_DISP2_SLCG_OVR, .present = true },
+	[tegra_clk_vi_slcg_ovr] = { .dt_id = TEGRA210_CLK_VI_SLCG_OVR, .present = true },
+	[tegra_clk_ispa_slcg_ovr] = { .dt_id = TEGRA210_CLK_ISPA_SLCG_OVR, .present = true },
+	[tegra_clk_ispb_slcg_ovr] = { .dt_id = TEGRA210_CLK_ISPB_SLCG_OVR, .present = true },
+	[tegra_clk_nvdec_slcg_ovr] = { .dt_id = TEGRA210_CLK_NVDEC_SLCG_OVR, .present = true },
+	[tegra_clk_msenc_slcg_ovr] = { .dt_id = TEGRA210_CLK_MSENC_SLCG_OVR, .present = true },
+	[tegra_clk_nvjpg_slcg_ovr] = { .dt_id = TEGRA210_CLK_NVJPG_SLCG_OVR, .present = true },
+	[tegra_clk_vic03_slcg_ovr] = { .dt_id = TEGRA210_CLK_VIC03_SLCG_OVR, .present = true },
+	[tegra_clk_xusb_dev_slcg_ovr] = { .dt_id = TEGRA210_CLK_XUSB_DEV_SLCG_OVR, .present = true },
+	[tegra_clk_xusb_host_slcg_ovr] = { .dt_id = TEGRA210_CLK_XUSB_HOST_SLCG_OVR, .present = true },
+	[tegra_clk_d_audio_slcg_ovr] = { .dt_id = TEGRA210_CLK_D_AUDIO_SLCG_OVR, .present = true },
+	[tegra_clk_ape_slcg_ovr] = { .dt_id = TEGRA210_CLK_APE_SLCG_OVR, .present = true },
+	[tegra_clk_sata_slcg_ovr] = { .dt_id = TEGRA210_CLK_SATA_SLCG_OVR, .present = true },
+	[tegra_clk_sata_slcg_ovr_ipfs] = { .dt_id = TEGRA210_CLK_SATA_SLCG_OVR_IPFS, .present = true },
+	[tegra_clk_sata_slcg_ovr_fpci] = { .dt_id = TEGRA210_CLK_SATA_SLCG_OVR_FPCI, .present = true },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
@@ -2768,6 +2789,75 @@ static void __init tegra210_clock_apply_init_table(void)
 	tegra_init_from_table(init_table, clks, TEGRA210_CLK_CLK_MAX);
 }
 
+static void __init tegra210_ovr_clk_init(void __iomem *clk_base)
+{
+	struct clk *clk;
+
+	clk = clk_register_gate(NULL, "disp1_slcg_ovr", "disp1", 0,
+				clk_base + LVL2_CLK_GATE_OVRA, 1, 0, NULL);
+	clks[TEGRA210_CLK_DISP1_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "disp2_slcg_ovr", "disp2", 0,
+				clk_base + LVL2_CLK_GATE_OVRA, 2, 0, NULL);
+	clks[TEGRA210_CLK_DISP2_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "vi_slcg_ovr", "vi", 0,
+				clk_base + LVL2_CLK_GATE_OVRA, 15, 0, NULL);
+	clks[TEGRA210_CLK_VI_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "ispa_slcg_ovr", "isp", 0,
+				clk_base + LVL2_CLK_GATE_OVRE, 3, 0, NULL);
+	clks[TEGRA210_CLK_ISPA_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "ispb_slcg_ovr", "ispb", 0,
+				clk_base + LVL2_CLK_GATE_OVRD, 22, 0, NULL);
+	clks[TEGRA210_CLK_ISPB_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "nvdec_slcg_ovr", "nvdec", 0,
+				clk_base + LVL2_CLK_GATE_OVRE, 31, 0, NULL);
+	clks[TEGRA210_CLK_NVDEC_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "msenc_slcg_ovr", "msenc", 0,
+				clk_base + LVL2_CLK_GATE_OVRE, 29, 0, NULL);
+	clks[TEGRA210_CLK_MSENC_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "nvjpg_slcg_ovr", "nvjpg", 0,
+				clk_base + LVL2_CLK_GATE_OVRE, 9, 0, NULL);
+	clks[TEGRA210_CLK_NVJPG_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "vic03_slcg_ovr", "vic03", 0,
+				clk_base + LVL2_CLK_GATE_OVRE, 5, 0, NULL);
+	clks[TEGRA210_CLK_VIC03_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "xusb_dev_slcg_ovr", "xusb_dev", 0,
+				clk_base + LVL2_CLK_GATE_OVRC, 31, 0, NULL);
+	clks[TEGRA210_CLK_XUSB_DEV_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "xusb_host_slcg_ovr", "xusb_host", 0,
+				clk_base + LVL2_CLK_GATE_OVRC, 30, 0, NULL);
+	clks[TEGRA210_CLK_XUSB_HOST_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "d_audio_slcg_ovr", "d_audio", 0,
+				clk_base + LVL2_CLK_GATE_OVRC, 1, 0, NULL);
+	clks[TEGRA210_CLK_D_AUDIO_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "ape_slcg_ovr", "ape", 0,
+				clk_base + LVL2_CLK_GATE_OVRE, 10, 0, NULL);
+	clks[TEGRA210_CLK_APE_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "sata_slcg_ovr", "sata", 0,
+				clk_base + LVL2_CLK_GATE_OVRC, 0, 0, NULL);
+	clks[TEGRA210_CLK_SATA_SLCG_OVR] = clk;
+
+	clk = clk_register_gate(NULL, "sata_slcg_ovr_ipfs", "sata", 0,
+				clk_base + LVL2_CLK_GATE_OVRC, 17, 0, NULL);
+	clks[TEGRA210_CLK_SATA_SLCG_OVR_IPFS] = clk;
+
+	clk = clk_register_gate(NULL, "sata_slcg_ovr_fpci", "sata", 0,
+				clk_base + LVL2_CLK_GATE_OVRC, 19, 0, NULL);
+	clks[TEGRA210_CLK_SATA_SLCG_OVR_FPCI] = clk;
+}
+
 /**
  * tegra210_clock_init - Tegra210-specific clock initialization
  * @np: struct device_node * of the DT node for the SoC CAR IP block
@@ -2818,6 +2908,7 @@ static void __init tegra210_clock_init(struct device_node *np)
 	tegra_fixed_clk_init(tegra210_clks);
 	tegra210_pll_init(clk_base, pmc_base);
 	tegra210_periph_clk_init(clk_base, pmc_base);
+	tegra210_ovr_clk_init(clk_base);
 	tegra_audio_clk_init(clk_base, pmc_base, tegra210_clks,
 			     tegra210_audio_plls,
 			     ARRAY_SIZE(tegra210_audio_plls));
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 0a05b0d36ae7..299a18537973 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -361,22 +361,22 @@
 /* 331 */
 /* 332 */
 /* 333 */
-/* 334 */
-/* 335 */
-/* 336 */
-/* 337 */
-/* 338 */
-/* 339 */
-/* 340 */
-/* 341 */
-/* 342 */
-/* 343 */
-/* 344 */
-/* 345 */
-/* 346 */
-/* 347 */
-/* 348 */
-/* 349 */
+#define TEGRA210_CLK_DISP1_SLCG_OVR 334
+#define TEGRA210_CLK_DISP2_SLCG_OVR 335
+#define TEGRA210_CLK_VI_SLCG_OVR 336
+#define TEGRA210_CLK_ISPA_SLCG_OVR 337
+#define TEGRA210_CLK_ISPB_SLCG_OVR 338
+#define TEGRA210_CLK_NVDEC_SLCG_OVR 339
+#define TEGRA210_CLK_MSENC_SLCG_OVR 340
+#define TEGRA210_CLK_NVJPG_SLCG_OVR 341
+#define TEGRA210_CLK_VIC03_SLCG_OVR 342
+#define TEGRA210_CLK_XUSB_DEV_SLCG_OVR 343
+#define TEGRA210_CLK_XUSB_HOST_SLCG_OVR 344
+#define TEGRA210_CLK_D_AUDIO_SLCG_OVR 345
+#define TEGRA210_CLK_APE_SLCG_OVR 346
+#define TEGRA210_CLK_SATA_SLCG_OVR 347
+#define TEGRA210_CLK_SATA_SLCG_OVR_IPFS 348
+#define TEGRA210_CLK_SATA_SLCG_OVR_FPCI 349
 
 #define TEGRA210_CLK_AUDIO0_MUX 350
 #define TEGRA210_CLK_AUDIO1_MUX 351
-- 
1.9.1

