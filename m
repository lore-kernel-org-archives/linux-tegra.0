From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 6/6] usb: host: ohci-exynos: Use devm_ioremap_resource instead of devm_ioremap
Date: Sat, 10 May 2014 15:27:03 +0530
Message-ID: <1399715823-19839-7-git-send-email-gautam.vivek@samsung.com>
References: <1399715823-19839-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399715823-19839-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Using devm_ioremap_resource() API should actually be preferred over
devm_ioremap(), since the former request the mem region first and then
gives back the ioremap'ed memory pointer.
devm_ioremap_resource() calls request_mem_region(), therby preventing
other drivers to make any overlapping call to the same region.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/host/ohci-exynos.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 9cf80cb..aa64fb5 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -120,9 +120,8 @@ skip_phy:
 
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
-	hcd->regs = devm_ioremap(&pdev->dev, res->start, hcd->rsrc_len);
+	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (!hcd->regs) {
-		dev_err(&pdev->dev, "Failed to remap I/O memory\n");
 		err = -ENOMEM;
 		goto fail_io;
 	}
-- 
1.7.10.4
