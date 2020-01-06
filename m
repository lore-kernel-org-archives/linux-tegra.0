From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 19/20] usb: host: ehci-tegra: Stop managing PHY's power
Date: Mon,  6 Jan 2020 04:34:15 +0300
Message-ID: <20200106013416.9604-20-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no need to use usb_phy_set_suspend during of driver's probe
because now PHY driver enables hardware during of PHY's initialization.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/ehci-tegra.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 32483bef046b..1eb94205a5ac 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -480,12 +480,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	}
 	u_phy->otg->host = hcd_to_bus(hcd);
 
-	err = usb_phy_set_suspend(hcd->usb_phy, 0);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to power on the phy\n");
-		goto cleanup_phy;
-	}
-
 	irq = platform_get_irq(pdev, 0);
 	if (!irq) {
 		dev_err(&pdev->dev, "Failed to get IRQ\n");
-- 
2.24.0
