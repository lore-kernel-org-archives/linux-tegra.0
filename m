From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] video: tegra: Add hook for DDC enable
Date: Wed, 20 Apr 2011 19:31:47 -0700
Message-ID: <1303353108-8755-1-git-send-email-rmorell@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some output types like HDMI need to take special action when performing
a DDC transaction such as an EDID read.  This adds hooks to give
platform code the opportunity to set up for DDC transactions.

For HDMI, DDC access is enabled before the debouncing delay is applied;
this is necessary for some HDMI sinks to give the +5V time to settle and
the i2c microcontroller in the sink (powered off the +5V from the cable)
time to power up.

Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I tested this on a couple of different HDMI sinks and a couple of different
Tegra boards.  With these changes, EDID reads succeed every hotplug (they were
intermittent before), and I verified with a multimeter that +5V is not on in
the steady state when HDMI output is disabled.

 arch/arm/mach-tegra/include/mach/dc.h |    6 ++++
 drivers/video/tegra/dc/dc.c           |   24 +++++++++++++++++
 drivers/video/tegra/dc/dc_priv.h      |    8 ++++-
 drivers/video/tegra/dc/hdmi.c         |   46 ++++++++++++++++++++------------
 4 files changed, 65 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/dc.h b/arch/arm/mach-tegra/include/mach/dc.h
index 9bd2619..ddd600a 100644
--- a/arch/arm/mach-tegra/include/mach/dc.h
+++ b/arch/arm/mach-tegra/include/mach/dc.h
@@ -71,6 +71,12 @@ struct tegra_dc_out {
 
 	int	(*enable)(void);
 	int	(*disable)(void);
+	/*
+	 * Some output types require special handling when attempting to read
+	 * the EDID over DDC (such as HDMI enabling +5V).
+	 */
+	void	(*enable_ddc)(void);
+	void	(*disable_ddc)(void);
 };
 
 /* bits for tegra_dc_out.flags */
diff --git a/drivers/video/tegra/dc/dc.c b/drivers/video/tegra/dc/dc.c
index a61e86f..f19bbb2 100644
--- a/drivers/video/tegra/dc/dc.c
+++ b/drivers/video/tegra/dc/dc.c
@@ -1033,6 +1033,28 @@ static void tegra_dc_init(struct tegra_dc *dc)
 		tegra_dc_program_mode(dc, &dc->mode);
 }
 
+void tegra_dc_enable_ddc(struct tegra_dc *dc)
+{
+	if (dc->ddc_enabled)
+		return;
+
+	if (dc->out && dc->out->enable_ddc)
+		dc->out->enable_ddc();
+
+	dc->ddc_enabled = true;
+}
+
+void tegra_dc_disable_ddc(struct tegra_dc *dc)
+{
+	if (!dc->ddc_enabled)
+		return;
+
+	if (dc->out && dc->out->disable_ddc)
+		dc->out->disable_ddc();
+
+	dc->ddc_enabled = false;
+}
+
 static bool _tegra_dc_enable(struct tegra_dc *dc)
 {
 	if (dc->mode.pclk == 0)
@@ -1040,6 +1062,7 @@ static bool _tegra_dc_enable(struct tegra_dc *dc)
 
 	tegra_dc_io_start(dc);
 
+	tegra_dc_enable_ddc(dc);
 	if (dc->out && dc->out->enable)
 		dc->out->enable();
 
@@ -1086,6 +1109,7 @@ static void _tegra_dc_disable(struct tegra_dc *dc)
 
 	if (dc->out && dc->out->disable)
 		dc->out->disable();
+	tegra_dc_disable_ddc(dc);
 
 	/* flush any pending syncpt waits */
 	while (dc->syncpt_min < dc->syncpt_max) {
diff --git a/drivers/video/tegra/dc/dc_priv.h b/drivers/video/tegra/dc/dc_priv.h
index c8476f8..11669a3 100644
--- a/drivers/video/tegra/dc/dc_priv.h
+++ b/drivers/video/tegra/dc/dc_priv.h
@@ -36,8 +36,8 @@ struct tegra_dc_out_ops {
 	int (*init)(struct tegra_dc *dc);
 	/* destroy output.  dc clocks are not on at this point */
 	void (*destroy)(struct tegra_dc *dc);
-	/* detect connected display.  can sleep.*/
-	bool (*detect)(struct tegra_dc *dc);
+	/* detect connected display. */
+	void (*detect)(struct tegra_dc *dc);
 	/* enable output.  dc clocks are on at this point */
 	void (*enable)(struct tegra_dc *dc);
 	/* disable output.  dc clocks are on at this point */
@@ -63,6 +63,7 @@ struct tegra_dc {
 	struct clk			*emc_clk;
 
 	bool				enabled;
+	bool				ddc_enabled;
 	bool				suspended;
 
 	struct tegra_dc_out		*out;
@@ -138,6 +139,9 @@ static inline void *tegra_dc_get_outdata(struct tegra_dc *dc)
 
 void tegra_dc_setup_clk(struct tegra_dc *dc, struct clk *clk);
 
+void tegra_dc_enable_ddc(struct tegra_dc *dc);
+void tegra_dc_disable_ddc(struct tegra_dc *dc);
+
 extern struct tegra_dc_out_ops tegra_dc_rgb_ops;
 extern struct tegra_dc_out_ops tegra_dc_hdmi_ops;
 
diff --git a/drivers/video/tegra/dc/hdmi.c b/drivers/video/tegra/dc/hdmi.c
index ba2dc19..283cdef 100644
--- a/drivers/video/tegra/dc/hdmi.c
+++ b/drivers/video/tegra/dc/hdmi.c
@@ -447,6 +447,8 @@ static bool tegra_dc_hdmi_detect(struct tegra_dc *dc)
 	if (!tegra_dc_hdmi_hpd(dc))
 		goto fail;
 
+	BUG_ON(!dc->ddc_enabled);
+
 	err = tegra_edid_get_monspecs(hdmi->edid, &specs);
 	if (err < 0) {
 		dev_err(&dc->ndev->dev, "error reading edid\n");
@@ -471,6 +473,24 @@ fail:
 	return false;
 }
 
+static void tegra_dc_hdmi_enqueue_detect(struct tegra_dc *dc)
+{
+	struct tegra_dc_hdmi_data *hdmi = tegra_dc_get_outdata(dc);
+
+	cancel_delayed_work(&hdmi->work);
+	if (tegra_dc_hdmi_hpd(dc)) {
+		/*
+		 * We need DDC enabled to read the EDID; give the sink some
+		 * time to power up by enabling before the delay.
+		 */
+		tegra_dc_enable_ddc(dc);
+		queue_delayed_work(system_nrt_wq, &hdmi->work,
+				   msecs_to_jiffies(100));
+	} else {
+		queue_delayed_work(system_nrt_wq, &hdmi->work,
+				   msecs_to_jiffies(30));
+	}
+}
 
 static void tegra_dc_hdmi_detect_worker(struct work_struct *work)
 {
@@ -482,6 +502,9 @@ static void tegra_dc_hdmi_detect_worker(struct work_struct *work)
 		tegra_dc_disable(dc);
 		tegra_fb_update_monspecs(dc->fb, NULL, NULL);
 	}
+
+	/* We don't need DDC enabled after reading the EDID. */
+	tegra_dc_disable_ddc(dc);
 }
 
 static irqreturn_t tegra_dc_hdmi_irq(int irq, void *ptr)
@@ -491,17 +514,11 @@ static irqreturn_t tegra_dc_hdmi_irq(int irq, void *ptr)
 	unsigned long flags;
 
 	spin_lock_irqsave(&hdmi->suspend_lock, flags);
-	if (hdmi->suspended) {
+	if (hdmi->suspended)
 		hdmi->hpd_pending = true;
-	} else {
-		cancel_delayed_work(&hdmi->work);
-		if (tegra_dc_hdmi_hpd(dc))
-			queue_delayed_work(system_nrt_wq, &hdmi->work,
-					   msecs_to_jiffies(100));
-		else
-			queue_delayed_work(system_nrt_wq, &hdmi->work,
-					   msecs_to_jiffies(30));
-	}
+	else
+		tegra_dc_hdmi_enqueue_detect(dc);
+
 	spin_unlock_irqrestore(&hdmi->suspend_lock, flags);
 
 	return IRQ_HANDLED;
@@ -526,12 +543,7 @@ static void tegra_dc_hdmi_resume(struct tegra_dc *dc)
 	spin_lock_irqsave(&hdmi->suspend_lock, flags);
 	hdmi->suspended = false;
 	if (hdmi->hpd_pending) {
-		if (tegra_dc_hdmi_hpd(dc))
-			queue_delayed_work(system_nrt_wq, &hdmi->work,
-					   msecs_to_jiffies(100));
-		else
-			queue_delayed_work(system_nrt_wq, &hdmi->work,
-					   msecs_to_jiffies(30));
+		tegra_dc_hdmi_enqueue_detect(dc);
 		hdmi->hpd_pending = false;
 	}
 	spin_unlock_irqrestore(&hdmi->suspend_lock, flags);
@@ -1151,7 +1163,7 @@ struct tegra_dc_out_ops tegra_dc_hdmi_ops = {
 	.destroy = tegra_dc_hdmi_destroy,
 	.enable = tegra_dc_hdmi_enable,
 	.disable = tegra_dc_hdmi_disable,
-	.detect = tegra_dc_hdmi_detect,
+	.detect = tegra_dc_hdmi_enqueue_detect,
 	.suspend = tegra_dc_hdmi_suspend,
 	.resume = tegra_dc_hdmi_resume,
 };
-- 
1.7.3.4
