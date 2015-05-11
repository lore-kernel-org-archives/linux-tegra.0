From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 07/12] drm/tegra: Set NC(Non-contiguous) mode to dc for one-shot
Date: Mon, 11 May 2015 09:38:26 +0800
Message-ID: <1431308311-4470-8-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

If dc is about to work in one-shot mode, we need to set dc's scan
mode to NC(Non-contiguous).
There are 2 things which can make dc send frame again:
- TE signal is received
- Driver sets the NC_HOST_TRIG_ENABLE

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 43 +++++++++++++++++++++++++++++--------------
 drivers/gpu/drm/tegra/dc.h |  5 +++++
 2 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a287e4fec865..b88c29322c6f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1248,10 +1248,26 @@ static void tegra_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		tegra_dc_writel(dc, value, DC_DISP_INTERLACE_CONTROL);
 	}
 
-	value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
-	value &= ~DISP_CTRL_MODE_MASK;
-	value |= DISP_CTRL_MODE_C_DISPLAY;
-	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+	if (mode->flags & DRM_MODE_FLAG_PREFER_ONE_SHOT) {
+		/* enable MSF & set MSF polarity */
+		value = MSF_ENABLE | MSF_LSPI;
+		if (mode->flags & DRM_MODE_FLAG_TE_POLARITY_HIGH)
+			value |= MSF_POLARITY_HIGH;
+		else
+			value |= MSF_POLARITY_LOW;
+		tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND_OPTION0);
+
+		/* set non-continuous mode */
+		value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
+		value &= ~DISP_CTRL_MODE_MASK;
+		value |= DISP_CTRL_MODE_NC_DISPLAY;
+		tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+	} else {
+		value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
+		value &= ~DISP_CTRL_MODE_MASK;
+		value |= DISP_CTRL_MODE_C_DISPLAY;
+		tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+	}
 
 	value = tegra_dc_readl(dc, DC_CMD_DISPLAY_POWER_CONTROL);
 	value |= PW0_ENABLE | PW1_ENABLE | PW2_ENABLE | PW3_ENABLE |
@@ -1319,16 +1335,11 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 	status = tegra_dc_readl(dc, DC_CMD_INT_STATUS);
 	tegra_dc_writel(dc, status, DC_CMD_INT_STATUS);
 
-	if (status & FRAME_END_INT) {
-		/*
-		dev_dbg(dc->dev, "%s(): frame end\n", __func__);
-		*/
-	}
+	if (status & FRAME_END_INT)
+		dev_info(dc->dev, "%s(): frame end\n", __func__);
 
 	if (status & VBLANK_INT) {
-		/*
-		dev_dbg(dc->dev, "%s(): vertical blank\n", __func__);
-		*/
+		dev_info(dc->dev, "%s(): vertical blank\n", __func__);
 		drm_crtc_handle_vblank(&dc->base);
 		tegra_dc_finish_page_flip(dc);
 	}
@@ -1339,6 +1350,9 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		*/
 	}
 
+	if (status & MSF_INT)
+		dev_info(dc->dev, "MSF_INT received.\n");
+
 	return IRQ_HANDLED;
 }
 
@@ -1732,10 +1746,11 @@ static int tegra_dc_init(struct host1x_client *client)
 		WINDOW_B_THRESHOLD(1) | WINDOW_C_THRESHOLD(1);
 	tegra_dc_writel(dc, value, DC_DISP_DISP_MEM_HIGH_PRIORITY_TIMER);
 
-	value = VBLANK_INT | WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT;
+	value = VBLANK_INT | WIN_A_UF_INT | WIN_B_UF_INT |
+		WIN_C_UF_INT | MSF_INT;
 	tegra_dc_writel(dc, value, DC_CMD_INT_ENABLE);
 
-	value = WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT;
+	value = WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT | MSF_INT;
 	tegra_dc_writel(dc, value, DC_CMD_INT_MASK);
 
 	if (dc->soc->supports_border_color)
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 55792daabbb5..4a2d0fec5853 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -27,6 +27,10 @@
 #define DC_CMD_CONT_SYNCPT_VSYNC		0x028
 #define  SYNCPT_VSYNC_ENABLE (1 << 8)
 #define DC_CMD_DISPLAY_COMMAND_OPTION0		0x031
+#define MSF_ENABLE                             (1 << 1)
+#define MSF_LSPI                               (0 << 2)
+#define MSF_POLARITY_HIGH                      (0 << 0)
+#define MSF_POLARITY_LOW                       (1 << 0)
 #define DC_CMD_DISPLAY_COMMAND			0x032
 #define DISP_CTRL_MODE_STOP (0 << 5)
 #define DISP_CTRL_MODE_C_DISPLAY (1 << 5)
@@ -53,6 +57,7 @@
 #define WIN_A_UF_INT  (1 << 8)
 #define WIN_B_UF_INT  (1 << 9)
 #define WIN_C_UF_INT  (1 << 10)
+#define MSF_INT       (1 << 12)
 #define WIN_A_OF_INT  (1 << 14)
 #define WIN_B_OF_INT  (1 << 15)
 #define WIN_C_OF_INT  (1 << 16)
-- 
2.1.4
