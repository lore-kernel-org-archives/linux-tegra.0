From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] drm/nouveau: introduce CPU cache flushing
	macro
Date: Mon, 19 May 2014 16:10:58 +0900
Message-ID: <1400483458-9648-5-git-send-email-acourbot@nvidia.com>
References: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400483458-9648-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some architectures (e.g. ARM) need the CPU buffers to be explicitely
flushed for a memory write to take effect. Not doing so results in
synchronization issues, especially after writing to BOs.

This patch introduces a macro that flushes the caches on ARM and
translates to a no-op on other architectures, and uses it when
writing to in-memory BOs. It will also be useful for implementations of
instmem that access shared memory directly instead of going through
PRAMIN.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/os.h    | 17 +++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.c |  8 ++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/os.h b/drivers/gpu/drm/nouveau/core/os.h
index d0ced94ca54c..274b4460bb03 100644
--- a/drivers/gpu/drm/nouveau/core/os.h
+++ b/drivers/gpu/drm/nouveau/core/os.h
@@ -38,4 +38,21 @@
 #endif /* def __BIG_ENDIAN else */
 #endif /* !ioread32_native */
 
+#if defined(__arm__)
+
+#define nv_cpu_cache_flush_area(va, size)	\
+do {						\
+	phys_addr_t pa = virt_to_phys(va);	\
+	__cpuc_flush_dcache_area(va, size);	\
+	outer_flush_range(pa, pa + size);	\
+} while (0)
+
+#else
+
+#define nv_cpu_cache_flush_area(va, size)	\
+do {						\
+} while (0)
+
+#endif /* defined(__arm__) */
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0886f47e5244..b9c9729c5733 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -437,8 +437,10 @@ nouveau_bo_wr16(struct nouveau_bo *nvbo, unsigned index, u16 val)
 	mem = &mem[index];
 	if (is_iomem)
 		iowrite16_native(val, (void __force __iomem *)mem);
-	else
+	else {
 		*mem = val;
+		nv_cpu_cache_flush_area(mem, 2);
+	}
 }
 
 u32
@@ -461,8 +463,10 @@ nouveau_bo_wr32(struct nouveau_bo *nvbo, unsigned index, u32 val)
 	mem = &mem[index];
 	if (is_iomem)
 		iowrite32_native(val, (void __force __iomem *)mem);
-	else
+	else {
 		*mem = val;
+		nv_cpu_cache_flush_area(mem, 4);
+	}
 }
 
 static struct ttm_tt *
-- 
1.9.2
