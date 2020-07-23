From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v4 12/14] gpu: host1x: mipi: Keep MIPI clock enabled till calibration is done
Date: Thu, 23 Jul 2020 16:51:10 -0700
Message-ID: <1595548272-9809-13-git-send-email-skomatineni@nvidia.com>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595548272-9809-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

With the split of MIPI calibration into tegra_mipi_calibrate() and
tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
is done.

So, this patch skips disabling MIPI clock after triggering start of
calibration and disables it only after waiting for done status from
the calibration logic.

This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibration()
and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
with their usage.

As MIPI clock is left enabled and in case of any failures with CSI input
streaming tegra_mipi_finish_calibration() will not get invoked.
So added new API tegra_mipi_cancel_calibrate() which disables MIPI clock
and consumer drivers can call this in such cases.

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dsi.c |  4 ++--
 drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
 include/linux/host1x.h      |  5 +++--
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 3820e8d..4d54c13 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
 	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
 
-	err = tegra_mipi_calibrate(dsi->mipi);
+	err = tegra_mipi_start_calibrate(dsi->mipi);
 	if (err < 0)
 		return err;
 
-	return tegra_mipi_wait(dsi->mipi);
+	return tegra_mipi_finish_calibrate(dsi->mipi);
 }
 
 static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e606464..f06c5cd 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -293,17 +293,19 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 }
 EXPORT_SYMBOL(tegra_mipi_disable);
 
-int tegra_mipi_wait(struct tegra_mipi_device *device)
+void tegra_mipi_cancel_calibrate(struct tegra_mipi_device *device)
+{
+	clk_disable(device->mipi->clk);
+}
+EXPORT_SYMBOL(tegra_mipi_cancel_calibrate);
+
+int tegra_mipi_finish_calibrate(struct tegra_mipi_device *device)
 {
 	struct tegra_mipi *mipi = device->mipi;
 	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
 	u32 value;
 	int err;
 
-	err = clk_enable(device->mipi->clk);
-	if (err < 0)
-		return err;
-
 	mutex_lock(&device->mipi->lock);
 
 	err = readl_relaxed_poll_timeout(status_reg, value,
@@ -315,9 +317,9 @@ int tegra_mipi_wait(struct tegra_mipi_device *device)
 
 	return err;
 }
-EXPORT_SYMBOL(tegra_mipi_wait);
+EXPORT_SYMBOL(tegra_mipi_finish_calibrate);
 
-int tegra_mipi_calibrate(struct tegra_mipi_device *device)
+int tegra_mipi_start_calibrate(struct tegra_mipi_device *device)
 {
 	const struct tegra_mipi_soc *soc = device->mipi->soc;
 	unsigned int i;
@@ -382,11 +384,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
 
 	mutex_unlock(&device->mipi->lock);
-	clk_disable(device->mipi->clk);
 
 	return 0;
 }
-EXPORT_SYMBOL(tegra_mipi_calibrate);
+EXPORT_SYMBOL(tegra_mipi_start_calibrate);
 
 static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
 	{ .data = MIPI_CAL_CONFIG_CSIA },
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 20c885d..0065763 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -333,7 +333,8 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
-int tegra_mipi_calibrate(struct tegra_mipi_device *device);
-int tegra_mipi_wait(struct tegra_mipi_device *device);
+int tegra_mipi_start_calibrate(struct tegra_mipi_device *device);
+int tegra_mipi_finish_calibrate(struct tegra_mipi_device *device);
+void tegra_mipi_cancel_calibrate(struct tegra_mipi_device *device);
 
 #endif
-- 
2.7.4
