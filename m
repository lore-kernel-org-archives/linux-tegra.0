From: Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH] usb: host: ehci-tegra: Remove superfluous dev_err() message
Date: Mon,  6 Apr 2020 13:55:30 +0800
Message-ID: <20200406055530.10860-1-tangbin@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The platform_get_irq() can print error message,so remove the redundant
dev_err() here.

Signed-off-by: Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index d6433f206..75a075daf 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -480,7 +480,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (!irq) {
-		dev_err(&pdev->dev, "Failed to get IRQ\n");
 		err = -ENODEV;
 		goto cleanup_phy;
 	}
-- 
2.20.1.windows.1
