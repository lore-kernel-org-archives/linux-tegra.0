From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] ARM: dma-mapping: Refrain noisy console message
Date: Tue, 28 Aug 2012 14:43:51 +0300
Message-ID: <1346154232-13299-3-git-send-email-hdoyu@nvidia.com>
References: <1346154232-13299-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346154232-13299-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

With many IOMMU'able devices, console gets noisy.

Tegra30 has a few dozen of IOMMU'able devices.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mm/dma-mapping.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 8cb9542..2621282 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1747,7 +1747,7 @@ int arm_iommu_attach_device(struct device *dev,
 	dev->archdata.mapping = mapping;
 	set_dma_ops(dev, &iommu_ops);
 
-	pr_info("Attached IOMMU controller to %s device.\n", dev_name(dev));
+	pr_debug("Attached IOMMU controller to %s device.\n", dev_name(dev));
 	return 0;
 }
 
-- 
1.7.5.4
