From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH] USB: EHCI: tegra: Fix use-after-free in .remove()
Date: Tue, 17 Jun 2014 17:17:40 +0300
Message-ID: <1403014660-15509-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The tegra_ehci_hcd structure is located in the private space allocated
by the core USB code so it must not be accessed after the HCD is
freed.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
---
 drivers/usb/host/ehci-tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 6fdcb8a..5590567 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -479,10 +479,11 @@ static int tegra_ehci_remove(struct platform_device *pdev)
 
 	usb_phy_shutdown(hcd->phy);
 	usb_remove_hcd(hcd);
-	usb_put_hcd(hcd);
 
 	clk_disable_unprepare(tegra->clk);
 
+	usb_put_hcd(hcd);
+
 	return 0;
 }
 
-- 
1.8.1.5
