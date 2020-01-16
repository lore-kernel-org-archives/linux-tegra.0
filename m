From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: gadget: xudc: Remove redundant platform_get_irq error message
Date: Thu, 16 Jan 2020 22:14:33 +0800
Message-ID: <20200116141433.57056-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, yuehaibing@huawei.com, nkristam@nvidia.com, felipe.balbi@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

platform_get_irq() will call dev_err() itself on failure,
so there is no need for the driver to also do this.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 634c2c1..fc1eafc 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3492,11 +3492,8 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	}
 
 	xudc->irq = platform_get_irq(pdev, 0);
-	if (xudc->irq < 0) {
-		dev_err(xudc->dev, "failed to get IRQ: %d\n",
-				xudc->irq);
+	if (xudc->irq < 0)
 		return xudc->irq;
-	}
 
 	err = devm_request_irq(&pdev->dev, xudc->irq, tegra_xudc_irq, 0,
 			       dev_name(&pdev->dev), xudc);
-- 
2.7.4
