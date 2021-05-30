Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1595C4709A
	for <linux-tegra@archiver.kernel.org>; Sun, 30 May 2021 12:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B31E7611AE
	for <linux-tegra@archiver.kernel.org>; Sun, 30 May 2021 12:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhE3MYD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 30 May 2021 08:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhE3MYB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 May 2021 08:24:01 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F6E7C06138B
        for <linux-tegra@vger.kernel.org>; Sun, 30 May 2021 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=pio5wuYkbUbNq9Jl0h+NbXpUcO1KSQQtsdzja3u1jko=; b=NF6Rm0R17Rjkidl2ScGLz2IT5n
        tdzUJPg2ynPAjyo7HiSr0JdFuz3s739KHxPGZEJqLNed2nz0ustF+re4ggxYNXCsH3NialW++rYIl
        l80i3KYGKv27QojpTO0DkvHJIEfvURI96eMdrZ+eYHZe2OzxYI5Zj+yd4NOPc7YSnShmw2I+DFlJy
        Qh6IqpuBu62x2hMwTzoXWdrK95oT35eDm/XDRxFHLmUgo9UAlnq9FavDOERpe+P4ren5Fq9GNcTto
        RgdiwGLIf1AOJ0C8aKf1G/FfdEzoZWYXOhwzTK/8GwpoS/4lgI86tNknEA3gsGbD2F+8iRSnIw+pX
        tIpKlBoA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lnKSP-000775-M4; Sun, 30 May 2021 15:22:17 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 01/14] gpu: host1x: Add DMA fence implementation
Date:   Sun, 30 May 2021 15:21:43 +0300
Message-Id: <20210530122156.3292479-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210530122156.3292479-1-mperttunen@nvidia.com>
References: <20210530122156.3292479-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add an implementation of dma_fences based on syncpoints. Syncpoint
interrupts are used to signal fences. Additionally, after
software signaling has been enabled, a 30 second timeout is started.
If the syncpoint threshold is not reached within this period,
the fence is signalled with an -ETIMEDOUT error code. This is to
allow fences that would never reach their syncpoint threshold to
be cleaned up. The timeout can potentially be removed in the future
after job tracking code has been refactored.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
* Removed userspace interface.
* Add host1x_ prefixes in various places.
v5:
* Update for change in put_ref prototype.
v4:
* Fix _signal prototype and include it to avoid warning
* Remove use of unused local in error path
v3:
* Move declaration of host1x_fence_extract to public header
---
 drivers/gpu/host1x/Makefile |   1 +
 drivers/gpu/host1x/fence.c  | 211 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/fence.h  |  13 +++
 drivers/gpu/host1x/intr.c   |   9 ++
 drivers/gpu/host1x/intr.h   |   2 +
 include/linux/host1x.h      |   3 +
 6 files changed, 239 insertions(+)
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 096017b8789d..d2b6f7de0498 100644
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
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
new file mode 100644
index 000000000000..fde59cd8487b
--- /dev/null
+++ b/drivers/gpu/host1x/fence.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Syncpoint dma_fence implementation
+ *
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#include <linux/dma-fence.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/sync_file.h>
+
+#include "fence.h"
+#include "intr.h"
+#include "syncpt.h"
+
+DEFINE_SPINLOCK(lock);
+
+struct host1x_syncpt_fence {
+	struct dma_fence base;
+
+	atomic_t signaling;
+
+	struct host1x_syncpt *sp;
+	u32 threshold;
+
+	struct host1x_waitlist *waiter;
+	void *waiter_ref;
+
+	struct delayed_work timeout_work;
+};
+
+static const char *host1x_syncpt_fence_get_driver_name(struct dma_fence *f)
+{
+	return "host1x";
+}
+
+static const char *host1x_syncpt_fence_get_timeline_name(struct dma_fence *f)
+{
+	return "syncpoint";
+}
+
+static struct host1x_syncpt_fence *to_host1x_fence(struct dma_fence *f)
+{
+	return container_of(f, struct host1x_syncpt_fence, base);
+}
+
+static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
+{
+	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
+	int err;
+
+	if (host1x_syncpt_is_expired(sf->sp, sf->threshold))
+		return false;
+
+	dma_fence_get(f);
+
+	/*
+	 * The dma_fence framework requires the fence driver to keep a
+	 * reference to any fences for which 'enable_signaling' has been
+	 * called (and that have not been signalled).
+	 * 
+	 * We provide a userspace API to create arbitrary syncpoint fences,
+	 * so we cannot normally guarantee that all fences get signalled.
+	 * As such, setup a timeout, so that long-lasting fences will get
+	 * reaped eventually.
+	 */
+	schedule_delayed_work(&sf->timeout_work, msecs_to_jiffies(30000));
+
+	err = host1x_intr_add_action(sf->sp->host, sf->sp, sf->threshold,
+				     HOST1X_INTR_ACTION_SIGNAL_FENCE, f,
+				     sf->waiter, &sf->waiter_ref);
+	if (err) {
+		cancel_delayed_work_sync(&sf->timeout_work);
+		dma_fence_put(f);
+		return false;
+	}
+
+	/* intr framework takes ownership of waiter */
+	sf->waiter = NULL;
+
+	/*
+	 * The fence may get signalled at any time after the above call,
+	 * so we need to initialize all state used by signalling
+	 * before it.
+	 */
+
+	return true;
+}
+
+static void host1x_syncpt_fence_release(struct dma_fence *f)
+{
+	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
+
+	if (sf->waiter)
+		kfree(sf->waiter);
+
+	dma_fence_free(f);
+}
+
+const struct dma_fence_ops host1x_syncpt_fence_ops = {
+	.get_driver_name = host1x_syncpt_fence_get_driver_name,
+	.get_timeline_name = host1x_syncpt_fence_get_timeline_name,
+	.enable_signaling = host1x_syncpt_fence_enable_signaling,
+	.release = host1x_syncpt_fence_release,
+};
+
+void host1x_fence_signal(struct host1x_syncpt_fence *f)
+{
+	if (atomic_xchg(&f->signaling, 1))
+		return;
+
+	/*
+	 * Cancel pending timeout work - if it races, it will
+	 * not get 'f->signaling' and return.
+	 */
+	cancel_delayed_work_sync(&f->timeout_work);
+
+	host1x_intr_put_ref(f->sp->host, f->sp->id, f->waiter_ref, false);
+
+	dma_fence_signal(&f->base);
+	dma_fence_put(&f->base);
+}
+
+static void do_fence_timeout(struct work_struct *work)
+{
+	struct delayed_work *dwork = (struct delayed_work *)work;
+	struct host1x_syncpt_fence *f =
+		container_of(dwork, struct host1x_syncpt_fence, timeout_work);
+
+	if (atomic_xchg(&f->signaling, 1))
+		return;
+
+	/*
+	 * Cancel pending timeout work - if it races, it will
+	 * not get 'f->signaling' and return.
+	 */
+	host1x_intr_put_ref(f->sp->host, f->sp->id, f->waiter_ref, true);
+
+	dma_fence_set_error(&f->base, -ETIMEDOUT);
+	dma_fence_signal(&f->base);
+	dma_fence_put(&f->base);
+}
+
+struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold)
+{
+	struct host1x_syncpt_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	fence->waiter = kzalloc(sizeof(*fence->waiter), GFP_KERNEL);
+	if (!fence->waiter)
+		return ERR_PTR(-ENOMEM);
+
+	fence->sp = sp;
+	fence->threshold = threshold;
+
+	dma_fence_init(&fence->base, &host1x_syncpt_fence_ops, &lock,
+		       dma_fence_context_alloc(1), 0);
+
+	INIT_DELAYED_WORK(&fence->timeout_work, do_fence_timeout);
+
+	return &fence->base;
+}
+EXPORT_SYMBOL(host1x_fence_create);
+
+int host1x_fence_create_fd(struct host1x_syncpt *sp, u32 threshold)
+{
+	struct sync_file *file;
+	struct dma_fence *f;
+	int fd;
+
+	f = host1x_fence_create(sp, threshold);
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		dma_fence_put(f);
+		return fd;
+	}
+
+	file = sync_file_create(f);
+	dma_fence_put(f);
+	if (!file)
+		return -ENOMEM;
+
+	fd_install(fd, file->file);
+
+	return fd;
+}
+EXPORT_SYMBOL(host1x_fence_create_fd);
+
+int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32 *threshold)
+{
+	struct host1x_syncpt_fence *f;
+
+	if (fence->ops != &host1x_syncpt_fence_ops)
+		return -EINVAL;
+
+	f = container_of(fence, struct host1x_syncpt_fence, base);
+
+	*id = f->sp->id;
+	*threshold = f->threshold;
+
+	return 0;
+}
+EXPORT_SYMBOL(host1x_fence_extract);
diff --git a/drivers/gpu/host1x/fence.h b/drivers/gpu/host1x/fence.h
new file mode 100644
index 000000000000..70c91de82f14
--- /dev/null
+++ b/drivers/gpu/host1x/fence.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#ifndef HOST1X_FENCE_H
+#define HOST1X_FENCE_H
+
+struct host1x_syncpt_fence;
+
+void host1x_fence_signal(struct host1x_syncpt_fence *fence);
+
+#endif
diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 6d1f3c0fdbe7..45b6be927ec4 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -13,6 +13,7 @@
 #include <trace/events/host1x.h>
 #include "channel.h"
 #include "dev.h"
+#include "fence.h"
 #include "intr.h"
 
 /* Wait list management */
@@ -121,12 +122,20 @@ static void action_wakeup_interruptible(struct host1x_waitlist *waiter)
 	wake_up_interruptible(wq);
 }
 
+static void action_signal_fence(struct host1x_waitlist *waiter)
+{
+	struct host1x_syncpt_fence *f = waiter->data;
+
+	host1x_fence_signal(f);
+}
+
 typedef void (*action_handler)(struct host1x_waitlist *waiter);
 
 static const action_handler action_handlers[HOST1X_INTR_ACTION_COUNT] = {
 	action_submit_complete,
 	action_wakeup,
 	action_wakeup_interruptible,
+	action_signal_fence,
 };
 
 static void run_handlers(struct list_head completed[HOST1X_INTR_ACTION_COUNT])
diff --git a/drivers/gpu/host1x/intr.h b/drivers/gpu/host1x/intr.h
index 6ea55e615e3a..e4c346099273 100644
--- a/drivers/gpu/host1x/intr.h
+++ b/drivers/gpu/host1x/intr.h
@@ -33,6 +33,8 @@ enum host1x_intr_action {
 	 */
 	HOST1X_INTR_ACTION_WAKEUP_INTERRUPTIBLE,
 
+	HOST1X_INTR_ACTION_SIGNAL_FENCE,
+
 	HOST1X_INTR_ACTION_COUNT
 };
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index e0a41c2b4c7a..f2ea24fe0b0d 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -166,6 +166,9 @@ u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
 void host1x_syncpt_release_vblank_reservation(struct host1x_client *client,
 					      u32 syncpt_id);
 
+struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold);
+int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32 *threshold);
+
 /*
  * host1x channel
  */
-- 
2.30.1

