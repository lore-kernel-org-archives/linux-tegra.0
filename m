From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 3/6] usb: host: ehci-mv: Use devm_ioremap_resource instead of devm_ioremap
Date: Sat, 10 May 2014 17:30:07 +0530
Message-ID: <1399723210-21569-4-git-send-email-gautam.vivek@samsung.com>
References: <1399723210-21569-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399723210-21569-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, swarren@wwwdotorg.org, kgene.kim@samsung.com, thierry.reding@gmail.com, shc_work@mail.ru, Vivek Gautam <gautam.vivek@samsung.com>
List-Id: linux-tegra@vger.kernel.org

Using devm_ioremap_resource() API should actually be preferred over
devm_ioremap(), since the former request the mem region first and then
gives back the ioremap'ed memory pointer.
devm_ioremap_resource() calls request_mem_region(), therby preventing
other drivers to make any overlapping call to the same region.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 drivers/usb/host/ehci-mv.c |   16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
index bd61612..08147c3 100644
--- a/drivers/usb/host/ehci-mv.c
+++ b/drivers/usb/host/ehci-mv.c
@@ -176,11 +176,9 @@ static int mv_ehci_probe(struct platform_device *pdev)
 		goto err_put_hcd;
 	}
 
-	ehci_mv->phy_regs = devm_ioremap(&pdev->dev, r->start,
-					 resource_size(r));
-	if (!ehci_mv->phy_regs) {
-		dev_err(&pdev->dev, "failed to map phy I/O memory\n");
-		retval = -EFAULT;
+	ehci_mv->phy_regs = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(ehci_mv->phy_regs)) {
+		retval = PTR_ERR(ehci_mv->phy_regs);
 		goto err_put_hcd;
 	}
 
@@ -191,11 +189,9 @@ static int mv_ehci_probe(struct platform_device *pdev)
 		goto err_put_hcd;
 	}
 
-	ehci_mv->cap_regs = devm_ioremap(&pdev->dev, r->start,
-					 resource_size(r));
-	if (ehci_mv->cap_regs == NULL) {
-		dev_err(&pdev->dev, "failed to map I/O memory\n");
-		retval = -EFAULT;
+	ehci_mv->cap_regs = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(ehci_mv->cap_regs)) {
+		retval = PTR_ERR(ehci_mv->cap_regs);
 		goto err_put_hcd;
 	}
 
-- 
1.7.10.4
