From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] gpu: host1x: Add support for DMA fences
Date: Thu, 11 Jan 2018 23:22:47 +0100
Message-ID: <20180111222249.29105-2-thierry.reding@gmail.com>
References: <20180111222249.29105-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111222249.29105-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add an implementation of DMA fences backed by Host1x syncpoints,
an interface to specify a prefence for job submissions.

Before submission, prefences containing only Host1x syncpoints
are waited by pushing wait commands to CDMA, whereas other
fences are CPU-waited.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/Kconfig         |   1 +
 drivers/gpu/host1x/Makefile        |   1 +
 drivers/gpu/host1x/dev.h           |  12 ++-
 drivers/gpu/host1x/fence.c         | 202 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/fence.h         |  28 +++++
 drivers/gpu/host1x/hw/channel_hw.c |  36 +++++--
 drivers/gpu/host1x/intr.c          |  11 +-
 drivers/gpu/host1x/intr.h          |   8 +-
 drivers/gpu/host1x/syncpt.c        |   2 +
 include/linux/host1x.h             |  12 ++-
 10 files changed, 302 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h

diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 91916326957f..e41032ebf16d 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -1,6 +1,7 @@
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
 	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	select DMA_SHARED_BUFFER
 	select IOMMU_IOVA if IOMMU_SUPPORT
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index b92016ce09b7..ae3a6edf74b4 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -9,6 +9,7 @@ host1x-y = \
 	job.o \
 	debug.o \
 	mipi.o \
+	fence.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
 	hw/host1x04.o \
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 43e9fabb43a1..c9071c9c443e 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2012-2015, NVIDIA Corporation.
+ * Copyright (C) 2012-2016 NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -42,6 +42,7 @@ struct host1x_channel_ops {
 	int (*init)(struct host1x_channel *channel, struct host1x *host,
 		    unsigned int id);
 	int (*submit)(struct host1x_job *job);
+	void (*push_wait)(struct host1x_channel *ch, u32 id, u32 thresh);
 };
 
 struct host1x_cdma_ops {
@@ -117,6 +118,8 @@ struct host1x {
 	struct clk *clk;
 	struct reset_control *rst;
 
+	u64 fence_ctx_base;
+
 	struct iommu_group *group;
 	struct iommu_domain *domain;
 	struct iova_domain iova;
@@ -250,6 +253,13 @@ static inline int host1x_hw_channel_submit(struct host1x *host,
 	return host->channel_op->submit(job);
 }
 
+static inline void host1x_hw_channel_push_wait(struct host1x *host,
+					       struct host1x_channel *channel,
+					       u32 id, u32 thresh)
+{
+	host->channel_op->push_wait(channel, id, thresh);
+}
+
 static inline void host1x_hw_cdma_start(struct host1x *host,
 					struct host1x_cdma *cdma)
 {
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
new file mode 100644
index 000000000000..3b056623ea64
--- /dev/null
+++ b/drivers/gpu/host1x/fence.c
@@ -0,0 +1,202 @@
+/*
+ * Copyright (C) 2016 NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-array.h>
+#include <linux/slab.h>
+
+#include "fence.h"
+#include "intr.h"
+#include "syncpt.h"
+#include "cdma.h"
+#include "channel.h"
+#include "dev.h"
+
+struct host1x_fence {
+	struct dma_fence base;
+	spinlock_t lock;
+
+	struct host1x_syncpt *syncpt;
+	u32 threshold;
+
+	struct host1x *host;
+	void *waiter;
+
+	char timeline_name[10];
+};
+
+static inline struct host1x_fence *to_host1x_fence(struct dma_fence *fence)
+{
+	return (struct host1x_fence *)fence;
+}
+
+static const char *host1x_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "host1x";
+}
+
+static const char *host1x_fence_get_timeline_name(struct dma_fence *fence)
+{
+	struct host1x_fence *f = to_host1x_fence(fence);
+
+	return f->timeline_name;
+}
+
+static bool host1x_fence_enable_signaling(struct dma_fence *fence)
+{
+	struct host1x_fence *f = to_host1x_fence(fence);
+
+	if (host1x_syncpt_is_expired(f->syncpt, f->threshold))
+		return false;
+
+	return true;
+}
+
+static bool host1x_fence_signaled(struct dma_fence *fence)
+{
+	struct host1x_fence *f = to_host1x_fence(fence);
+
+	return host1x_syncpt_is_expired(f->syncpt, f->threshold);
+}
+
+static void host1x_fence_release(struct dma_fence *fence)
+{
+	struct host1x_fence *f = to_host1x_fence(fence);
+
+	if (f->waiter)
+		host1x_intr_put_ref(f->host, f->syncpt->id, f->waiter);
+
+	kfree(f);
+}
+
+const struct dma_fence_ops host1x_fence_ops = {
+	.get_driver_name = host1x_fence_get_driver_name,
+	.get_timeline_name = host1x_fence_get_timeline_name,
+	.enable_signaling = host1x_fence_enable_signaling,
+	.signaled = host1x_fence_signaled,
+	.wait = dma_fence_default_wait,
+	.release = host1x_fence_release,
+};
+
+static void host1x_fence_wait_single(struct host1x_fence *f,
+				     struct host1x *host,
+				     struct host1x_channel *ch)
+{
+	if (host1x_syncpt_is_expired(f->syncpt, f->threshold))
+		return;
+
+	host1x_hw_channel_push_wait(host, ch, f->syncpt->id, f->threshold);
+}
+
+/**
+ * host1x_fence_is_waitable() - Check if DMA fence can be waited by hardware
+ * @fence: DMA fence
+ *
+ * Check is @fence is only backed by Host1x syncpoints and can therefore be
+ * waited using only hardware.
+ */
+bool host1x_fence_is_waitable(struct dma_fence *fence)
+{
+	struct dma_fence_array *array;
+	int i;
+
+	array = to_dma_fence_array(fence);
+	if (!array)
+		return fence->ops == &host1x_fence_ops;
+
+	for (i = 0; i < array->num_fences; ++i) {
+		if (array->fences[i]->ops != &host1x_fence_ops)
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * host1x_fence_wait() - Insert waits for fence into channel
+ * @fence: DMA fence
+ * @host: Host1x
+ * @ch: Host1x channel
+ *
+ * Inserts wait commands into Host1x channel fences in @fence.
+ * in @fence. @fence must only consist of syncpoint-backed fences.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int host1x_fence_wait(struct dma_fence *fence, struct host1x *host,
+		      struct host1x_channel *ch)
+{
+	struct dma_fence_array *array;
+	int i = 0;
+
+	if (!host1x_fence_is_waitable(fence))
+		return -EINVAL;
+
+	array = to_dma_fence_array(fence);
+	if (!array) {
+		host1x_fence_wait_single(to_host1x_fence(fence), host, ch);
+		return 0;
+	}
+
+	for (i = 0; i < array->num_fences; ++i) {
+		host1x_fence_wait_single(to_host1x_fence(array->fences[i]),
+					 host, ch);
+	}
+
+	return 0;
+}
+
+struct dma_fence *host1x_fence_create(struct host1x *host,
+				      struct host1x_syncpt *syncpt,
+				      u32 threshold)
+{
+	struct host1x_waitlist *waiter;
+	struct host1x_fence *f;
+	int err;
+
+	f = kzalloc(sizeof(*f), GFP_KERNEL);
+	if (!f)
+		return NULL;
+
+	waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
+	if (!waiter) {
+		kfree(f);
+		return NULL;
+	}
+
+	f->host = host;
+	f->syncpt = syncpt;
+	f->threshold = threshold;
+	f->waiter = NULL;
+	snprintf(f->timeline_name, ARRAY_SIZE(f->timeline_name),
+		 "%d", syncpt->id);
+
+	spin_lock_init(&f->lock);
+	dma_fence_init(&f->base, &host1x_fence_ops, &f->lock,
+		       host->fence_ctx_base + syncpt->id, threshold);
+
+	err = host1x_intr_add_action(f->host, f->syncpt->id, f->threshold,
+				     HOST1X_INTR_ACTION_SIGNAL_FENCE, f,
+				     waiter, &f->waiter);
+	if (err) {
+		kfree(waiter);
+		dma_fence_put((struct dma_fence *)f);
+		return NULL;
+	}
+
+	return (struct dma_fence *)f;
+}
+EXPORT_SYMBOL(host1x_fence_create);
diff --git a/drivers/gpu/host1x/fence.h b/drivers/gpu/host1x/fence.h
new file mode 100644
index 000000000000..5725c95c0f1b
--- /dev/null
+++ b/drivers/gpu/host1x/fence.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright (C) 2016 NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __HOST1X_FENCE_H
+#define __HOST1X_FENCE_H
+
+struct host1x;
+struct host1x_channel;
+struct dma_fence;
+
+bool host1x_fence_is_waitable(struct dma_fence *fence);
+int host1x_fence_wait(struct dma_fence *fence, struct host1x *host,
+		      struct host1x_channel *ch);
+
+#endif
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 9af758785a11..d43828902248 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -1,7 +1,7 @@
 /*
  * Tegra host1x Channel
  *
- * Copyright (c) 2010-2013, NVIDIA Corporation.
+ * Copyright (C) 2010-2016 NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -16,6 +16,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/dma-fence.h>
 #include <linux/host1x.h>
 #include <linux/slab.h>
 
@@ -23,6 +24,7 @@
 
 #include "../channel.h"
 #include "../dev.h"
+#include "../fence.h"
 #include "../intr.h"
 #include "../job.h"
 
@@ -68,11 +70,26 @@ static void submit_gathers(struct host1x_job *job)
 		u32 op1 = host1x_opcode_gather(g->words);
 		u32 op2 = g->base + g->offset;
 
+		/* add a setclass for modules that require it */
+		if (job->class)
+			host1x_cdma_push(cdma,
+				 host1x_opcode_setclass(job->class, 0, 0),
+				 HOST1X_OPCODE_NOP);
+
 		trace_write_gather(cdma, g->bo, g->offset, op1 & 0xffff);
 		host1x_cdma_push(cdma, op1, op2);
 	}
 }
 
+static void channel_push_wait(struct host1x_channel *channel,
+			     u32 id, u32 thresh)
+{
+	host1x_cdma_push(&channel->cdma,
+			 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
+				host1x_uclass_wait_syncpt_r(), 1),
+			 host1x_class_host_wait_syncpt(id, thresh));
+}
+
 static inline void synchronize_syncpt_base(struct host1x_job *job)
 {
 	struct host1x *host = dev_get_drvdata(job->channel->dev->parent);
@@ -110,6 +127,16 @@ static int channel_submit(struct host1x_job *job)
 	/* before error checks, return current max */
 	prev_max = job->syncpt_end = host1x_syncpt_read_max(sp);
 
+	if (job->prefence) {
+		if (host1x_fence_is_waitable(job->prefence)) {
+			host1x_fence_wait(job->prefence, host, job->channel);
+		} else {
+			err = dma_fence_wait(job->prefence, true);
+			if (err)
+				goto error;
+		}
+	}
+
 	/* get submit lock */
 	err = mutex_lock_interruptible(&ch->submitlock);
 	if (err)
@@ -151,12 +178,6 @@ static int channel_submit(struct host1x_job *job)
 
 	job->syncpt_end = syncval;
 
-	/* add a setclass for modules that require it */
-	if (job->class)
-		host1x_cdma_push(&ch->cdma,
-				 host1x_opcode_setclass(job->class, 0, 0),
-				 HOST1X_OPCODE_NOP);
-
 	submit_gathers(job);
 
 	/* end CDMA submit & stash pinned hMems into sync queue */
@@ -212,4 +233,5 @@ static int host1x_channel_init(struct host1x_channel *ch, struct host1x *dev,
 static const struct host1x_channel_ops host1x_channel_ops = {
 	.init = host1x_channel_init,
 	.submit = channel_submit,
+	.push_wait = channel_push_wait
 };
diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 8b4fad0ab35d..b3d51288243d 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -1,7 +1,7 @@
 /*
  * Tegra host1x Interrupt Management
  *
- * Copyright (c) 2010-2013, NVIDIA Corporation.
+ * Copyright (C) 2010-2016 NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -17,6 +17,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/dma-fence.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/irq.h>
@@ -133,12 +134,20 @@ static void action_wakeup_interruptible(struct host1x_waitlist *waiter)
 	wake_up_interruptible(wq);
 }
 
+static void action_signal_fence(struct host1x_waitlist *waiter)
+{
+	struct dma_fence *fence = waiter->data;
+
+	dma_fence_signal(fence);
+}
+
 typedef void (*action_handler)(struct host1x_waitlist *waiter);
 
 static const action_handler action_handlers[HOST1X_INTR_ACTION_COUNT] = {
 	action_submit_complete,
 	action_wakeup,
 	action_wakeup_interruptible,
+	action_signal_fence
 };
 
 static void run_handlers(struct list_head completed[HOST1X_INTR_ACTION_COUNT])
diff --git a/drivers/gpu/host1x/intr.h b/drivers/gpu/host1x/intr.h
index 1370c2bb75b8..6b2c090fa91c 100644
--- a/drivers/gpu/host1x/intr.h
+++ b/drivers/gpu/host1x/intr.h
@@ -1,7 +1,7 @@
 /*
  * Tegra host1x Interrupt Management
  *
- * Copyright (c) 2010-2013, NVIDIA Corporation.
+ * Copyright (C) 2010-2016 NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -43,6 +43,12 @@ enum host1x_intr_action {
 	 */
 	HOST1X_INTR_ACTION_WAKEUP_INTERRUPTIBLE,
 
+	/*
+	 * Signal a dma fence.
+	 * 'data' points to a host1x_fence
+	 */
+	HOST1X_INTR_ACTION_SIGNAL_FENCE,
+
 	HOST1X_INTR_ACTION_COUNT
 };
 
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index a2a952adc136..652803b610b2 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -18,6 +18,7 @@
 
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/dma-fence.h>
 #include <linux/slab.h>
 
 #include <trace/events/host1x.h>
@@ -413,6 +414,7 @@ int host1x_syncpt_init(struct host1x *host)
 	mutex_init(&host->syncpt_mutex);
 	host->syncpt = syncpt;
 	host->bases = bases;
+	host->fence_ctx_base = dma_fence_context_alloc(host->info->nb_pts);
 
 	host1x_syncpt_restore(host);
 	host1x_hw_syncpt_enable_protection(host);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index ddf7f9ca86cc..fd4daa78768f 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2009-2013, NVIDIA Corporation. All rights reserved.
+ * Copyright (C) 2009-2016 NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -71,6 +71,7 @@ struct host1x_client {
  * host1x buffer objects
  */
 
+struct dma_fence;
 struct host1x_bo;
 struct sg_table;
 
@@ -258,6 +259,9 @@ struct host1x_job {
 
 	/* Add a channel wait for previous ops to complete */
 	bool serialize;
+
+	/* Wait for prefence to complete before submitting */
+	struct dma_fence *prefence;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
@@ -343,4 +347,10 @@ int tegra_mipi_enable(struct tegra_mipi_device *device);
 int tegra_mipi_disable(struct tegra_mipi_device *device);
 int tegra_mipi_calibrate(struct tegra_mipi_device *device);
 
+struct host1x_fence;
+
+struct dma_fence *host1x_fence_create(struct host1x *host,
+				      struct host1x_syncpt *syncpt,
+				      u32 threshold);
+
 #endif
-- 
2.15.1
