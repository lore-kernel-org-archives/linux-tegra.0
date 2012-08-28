From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v4 3/4] ARM: dma-mapping: Introduce __atomic_get_pages() for __iommu_get_pages()
Date: Tue, 28 Aug 2012 08:13:03 +0300
Message-ID: <1346130784-23571-4-git-send-email-hdoyu@nvidia.com>
References: <1346130784-23571-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346130784-23571-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, chunsang.jeong-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, subashrp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pullip.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Support atomic allocation in __iommu_get_pages().

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mm/dma-mapping.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index a62f552..4ef2d7b 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -503,6 +503,15 @@ static void *__alloc_from_pool(size_t size, struct page **ret_page)
 	return ptr;
 }
 
+static struct page **__atomic_get_pages(void *addr)
+{
+	struct dma_pool *pool = &atomic_pool;
+	struct page **pages = pool->pages;
+	int offs = (addr - pool->vaddr) >> PAGE_SHIFT;
+
+	return pages + offs;
+}
+
 static bool __in_atomic_pool(void *start, size_t size)
 {
 	struct dma_pool *pool = &atomic_pool;
@@ -1288,6 +1297,9 @@ static struct page **__iommu_get_pages(void *cpu_addr, struct dma_attrs *attrs)
 {
 	struct vm_struct *area;
 
+	if (__in_atomic_pool(cpu_addr, PAGE_SIZE))
+		return __atomic_get_pages(cpu_addr);
+
 	if (dma_get_attr(DMA_ATTR_NO_KERNEL_MAPPING, attrs))
 		return cpu_addr;
 
-- 
1.7.5.4
