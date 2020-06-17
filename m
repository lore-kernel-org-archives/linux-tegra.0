From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v2 13/18] gpu: host1x: mipi: Update tegra_mipi_request() to be node based
Date: Tue, 16 Jun 2020 18:41:29 -0700
Message-ID: <1592358094-23459-14-git-send-email-skomatineni@nvidia.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra CSI driver need a separate MIPI device for each channel as
calibration of corresponding MIPI pads for each channel should
happen independently.

So, this patch updates tegra_mipi_request() API to add a device_node
pointer argument to allow creating mipi device for specific device
node rather than a device.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c | 2 +-
 drivers/gpu/host1x/mipi.c   | 7 +++++--
 include/linux/host1x.h      | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 38beab9..0443589 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1618,7 +1618,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->regs))
 		return PTR_ERR(dsi->regs);
 
-	dsi->mipi = tegra_mipi_request(&pdev->dev);
+	dsi->mipi = tegra_mipi_request(&pdev->dev, NULL);
 	if (IS_ERR(dsi->mipi))
 		return PTR_ERR(dsi->mipi);
 
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e00809d..93b354b 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -206,13 +206,16 @@ static int tegra_mipi_power_down(struct tegra_mipi *mipi)
 	return 0;
 }
 
-struct tegra_mipi_device *tegra_mipi_request(struct device *device)
+struct tegra_mipi_device *tegra_mipi_request(struct device *device,
+					     struct device_node *np)
 {
-	struct device_node *np = device->of_node;
 	struct tegra_mipi_device *dev;
 	struct of_phandle_args args;
 	int err;
 
+	if (!np)
+		np = device->of_node;
+
 	err = of_parse_phandle_with_args(np, "nvidia,mipi-calibrate",
 					 "#nvidia,mipi-calibrate-cells", 0,
 					 &args);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index c230b4e..61dc577 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -325,7 +325,8 @@ int host1x_client_resume(struct host1x_client *client);
 
 struct tegra_mipi_device;
 
-struct tegra_mipi_device *tegra_mipi_request(struct device *device);
+struct tegra_mipi_device *tegra_mipi_request(struct device *device,
+					     struct device_node *np);
 void tegra_mipi_free(struct tegra_mipi_device *device);
 int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
-- 
2.7.4
