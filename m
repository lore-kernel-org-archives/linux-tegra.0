From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] ARM: dma-mapping: Small logical clean up
Date: Tue, 28 Aug 2012 14:43:49 +0300
Message-ID: <1346154232-13299-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Skip unnecessary operations if order == 0. A little bit easier to
read.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mm/dma-mapping.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 70a6275..aaea5e4 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1032,11 +1032,12 @@ static struct page **__iommu_alloc_buffer(struct device *dev, size_t size, gfp_t
 		if (!pages[i])
 			goto error;
 
-		if (order)
+		if (order) {
 			split_page(pages[i], order);
-		j = 1 << order;
-		while (--j)
-			pages[i + j] = pages[i] + j;
+			j = 1 << order;
+			while (--j)
+				pages[i + j] = pages[i] + j;
+		}
 
 		__dma_clear_buffer(pages[i], PAGE_SIZE << order);
 		i += 1 << order;
-- 
1.7.5.4
