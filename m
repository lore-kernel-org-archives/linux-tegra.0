From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 08/27] drivers/iommu: don't check resource with devm_ioremap_resource
Date: Tue, 23 Jul 2013 20:01:41 +0200
Message-ID: <1374602524-3398-9-git-send-email-wsa@the-dreams.de>
References: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
Please apply via the subsystem-tree.

 drivers/iommu/tegra-smmu.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index f6f120e..e066560 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1177,8 +1177,6 @@ static int tegra_smmu_probe(struct platform_device *pdev)
 		struct resource *res;
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res)
-			return -ENODEV;
 		smmu->regs[i] = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(smmu->regs[i]))
 			return PTR_ERR(smmu->regs[i]);
-- 
1.7.10.4
