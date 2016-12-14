From: Alban Bedel <alban.bedel@avionic-design.de>
Subject: [PATCH] drm/tegra: hdmi: Fix audio to work with any pixel clock rate
Date: Wed, 14 Dec 2016 18:20:39 +0100
Message-ID: <20161214172039.5615-1-alban.bedel@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Alban Bedel <alban.bedel@avionic-design.de>
List-Id: linux-tegra@vger.kernel.org

The audio setting implementation was limited to a few specific pixel
clocks. This prevented HDMI audio from working on several test devices
as they need a pixel clock that is not supported by this implementation.

Fix this by implementing the algorithm provided in the TRM using fixed
point arithmetic. This allows the driver to cope with any sane pixel
clock rate.

Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
---
 drivers/gpu/drm/tegra/hdmi.c | 163 ++++++++++++++-----------------------------
 1 file changed, 54 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index cda0491ed6bf..b6078d6604b1 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <asm/div64.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
@@ -112,68 +113,11 @@ static inline void tegra_hdmi_writel(struct tegra_hdmi *hdmi, u32 value,
 }
 
 struct tegra_hdmi_audio_config {
-	unsigned int pclk;
 	unsigned int n;
 	unsigned int cts;
 	unsigned int aval;
 };
 
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_32k[] = {
-	{  25200000, 4096,  25200, 24000 },
-	{  27000000, 4096,  27000, 24000 },
-	{  74250000, 4096,  74250, 24000 },
-	{ 148500000, 4096, 148500, 24000 },
-	{         0,    0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_44_1k[] = {
-	{  25200000, 5880,  26250, 25000 },
-	{  27000000, 5880,  28125, 25000 },
-	{  74250000, 4704,  61875, 20000 },
-	{ 148500000, 4704, 123750, 20000 },
-	{         0,    0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_48k[] = {
-	{  25200000, 6144,  25200, 24000 },
-	{  27000000, 6144,  27000, 24000 },
-	{  74250000, 6144,  74250, 24000 },
-	{ 148500000, 6144, 148500, 24000 },
-	{         0,    0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_88_2k[] = {
-	{  25200000, 11760,  26250, 25000 },
-	{  27000000, 11760,  28125, 25000 },
-	{  74250000,  9408,  61875, 20000 },
-	{ 148500000,  9408, 123750, 20000 },
-	{         0,     0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_96k[] = {
-	{  25200000, 12288,  25200, 24000 },
-	{  27000000, 12288,  27000, 24000 },
-	{  74250000, 12288,  74250, 24000 },
-	{ 148500000, 12288, 148500, 24000 },
-	{         0,     0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_176_4k[] = {
-	{  25200000, 23520,  26250, 25000 },
-	{  27000000, 23520,  28125, 25000 },
-	{  74250000, 18816,  61875, 20000 },
-	{ 148500000, 18816, 123750, 20000 },
-	{         0,     0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_192k[] = {
-	{  25200000, 24576,  25200, 24000 },
-	{  27000000, 24576,  27000, 24000 },
-	{  74250000, 24576,  74250, 24000 },
-	{ 148500000, 24576, 148500, 24000 },
-	{         0,     0,      0,     0 },
-};
-
 static const struct tmds_config tegra20_tmds_config[] = {
 	{ /* slow pixel clock modes */
 		.pclk = 27000000,
@@ -411,52 +355,49 @@ static const struct tmds_config tegra124_tmds_config[] = {
 	},
 };
 
-static const struct tegra_hdmi_audio_config *
-tegra_hdmi_get_audio_config(unsigned int sample_rate, unsigned int pclk)
+static int
+tegra_hdmi_get_audio_config(unsigned int audio_freq, unsigned int pix_clock,
+			    struct tegra_hdmi_audio_config *config)
 {
-	const struct tegra_hdmi_audio_config *table;
-
-	switch (sample_rate) {
-	case 32000:
-		table = tegra_hdmi_audio_32k;
-		break;
-
-	case 44100:
-		table = tegra_hdmi_audio_44_1k;
-		break;
-
-	case 48000:
-		table = tegra_hdmi_audio_48k;
-		break;
-
-	case 88200:
-		table = tegra_hdmi_audio_88_2k;
-		break;
-
-	case 96000:
-		table = tegra_hdmi_audio_96k;
-		break;
-
-	case 176400:
-		table = tegra_hdmi_audio_176_4k;
-		break;
-
-	case 192000:
-		table = tegra_hdmi_audio_192k;
-		break;
-
-	default:
-		return NULL;
-	}
-
-	while (table->pclk) {
-		if (table->pclk == pclk)
-			return table;
-
-		table++;
+	const int afreq = 128 * audio_freq;
+	const int min_n = afreq / 1500;
+	const int max_n = afreq / 300;
+	const int ideal_n = afreq / 1000;
+	int64_t min_err = (uint64_t)-1 >> 1;
+	int n;
+
+	config->n = -1;
+
+	for (n = min_n; n <= max_n; n++) {
+		uint64_t cts_f, aval_f;
+		int64_t cts, err;
+
+		/* compute aval in 48.16 fixed point */
+		aval_f = ((int64_t)24000000 << 16) * n;
+		do_div(aval_f, afreq);
+		/* It should round without any rest */
+		if (aval_f & 0xFFFF)
+			continue;
+
+		/* Compute cts in 48.16 fixed point */
+		cts_f = ((int64_t)pix_clock << 16) * n;
+		do_div(cts_f, afreq);
+		/* Round it to the nearest integer */
+		cts = (cts_f & ~0xFFFF) + ((cts_f & BIT(15)) << 1);
+
+		/* Compute the absolute error */
+		err = abs((int64_t)cts_f - cts);
+		if (err < min_err ||
+		    (err == min_err &&
+		     abs(n - ideal_n) < abs(config->n - ideal_n))) {
+			config->n = n;
+			config->cts = cts >> 16;
+			config->aval = aval_f >> 16;
+			min_err = err;
+		}
 	}
 
-	return NULL;
+	return config->n != -1 ? 0 : -EINVAL;
 }
 
 static void tegra_hdmi_setup_audio_fs_tables(struct tegra_hdmi *hdmi)
@@ -512,8 +453,9 @@ static void tegra_hdmi_write_aval(struct tegra_hdmi *hdmi, u32 value)
 
 static int tegra_hdmi_setup_audio(struct tegra_hdmi *hdmi)
 {
-	const struct tegra_hdmi_audio_config *config;
+	struct tegra_hdmi_audio_config config;
 	u32 source, value;
+	int err;
 
 	switch (hdmi->audio_source) {
 	case HDA:
@@ -588,25 +530,28 @@ static int tegra_hdmi_setup_audio(struct tegra_hdmi *hdmi)
 		tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_AUDIO_SPARE0);
 	}
 
-	config = tegra_hdmi_get_audio_config(hdmi->audio_sample_rate,
-					     hdmi->pixel_clock);
-	if (!config) {
+	err = tegra_hdmi_get_audio_config(hdmi->audio_sample_rate,
+					  hdmi->pixel_clock, &config);
+	if (err) {
 		dev_err(hdmi->dev,
 			"cannot set audio to %u Hz at %u Hz pixel clock\n",
 			hdmi->audio_sample_rate, hdmi->pixel_clock);
-		return -EINVAL;
+		return err;
 	}
 
+	dev_dbg(hdmi->dev, "audio: pixclk=%d, n=%d, cts=%d, aval=%d\n",
+		hdmi->pixel_clock, config.n, config.cts, config.aval);
+
 	tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_HDMI_ACR_CTRL);
 
 	value = AUDIO_N_RESETF | AUDIO_N_GENERATE_ALTERNATE |
-		AUDIO_N_VALUE(config->n - 1);
+		AUDIO_N_VALUE(config.n - 1);
 	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_AUDIO_N);
 
-	tegra_hdmi_writel(hdmi, ACR_SUBPACK_N(config->n) | ACR_ENABLE,
+	tegra_hdmi_writel(hdmi, ACR_SUBPACK_N(config.n) | ACR_ENABLE,
 			  HDMI_NV_PDISP_HDMI_ACR_0441_SUBPACK_HIGH);
 
-	tegra_hdmi_writel(hdmi, ACR_SUBPACK_CTS(config->cts),
+	tegra_hdmi_writel(hdmi, ACR_SUBPACK_CTS(config.cts),
 			  HDMI_NV_PDISP_HDMI_ACR_0441_SUBPACK_LOW);
 
 	value = SPARE_HW_CTS | SPARE_FORCE_SW_CTS | SPARE_CTS_RESET_VAL(1);
@@ -617,7 +562,7 @@ static int tegra_hdmi_setup_audio(struct tegra_hdmi *hdmi)
 	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_AUDIO_N);
 
 	if (hdmi->config->has_hda)
-		tegra_hdmi_write_aval(hdmi, config->aval);
+		tegra_hdmi_write_aval(hdmi, config.aval);
 
 	tegra_hdmi_setup_audio_fs_tables(hdmi);
 
-- 
2.11.0
