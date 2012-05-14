From: Hiroshi DOYU <hdoyu@nvidia.com>
Subject: [PATCH 2/2] iommu/tegra: gart: Reserve iomem resource
Date: Mon, 14 May 2012 21:12:03 +0300
Message-ID: <1337019127-6863-2-git-send-email-hdoyu@nvidia.com>
References: <1337019127-6863-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1337019127-6863-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hdoyu@nvidia.com
Cc: linux-tegra@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>, Stephen Warren <swarren@wwwdotorg.org>, Bharat Nihalani <bnihalani@nvidia.com>, Vandana Salve <vsalve@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

GART Register/Aperture range should be reserved.

Signed-off-by: Hiroshi DOYU <hdoyu@nvidia.com>
---
 drivers/iommu/tegra-gart.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 33a23b6..a431006 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -366,12 +366,18 @@ static int tegra_gart_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	gart_regs = devm_ioremap(dev, res->start, resource_size(res));
+	gart_regs = devm_request_and_ioremap(dev, res);
 	if (!gart_regs) {
 		dev_err(dev, "failed to remap GART registers\n");
 		return -ENXIO;
 	}
 
+	if (!devm_request_mem_region(dev, res_remap->start,
+				     resource_size(res_remap), dev_name(dev))) {
+		dev_err(dev, "failed to reserve GART aperture\n");
+		return -EBUSY;
+	}
+
 	gart->dev = &pdev->dev;
 	spin_lock_init(&gart->pte_lock);
 	spin_lock_init(&gart->client_lock);
-- 
1.7.5.4
