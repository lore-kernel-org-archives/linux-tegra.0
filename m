From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 05/10] gpu: host1x: Add job done callback
Date: Sun,  5 Nov 2017 13:01:13 +0200
Message-ID: <20171105110118.15142-6-mperttunen@nvidia.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171105110118.15142-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Allow job submitters to set a callback to be called when the job has
completed. The jobs are stored and the callbacks called outside the
CDMA lock area to allow the callbacks to do CDMA-requiring operations
like freeing channels.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/cdma.c | 44 +++++++++++++++++++++++++++++++++-----------
 include/linux/host1x.h    |  4 ++++
 2 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index f787cfe69c11..57221d199d33 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -251,17 +251,24 @@ static void stop_cdma_timer_locked(struct host1x_cdma *cdma)
 	cdma->timeout.client = 0;
 }
 
-/*
- * For all sync queue entries that have already finished according to the
- * current sync point registers:
- *  - unpin & unref their mems
- *  - pop their push buffer slots
- *  - remove them from the sync queue
+/**
+ * update_cdma_locked() - Update CDMA sync queue
+ * @cdma: CDMA instance to update
+ * @done_jobs: List that finished jobs will be added to
+ *
+ * Go through the CDMA's sync queue, and for each job that has been finished,
+ * - unpin it
+ * - pop its push buffer slots
+ * - remove it from the sync queue
+ * - add it to the done_jobs list.
+ *
  * This is normally called from the host code's worker thread, but can be
  * called manually if necessary.
- * Must be called with the cdma lock held.
+ *
+ * Must be called with the CDMA lock held.
  */
-static void update_cdma_locked(struct host1x_cdma *cdma)
+static void update_cdma_locked(struct host1x_cdma *cdma,
+			       struct list_head *done_jobs)
 {
 	bool signal = false;
 	struct host1x *host1x = cdma_to_host1x(cdma);
@@ -305,8 +312,7 @@ static void update_cdma_locked(struct host1x_cdma *cdma)
 				signal = true;
 		}
 
-		list_del(&job->list);
-		host1x_job_put(job);
+		list_move_tail(&job->list, done_jobs);
 	}
 
 	if (cdma->event == CDMA_EVENT_SYNC_QUEUE_EMPTY &&
@@ -542,7 +548,23 @@ void host1x_cdma_end(struct host1x_cdma *cdma,
  */
 void host1x_cdma_update(struct host1x_cdma *cdma)
 {
+	struct host1x_job *job, *tmp;
+	LIST_HEAD(done_jobs);
+
 	mutex_lock(&cdma->lock);
-	update_cdma_locked(cdma);
+	update_cdma_locked(cdma, &done_jobs);
 	mutex_unlock(&cdma->lock);
+
+	/*
+	 * The done callback may want to free the channel, which requires
+	 * taking the CDMA lock, so we need to do it outside the above lock
+	 * region.
+	 */
+	list_for_each_entry_safe(job, tmp, &done_jobs, list) {
+		if (job->done)
+			job->done(job);
+
+		list_del(&job->list);
+		host1x_job_put(job);
+	}
 }
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 630b1a98ab58..f931d28a68ff 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -253,6 +253,10 @@ struct host1x_job {
 	/* Check if class belongs to the unit */
 	int (*is_valid_class)(u32 class);
 
+	/* Job done callback */
+	void (*done)(struct host1x_job *job);
+	void *callback_data;
+
 	/* Request a SETCLASS to this class */
 	u32 class;
 
-- 
2.14.2
