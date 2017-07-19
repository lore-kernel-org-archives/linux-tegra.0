From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 089/102] usb: host: xhci-tegra: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:33 +0200
Message-ID: <20170719152646.25903-90-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/usb/host/xhci-tegra.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 74436f8ca5382..ba53ee63d450c 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -933,14 +933,16 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	if (IS_ERR(tegra->padctl))
 		return PTR_ERR(tegra->padctl);
 
-	tegra->host_rst = devm_reset_control_get(&pdev->dev, "xusb_host");
+	tegra->host_rst = devm_reset_control_get_exclusive(&pdev->dev,
+							   "xusb_host");
 	if (IS_ERR(tegra->host_rst)) {
 		err = PTR_ERR(tegra->host_rst);
 		dev_err(&pdev->dev, "failed to get xusb_host reset: %d\n", err);
 		goto put_padctl;
 	}
 
-	tegra->ss_rst = devm_reset_control_get(&pdev->dev, "xusb_ss");
+	tegra->ss_rst = devm_reset_control_get_exclusive(&pdev->dev,
+							 "xusb_ss");
 	if (IS_ERR(tegra->ss_rst)) {
 		err = PTR_ERR(tegra->ss_rst);
 		dev_err(&pdev->dev, "failed to get xusb_ss reset: %d\n", err);
-- 
2.11.0
