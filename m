From: Bhaktipriya Shridhar <bhaktipriya96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: hw: intr_hw: Remove create_workqueue
Date: Fri, 27 May 2016 20:58:08 +0530
Message-ID: <20160527152808.GA17694@Karyakshetra>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

With concurrency managed workqueues, use of dedicated workqueues can be
replaced by using system_wq. Drop host->intr_wq by using
system_wq.

Since there is only a single work item, increase of concurrency level by
switching to system_wq should not break anything.

cancel_work_sync() is used to ensure that work is not pending by the time
exit path runs.

Signed-off-by: Bhaktipriya Shridhar <bhaktipriya96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/dev.h        | 1 -
 drivers/gpu/host1x/hw/intr_hw.c | 8 ++++++--
 drivers/gpu/host1x/intr.c       | 4 ----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index dace124..136c3a9 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -109,7 +109,6 @@ struct host1x {
 	struct clk *clk;

 	struct mutex intr_mutex;
-	struct workqueue_struct *intr_wq;
 	int intr_syncpt_irq;

 	const struct host1x_syncpt_ops *syncpt_op;
diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index 498b37e..ccf4599 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -38,7 +38,7 @@ static void host1x_intr_syncpt_handle(struct host1x_syncpt *syncpt)
 	host1x_sync_writel(host, BIT_MASK(id),
 		HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(BIT_WORD(id)));

-	queue_work(host->intr_wq, &syncpt->intr.work);
+	schedule_work(&syncpt->intr.work);
 }

 static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
@@ -127,8 +127,12 @@ static void _host1x_intr_disable_syncpt_intr(struct host1x *host, u32 id)

 static int _host1x_free_syncpt_irq(struct host1x *host)
 {
+	int i;
+
 	devm_free_irq(host->dev, host->intr_syncpt_irq, host);
-	flush_workqueue(host->intr_wq);
+
+	for (i = 0; i < host->info->nb_pts; i++)
+		cancel_work_sync(&host->syncpt[i].intr.work);
 	return 0;
 }

diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 2491bf8..81de286 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -277,9 +277,6 @@ int host1x_intr_init(struct host1x *host, unsigned int irq_sync)

 	mutex_init(&host->intr_mutex);
 	host->intr_syncpt_irq = irq_sync;
-	host->intr_wq = create_workqueue("host_syncpt");
-	if (!host->intr_wq)
-		return -ENOMEM;

 	for (id = 0; id < nb_pts; ++id) {
 		struct host1x_syncpt *syncpt = host->syncpt + id;
@@ -299,7 +296,6 @@ int host1x_intr_init(struct host1x *host, unsigned int irq_sync)
 void host1x_intr_deinit(struct host1x *host)
 {
 	host1x_intr_stop(host);
-	destroy_workqueue(host->intr_wq);
 }

 void host1x_intr_start(struct host1x *host)
--
2.1.4
