From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] gpu: host1x: Remove dev_err() on platform_get_irq() failure
Date: Sat, 2 Nov 2019 15:57:44 +0800
Message-ID: <20191102075744.6864-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

platform_get_irq() will call dev_err() itself on failure,
so there is no need for the driver to also do this.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/host1x/dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index a738ea5..388bcc2 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -339,10 +339,8 @@ static int host1x_probe(struct platform_device *pdev)
 	}
 
 	syncpt_irq = platform_get_irq(pdev, 0);
-	if (syncpt_irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ: %d\n", syncpt_irq);
+	if (syncpt_irq < 0)
 		return syncpt_irq;
-	}
 
 	mutex_init(&host->devices_lock);
 	INIT_LIST_HEAD(&host->devices);
-- 
2.7.4
