From: Bhaktipriya Shridhar <bhaktipriya96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] gpu: host1x: hw: intr_hw: Remove create_workqueue
Date: Sat, 18 Jun 2016 14:36:32 +0530
Message-ID: <20160618090632.GA11246@Karyakshetra>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

System workqueues have been able to handle high level of concurrency
for a long time now and there's no reason to use dedicated workqueues
just to gain concurrency. Since the workqueue host->intr_wq is involved
in sync point interrupts, and sync point wait and is not being used on
a memory reclaim path, dedicated host->intr_wq has been replaced with the
use of system_wq.

Unlike a dedicated per-cpu workqueue created with create_workqueue(),
system_wq allows multiple work items to overlap executions even on
the same CPU; however, a per-cpu workqueue doesn't have any CPU
locality or global ordering guarantees unless the target CPU is
explicitly specified and thus the increase of local concurrency
shouldn't make any difference.

cancel_work_sync() has been used  in _host1x_free_syncpt_irq() to ensure
that no work is pending by the time exit path runs.

Signed-off-by: Bhaktipriya Shridhar <bhaktipriya96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Changes in v2:
	-Changed commit description

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
index e1e31e9..10f8168 100644
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
