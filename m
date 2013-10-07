From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 17/27] drm/tegra: Add Tegra114 HDMI support
Date: Mon,  7 Oct 2013 10:34:34 +0200
Message-ID: <1381134884-5816-18-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra114 TMDS configuration requires a new peak_current field and the
driver current override bit has changed position.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c  |   1 +
 drivers/gpu/drm/tegra/hdmi.c | 103 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/hdmi.h | 152 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 253 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e958960..4afc9e1 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -490,6 +490,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra30-hdmi", },
 	{ .compatible = "nvidia,tegra30-gr2d", },
 	{ .compatible = "nvidia,tegra114-dc", },
+	{ .compatible = "nvidia,tegra114-hdmi", },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 4489d56..130cb6d 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -142,6 +142,7 @@ struct tmds_config {
 	u32 pll1;
 	u32 pe_current;
 	u32 drive_current;
+	u32 peak_current;
 };
 
 static const struct tmds_config tegra2_tmds_config[] = {
@@ -223,6 +224,85 @@ static const struct tmds_config tegra3_tmds_config[] = {
 	},
 };
 
+const struct tmds_config tegra114_tmds_config[] = {
+	{ /* 480p/576p / 25.2MHz/27MHz modes */
+		.pclk = 27000000,
+		.pll0 = SOR_PLL_ICHPMP(1) | SOR_PLL_BG_V17_S(3) |
+			SOR_PLL_VCOCAP(0) | SOR_PLL_RESISTORSEL,
+		.pll1 = SOR_PLL_LOADADJ(3) | SOR_PLL_TMDS_TERMADJ(0),
+		.pe_current = PE_CURRENT0(PE_CURRENT_0_mA_T114) |
+			PE_CURRENT1(PE_CURRENT_0_mA_T114) |
+			PE_CURRENT2(PE_CURRENT_0_mA_T114) |
+			PE_CURRENT3(PE_CURRENT_0_mA_T114),
+		.drive_current =
+			DRIVE_CURRENT_LANE0_T114(DRIVE_CURRENT_10_400_mA_T114) |
+			DRIVE_CURRENT_LANE1_T114(DRIVE_CURRENT_10_400_mA_T114) |
+			DRIVE_CURRENT_LANE2_T114(DRIVE_CURRENT_10_400_mA_T114) |
+			DRIVE_CURRENT_LANE3_T114(DRIVE_CURRENT_10_400_mA_T114),
+		.peak_current = PEAK_CURRENT_LANE0(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE1(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE2(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE3(PEAK_CURRENT_0_000_mA),
+	}, { /* 720p / 74.25MHz modes */
+		.pclk = 74250000,
+		.pll0 = SOR_PLL_ICHPMP(1) | SOR_PLL_BG_V17_S(3) |
+			SOR_PLL_VCOCAP(1) | SOR_PLL_RESISTORSEL,
+		.pll1 = SOR_PLL_PE_EN | SOR_PLL_LOADADJ(3) |
+			SOR_PLL_TMDS_TERMADJ(0),
+		.pe_current = PE_CURRENT0(PE_CURRENT_15_mA_T114) |
+			PE_CURRENT1(PE_CURRENT_15_mA_T114) |
+			PE_CURRENT2(PE_CURRENT_15_mA_T114) |
+			PE_CURRENT3(PE_CURRENT_15_mA_T114),
+		.drive_current =
+			DRIVE_CURRENT_LANE0_T114(DRIVE_CURRENT_10_400_mA_T114) |
+			DRIVE_CURRENT_LANE1_T114(DRIVE_CURRENT_10_400_mA_T114) |
+			DRIVE_CURRENT_LANE2_T114(DRIVE_CURRENT_10_400_mA_T114) |
+			DRIVE_CURRENT_LANE3_T114(DRIVE_CURRENT_10_400_mA_T114),
+		.peak_current = PEAK_CURRENT_LANE0(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE1(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE2(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE3(PEAK_CURRENT_0_000_mA),
+	}, { /* 1080p / 148.5MHz modes */
+		.pclk = 148500000,
+		.pll0 = SOR_PLL_ICHPMP(1) | SOR_PLL_BG_V17_S(3) |
+			SOR_PLL_VCOCAP(3) | SOR_PLL_RESISTORSEL,
+		.pll1 = SOR_PLL_PE_EN | SOR_PLL_LOADADJ(3) |
+			SOR_PLL_TMDS_TERMADJ(0),
+		.pe_current = PE_CURRENT0(PE_CURRENT_10_mA_T114) |
+			PE_CURRENT1(PE_CURRENT_10_mA_T114) |
+			PE_CURRENT2(PE_CURRENT_10_mA_T114) |
+			PE_CURRENT3(PE_CURRENT_10_mA_T114),
+		.drive_current =
+			DRIVE_CURRENT_LANE0_T114(DRIVE_CURRENT_12_400_mA_T114) |
+			DRIVE_CURRENT_LANE1_T114(DRIVE_CURRENT_12_400_mA_T114) |
+			DRIVE_CURRENT_LANE2_T114(DRIVE_CURRENT_12_400_mA_T114) |
+			DRIVE_CURRENT_LANE3_T114(DRIVE_CURRENT_12_400_mA_T114),
+		.peak_current = PEAK_CURRENT_LANE0(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE1(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE2(PEAK_CURRENT_0_000_mA) |
+			PEAK_CURRENT_LANE3(PEAK_CURRENT_0_000_mA),
+	}, { /* 225/297MHz modes */
+		.pclk = UINT_MAX,
+		.pll0 = SOR_PLL_ICHPMP(1) | SOR_PLL_BG_V17_S(3) |
+			SOR_PLL_VCOCAP(0xf) | SOR_PLL_RESISTORSEL,
+		.pll1 = SOR_PLL_LOADADJ(3) | SOR_PLL_TMDS_TERMADJ(7)
+			| SOR_PLL_TMDS_TERM_ENABLE,
+		.pe_current = PE_CURRENT0(PE_CURRENT_0_mA_T114) |
+			PE_CURRENT1(PE_CURRENT_0_mA_T114) |
+			PE_CURRENT2(PE_CURRENT_0_mA_T114) |
+			PE_CURRENT3(PE_CURRENT_0_mA_T114),
+		.drive_current =
+			DRIVE_CURRENT_LANE0_T114(DRIVE_CURRENT_25_200_mA_T114) |
+			DRIVE_CURRENT_LANE1_T114(DRIVE_CURRENT_25_200_mA_T114) |
+			DRIVE_CURRENT_LANE2_T114(DRIVE_CURRENT_25_200_mA_T114) |
+			DRIVE_CURRENT_LANE3_T114(DRIVE_CURRENT_19_200_mA_T114),
+		.peak_current = PEAK_CURRENT_LANE0(PEAK_CURRENT_3_000_mA) |
+			PEAK_CURRENT_LANE1(PEAK_CURRENT_3_000_mA) |
+			PEAK_CURRENT_LANE2(PEAK_CURRENT_3_000_mA) |
+			PEAK_CURRENT_LANE3(PEAK_CURRENT_0_800_mA),
+	},
+};
+
 static const struct tegra_hdmi_audio_config *
 tegra_hdmi_get_audio_config(unsigned int audio_freq, unsigned int pclk)
 {
@@ -564,14 +644,26 @@ static void tegra_hdmi_setup_stereo_infoframe(struct tegra_hdmi *hdmi)
 static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
 				  const struct tmds_config *tmds)
 {
+	struct device_node *np = hdmi->dev->of_node;
 	unsigned long value;
 
 	tegra_hdmi_writel(hdmi, tmds->pll0, HDMI_NV_PDISP_SOR_PLL0);
 	tegra_hdmi_writel(hdmi, tmds->pll1, HDMI_NV_PDISP_SOR_PLL1);
 	tegra_hdmi_writel(hdmi, tmds->pe_current, HDMI_NV_PDISP_PE_CURRENT);
 
-	value = tmds->drive_current | DRIVE_CURRENT_FUSE_OVERRIDE;
-	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT);
+	if (of_device_is_compatible(np, "nvidia,tegra114-hdmi")) {
+		tegra_hdmi_writel(hdmi, tmds->drive_current,
+				  HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT);
+		value = tegra_hdmi_readl(hdmi, HDMI_NV_PDISP_SOR_PAD_CTLS0);
+		value |= DRIVE_CURRENT_FUSE_OVERRIDE_T114;
+		tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_PAD_CTLS0);
+		tegra_hdmi_writel(hdmi, tmds->peak_current,
+				  HDMI_NV_PDISP_SOR_IO_PEAK_CURRENT);
+	} else {
+		value = tmds->drive_current | DRIVE_CURRENT_FUSE_OVERRIDE;
+		tegra_hdmi_writel(hdmi, value,
+				  HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT);
+	}
 }
 
 static int tegra_output_hdmi_enable(struct tegra_output *output)
@@ -703,7 +795,10 @@ static int tegra_output_hdmi_enable(struct tegra_output *output)
 	tegra_hdmi_setup_stereo_infoframe(hdmi);
 
 	/* TMDS CONFIG */
-	if (of_device_is_compatible(node, "nvidia,tegra30-hdmi")) {
+	if (of_device_is_compatible(node, "nvidia,tegra114-hdmi")) {
+		num_tmds = ARRAY_SIZE(tegra114_tmds_config);
+		tmds = tegra114_tmds_config;
+	} else if (of_device_is_compatible(node, "nvidia,tegra30-hdmi")) {
 		num_tmds = ARRAY_SIZE(tegra3_tmds_config);
 		tmds = tegra3_tmds_config;
 	} else {
@@ -1048,6 +1143,7 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 	DUMP_REG(HDMI_NV_PDISP_SOR_AUDIO_CNTRL0);
 	DUMP_REG(HDMI_NV_PDISP_SOR_AUDIO_HDA_ELD_BUFWR);
 	DUMP_REG(HDMI_NV_PDISP_SOR_AUDIO_HDA_PRESENSE);
+	DUMP_REG(HDMI_NV_PDISP_SOR_IO_PEAK_CURRENT);
 
 #undef DUMP_REG
 
@@ -1284,6 +1380,7 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 }
 
 static struct of_device_id tegra_hdmi_of_match[] = {
+	{ .compatible = "nvidia,tegra114-hdmi", },
 	{ .compatible = "nvidia,tegra30-hdmi", },
 	{ .compatible = "nvidia,tegra20-hdmi", },
 	{ },
diff --git a/drivers/gpu/drm/tegra/hdmi.h b/drivers/gpu/drm/tegra/hdmi.h
index 52ac36e..37925c2 100644
--- a/drivers/gpu/drm/tegra/hdmi.h
+++ b/drivers/gpu/drm/tegra/hdmi.h
@@ -233,6 +233,10 @@
 #define DRIVE_CURRENT_LANE1(x)      (((x) & 0x3f) <<  8)
 #define DRIVE_CURRENT_LANE2(x)      (((x) & 0x3f) << 16)
 #define DRIVE_CURRENT_LANE3(x)      (((x) & 0x3f) << 24)
+#define DRIVE_CURRENT_LANE0_T114(x) (((x) & 0x7f) <<  0)
+#define DRIVE_CURRENT_LANE1_T114(x) (((x) & 0x7f) <<  8)
+#define DRIVE_CURRENT_LANE2_T114(x) (((x) & 0x7f) << 16)
+#define DRIVE_CURRENT_LANE3_T114(x) (((x) & 0x7f) << 24)
 #define DRIVE_CURRENT_FUSE_OVERRIDE (1 << 31)
 
 #define DRIVE_CURRENT_1_500_mA  0x00
@@ -299,6 +303,79 @@
 #define DRIVE_CURRENT_24_375_mA 0x3d
 #define DRIVE_CURRENT_24_750_mA 0x3e
 
+#define DRIVE_CURRENT_0_000_mA_T114 0x00
+#define DRIVE_CURRENT_0_400_mA_T114 0x01
+#define DRIVE_CURRENT_0_800_mA_T114 0x02
+#define DRIVE_CURRENT_1_200_mA_T114 0x03
+#define DRIVE_CURRENT_1_600_mA_T114 0x04
+#define DRIVE_CURRENT_2_000_mA_T114 0x05
+#define DRIVE_CURRENT_2_400_mA_T114 0x06
+#define DRIVE_CURRENT_2_800_mA_T114 0x07
+#define DRIVE_CURRENT_3_200_mA_T114 0x08
+#define DRIVE_CURRENT_3_600_mA_T114 0x09
+#define DRIVE_CURRENT_4_000_mA_T114 0x0a
+#define DRIVE_CURRENT_4_400_mA_T114 0x0b
+#define DRIVE_CURRENT_4_800_mA_T114 0x0c
+#define DRIVE_CURRENT_5_200_mA_T114 0x0d
+#define DRIVE_CURRENT_5_600_mA_T114 0x0e
+#define DRIVE_CURRENT_6_000_mA_T114 0x0f
+#define DRIVE_CURRENT_6_400_mA_T114 0x10
+#define DRIVE_CURRENT_6_800_mA_T114 0x11
+#define DRIVE_CURRENT_7_200_mA_T114 0x12
+#define DRIVE_CURRENT_7_600_mA_T114 0x13
+#define DRIVE_CURRENT_8_000_mA_T114 0x14
+#define DRIVE_CURRENT_8_400_mA_T114 0x15
+#define DRIVE_CURRENT_8_800_mA_T114 0x16
+#define DRIVE_CURRENT_9_200_mA_T114 0x17
+#define DRIVE_CURRENT_9_600_mA_T114 0x18
+#define DRIVE_CURRENT_10_000_mA_T114 0x19
+#define DRIVE_CURRENT_10_400_mA_T114 0x1a
+#define DRIVE_CURRENT_10_800_mA_T114 0x1b
+#define DRIVE_CURRENT_11_200_mA_T114 0x1c
+#define DRIVE_CURRENT_11_600_mA_T114 0x1d
+#define DRIVE_CURRENT_12_000_mA_T114 0x1e
+#define DRIVE_CURRENT_12_400_mA_T114 0x1f
+#define DRIVE_CURRENT_12_800_mA_T114 0x20
+#define DRIVE_CURRENT_13_200_mA_T114 0x21
+#define DRIVE_CURRENT_13_600_mA_T114 0x22
+#define DRIVE_CURRENT_14_000_mA_T114 0x23
+#define DRIVE_CURRENT_14_400_mA_T114 0x24
+#define DRIVE_CURRENT_14_800_mA_T114 0x25
+#define DRIVE_CURRENT_15_200_mA_T114 0x26
+#define DRIVE_CURRENT_15_600_mA_T114 0x27
+#define DRIVE_CURRENT_16_000_mA_T114 0x28
+#define DRIVE_CURRENT_16_400_mA_T114 0x29
+#define DRIVE_CURRENT_16_800_mA_T114 0x2a
+#define DRIVE_CURRENT_17_200_mA_T114 0x2b
+#define DRIVE_CURRENT_17_600_mA_T114 0x2c
+#define DRIVE_CURRENT_18_000_mA_T114 0x2d
+#define DRIVE_CURRENT_18_400_mA_T114 0x2e
+#define DRIVE_CURRENT_18_800_mA_T114 0x2f
+#define DRIVE_CURRENT_19_200_mA_T114 0x30
+#define DRIVE_CURRENT_19_600_mA_T114 0x31
+#define DRIVE_CURRENT_20_000_mA_T114 0x32
+#define DRIVE_CURRENT_20_400_mA_T114 0x33
+#define DRIVE_CURRENT_20_800_mA_T114 0x34
+#define DRIVE_CURRENT_21_200_mA_T114 0x35
+#define DRIVE_CURRENT_21_600_mA_T114 0x36
+#define DRIVE_CURRENT_22_000_mA_T114 0x37
+#define DRIVE_CURRENT_22_400_mA_T114 0x38
+#define DRIVE_CURRENT_22_800_mA_T114 0x39
+#define DRIVE_CURRENT_23_200_mA_T114 0x3a
+#define DRIVE_CURRENT_23_600_mA_T114 0x3b
+#define DRIVE_CURRENT_24_000_mA_T114 0x3c
+#define DRIVE_CURRENT_24_400_mA_T114 0x3d
+#define DRIVE_CURRENT_24_800_mA_T114 0x3e
+#define DRIVE_CURRENT_25_200_mA_T114 0x3f
+#define DRIVE_CURRENT_25_400_mA_T114 0x40
+#define DRIVE_CURRENT_25_800_mA_T114 0x41
+#define DRIVE_CURRENT_26_200_mA_T114 0x42
+#define DRIVE_CURRENT_26_600_mA_T114 0x43
+#define DRIVE_CURRENT_27_000_mA_T114 0x44
+#define DRIVE_CURRENT_27_400_mA_T114 0x45
+#define DRIVE_CURRENT_27_800_mA_T114 0x46
+#define DRIVE_CURRENT_28_200_mA_T114 0x47
+
 #define HDMI_NV_PDISP_AUDIO_DEBUG0				0x7f
 #define HDMI_NV_PDISP_AUDIO_DEBUG1				0x80
 #define HDMI_NV_PDISP_AUDIO_DEBUG2				0x81
@@ -358,6 +435,23 @@
 #define PE_CURRENT_7_0_mA 0xe
 #define PE_CURRENT_7_5_mA 0xf
 
+#define PE_CURRENT_0_mA_T114 0x0
+#define PE_CURRENT_1_mA_T114 0x1
+#define PE_CURRENT_2_mA_T114 0x2
+#define PE_CURRENT_3_mA_T114 0x3
+#define PE_CURRENT_4_mA_T114 0x4
+#define PE_CURRENT_5_mA_T114 0x5
+#define PE_CURRENT_6_mA_T114 0x6
+#define PE_CURRENT_7_mA_T114 0x7
+#define PE_CURRENT_8_mA_T114 0x8
+#define PE_CURRENT_9_mA_T114 0x9
+#define PE_CURRENT_10_mA_T114 0xa
+#define PE_CURRENT_11_mA_T114 0xb
+#define PE_CURRENT_12_mA_T114 0xc
+#define PE_CURRENT_13_mA_T114 0xd
+#define PE_CURRENT_14_mA_T114 0xe
+#define PE_CURRENT_15_mA_T114 0xf
+
 #define HDMI_NV_PDISP_KEY_CTRL					0x9a
 #define HDMI_NV_PDISP_KEY_DEBUG0				0x9b
 #define HDMI_NV_PDISP_KEY_DEBUG1				0x9c
@@ -383,4 +477,62 @@
 #define HDMI_NV_PDISP_SOR_AUDIO_AVAL_1920    0xc5
 #define HDMI_NV_PDISP_SOR_AUDIO_AVAL_DEFAULT 0xc5
 
+#define HDMI_NV_PDISP_SOR_IO_PEAK_CURRENT		0xd1
+#define PEAK_CURRENT_LANE0(x) (((x) & 0x7f) <<  0)
+#define PEAK_CURRENT_LANE1(x) (((x) & 0x7f) <<  8)
+#define PEAK_CURRENT_LANE2(x) (((x) & 0x7f) << 16)
+#define PEAK_CURRENT_LANE3(x) (((x) & 0x7f) << 24)
+
+#define PEAK_CURRENT_0_000_mA 0x00
+#define PEAK_CURRENT_0_200_mA 0x01
+#define PEAK_CURRENT_0_400_mA 0x02
+#define PEAK_CURRENT_0_600_mA 0x03
+#define PEAK_CURRENT_0_800_mA 0x04
+#define PEAK_CURRENT_1_000_mA 0x05
+#define PEAK_CURRENT_1_200_mA 0x06
+#define PEAK_CURRENT_1_400_mA 0x07
+#define PEAK_CURRENT_1_600_mA 0x08
+#define PEAK_CURRENT_1_800_mA 0x09
+#define PEAK_CURRENT_2_000_mA 0x0a
+#define PEAK_CURRENT_2_200_mA 0x0b
+#define PEAK_CURRENT_2_400_mA 0x0c
+#define PEAK_CURRENT_2_600_mA 0x0d
+#define PEAK_CURRENT_2_800_mA 0x0e
+#define PEAK_CURRENT_3_000_mA 0x0f
+#define PEAK_CURRENT_3_200_mA 0x10
+#define PEAK_CURRENT_3_400_mA 0x11
+#define PEAK_CURRENT_3_600_mA 0x12
+#define PEAK_CURRENT_3_800_mA 0x13
+#define PEAK_CURRENT_4_000_mA 0x14
+#define PEAK_CURRENT_4_200_mA 0x15
+#define PEAK_CURRENT_4_400_mA 0x16
+#define PEAK_CURRENT_4_600_mA 0x17
+#define PEAK_CURRENT_4_800_mA 0x18
+#define PEAK_CURRENT_5_000_mA 0x19
+#define PEAK_CURRENT_5_200_mA 0x1a
+#define PEAK_CURRENT_5_400_mA 0x1b
+#define PEAK_CURRENT_5_600_mA 0x1c
+#define PEAK_CURRENT_5_800_mA 0x1d
+#define PEAK_CURRENT_6_000_mA 0x1e
+#define PEAK_CURRENT_6_200_mA 0x1f
+#define PEAK_CURRENT_6_400_mA 0x20
+#define PEAK_CURRENT_6_600_mA 0x21
+#define PEAK_CURRENT_6_800_mA 0x22
+#define PEAK_CURRENT_7_000_mA 0x23
+#define PEAK_CURRENT_7_200_mA 0x24
+#define PEAK_CURRENT_7_400_mA 0x25
+#define PEAK_CURRENT_7_600_mA 0x26
+#define PEAK_CURRENT_7_800_mA 0x27
+#define PEAK_CURRENT_8_000_mA 0x28
+#define PEAK_CURRENT_8_200_mA 0x29
+#define PEAK_CURRENT_8_400_mA 0x2a
+#define PEAK_CURRENT_8_600_mA 0x2b
+#define PEAK_CURRENT_8_800_mA 0x2c
+#define PEAK_CURRENT_9_000_mA 0x2d
+#define PEAK_CURRENT_9_200_mA 0x2e
+#define PEAK_CURRENT_9_400_mA 0x2f
+
+#define HDMI_NV_PDISP_SOR_PAD_CTLS0		0xd2
+#define DRIVE_CURRENT_FUSE_OVERRIDE_T114	(1 << 31)
+
 #endif /* TEGRA_HDMI_H */
-- 
1.8.4
