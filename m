From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/3] gpu: host1x: Cancel only job that actually got stuck
Date: Tue,  7 Aug 2018 16:07:11 +0300
Message-ID: <20180807130713.1016-2-digetx@gmail.com>
References: <20180807130713.1016-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807130713.1016-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Host1x doesn't have information about jobs inter-dependency, that is
something that will become available once host1x will get a proper
jobs scheduler implementation. Currently a hang job causes other unrelated
jobs to be canceled, that is a relic from downstream driver which is
irrelevant to upstream. Let's cancel only the hanging job and not to touch
other jobs in queue.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/cdma.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 91df51e631b2..75f339f5df6f 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -348,13 +348,11 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 	}
 
 	/*
-	 * Walk the sync_queue, first incrementing with the CPU syncpts that
-	 * are partially executed (the first buffer) or fully skipped while
-	 * still in the current context (slots are also NOP-ed).
+	 * Increment with CPU the remaining syncpts of a partially executed job.
 	 *
-	 * At the point contexts are interleaved, syncpt increments must be
-	 * done inline with the pushbuffer from a GATHER buffer to maintain
-	 * the order (slots are modified to be a GATHER of syncpt incrs).
+	 * Syncpt increments must be done inline with the pushbuffer from a
+	 * GATHER buffer to maintain the order (slots are modified to be a
+	 * GATHER of syncpt incrs).
 	 *
 	 * Note: save in restart_addr the location where the timed out buffer
 	 * started in the PB, so we can start the refetch from there (with the
@@ -362,20 +360,15 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 	 * properly for this buffer and resources are freed.
 	 */
 
-	dev_dbg(dev, "%s: perform CPU incr on pending same ctx buffers\n",
-		__func__);
+	dev_dbg(dev, "%s: perform CPU incr on pending buffers\n", __func__);
 
 	if (!list_empty(&cdma->sync_queue))
 		restart_addr = job->first_get;
 	else
 		restart_addr = cdma->last_pos;
 
-	/* do CPU increments as long as this context continues */
-	list_for_each_entry_from(job, &cdma->sync_queue, list) {
-		/* different context, gets us out of this loop */
-		if (job->client != cdma->timeout.client)
-			break;
-
+	/* do CPU increments for the remaining syncpts */
+	if (job) {
 		/* won't need a timeout when replayed */
 		job->timeout = 0;
 
@@ -388,20 +381,8 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 		host1x_hw_cdma_timeout_cpu_incr(host1x, cdma, job->first_get,
 						syncpt_incrs, job->syncpt_end,
 						job->num_slots);
-
-		syncpt_val += syncpt_incrs;
 	}
 
-	/*
-	 * The following sumbits from the same client may be dependent on the
-	 * failed submit and therefore they may fail. Force a small timeout
-	 * to make the queue cleanup faster.
-	 */
-
-	list_for_each_entry_from(job, &cdma->sync_queue, list)
-		if (job->client == cdma->timeout.client)
-			job->timeout = min_t(unsigned int, job->timeout, 500);
-
 	dev_dbg(dev, "%s: finished sync_queue modification\n", __func__);
 
 	/* roll back DMAGET and start up channel again */
-- 
2.18.0
