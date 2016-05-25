From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 01/11] clk: tegra: Switch to using critical/handoff clks
Date: Wed, 25 May 2016 18:24:21 -0400
Message-ID: <1464215071-28696-2-git-send-email-rklein@nvidia.com>
References: <1464215071-28696-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464215071-28696-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Mark some of the required-to-be-enabled clks as critical
or hand-off clks, depending on whether or not there is a
consumer who should be taking a reference to them to enable them.

- May need to revisit all chips to look for more
- May need to switch some hand-off => critical since support is
  less in mainline and some clks might not be requested then

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-periph.c     | 21 ++++++++++++++-------
 drivers/clk/tegra/clk-tegra-super-gen4.c | 12 +++++++-----
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 29d04c663abf..9365770bcaa5 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -162,6 +162,13 @@
 			_clk_num, _gate_flags, _clk_id, _parents##_idx, 0,\
 			NULL)
 
+#define MUX8_FLAGS(_name, _parents, _offset,\
+			     _clk_num, _gate_flags, _clk_id, _flags)	\
+	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
+			29, MASK(8), 0, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP,\
+			_clk_num, _gate_flags, _clk_id, _parents##_idx, _flags,\
+			NULL)
+
 #define MUX8_NOGATE_LOCK(_name, _parents, _offset, _clk_id, _lock)	\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,	\
 			      29, MASK(3), 0, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP,\
@@ -651,7 +658,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	INT8("3d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d_8),
 	INT8("vic03", mux_pllm_pllc_pllp_plla_pllc2_c3_clkm, CLK_SOURCE_VIC03, 178, 0, tegra_clk_vic03),
 	INT8("vic03", mux_pllc_pllp_plla1_pllc2_c3_clkm, CLK_SOURCE_VIC03, 178, 0, tegra_clk_vic03_8),
-	INT_FLAGS("mselect", mux_pllp_clkm, CLK_SOURCE_MSELECT, 99, 0, tegra_clk_mselect, CLK_IGNORE_UNUSED),
+	INT_FLAGS("mselect", mux_pllp_clkm, CLK_SOURCE_MSELECT, 99, 0, tegra_clk_mselect, CLK_IGNORE_UNUSED | CLK_IS_CRITICAL),
 	MUX("i2s0", mux_pllaout0_audio0_2x_pllp_clkm, CLK_SOURCE_I2S0, 30, TEGRA_PERIPH_ON_APB, tegra_clk_i2s0),
 	MUX("i2s1", mux_pllaout0_audio1_2x_pllp_clkm, CLK_SOURCE_I2S1, 11, TEGRA_PERIPH_ON_APB, tegra_clk_i2s1),
 	MUX("i2s2", mux_pllaout0_audio2_2x_pllp_clkm, CLK_SOURCE_I2S2, 18, TEGRA_PERIPH_ON_APB, tegra_clk_i2s2),
@@ -691,8 +698,8 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("dsiblp", mux_pllp_pllc_clkm, CLK_SOURCE_DSIBLP, 148, 0, tegra_clk_dsiblp),
 	MUX("tsensor", mux_pllp_pllc_clkm_clk32, CLK_SOURCE_TSENSOR, 100, TEGRA_PERIPH_ON_APB, tegra_clk_tsensor),
 	MUX("actmon", mux_pllp_pllc_clk32_clkm, CLK_SOURCE_ACTMON, 119, 0, tegra_clk_actmon),
-	MUX("dfll_ref", mux_pllp_clkm, CLK_SOURCE_DFLL_REF, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_ref),
-	MUX("dfll_soc", mux_pllp_clkm, CLK_SOURCE_DFLL_SOC, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_soc),
+	MUX_FLAGS("dfll_ref", mux_pllp_clkm, CLK_SOURCE_DFLL_REF, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_ref, CLK_IS_CRITICAL),
+	MUX_FLAGS("dfll_soc", mux_pllp_clkm, CLK_SOURCE_DFLL_SOC, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_soc, CLK_IS_CRITICAL),
 	MUX("i2cslow", mux_pllp_pllc_clk32_clkm, CLK_SOURCE_I2CSLOW, 81, TEGRA_PERIPH_ON_APB, tegra_clk_i2cslow),
 	MUX("sbc1", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC1, 41, TEGRA_PERIPH_ON_APB, tegra_clk_sbc1),
 	MUX("sbc2", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC2, 44, TEGRA_PERIPH_ON_APB, tegra_clk_sbc2),
@@ -730,7 +737,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("ndflash", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDFLASH, 13, TEGRA_PERIPH_ON_APB, tegra_clk_ndflash_8),
 	MUX8("ndspeed", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDSPEED, 80, TEGRA_PERIPH_ON_APB, tegra_clk_ndspeed_8),
 	MUX8("hdmi", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_HDMI, 51, 0, tegra_clk_hdmi),
-	MUX8("extern1", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN1, 120, 0, tegra_clk_extern1),
+	MUX8_FLAGS("extern1", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN1, 120, 0, tegra_clk_extern1, CLK_IS_CRITICAL),
 	MUX8("extern2", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN2, 121, 0, tegra_clk_extern2),
 	MUX8("extern3", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN3, 122, 0, tegra_clk_extern3),
 	MUX8("soc_therm", mux_pllm_pllc_pllp_plla, CLK_SOURCE_SOC_THERM, 78, TEGRA_PERIPH_ON_APB, tegra_clk_soc_therm),
@@ -744,7 +751,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("clk72mhz", mux_pllp3_pllc_clkm, CLK_SOURCE_CLK72MHZ, 177, TEGRA_PERIPH_NO_RESET, tegra_clk_clk72Mhz),
 	MUX8("clk72mhz", mux_pllp_out3_pllp_pllc_clkm, CLK_SOURCE_CLK72MHZ, 177, TEGRA_PERIPH_NO_RESET, tegra_clk_clk72Mhz_8),
 	MUX8_NOGATE_LOCK("sor0_lvds", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, tegra_clk_sor0_lvds, &sor0_lock),
-	MUX_FLAGS("csite", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite, CLK_IGNORE_UNUSED),
+	MUX_FLAGS("csite", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite, CLK_IGNORE_UNUSED | CLK_IS_CRITICAL),
 	MUX_FLAGS("csite", mux_pllp_pllre_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite_8, CLK_IGNORE_UNUSED),
 	NODIV("disp1", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1, NULL),
 	NODIV("disp1", mux_pllp_plld_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1_8, NULL),
@@ -816,7 +823,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("xusb_host", "xusb_host_src", 89, 0, tegra_clk_xusb_host, 0),
 	GATE("xusb_ss", "xusb_ss_src", 156, 0, tegra_clk_xusb_ss, 0),
 	GATE("xusb_dev", "xusb_dev_src", 95, 0, tegra_clk_xusb_dev, 0),
-	GATE("emc", "emc_mux", 57, 0, tegra_clk_emc, CLK_IGNORE_UNUSED),
+	GATE("emc", "emc_mux", 57, 0, tegra_clk_emc, CLK_IGNORE_UNUSED | CLK_IS_CRITICAL),
 	GATE("sata_cold", "clk_m", 129, TEGRA_PERIPH_ON_APB, tegra_clk_sata_cold, 0),
 	GATE("ispb", "clk_m", 3, 0, tegra_clk_ispb, 0),
 	GATE("vim2_clk", "clk_m", 11, 0, tegra_clk_vim2_clk, 0),
@@ -825,7 +832,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("pllg_ref", "pll_ref", 189, 0, tegra_clk_pll_g_ref, 0),
 	GATE("hsic_trk", "usb2_hsic_trk", 209, TEGRA_PERIPH_NO_RESET, tegra_clk_hsic_trk, 0),
 	GATE("usb2_trk", "usb2_hsic_trk", 210, TEGRA_PERIPH_NO_RESET, tegra_clk_usb2_trk, 0),
-	GATE("xusb_gate", "osc", 143, 0, tegra_clk_xusb_gate, 0),
+	GATE("xusb_gate", "osc", 143, 0, tegra_clk_xusb_gate, CLK_IS_CRITICAL),
 	GATE("pll_p_out_cpu", "pll_p", 223, 0, tegra_clk_pll_p_out_cpu, 0),
 	GATE("pll_p_out_adsp", "pll_p", 187, 0, tegra_clk_pll_p_out_adsp, 0),
 	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index 474de0f0c26d..5283138af093 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -116,7 +116,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
 		clk = tegra_clk_register_super_mux("sclk_mux",
 						gen_info->sclk_parents,
 						gen_info->num_sclk_parents,
-						CLK_SET_RATE_PARENT,
+						CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 						clk_base + SCLK_BURST_POLICY,
 						0, 4, 0, 0, NULL);
 		*dt_clk = clk;
@@ -137,7 +137,8 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
 			clk = tegra_clk_register_super_mux("sclk",
 						gen_info->sclk_parents,
 						gen_info->num_sclk_parents,
-						CLK_SET_RATE_PARENT,
+						CLK_SET_RATE_PARENT |
+						CLK_IS_CRITICAL,
 						clk_base + SCLK_BURST_POLICY,
 						0, 4, 0, 0, NULL);
 			*dt_clk = clk;
@@ -166,7 +167,8 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
 				   clk_base + SYSTEM_CLK_RATE, 0, 2, 0,
 				   &sysrate_lock);
 	clk = clk_register_gate(NULL, "pclk", "pclk_div", CLK_SET_RATE_PARENT |
-				CLK_IGNORE_UNUSED, clk_base + SYSTEM_CLK_RATE,
+				CLK_IGNORE_UNUSED | CLK_IS_CRITICAL,
+				clk_base + SYSTEM_CLK_RATE,
 				3, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
 	*dt_clk = clk;
 }
@@ -187,14 +189,14 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
 			clk = tegra_clk_register_super_mux("cclk_g",
 					gen_info->cclk_g_parents,
 					gen_info->num_cclk_g_parents,
-					CLK_SET_RATE_PARENT,
+					CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 					clk_base + CCLKG_BURST_POLICY,
 					0, 4, 8, 0, NULL);
 		} else {
 			clk = tegra_clk_register_super_mux("cclk_g",
 					gen_info->cclk_g_parents,
 					gen_info->num_cclk_g_parents,
-					CLK_SET_RATE_PARENT,
+					CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 					clk_base + CCLKG_BURST_POLICY,
 					0, 4, 0, 0, NULL);
 		}
-- 
1.9.1
