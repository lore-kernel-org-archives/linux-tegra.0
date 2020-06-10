From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v1 14/18] gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
Date: Tue, 9 Jun 2020 23:02:36 -0700
Message-ID: <1591768960-31648-15-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

SW can trigger MIPI pads calibration any time after power on
but calibration results will be latched and applied to the pads
by MIPI CAL unit only when the link is in LP-11 state and then
status register will be updated.

For CSI, trigger of pads calibration happen during CSI stream
enable where CSI receiver is kept ready prior to sensor or CSI
transmitter stream start.

So, pads may not be in LP-11 at this time and waiting for the
calibration to be done immediate after calibration start will
result in timeout.

This patch splits tegra_mipi_calibrate() and tegra_mipi_wait()
so triggering for calibration and waiting for it to complete can
happen at different stages.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c |  7 ++++++-
 drivers/gpu/host1x/mipi.c   | 23 +++++++++++++++++------
 include/linux/host1x.h      |  1 +
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 38beab9..814363f 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -670,6 +670,7 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
 static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 {
 	u32 value;
+	int ret;
 
 	/*
 	 * XXX Is this still needed? The module reset is deasserted right
@@ -693,7 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
 	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
 
-	return tegra_mipi_calibrate(dsi->mipi);
+	ret = tegra_mipi_calibrate(dsi->mipi);
+	if (ret < 0)
+		return ret;
+
+	return tegra_mipi_wait(dsi->mipi);
 }
 
 static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index f51fe69..a01df6a 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -299,22 +299,35 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 }
 EXPORT_SYMBOL(tegra_mipi_disable);
 
-static int tegra_mipi_wait(struct tegra_mipi *mipi)
+int tegra_mipi_wait(struct tegra_mipi_device *device)
 {
+	struct tegra_mipi *mipi = device->mipi;
 	unsigned long timeout = jiffies + msecs_to_jiffies(250);
 	u32 value;
+	int err;
+
+	err = clk_enable(device->mipi->clk);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&device->mipi->lock);
 
 	while (time_before(jiffies, timeout)) {
 		value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
 		if ((value & MIPI_CAL_STATUS_ACTIVE) == 0 &&
 		    (value & MIPI_CAL_STATUS_DONE) != 0)
-			return 0;
+			goto done;
 
 		usleep_range(10, 50);
 	}
 
-	return -ETIMEDOUT;
+	err = -ETIMEDOUT;
+done:
+	mutex_unlock(&device->mipi->lock);
+	clk_disable(device->mipi->clk);
+	return err;
 }
+EXPORT_SYMBOL(tegra_mipi_wait);
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 {
@@ -380,12 +393,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	value |= MIPI_CAL_CTRL_START;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
 
-	err = tegra_mipi_wait(device->mipi);
-
 	mutex_unlock(&device->mipi->lock);
 	clk_disable(device->mipi->clk);
 
-	return err;
+	return 0;
 }
 EXPORT_SYMBOL(tegra_mipi_calibrate);
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index a61ca52..dbad062 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -332,5 +332,6 @@ void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
 int tegra_mipi_calibrate(struct tegra_mipi_device *device);
+int tegra_mipi_wait(struct tegra_mipi_device *device);
 
 #endif
-- 
2.7.4
