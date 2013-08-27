From: Libo Chen <clbchenlibo.chen@huawei.com>
Subject: [PATCH 3/4] usb: phy-tegra-usb: use platform_{get,set}_drvdata()
Date: Tue, 27 Aug 2013 16:10:27 +0800
Message-ID: <521C5EF3.2090907@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com, Greg KH <gregkh@linuxfoundation.org>, swarren@wwwdotorg.org
Cc: USB <linux-usb@vger.kernel.org>, linux-tegra@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Li Zefan <lizefan@huawei.com>
List-Id: linux-tegra@vger.kernel.org


Use the wrapper functions for getting and setting the driver data using
platform_device instead of using dev_{get,set}_drvdata() with &pdev->dev,
so we can directly pass a struct platform_device.

Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 drivers/usb/phy/phy-tegra-usb.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index cec0855..68bc93f 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -859,7 +859,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	tegra_phy->u_phy.shutdown = tegra_usb_phy_close;
 	tegra_phy->u_phy.set_suspend = tegra_usb_phy_suspend;

-	dev_set_drvdata(&pdev->dev, tegra_phy);
+	platform_set_drvdata(pdev, tegra_phy);
 	return 0;
 }

-- 
1.7.1
