From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Revert "Revert "Revert "tegra: host: move stale wait checking into the kernel"""
Date: Fri,  8 Apr 2011 17:58:21 -0700
Message-ID: <1302310701-21953-1-git-send-email-rmorell@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rebecca-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
Cc: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This reverts commit be7b9ce20d645c2c9293441830ee33a0a5fc489f.

The change being reverted (again) breaks the userspace nvhost ABI.  It
will be reworked to be done in a backwards-compatible way.

Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch is against the linux-tegra-2.6.36 kernel (and its android- variant);
the breakage does not appear to be in the .37 kernel.


 arch/arm/mach-tegra/include/mach/nvhost.h  |    9 ----
 arch/arm/mach-tegra/include/mach/nvmap.h   |    4 --
 drivers/video/tegra/host/dev.c             |   42 +------------------
 drivers/video/tegra/host/nvhost_channel.h  |    1 -
 drivers/video/tegra/host/nvhost_hardware.h |    6 ---
 drivers/video/tegra/host/nvhost_syncpt.c   |   62 +---------------------------
 drivers/video/tegra/host/nvhost_syncpt.h   |    6 ---
 drivers/video/tegra/nvmap/nvmap.c          |   50 ----------------------
 8 files changed, 3 insertions(+), 177 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/nvhost.h b/arch/arm/mach-tegra/include/mach/nvhost.h
index 4bec312..c72666a 100644
--- a/arch/arm/mach-tegra/include/mach/nvhost.h
+++ b/arch/arm/mach-tegra/include/mach/nvhost.h
@@ -81,8 +81,6 @@ struct nvhost_submit_hdr {
 	__u32 syncpt_incrs;
 	__u32 num_cmdbufs;
 	__u32 num_relocs;
-	__u32 num_waitchks;
-	__u32 waitchk_mask;
 };
 
 struct nvhost_cmdbuf {
@@ -98,13 +96,6 @@ struct nvhost_reloc {
 	__u32 target_offset;
 };
 
-struct nvhost_waitchk {
-	__u32 mem;
-	__u32 offset;
-	__u32 syncpt_id;
-	__u32 thresh;
-};
-
 struct nvhost_get_param_args {
 	__u32 value;
 };
diff --git a/arch/arm/mach-tegra/include/mach/nvmap.h b/arch/arm/mach-tegra/include/mach/nvmap.h
index 7a79748..7422d1a 100644
--- a/arch/arm/mach-tegra/include/mach/nvmap.h
+++ b/arch/arm/mach-tegra/include/mach/nvmap.h
@@ -97,10 +97,6 @@ int nvmap_pin_array(struct nvmap_client *client, struct nvmap_handle *gather,
 void nvmap_unpin_handles(struct nvmap_client *client,
 			 struct nvmap_handle **h, int nr);
 
-int nvmap_patch_wait(struct nvmap_client *client,
-		     struct nvmap_handle *patch,
-		     u32 patch_offset, u32 patch_value);
-
 struct nvmap_platform_carveout {
 	const char *name;
 	unsigned int usage_mask;
diff --git a/drivers/video/tegra/host/dev.c b/drivers/video/tegra/host/dev.c
index 2f37558..20a4eda 100644
--- a/drivers/video/tegra/host/dev.c
+++ b/drivers/video/tegra/host/dev.c
@@ -50,8 +50,6 @@ struct nvhost_channel_userctx {
 	u32 syncpt_incrs;
 	u32 cmdbufs_pending;
 	u32 relocs_pending;
-	u32 waitchk_pending;
-	u32 waitchk_ref;
 	struct nvmap_handle_ref *gather_mem;
 	struct nvhost_op_pair *gathers;
 	int num_gathers;
@@ -59,9 +57,6 @@ struct nvhost_channel_userctx {
 	struct nvmap_pinarray_elem pinarray[NVHOST_MAX_HANDLES];
 	struct nvmap_handle *unpinarray[NVHOST_MAX_HANDLES];
 	struct nvmap_client *nvmap;
-	struct nvhost_waitchk waitchks[NVHOST_MAX_WAIT_CHECKS];
-	u32 num_waitchks;
-	u32 waitchk_mask;
 };
 
 struct nvhost_ctrl_userctx {
@@ -146,7 +141,6 @@ static void reset_submit(struct nvhost_channel_userctx *ctx)
 {
 	ctx->cmdbufs_pending = 0;
 	ctx->relocs_pending = 0;
-	ctx->waitchk_pending = 0;
 }
 
 static ssize_t nvhost_channelwrite(struct file *filp, const char __user *buf,
@@ -158,7 +152,7 @@ static ssize_t nvhost_channelwrite(struct file *filp, const char __user *buf,
 
 	while (remaining) {
 		size_t consumed;
-		if (!priv->relocs_pending && !priv->cmdbufs_pending && !priv->waitchk_pending) {
+		if (!priv->relocs_pending && !priv->cmdbufs_pending) {
 			consumed = sizeof(struct nvhost_submit_hdr);
 			if (remaining < consumed)
 				break;
@@ -173,7 +167,6 @@ static ssize_t nvhost_channelwrite(struct file *filp, const char __user *buf,
 			/* leave room for ctx switch */
 			priv->num_gathers = 2;
 			priv->pinarray_size = 0;
-			priv->waitchk_mask |= priv->waitchk_ref;
 		} else if (priv->cmdbufs_pending) {
 			struct nvhost_cmdbuf cmdbuf;
 			consumed = sizeof(cmdbuf);
@@ -199,18 +192,6 @@ static ssize_t nvhost_channelwrite(struct file *filp, const char __user *buf,
 			}
 			priv->pinarray_size += numrelocs;
 			priv->relocs_pending -= numrelocs;
-		} else if (priv->waitchk_pending) {
-			struct nvhost_waitchk *waitp;
-			consumed = sizeof(struct nvhost_waitchk);
-			if (remaining < consumed)
-				break;
-			waitp = &priv->waitchks[priv->num_waitchks];
-			if (copy_from_user(waitp, buf, consumed)) {
-				err = -EFAULT;
-				break;
-			}
-			priv->num_waitchks++;
-			priv->waitchk_pending--;
 		} else {
 			err = -EFAULT;
 			break;
@@ -238,7 +219,7 @@ static int nvhost_ioctl_channel_flush(struct nvhost_channel_userctx *ctx,
 	int num_unpin;
 	int err;
 
-	if (ctx->relocs_pending || ctx->cmdbufs_pending || ctx->waitchk_pending) {
+	if (ctx->relocs_pending || ctx->cmdbufs_pending) {
 		reset_submit(ctx);
 		dev_err(&ctx->ch->dev->pdev->dev, "channel submit out of sync\n");
 		return -EFAULT;
@@ -273,23 +254,6 @@ static int nvhost_ioctl_channel_flush(struct nvhost_channel_userctx *ctx,
 		return err;
 	}
 
-	/* remove stale waits */
-	if (ctx->num_waitchks) {
-		err = nvhost_syncpt_wait_check(ctx->nvmap,
-				&ctx->ch->dev->syncpt, ctx->waitchk_mask,
-				ctx->waitchks, ctx->num_waitchks);
-		if (err) {
-			dev_warn(&ctx->ch->dev->pdev->dev,
-				"nvhost_syncpt_wait_check failed: %d\n", err);
-			mutex_unlock(&ctx->ch->submitlock);
-			nvmap_unpin_handles(ctx->nvmap, ctx->unpinarray, num_unpin);
-			nvhost_module_idle(&ctx->ch->mod);
-			return err;
-		}
-		ctx->num_waitchks = 0;
-		ctx->waitchk_mask = 0;
-	}
-
 	/* context switch */
 	if (ctx->ch->cur_ctx != ctx->hwctx) {
 		struct nvhost_hwctx *hw = ctx->hwctx;
@@ -373,8 +337,6 @@ static long nvhost_channelctl(struct file *filp,
 		err = nvhost_ioctl_channel_flush(priv, (void *)buf);
 		break;
 	case NVHOST_IOCTL_CHANNEL_GET_SYNCPOINTS:
-		/* host syncpt ID is used by the RM (and never be given out) */
-		BUG_ON(priv->ch->desc->syncpts & (1 << NVSYNCPT_GRAPHICS_HOST));
 		((struct nvhost_get_param_args *)buf)->value =
 			priv->ch->desc->syncpts;
 		break;
diff --git a/drivers/video/tegra/host/nvhost_channel.h b/drivers/video/tegra/host/nvhost_channel.h
index 492d4a2..c62d739 100644
--- a/drivers/video/tegra/host/nvhost_channel.h
+++ b/drivers/video/tegra/host/nvhost_channel.h
@@ -32,7 +32,6 @@
 
 #define NVHOST_CHANNEL_BASE 0
 #define NVHOST_NUMCHANNELS (NV_HOST1X_CHANNELS - 1)
-#define NVHOST_MAX_WAIT_CHECKS 256
 #define NVHOST_MAX_GATHERS 512
 #define NVHOST_MAX_HANDLES 1280
 
diff --git a/drivers/video/tegra/host/nvhost_hardware.h b/drivers/video/tegra/host/nvhost_hardware.h
index 3309ae4..f69f467 100644
--- a/drivers/video/tegra/host/nvhost_hardware.h
+++ b/drivers/video/tegra/host/nvhost_hardware.h
@@ -141,12 +141,6 @@ enum {
 	NV_CLASS_HOST_INDDATA = 0x2e
 };
 
-static inline u32 nvhost_class_host_wait_syncpt(
-	unsigned indx, unsigned threshold)
-{
-	return (indx << 24) | (threshold & 0xffffff);
-}
-
 static inline u32 nvhost_class_host_wait_syncpt_base(
 	unsigned indx, unsigned base_indx, unsigned offset)
 {
diff --git a/drivers/video/tegra/host/nvhost_syncpt.c b/drivers/video/tegra/host/nvhost_syncpt.c
index 1881716..dd2ab0d 100644
--- a/drivers/video/tegra/host/nvhost_syncpt.c
+++ b/drivers/video/tegra/host/nvhost_syncpt.c
@@ -226,7 +226,7 @@ done:
 }
 
 static const char *s_syncpt_names[32] = {
-	"gfx_host", "", "", "", "", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "", "", "", "", "",
 	"vi_isp_0", "vi_isp_1", "vi_isp_2", "vi_isp_3", "vi_isp_4", "vi_isp_5",
 	"2d_0", "2d_1",
 	"", "",
@@ -254,63 +254,3 @@ void nvhost_syncpt_debug(struct nvhost_syncpt *sp)
 
 	}
 }
-
-/* returns true, if a <= b < c using wrapping comparison */
-static inline bool nvhost_syncpt_is_between(u32 a, u32 b, u32 c)
-{
-	return b-a < c-a;
-}
-
-/* returns true, if x >= y (mod 1 << 32) */
-static bool nvhost_syncpt_wrapping_comparison(u32 x, u32 y)
-{
-	return nvhost_syncpt_is_between(y, x, (1UL<<31UL)+y);
-}
-
-/* check for old WAITs to be removed (avoiding a wrap) */
-int nvhost_syncpt_wait_check(struct nvmap_client *nvmap,
-			struct nvhost_syncpt *sp, u32 waitchk_mask,
-			struct nvhost_waitchk *waitp, u32 waitchks)
-{
-	u32 idx;
-	int err = 0;
-
-	/* get current syncpt values */
-	for (idx = 0; idx < NV_HOST1X_SYNCPT_NB_PTS; idx++) {
-		if (BIT(idx) & waitchk_mask) {
-			nvhost_syncpt_update_min(sp, idx);
-		}
-	}
-
-	BUG_ON(!waitp);
-
-	/* compare syncpt vs wait threshold */
-	while (waitchks) {
-		u32 syncpt, override;
-
-		BUG_ON(waitp->syncpt_id > NV_HOST1X_SYNCPT_NB_PTS);
-
-		syncpt = atomic_read(&sp->min_val[waitp->syncpt_id]);
-		if (nvhost_syncpt_wrapping_comparison(syncpt, waitp->thresh)) {
-
-			/* wait has completed already, so can be removed */
-			dev_dbg(&syncpt_to_dev(sp)->pdev->dev,
-					"drop WAIT id %d (%s) thresh 0x%x, syncpt 0x%x\n",
-					waitp->syncpt_id,  nvhost_syncpt_name(waitp->syncpt_id),
-					waitp->thresh, syncpt);
-
-			/* move wait to a kernel reserved syncpt (that's always 0) */
-			override = nvhost_class_host_wait_syncpt(NVSYNCPT_GRAPHICS_HOST, 0);
-
-			/* patch the wait */
-			err = nvmap_patch_wait(nvmap,
-						(struct nvmap_handle *)waitp->mem,
-						waitp->offset, override);
-			if (err)
-				break;
-		}
-		waitchks--;
-		waitp++;
-	}
-	return err;
-}
diff --git a/drivers/video/tegra/host/nvhost_syncpt.h b/drivers/video/tegra/host/nvhost_syncpt.h
index b4ce3c6..f161f20 100644
--- a/drivers/video/tegra/host/nvhost_syncpt.h
+++ b/drivers/video/tegra/host/nvhost_syncpt.h
@@ -25,13 +25,10 @@
 
 #include <linux/kernel.h>
 #include <linux/sched.h>
-#include <mach/nvhost.h>
-#include <mach/nvmap.h>
 #include <asm/atomic.h>
 
 #include "nvhost_hardware.h"
 
-#define NVSYNCPT_GRAPHICS_HOST		     (0)
 #define NVSYNCPT_VI_ISP_0		     (12)
 #define NVSYNCPT_VI_ISP_1		     (13)
 #define NVSYNCPT_VI_ISP_2		     (14)
@@ -145,9 +142,6 @@ static inline int nvhost_syncpt_wait(struct nvhost_syncpt *sp, u32 id, u32 thres
 	return nvhost_syncpt_wait_timeout(sp, id, thresh, MAX_SCHEDULE_TIMEOUT);
 }
 
-int nvhost_syncpt_wait_check(struct nvmap_client *nvmap,
-			struct nvhost_syncpt *sp, u32 mask,
-			struct nvhost_waitchk *waitp, u32 num_waits);
 
 const char *nvhost_syncpt_name(u32 id);
 
diff --git a/drivers/video/tegra/nvmap/nvmap.c b/drivers/video/tegra/nvmap/nvmap.c
index 380f70e..1a70f43 100644
--- a/drivers/video/tegra/nvmap/nvmap.c
+++ b/drivers/video/tegra/nvmap/nvmap.c
@@ -724,53 +724,3 @@ void nvmap_free(struct nvmap_client *client, struct nvmap_handle_ref *r)
 {
 	nvmap_free_handle_id(client, nvmap_ref_to_id(r));
 }
-
-/*
- * create a mapping to the user's buffer and write it
- * (uses similar logic from nvmap_reloc_pin_array to map the cmdbuf)
- */
-int nvmap_patch_wait(struct nvmap_client *client,
-				struct nvmap_handle *patch,
-				u32 patch_offset, u32 patch_value)
-{
-	unsigned long phys;
-	unsigned int pfn, last_pfn = 0;
-	void *addr;
-	pte_t **pte;
-
-	if (patch_offset >= patch->size) {
-		nvmap_warn(client, "read/write outside of handle\n");
-		return -EFAULT;
-	}
-
-	pte = nvmap_alloc_pte(client->dev, &addr);
-	if (IS_ERR(pte))
-		return PTR_ERR(pte);
-
-	/* derive physaddr of cmdbuf WAIT to patch */
-	if (patch->heap_pgalloc) {
-		unsigned int page = patch_offset >> PAGE_SHIFT;
-		phys = page_to_phys(patch->pgalloc.pages[page]);
-		phys += (patch_offset & ~PAGE_MASK);
-	} else {
-		phys = patch->carveout->base + patch_offset;
-	}
-
-	pfn = __phys_to_pfn(phys);
-
-	/* write PTE, so addr points to cmdbuf PFN */
-	if (pfn != last_pfn) {
-		pgprot_t prot = nvmap_pgprot(patch, pgprot_kernel);
-		unsigned long kaddr = (unsigned long)addr;
-		set_pte_at(&init_mm, kaddr, *pte, pfn_pte(pfn, prot));
-		flush_tlb_kernel_page(kaddr);
-		last_pfn = pfn;
-	}
-
-	/* write patch_value to addr + page offset */
-	__raw_writel(patch_value, addr + (phys & ~PAGE_MASK));
-
-	nvmap_free_pte(client->dev, pte);
-	wmb();
-	return 0;
-}
-- 
1.7.3.4
