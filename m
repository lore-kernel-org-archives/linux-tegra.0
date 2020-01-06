From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 02/20] usb: host: ehci-tegra: Correct teardown order of driver's removal
Date: Mon,  6 Jan 2020 04:33:58 +0300
Message-ID: <20200106013416.9604-3-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I found that PHY's enable refcounting was broken and after fixing it
I also found that machine started to hang after EHCI driver module
removal. Turned out that the teardown order is incorrect because HCD must
be unregistered *before* PHY's disabling. Note that it is also not correct
to assert the shared reset during of driver's removal because PHY takes
care of resetting shared pads and thus it's better to remove that part
from the EHCI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/ehci-tegra.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 4d2cdec4cb78..32483bef046b 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -521,16 +521,10 @@ static int tegra_ehci_remove(struct platform_device *pdev)
 	struct tegra_ehci_hcd *tegra =
 		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
 
+	usb_remove_hcd(hcd);
 	otg_set_host(hcd->usb_phy->otg, NULL);
-
 	usb_phy_shutdown(hcd->usb_phy);
-	usb_remove_hcd(hcd);
-
-	reset_control_assert(tegra->rst);
-	udelay(1);
-
 	clk_disable_unprepare(tegra->clk);
-
 	usb_put_hcd(hcd);
 
 	return 0;
-- 
2.24.0
