From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] firmware: tegra: use devm_platform_ioremap_resource() to simplify code
Date: Wed, 9 Oct 2019 22:36:48 +0800
Message-ID: <20191009143648.3620-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, yuehaibing@huawei.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/firmware/tegra/bpmp-tegra210.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra210.c b/drivers/firmware/tegra/bpmp-tegra210.c
index ae15940..c2447be 100644
--- a/drivers/firmware/tegra/bpmp-tegra210.c
+++ b/drivers/firmware/tegra/bpmp-tegra210.c
@@ -162,7 +162,6 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
 {
 	struct platform_device *pdev = to_platform_device(bpmp->dev);
 	struct tegra210_bpmp *priv;
-	struct resource *res;
 	unsigned int i;
 	int err;
 
@@ -172,13 +171,11 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
 
 	bpmp->priv = priv;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->atomics = devm_ioremap_resource(&pdev->dev, res);
+	priv->atomics = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->atomics))
 		return PTR_ERR(priv->atomics);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	priv->arb_sema = devm_ioremap_resource(&pdev->dev, res);
+	priv->arb_sema = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(priv->arb_sema))
 		return PTR_ERR(priv->arb_sema);
 
-- 
2.7.4
