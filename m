From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/10] drm/tegra: Deliver job completion callback to client
Date: Sun,  5 Nov 2017 13:01:14 +0200
Message-ID: <20171105110118.15142-7-mperttunen@nvidia.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171105110118.15142-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

To allow client drivers to free resources when jobs have completed,
deliver job completion callbacks to them. This requires adding
reference counting to context objects, as job completion can happen
after the userspace application has closed the context. As such,
also add kref-based refcounting for contexts.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/drm.h |  4 ++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 2cdd054520bf..3e2a4a19412e 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -281,8 +281,11 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	return 0;
 }
 
-static void tegra_drm_context_free(struct tegra_drm_context *context)
+static void tegra_drm_context_free(struct kref *ref)
 {
+	struct tegra_drm_context *context =
+		container_of(ref, struct tegra_drm_context, ref);
+
 	context->client->ops->close_channel(context);
 	kfree(context);
 }
@@ -379,6 +382,16 @@ static int host1x_waitchk_copy_from_user(struct host1x_waitchk *dest,
 	return 0;
 }
 
+static void tegra_drm_job_done(struct host1x_job *job)
+{
+	struct tegra_drm_context *context = job->callback_data;
+
+	if (context->client->ops->submit_done)
+		context->client->ops->submit_done(context);
+
+	kref_put(&context->ref, tegra_drm_context_free);
+}
+
 int tegra_drm_submit(struct tegra_drm_context *context,
 		     struct drm_tegra_submit *args, struct drm_device *drm,
 		     struct drm_file *file)
@@ -560,6 +573,9 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	job->syncpt_id = syncpt.id;
 	job->timeout = 10000;
 
+	job->done = tegra_drm_job_done;
+	job->callback_data = context;
+
 	if (args->timeout && args->timeout < 10000)
 		job->timeout = args->timeout;
 
@@ -567,8 +583,11 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	if (err)
 		goto fail;
 
+	kref_get(&context->ref);
+
 	err = host1x_job_submit(job);
 	if (err) {
+		kref_put(&context->ref, tegra_drm_context_free);
 		host1x_job_unpin(job);
 		goto fail;
 	}
@@ -717,6 +736,8 @@ static int tegra_open_channel(struct drm_device *drm, void *data,
 	if (err < 0)
 		kfree(context);
 
+	kref_init(&context->ref);
+
 	mutex_unlock(&fpriv->lock);
 	return err;
 }
@@ -738,7 +759,7 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 	}
 
 	idr_remove(&fpriv->contexts, context->id);
-	tegra_drm_context_free(context);
+	kref_put(&context->ref, tegra_drm_context_free);
 
 unlock:
 	mutex_unlock(&fpriv->lock);
@@ -1026,7 +1047,7 @@ static int tegra_drm_context_cleanup(int id, void *p, void *data)
 {
 	struct tegra_drm_context *context = p;
 
-	tegra_drm_context_free(context);
+	kref_put(&context->ref, tegra_drm_context_free);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 063f5d397526..079aebb3fb38 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -13,6 +13,7 @@
 #include <uapi/drm/tegra_drm.h>
 #include <linux/host1x.h>
 #include <linux/iova.h>
+#include <linux/kref.h>
 #include <linux/of_gpio.h>
 
 #include <drm/drmP.h>
@@ -74,6 +75,8 @@ struct tegra_drm {
 struct tegra_drm_client;
 
 struct tegra_drm_context {
+	struct kref ref;
+
 	struct tegra_drm_client *client;
 	struct host1x_channel *channel;
 	unsigned int id;
@@ -88,6 +91,7 @@ struct tegra_drm_client_ops {
 	int (*submit)(struct tegra_drm_context *context,
 		      struct drm_tegra_submit *args, struct drm_device *drm,
 		      struct drm_file *file);
+	void (*submit_done)(struct tegra_drm_context *context);
 };
 
 int tegra_drm_submit(struct tegra_drm_context *context,
-- 
2.14.2
