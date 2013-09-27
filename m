From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] USB: EHCI: tegra: drop clk_put for devm_clk_get in tegra_ehci_probe()
Date: Fri, 27 Sep 2013 16:22:08 +0800
Message-ID: <CAPgLHd8+Tdmkt=Tp1kK2f52PAHQNZ8ka9sKt6avUB00VsGqNQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

devm_clk_get() is used so there is no reason to explicitly
call clk_put() in probe or remove functions.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c | 4 +---
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
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
