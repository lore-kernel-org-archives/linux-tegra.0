From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 12/27] gpu: host1x: Expose syncpt and channel functionality
Date: Mon,  7 Oct 2013 10:34:29 +0200
Message-ID: <1381134884-5816-13-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Expose the buffer objects, syncpoint and channel functionality in the
public public header so that drivers can use them.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/Makefile        |   2 -
 drivers/gpu/host1x/cdma.c          |   2 +-
 drivers/gpu/host1x/channel.h       |   6 --
 drivers/gpu/host1x/drm/drm.c       |   2 -
 drivers/gpu/host1x/drm/gem.h       |   4 +-
 drivers/gpu/host1x/drm/gr2d.c      |   6 +-
 drivers/gpu/host1x/drm/hdmi.c      |   2 +-
 drivers/gpu/host1x/host1x_bo.h     |  87 -----------------
 drivers/gpu/host1x/hw/channel_hw.c |   1 -
 drivers/gpu/host1x/hw/debug_hw.c   |   1 -
 drivers/gpu/host1x/job.c           |   2 +-
 drivers/gpu/host1x/job.h           | 108 ----------------------
 drivers/gpu/host1x/syncpt.c        |  19 ++++
 drivers/gpu/host1x/syncpt.h        |  40 +-------
 include/linux/host1x.h             | 185 +++++++++++++++++++++++++++++++++++++
 15 files changed, 211 insertions(+), 256 deletions(-)
 delete mode 100644 drivers/gpu/host1x/host1x_bo.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 3b037b6..64628ba 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -1,5 +1,3 @@
-ccflags-y = -Idrivers/gpu/host1x
-
 host1x-y = \
 	syncpt.o \
 	dev.o \
diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index de72172..3995255 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -20,6 +20,7 @@
 #include <asm/cacheflush.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/host1x.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
@@ -30,7 +31,6 @@
 #include "channel.h"
 #include "dev.h"
 #include "debug.h"
-#include "host1x_bo.h"
 #include "job.h"
 
 /*
diff --git a/drivers/gpu/host1x/channel.h b/drivers/gpu/host1x/channel.h
index 48723b8..df767cf 100644
--- a/drivers/gpu/host1x/channel.h
+++ b/drivers/gpu/host1x/channel.h
@@ -40,12 +40,6 @@ struct host1x_channel {
 /* channel list operations */
 int host1x_channel_list_init(struct host1x *host);
 
-struct host1x_channel *host1x_channel_request(struct device *dev);
-void host1x_channel_free(struct host1x_channel *channel);
-struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
-void host1x_channel_put(struct host1x_channel *channel);
-int host1x_job_submit(struct host1x_job *job);
-
 #define host1x_for_each_channel(host, channel)				\
 	list_for_each_entry(channel, &host->chlist.list, list)
 
diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index cb6a4e8..e93caea 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -8,10 +8,8 @@
  */
 
 #include "host1x_client.h"
-#include "dev.h"
 #include "drm.h"
 #include "gem.h"
-#include "syncpt.h"
 
 #define DRIVER_NAME "tegra"
 #define DRIVER_DESC "NVIDIA Tegra graphics"
diff --git a/drivers/gpu/host1x/drm/gem.h b/drivers/gpu/host1x/drm/gem.h
index 492533a..2b54f14 100644
--- a/drivers/gpu/host1x/drm/gem.h
+++ b/drivers/gpu/host1x/drm/gem.h
@@ -19,11 +19,11 @@
 #ifndef __HOST1X_GEM_H
 #define __HOST1X_GEM_H
 
+#include <linux/host1x.h>
+
 #include <drm/drm.h>
 #include <drm/drmP.h>
 
-#include "host1x_bo.h"
-
 struct tegra_bo {
 	struct drm_gem_object gem;
 	struct host1x_bo base;
diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index e814918..a16aaa8 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -16,13 +16,9 @@
 
 #include <linux/clk.h>
 
-#include "channel.h"
+#include "host1x_client.h"
 #include "drm.h"
 #include "gem.h"
-#include "job.h"
-#include "host1x_bo.h"
-#include "host1x_client.h"
-#include "syncpt.h"
 
 struct gr2d {
 	struct tegra_drm_client client;
diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index 30ac9e8..a237004 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -13,10 +13,10 @@
 #include <linux/hdmi.h>
 #include <linux/regulator/consumer.h>
 
+#include "host1x_client.h"
 #include "hdmi.h"
 #include "drm.h"
 #include "dc.h"
-#include "host1x_client.h"
 
 struct tegra_hdmi {
 	struct tegra_drm_client client;
diff --git a/drivers/gpu/host1x/host1x_bo.h b/drivers/gpu/host1x/host1x_bo.h
deleted file mode 100644
index 4c1f10bd..0000000
--- a/drivers/gpu/host1x/host1x_bo.h
+++ /dev/null
@@ -1,87 +0,0 @@
-/*
- * Tegra host1x Memory Management Abstraction header
- *
- * Copyright (c) 2012-2013, NVIDIA Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef _HOST1X_BO_H
-#define _HOST1X_BO_H
-
-struct host1x_bo;
-
-struct host1x_bo_ops {
-	struct host1x_bo *(*get)(struct host1x_bo *bo);
-	void (*put)(struct host1x_bo *bo);
-	dma_addr_t (*pin)(struct host1x_bo *bo, struct sg_table **sgt);
-	void (*unpin)(struct host1x_bo *bo, struct sg_table *sgt);
-	void *(*mmap)(struct host1x_bo *bo);
-	void (*munmap)(struct host1x_bo *bo, void *addr);
-	void *(*kmap)(struct host1x_bo *bo, unsigned int pagenum);
-	void (*kunmap)(struct host1x_bo *bo, unsigned int pagenum, void *addr);
-};
-
-struct host1x_bo {
-	const struct host1x_bo_ops *ops;
-};
-
-static inline void host1x_bo_init(struct host1x_bo *bo,
-				  const struct host1x_bo_ops *ops)
-{
-	bo->ops = ops;
-}
-
-static inline struct host1x_bo *host1x_bo_get(struct host1x_bo *bo)
-{
-	return bo->ops->get(bo);
-}
-
-static inline void host1x_bo_put(struct host1x_bo *bo)
-{
-	bo->ops->put(bo);
-}
-
-static inline dma_addr_t host1x_bo_pin(struct host1x_bo *bo,
-				       struct sg_table **sgt)
-{
-	return bo->ops->pin(bo, sgt);
-}
-
-static inline void host1x_bo_unpin(struct host1x_bo *bo, struct sg_table *sgt)
-{
-	bo->ops->unpin(bo, sgt);
-}
-
-static inline void *host1x_bo_mmap(struct host1x_bo *bo)
-{
-	return bo->ops->mmap(bo);
-}
-
-static inline void host1x_bo_munmap(struct host1x_bo *bo, void *addr)
-{
-	bo->ops->munmap(bo, addr);
-}
-
-static inline void *host1x_bo_kmap(struct host1x_bo *bo, unsigned int pagenum)
-{
-	return bo->ops->kmap(bo, pagenum);
-}
-
-static inline void host1x_bo_kunmap(struct host1x_bo *bo,
-				    unsigned int pagenum, void *addr)
-{
-	bo->ops->kunmap(bo, pagenum, addr);
-}
-
-#endif
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index c950bc6..aa9bdf3 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -21,7 +21,6 @@
 
 #include <trace/events/host1x.h>
 
-#include "host1x_bo.h"
 #include "channel.h"
 #include "dev.h"
 #include "intr.h"
diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index dfad663..788fe71 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -19,7 +19,6 @@
 #include "debug.h"
 #include "cdma.h"
 #include "channel.h"
-#include "host1x_bo.h"
 
 #define HOST1X_DEBUG_MAX_PAGE_OFFSET 102400
 
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index c4e1050..0ac3474 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -18,6 +18,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/host1x.h>
 #include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/scatterlist.h>
@@ -27,7 +28,6 @@
 
 #include "channel.h"
 #include "dev.h"
-#include "host1x_bo.h"
 #include "job.h"
 #include "syncpt.h"
 
diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
index fba45f2..33a697d 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -34,15 +34,6 @@ struct host1x_cmdbuf {
 	u32 pad;
 };
 
-struct host1x_reloc {
-	struct host1x_bo *cmdbuf;
-	u32 cmdbuf_offset;
-	struct host1x_bo *target;
-	u32 target_offset;
-	u32 shift;
-	u32 pad;
-};
-
 struct host1x_waitchk {
 	struct host1x_bo *bo;
 	u32 offset;
@@ -56,105 +47,6 @@ struct host1x_job_unpin_data {
 };
 
 /*
- * Each submit is tracked as a host1x_job.
- */
-struct host1x_job {
-	/* When refcount goes to zero, job can be freed */
-	struct kref ref;
-
-	/* List entry */
-	struct list_head list;
-
-	/* Channel where job is submitted to */
-	struct host1x_channel *channel;
-
-	u32 client;
-
-	/* Gathers and their memory */
-	struct host1x_job_gather *gathers;
-	unsigned int num_gathers;
-
-	/* Wait checks to be processed at submit time */
-	struct host1x_waitchk *waitchk;
-	unsigned int num_waitchk;
-	u32 waitchk_mask;
-
-	/* Array of handles to be pinned & unpinned */
-	struct host1x_reloc *relocarray;
-	unsigned int num_relocs;
-	struct host1x_job_unpin_data *unpins;
-	unsigned int num_unpins;
-
-	dma_addr_t *addr_phys;
-	dma_addr_t *gather_addr_phys;
-	dma_addr_t *reloc_addr_phys;
-
-	/* Sync point id, number of increments and end related to the submit */
-	u32 syncpt_id;
-	u32 syncpt_incrs;
-	u32 syncpt_end;
-
-	/* Maximum time to wait for this job */
-	unsigned int timeout;
-
-	/* Index and number of slots used in the push buffer */
-	unsigned int first_get;
-	unsigned int num_slots;
-
-	/* Copy of gathers */
-	size_t gather_copy_size;
-	dma_addr_t gather_copy;
-	u8 *gather_copy_mapped;
-
-	/* Check if register is marked as an address reg */
-	int (*is_addr_reg)(struct device *dev, u32 reg, u32 class);
-
-	/* Request a SETCLASS to this class */
-	u32 class;
-
-	/* Add a channel wait for previous ops to complete */
-	bool serialize;
-};
-/*
- * Allocate memory for a job. Just enough memory will be allocated to
- * accomodate the submit.
- */
-struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-				    u32 num_cmdbufs, u32 num_relocs,
-				    u32 num_waitchks);
-
-/*
- * Add a gather to a job.
- */
-void host1x_job_add_gather(struct host1x_job *job, struct host1x_bo *mem_id,
-			   u32 words, u32 offset);
-
-/*
- * Increment reference going to host1x_job.
- */
-struct host1x_job *host1x_job_get(struct host1x_job *job);
-
-/*
- * Decrement reference job, free if goes to zero.
- */
-void host1x_job_put(struct host1x_job *job);
-
-/*
- * Pin memory related to job. This handles relocation of addresses to the
- * host1x address space. Handles both the gather memory and any other memory
- * referred to from the gather buffers.
- *
- * Handles also patching out host waits that would wait for an expired sync
- * point value.
- */
-int host1x_job_pin(struct host1x_job *job, struct device *dev);
-
-/*
- * Unpin memory related to job.
- */
-void host1x_job_unpin(struct host1x_job *job);
-
-/*
  * Dump contents of job to debug output.
  */
 void host1x_job_dump(struct device *dev, struct host1x_job *job);
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 409745b..03cf292 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -354,6 +354,25 @@ void host1x_syncpt_deinit(struct host1x *host)
 		kfree(sp->name);
 }
 
+/*
+ * Read max. It indicates how many operations there are in queue, either in
+ * channel or in a software thread.
+ * */
+u32 host1x_syncpt_read_max(struct host1x_syncpt *sp)
+{
+	smp_rmb();
+	return (u32)atomic_read(&sp->max_val);
+}
+
+/*
+ * Read min, which is a shadow of the current sync point value in hardware.
+ */
+u32 host1x_syncpt_read_min(struct host1x_syncpt *sp)
+{
+	smp_rmb();
+	return (u32)atomic_read(&sp->min_val);
+}
+
 int host1x_syncpt_nb_pts(struct host1x *host)
 {
 	return host->info->nb_pts;
diff --git a/drivers/gpu/host1x/syncpt.h b/drivers/gpu/host1x/syncpt.h
index 267c0b9..4eb933a 100644
--- a/drivers/gpu/host1x/syncpt.h
+++ b/drivers/gpu/host1x/syncpt.h
@@ -20,6 +20,7 @@
 #define __HOST1X_SYNCPT_H
 
 #include <linux/atomic.h>
+#include <linux/host1x.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
 
@@ -50,25 +51,6 @@ int host1x_syncpt_init(struct host1x *host);
 /*  Free sync point array */
 void host1x_syncpt_deinit(struct host1x *host);
 
-/*
- * Read max. It indicates how many operations there are in queue, either in
- * channel or in a software thread.
- * */
-static inline u32 host1x_syncpt_read_max(struct host1x_syncpt *sp)
-{
-	smp_rmb();
-	return (u32)atomic_read(&sp->max_val);
-}
-
-/*
- * Read min, which is a shadow of the current sync point value in hardware.
- */
-static inline u32 host1x_syncpt_read_min(struct host1x_syncpt *sp)
-{
-	smp_rmb();
-	return (u32)atomic_read(&sp->min_val);
-}
-
 /* Return number of sync point supported. */
 int host1x_syncpt_nb_pts(struct host1x *host);
 
@@ -112,9 +94,6 @@ static inline bool host1x_syncpt_idle(struct host1x_syncpt *sp)
 	return (min == max);
 }
 
-/* Return pointer to struct denoting sync point id. */
-struct host1x_syncpt *host1x_syncpt_get(struct host1x *host, u32 id);
-
 /* Load current value from hardware to the shadow register. */
 u32 host1x_syncpt_load(struct host1x_syncpt *sp);
 
@@ -130,16 +109,9 @@ void host1x_syncpt_restore(struct host1x *host);
 /* Read current wait base value into shadow register and return it. */
 u32 host1x_syncpt_load_wait_base(struct host1x_syncpt *sp);
 
-/* Request incrementing a sync point. */
-int host1x_syncpt_incr(struct host1x_syncpt *sp);
-
 /* Indicate future operations by incrementing the sync point max. */
 u32 host1x_syncpt_incr_max(struct host1x_syncpt *sp, u32 incrs);
 
-/* Wait until sync point reaches a threshold value, or a timeout. */
-int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh,
-			long timeout, u32 *value);
-
 /* Check if sync point id is valid. */
 static inline int host1x_syncpt_is_valid(struct host1x_syncpt *sp)
 {
@@ -149,14 +121,4 @@ static inline int host1x_syncpt_is_valid(struct host1x_syncpt *sp)
 /* Patch a wait by replacing it with a wait for syncpt 0 value 0 */
 int host1x_syncpt_patch_wait(struct host1x_syncpt *sp, void *patch_addr);
 
-/* Return id of the sync point */
-u32 host1x_syncpt_id(struct host1x_syncpt *sp);
-
-/* Allocate a sync point for a device. */
-struct host1x_syncpt *host1x_syncpt_request(struct device *dev,
-					    bool client_managed);
-
-/* Free a sync point. */
-void host1x_syncpt_free(struct host1x_syncpt *sp);
-
 #endif
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index d429a93..7442f2a 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -19,6 +19,9 @@
 #ifndef __LINUX_HOST1X_H
 #define __LINUX_HOST1X_H
 
+#include <linux/kref.h>
+#include <linux/types.h>
+
 enum host1x_class {
 	HOST1X_CLASS_HOST1X = 0x1,
 	HOST1X_CLASS_GR2D = 0x51,
@@ -45,4 +48,186 @@ struct host1x_client {
 	unsigned int num_syncpts;
 };
 
+/*
+ * host1x buffer objects
+ */
+
+struct host1x_bo;
+struct sg_table;
+
+struct host1x_bo_ops {
+	struct host1x_bo *(*get)(struct host1x_bo *bo);
+	void (*put)(struct host1x_bo *bo);
+	dma_addr_t (*pin)(struct host1x_bo *bo, struct sg_table **sgt);
+	void (*unpin)(struct host1x_bo *bo, struct sg_table *sgt);
+	void *(*mmap)(struct host1x_bo *bo);
+	void (*munmap)(struct host1x_bo *bo, void *addr);
+	void *(*kmap)(struct host1x_bo *bo, unsigned int pagenum);
+	void (*kunmap)(struct host1x_bo *bo, unsigned int pagenum, void *addr);
+};
+
+struct host1x_bo {
+	const struct host1x_bo_ops *ops;
+};
+
+static inline void host1x_bo_init(struct host1x_bo *bo,
+				  const struct host1x_bo_ops *ops)
+{
+	bo->ops = ops;
+}
+
+static inline struct host1x_bo *host1x_bo_get(struct host1x_bo *bo)
+{
+	return bo->ops->get(bo);
+}
+
+static inline void host1x_bo_put(struct host1x_bo *bo)
+{
+	bo->ops->put(bo);
+}
+
+static inline dma_addr_t host1x_bo_pin(struct host1x_bo *bo,
+				       struct sg_table **sgt)
+{
+	return bo->ops->pin(bo, sgt);
+}
+
+static inline void host1x_bo_unpin(struct host1x_bo *bo, struct sg_table *sgt)
+{
+	bo->ops->unpin(bo, sgt);
+}
+
+static inline void *host1x_bo_mmap(struct host1x_bo *bo)
+{
+	return bo->ops->mmap(bo);
+}
+
+static inline void host1x_bo_munmap(struct host1x_bo *bo, void *addr)
+{
+	bo->ops->munmap(bo, addr);
+}
+
+static inline void *host1x_bo_kmap(struct host1x_bo *bo, unsigned int pagenum)
+{
+	return bo->ops->kmap(bo, pagenum);
+}
+
+static inline void host1x_bo_kunmap(struct host1x_bo *bo,
+				    unsigned int pagenum, void *addr)
+{
+	bo->ops->kunmap(bo, pagenum, addr);
+}
+
+/*
+ * host1x syncpoints
+ */
+
+struct host1x_syncpt;
+struct host1x;
+
+struct host1x_syncpt *host1x_syncpt_get(struct host1x *host, u32 id);
+u32 host1x_syncpt_id(struct host1x_syncpt *sp);
+u32 host1x_syncpt_read_min(struct host1x_syncpt *sp);
+u32 host1x_syncpt_read_max(struct host1x_syncpt *sp);
+int host1x_syncpt_incr(struct host1x_syncpt *sp);
+int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
+		       u32 *value);
+struct host1x_syncpt *host1x_syncpt_request(struct device *dev,
+					    bool client_managed);
+void host1x_syncpt_free(struct host1x_syncpt *sp);
+
+/*
+ * host1x channel
+ */
+
+struct host1x_channel;
+struct host1x_job;
+
+struct host1x_channel *host1x_channel_request(struct device *dev);
+void host1x_channel_free(struct host1x_channel *channel);
+struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
+void host1x_channel_put(struct host1x_channel *channel);
+int host1x_job_submit(struct host1x_job *job);
+
+/*
+ * host1x job
+ */
+
+struct host1x_reloc {
+	struct host1x_bo *cmdbuf;
+	u32 cmdbuf_offset;
+	struct host1x_bo *target;
+	u32 target_offset;
+	u32 shift;
+	u32 pad;
+};
+
+struct host1x_job {
+	/* When refcount goes to zero, job can be freed */
+	struct kref ref;
+
+	/* List entry */
+	struct list_head list;
+
+	/* Channel where job is submitted to */
+	struct host1x_channel *channel;
+
+	u32 client;
+
+	/* Gathers and their memory */
+	struct host1x_job_gather *gathers;
+	unsigned int num_gathers;
+
+	/* Wait checks to be processed at submit time */
+	struct host1x_waitchk *waitchk;
+	unsigned int num_waitchk;
+	u32 waitchk_mask;
+
+	/* Array of handles to be pinned & unpinned */
+	struct host1x_reloc *relocarray;
+	unsigned int num_relocs;
+	struct host1x_job_unpin_data *unpins;
+	unsigned int num_unpins;
+
+	dma_addr_t *addr_phys;
+	dma_addr_t *gather_addr_phys;
+	dma_addr_t *reloc_addr_phys;
+
+	/* Sync point id, number of increments and end related to the submit */
+	u32 syncpt_id;
+	u32 syncpt_incrs;
+	u32 syncpt_end;
+
+	/* Maximum time to wait for this job */
+	unsigned int timeout;
+
+	/* Index and number of slots used in the push buffer */
+	unsigned int first_get;
+	unsigned int num_slots;
+
+	/* Copy of gathers */
+	size_t gather_copy_size;
+	dma_addr_t gather_copy;
+	u8 *gather_copy_mapped;
+
+	/* Check if register is marked as an address reg */
+	int (*is_addr_reg)(struct device *dev, u32 reg, u32 class);
+
+	/* Request a SETCLASS to this class */
+	u32 class;
+
+	/* Add a channel wait for previous ops to complete */
+	bool serialize;
+};
+
+struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
+				    u32 num_cmdbufs, u32 num_relocs,
+				    u32 num_waitchks);
+void host1x_job_add_gather(struct host1x_job *job, struct host1x_bo *mem_id,
+			   u32 words, u32 offset);
+struct host1x_job *host1x_job_get(struct host1x_job *job);
+void host1x_job_put(struct host1x_job *job);
+int host1x_job_pin(struct host1x_job *job, struct device *dev);
+void host1x_job_unpin(struct host1x_job *job);
+
 #endif
-- 
1.8.4
