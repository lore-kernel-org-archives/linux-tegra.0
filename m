From: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/4] gpu: host1x: shuffle job APIs
Date: Thu, 13 Jun 2013 15:23:35 +0530
Message-ID: <1371117218-2326-2-git-send-email-mkulkarni@nvidia.com>
References: <1371117218-2326-1-git-send-email-mkulkarni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371117218-2326-1-git-send-email-mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch moves the API host1x_job_submit to job.c file. It also
adds a new API host1x_job_complete.

This is in preparation to add runtime PM support to host1x &
its modules. The idea is to call pm_runtime_get from
host1x_job_submit and pm_runtime_put from host1x_job_complete.

This way the runtime PM calls are localized to single file &
easy to maintain as well as debug

Signed-off-by: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/cdma.c    |  2 ++
 drivers/gpu/host1x/channel.c |  8 --------
 drivers/gpu/host1x/channel.h |  1 -
 drivers/gpu/host1x/job.c     | 12 ++++++++++++
 drivers/gpu/host1x/job.h     |  3 +++
 5 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index de72172..910087b 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -252,6 +252,8 @@ static void update_cdma_locked(struct host1x_cdma *cdma)
 				signal = true;
 		}
 
+		host1x_job_complete(job);
+
 		list_del(&job->list);
 		host1x_job_put(job);
 	}
diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 83ea51b..c381441 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -21,7 +21,6 @@
 
 #include "channel.h"
 #include "dev.h"
-#include "job.h"
 
 /* Constructor for the host1x device list */
 int host1x_channel_list_init(struct host1x *host)
@@ -37,13 +36,6 @@ int host1x_channel_list_init(struct host1x *host)
 	return 0;
 }
 
-int host1x_job_submit(struct host1x_job *job)
-{
-	struct host1x *host = dev_get_drvdata(job->channel->dev->parent);
-
-	return host1x_hw_channel_submit(host, job);
-}
-
 struct host1x_channel *host1x_channel_get(struct host1x_channel *channel)
 {
 	int err = 0;
diff --git a/drivers/gpu/host1x/channel.h b/drivers/gpu/host1x/channel.h
index 48723b8..8401f25 100644
--- a/drivers/gpu/host1x/channel.h
+++ b/drivers/gpu/host1x/channel.h
@@ -44,7 +44,6 @@ struct host1x_channel *host1x_channel_request(struct device *dev);
 void host1x_channel_free(struct host1x_channel *channel);
 struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
 void host1x_channel_put(struct host1x_channel *channel);
-int host1x_job_submit(struct host1x_job *job);
 
 #define host1x_for_each_channel(host, channel)				\
 	list_for_each_entry(channel, &host->chlist.list, list)
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index cc80766..05bafa4 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -586,3 +586,15 @@ void host1x_job_dump(struct device *dev, struct host1x_job *job)
 	dev_dbg(dev, "    NUM_SLOTS   %d\n", job->num_slots);
 	dev_dbg(dev, "    NUM_HANDLES %d\n", job->num_unpins);
 }
+
+int host1x_job_submit(struct host1x_job *job)
+{
+	struct host1x *host = dev_get_drvdata(job->channel->dev->parent);
+
+	return host1x_hw_channel_submit(host, job);
+}
+
+int host1x_job_complete(struct host1x_job *job)
+{
+	return 0;
+}
diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
index fba45f2..e0249c3 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -159,4 +159,7 @@ void host1x_job_unpin(struct host1x_job *job);
  */
 void host1x_job_dump(struct device *dev, struct host1x_job *job);
 
+int host1x_job_submit(struct host1x_job *job);
+int host1x_job_complete(struct host1x_job *job);
+
 #endif
-- 
1.8.1.5
