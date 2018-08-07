From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 3/3] gpu: host1x: Continue CDMA execution starting with a next job
Date: Tue,  7 Aug 2018 16:07:13 +0300
Message-ID: <20180807130713.1016-4-digetx@gmail.com>
References: <20180807130713.1016-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807130713.1016-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Currently gathers of a hung job are getting NOP'ed and a restarted CDMA
executes the NOP'ed gathers. There shouldn't be a reason to not restart
CDMA execution starting with a next job, avoiding the unnecessary churning
with gathers NOP'ing.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/cdma.c       | 23 +++++++++++------------
 drivers/gpu/host1x/hw/cdma_hw.c | 13 -------------
 2 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 6aa6fa1498e8..9e4f01c7f663 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -323,7 +323,7 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 {
 	struct host1x *host1x = cdma_to_host1x(cdma);
 	u32 restart_addr, syncpt_incrs, syncpt_val;
-	struct host1x_job *job;
+	struct host1x_job *job, *next_job = NULL;
 
 	syncpt_val = host1x_syncpt_load(cdma->timeout.syncpt);
 
@@ -341,8 +341,13 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 		__func__);
 
 	list_for_each_entry(job, &cdma->sync_queue, list) {
-		if (syncpt_val < job->syncpt_end)
+		if (syncpt_val < job->syncpt_end) {
+
+			if (!list_is_last(&job->list, &cdma->sync_queue))
+				next_job = list_next_entry(job, list);
+
 			goto syncpt_incr;
+		}
 
 		host1x_job_dump(dev, job);
 	}
@@ -355,17 +360,11 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 	/*
 	 * Increment with CPU the remaining syncpts of a partially executed job.
 	 *
-	 * Syncpt increments must be done inline with the pushbuffer from a
-	 * GATHER buffer to maintain the order (slots are modified to be a
-	 * GATHER of syncpt incrs).
-	 *
-	 * Note: save in restart_addr the location where the timed out buffer
-	 * started in the PB, so we can start the refetch from there (with the
-	 * modified NOP-ed PB slots). This lets things appear to have completed
-	 * properly for this buffer and resources are freed.
+	 * CDMA will continue execution starting with the next job or will get
+	 * into idle state.
 	 */
-	if (job)
-		restart_addr = job->first_get;
+	if (next_job)
+		restart_addr = next_job->first_get;
 	else
 		restart_addr = cdma->last_pos;
 
diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
index ce320534cbed..bc203532ae6d 100644
--- a/drivers/gpu/host1x/hw/cdma_hw.c
+++ b/drivers/gpu/host1x/hw/cdma_hw.c
@@ -40,7 +40,6 @@ static void cdma_timeout_cpu_incr(struct host1x_cdma *cdma, u32 getptr,
 				u32 syncpt_incrs, u32 syncval, u32 nr_slots)
 {
 	struct host1x *host1x = cdma_to_host1x(cdma);
-	struct push_buffer *pb = &cdma->push_buffer;
 	unsigned int i;
 
 	for (i = 0; i < syncpt_incrs; i++)
@@ -48,18 +47,6 @@ static void cdma_timeout_cpu_incr(struct host1x_cdma *cdma, u32 getptr,
 
 	/* after CPU incr, ensure shadow is up to date */
 	host1x_syncpt_load(cdma->timeout.syncpt);
-
-	/* NOP all the PB slots */
-	while (nr_slots--) {
-		u32 *p = (u32 *)(pb->mapped + getptr);
-		*(p++) = HOST1X_OPCODE_NOP;
-		*(p++) = HOST1X_OPCODE_NOP;
-		dev_dbg(host1x->dev, "%s: NOP at %pad+%#x\n", __func__,
-			&pb->dma, getptr);
-		getptr = (getptr + 8) & (pb->size - 1);
-	}
-
-	wmb();
 }
 
 /*
-- 
2.18.0
