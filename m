From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 17/20] usb: chipidea: tegra: Stop managing PHY's power
Date: Mon,  6 Jan 2020 04:34:13 +0300
Message-ID: <20200106013416.9604-18-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra's USB PHY driver now provides generic PHY init/shutdown callbacks
and thus the custom PHY management could be removed from Tegra-specific
part of the ChipIdea driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 0c9911d44ee5..7455df0ede49 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -83,13 +83,6 @@ static int tegra_udc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	/*
-	 * Tegra's USB PHY driver doesn't implement optional phy_init()
-	 * hook, so we have to power on UDC controller before ChipIdea
-	 * driver initialization kicks in.
-	 */
-	usb_phy_set_suspend(udc->phy, 0);
-
 	/* setup and register ChipIdea HDRC device */
 	udc->data.name = "tegra-udc";
 	udc->data.flags = soc->flags;
@@ -109,7 +102,6 @@ static int tegra_udc_probe(struct platform_device *pdev)
 	return 0;
 
 fail_power_off:
-	usb_phy_set_suspend(udc->phy, 1);
 	clk_disable_unprepare(udc->clk);
 	return err;
 }
@@ -119,7 +111,6 @@ static int tegra_udc_remove(struct platform_device *pdev)
 	struct tegra_udc *udc = platform_get_drvdata(pdev);
 
 	ci_hdrc_remove_device(udc->dev);
-	usb_phy_set_suspend(udc->phy, 1);
 	clk_disable_unprepare(udc->clk);
 
 	return 0;
-- 
2.24.0
