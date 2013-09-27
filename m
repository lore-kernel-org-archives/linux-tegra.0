From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/1] USB: EHCI: tegra: Remove incorrect clk_put
Date: Fri, 27 Sep 2013 16:10:34 +0530
Message-ID: <1380278434-20754-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra->clk is obtained using devm_clk_get(). Hence clk_put
should not be used.

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 78fa76d..e6d8e26 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -388,7 +388,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 
 	err = clk_prepare_enable(tegra->clk);
 	if (err)
-		goto cleanup_clk_get;
+		goto cleanup_hcd_create;
 
 	tegra_periph_reset_assert(tegra->clk);
 	udelay(1);
@@ -465,8 +465,6 @@ cleanup_phy:
 	usb_phy_shutdown(hcd->phy);
 cleanup_clk_en:
 	clk_disable_unprepare(tegra->clk);
-cleanup_clk_get:
-	clk_put(tegra->clk);
 cleanup_hcd_create:
 	usb_put_hcd(hcd);
 	return err;
-- 
1.7.9.5
