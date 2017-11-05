From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 08/10] drm/tegra: Implement dynamic channel allocation model
Date: Sun,  5 Nov 2017 13:01:16 +0200
Message-ID: <20171105110118.15142-9-mperttunen@nvidia.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171105110118.15142-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

In the traditional channel allocation model, a single hardware channel
was allocated for each client. This is simple from an implementation
perspective but prevents use of hardware scheduling.

This patch implements a channel allocation model where when a user
submits a job for a context, a hardware channel is allocated for
that context. The same channel is kept for as long as there are
incomplete jobs for that context. This way we can use hardware
scheduling and channel isolation between userspace processes, but
also prevent idling contexts from taking up hardware resources.

For now, this patch only adapts VIC to the new model.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 46 ++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.h |  7 +++-
 drivers/gpu/drm/tegra/vic.c | 79 +++++++++++++++++++++++----------------------
 3 files changed, 92 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index b964e18e3058..658bc8814f38 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -382,6 +382,51 @@ static int host1x_waitchk_copy_from_user(struct host1x_waitchk *dest,
 	return 0;
 }
 
+/**
+ * tegra_drm_context_get_channel() - Get a channel for submissions
+ * @context: Context for which to get a channel for
+ *
+ * Request a free hardware host1x channel for this user context, or if the
+ * context already has one, bump its refcount.
+ *
+ * Returns 0 on success, or -EBUSY if there were no free hardware channels.
+ */
+int tegra_drm_context_get_channel(struct tegra_drm_context *context)
+{
+	struct host1x_client *client = &context->client->base;
+
+	mutex_lock(&context->lock);
+
+	if (context->pending_jobs == 0) {
+		context->channel = host1x_channel_request(client->dev);
+		if (!context->channel) {
+			mutex_unlock(&context->lock);
+			return -EBUSY;
+		}
+	}
+
+	context->pending_jobs++;
+
+	mutex_unlock(&context->lock);
+
+	return 0;
+}
+
+/**
+ * tegra_drm_context_put_channel() - Put a previously gotten channel
+ * @context: Context which channel is no longer needed
+ *
+ * Decrease the refcount of the channel associated with this context,
+ * freeing it if the refcount drops to zero.
+ */
+void tegra_drm_context_put_channel(struct tegra_drm_context *context)
+{
+	mutex_lock(&context->lock);
+	if (--context->pending_jobs == 0)
+		host1x_channel_put(context->channel);
+	mutex_unlock(&context->lock);
+}
+
 static void tegra_drm_job_done(struct host1x_job *job)
 {
 	struct tegra_drm_context *context = job->callback_data;
@@ -737,6 +782,7 @@ static int tegra_open_channel(struct drm_device *drm, void *data,
 		kfree(context);
 
 	kref_init(&context->ref);
+	mutex_init(&context->lock);
 
 	mutex_unlock(&fpriv->lock);
 	return err;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 11d690846fd0..d0c3f1f779f6 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -78,9 +78,12 @@ struct tegra_drm_context {
 	struct kref ref;
 
 	struct tegra_drm_client *client;
+	unsigned int id;
+
+	struct mutex lock;
 	struct host1x_channel *channel;
 	struct host1x_syncpt *syncpt;
-	unsigned int id;
+	unsigned int pending_jobs;
 };
 
 struct tegra_drm_client_ops {
@@ -95,6 +98,8 @@ struct tegra_drm_client_ops {
 	void (*submit_done)(struct tegra_drm_context *context);
 };
 
+int tegra_drm_context_get_channel(struct tegra_drm_context *context);
+void tegra_drm_context_put_channel(struct tegra_drm_context *context);
 int tegra_drm_submit(struct tegra_drm_context *context,
 		     struct drm_tegra_submit *args, struct drm_device *drm,
 		     struct drm_file *file);
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index efe5f3af933e..0cacf023a890 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -33,7 +33,6 @@ struct vic {
 
 	void __iomem *regs;
 	struct tegra_drm_client client;
-	struct host1x_channel *channel;
 	struct iommu_domain *domain;
 	struct device *dev;
 	struct clk *clk;
@@ -161,28 +160,12 @@ static int vic_init(struct host1x_client *client)
 			goto detach_device;
 	}
 
-	vic->channel = host1x_channel_request(client->dev);
-	if (!vic->channel) {
-		err = -ENOMEM;
-		goto detach_device;
-	}
-
-	client->syncpts[0] = host1x_syncpt_request(client->dev, 0);
-	if (!client->syncpts[0]) {
-		err = -ENOMEM;
-		goto free_channel;
-	}
-
 	err = tegra_drm_register_client(tegra, drm);
 	if (err < 0)
-		goto free_syncpt;
+		goto detach_device;
 
 	return 0;
 
-free_syncpt:
-	host1x_syncpt_free(client->syncpts[0]);
-free_channel:
-	host1x_channel_put(vic->channel);
 detach_device:
 	if (tegra->domain)
 		iommu_detach_device(tegra->domain, vic->dev);
@@ -202,9 +185,6 @@ static int vic_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	host1x_syncpt_free(client->syncpts[0]);
-	host1x_channel_put(vic->channel);
-
 	if (vic->domain) {
 		iommu_detach_device(vic->domain, vic->dev);
 		vic->domain = NULL;
@@ -221,7 +201,24 @@ static const struct host1x_client_ops vic_client_ops = {
 static int vic_open_channel(struct tegra_drm_client *client,
 			    struct tegra_drm_context *context)
 {
-	struct vic *vic = to_vic(client);
+	context->syncpt = host1x_syncpt_request(client->base.dev, 0);
+	if (!context->syncpt)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void vic_close_channel(struct tegra_drm_context *context)
+{
+	host1x_syncpt_free(context->syncpt);
+}
+
+static int vic_submit(struct tegra_drm_context *context,
+		      struct drm_tegra_submit *args, struct drm_device *drm,
+		      struct drm_file *file)
+{
+	struct host1x_client *client = &context->client->base;
+	struct vic *vic = dev_get_drvdata(client->dev);
 	int err;
 
 	err = pm_runtime_get_sync(vic->dev);
@@ -229,35 +226,41 @@ static int vic_open_channel(struct tegra_drm_client *client,
 		return err;
 
 	err = vic_boot(vic);
-	if (err < 0) {
-		pm_runtime_put(vic->dev);
-		return err;
-	}
+	if (err < 0)
+		goto put_vic;
 
-	context->channel = host1x_channel_get(vic->channel);
-	if (!context->channel) {
-		pm_runtime_put(vic->dev);
-		return -ENOMEM;
-	}
+	err = tegra_drm_context_get_channel(context);
+	if (err < 0)
+		goto put_vic;
 
-	context->syncpt = client->base.syncpts[0];
+	err = tegra_drm_submit(context, args, drm, file);
+	if (err)
+		goto put_channel;
 
 	return 0;
+
+put_channel:
+	tegra_drm_context_put_channel(context);
+put_vic:
+	pm_runtime_put(vic->dev);
+
+	return err;
 }
 
-static void vic_close_channel(struct tegra_drm_context *context)
+static void vic_submit_done(struct tegra_drm_context *context)
 {
-	struct vic *vic = to_vic(context->client);
-
-	host1x_channel_put(context->channel);
+	struct host1x_client *client = &context->client->base;
+	struct vic *vic = dev_get_drvdata(client->dev);
 
+	tegra_drm_context_put_channel(context);
 	pm_runtime_put(vic->dev);
 }
 
 static const struct tegra_drm_client_ops vic_ops = {
 	.open_channel = vic_open_channel,
 	.close_channel = vic_close_channel,
-	.submit = tegra_drm_submit,
+	.submit = vic_submit,
+	.submit_done = vic_submit_done,
 };
 
 #define NVIDIA_TEGRA_124_VIC_FIRMWARE "nvidia/tegra124/vic03_ucode.bin"
@@ -340,8 +343,6 @@ static int vic_probe(struct platform_device *pdev)
 	vic->client.base.ops = &vic_client_ops;
 	vic->client.base.dev = dev;
 	vic->client.base.class = HOST1X_CLASS_VIC;
-	vic->client.base.syncpts = syncpts;
-	vic->client.base.num_syncpts = 1;
 	vic->dev = dev;
 	vic->config = vic_config;
 
-- 
2.14.2
