From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/3] gpu: host1x: Don't complete a completed job
Date: Tue,  7 Aug 2018 16:07:12 +0300
Message-ID: <20180807130713.1016-3-digetx@gmail.com>
References: <20180807130713.1016-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807130713.1016-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is a chance that the last job has been completed at the time of
CDMA timeout handler invocation. In this case there is no need to complete
the completed job.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/cdma.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 75f339f5df6f..6aa6fa1498e8 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -323,7 +323,7 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 {
 	struct host1x *host1x = cdma_to_host1x(cdma);
 	u32 restart_addr, syncpt_incrs, syncpt_val;
-	struct host1x_job *job = NULL;
+	struct host1x_job *job;
 
 	syncpt_val = host1x_syncpt_load(cdma->timeout.syncpt);
 
@@ -342,11 +342,16 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 
 	list_for_each_entry(job, &cdma->sync_queue, list) {
 		if (syncpt_val < job->syncpt_end)
-			break;
+			goto syncpt_incr;
 
 		host1x_job_dump(dev, job);
 	}
 
+	/* all jobs have been completed */
+	job = NULL;
+
+syncpt_incr:
+
 	/*
 	 * Increment with CPU the remaining syncpts of a partially executed job.
 	 *
@@ -359,16 +364,16 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 	 * modified NOP-ed PB slots). This lets things appear to have completed
 	 * properly for this buffer and resources are freed.
 	 */
-
-	dev_dbg(dev, "%s: perform CPU incr on pending buffers\n", __func__);
-
-	if (!list_empty(&cdma->sync_queue))
+	if (job)
 		restart_addr = job->first_get;
 	else
 		restart_addr = cdma->last_pos;
 
 	/* do CPU increments for the remaining syncpts */
 	if (job) {
+		dev_dbg(dev, "%s: perform CPU incr on pending buffers\n",
+			__func__);
+
 		/* won't need a timeout when replayed */
 		job->timeout = 0;
 
@@ -381,9 +386,10 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 		host1x_hw_cdma_timeout_cpu_incr(host1x, cdma, job->first_get,
 						syncpt_incrs, job->syncpt_end,
 						job->num_slots);
-	}
 
-	dev_dbg(dev, "%s: finished sync_queue modification\n", __func__);
+		dev_dbg(dev, "%s: finished sync_queue modification\n",
+			__func__);
+	}
 
 	/* roll back DMAGET and start up channel again */
 	host1x_hw_cdma_resume(host1x, cdma, restart_addr);
-- 
2.18.0
