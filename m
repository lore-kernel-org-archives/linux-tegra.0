From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 1/3] WIP: drm/tegra: Add 3D support
Date: Thu,  4 Apr 2013 16:09:18 +0200
Message-ID: <1365084560-11069-2-git-send-email-thierry.reding@avionic-design.de>
References: <1365084560-11069-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365084560-11069-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is a preliminary patch that adds support for 3D support on top of
Terje's and Arto's host1x and gr2d patches.

There are a few things that still need to be resolved before this can be
applied. I haven't been able to test Tegra30 support so it'd be good if
somebody with hardware could give it a try. I can probably arrange to
test it on a CardHu if nobody else steps up, but it'll take a while
until I get that setup. Looking at the downstream kernels indicates that
Tegra30 has a second clock and powergate domain and if those really are
required then this patch won't work on Tegra30.

One other important piece that is missing is a list of address registers
to feed to the firewall so that submitted command streams can be checked
for validity. I've already talked to Terje about that, but it seems like
it may turn out to be problematic. What with NVIDIA not wanting to
provide the register descriptions and all that. We'll need to resolve
this in some way before this patch can be merged.

Finally I want to refactor some of the commonalities between gr2d and
gr3d so that they can share more code.

If people want to give this a spin, there are some very basic test
programs available here[0]. The tests from the grate repository are
probably the most useful right now since they test both the gr2d and
gr3d modules and therefore can be used to verify that this patch
actually works.

[0]: https://github.com/organizations/grate-driver

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/host1x/Makefile   |   1 +
 drivers/gpu/host1x/dev.c      |   7 +
 drivers/gpu/host1x/dev.h      |   1 +
 drivers/gpu/host1x/drm/drm.c  |   2 +
 drivers/gpu/host1x/drm/gr3d.c | 289 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/host1x.h   |   3 +-
 6 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/host1x/drm/gr3d.c

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 3b037b6..5802e1b 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -17,4 +17,5 @@ host1x-$(CONFIG_DRM_TEGRA) += drm/drm.o drm/fb.o drm/dc.o
 host1x-$(CONFIG_DRM_TEGRA) += drm/output.o drm/rgb.o drm/hdmi.o
 host1x-$(CONFIG_DRM_TEGRA) += drm/gem.o
 host1x-$(CONFIG_DRM_TEGRA) += drm/gr2d.o
+host1x-$(CONFIG_DRM_TEGRA) += drm/gr3d.o
 obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 28e28a2..6daa3be 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -213,11 +213,17 @@ static int __init tegra_host1x_init(void)
 	err = platform_driver_register(&tegra_gr2d_driver);
 	if (err < 0)
 		goto unregister_hdmi;
+
+	err = platform_driver_register(&tegra_gr3d_driver);
+	if (err < 0)
+		goto unregister_gr2d;
 #endif
 
 	return 0;
 
 #ifdef CONFIG_DRM_TEGRA
+unregister_gr2d:
+	platform_driver_unregister(&tegra_gr2d_driver);
 unregister_hdmi:
 	platform_driver_unregister(&tegra_hdmi_driver);
 unregister_dc:
@@ -232,6 +238,7 @@ module_init(tegra_host1x_init);
 static void __exit tegra_host1x_exit(void)
 {
 #ifdef CONFIG_DRM_TEGRA
+	platform_driver_unregister(&tegra_gr3d_driver);
 	platform_driver_unregister(&tegra_gr2d_driver);
 	platform_driver_unregister(&tegra_hdmi_driver);
 	platform_driver_unregister(&tegra_dc_driver);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index a1607d6..406237a 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -304,5 +304,6 @@ static inline void host1x_hw_show_mlocks(struct host1x *host, struct output *o)
 extern struct platform_driver tegra_hdmi_driver;
 extern struct platform_driver tegra_dc_driver;
 extern struct platform_driver tegra_gr2d_driver;
+extern struct platform_driver tegra_gr3d_driver;
 
 #endif
diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 2b561c9..298c5f0 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -85,9 +85,11 @@ static int host1x_parse_dt(struct host1x_drm *host1x)
 		"nvidia,tegra20-dc",
 		"nvidia,tegra20-hdmi",
 		"nvidia,tegra20-gr2d",
+		"nvidia,tegra20-gr3d",
 		"nvidia,tegra30-dc",
 		"nvidia,tegra30-hdmi",
 		"nvidia,tegra30-gr2d",
+		"nvidia,tegra30-gr3d",
 	};
 	unsigned int i;
 	int err;
diff --git a/drivers/gpu/host1x/drm/gr3d.c b/drivers/gpu/host1x/drm/gr3d.c
new file mode 100644
index 0000000..58fe791
--- /dev/null
+++ b/drivers/gpu/host1x/drm/gr3d.c
@@ -0,0 +1,289 @@
+/*
+ * Copyright (C) 2013 Avionic Design GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/tegra-powergate.h>
+
+#include "host1x_client.h"
+#include "channel.h"
+#include "drm.h"
+#include "gem.h"
+#include "job.h"
+#include "syncpt.h"
+
+struct gr3d {
+	struct host1x_client client;
+	struct host1x_channel *channel;
+	struct clk *clk;
+};
+
+static inline struct gr3d *to_gr3d(struct host1x_client *client)
+{
+	return container_of(client, struct gr3d, client);
+}
+
+static int gr3d_drm_init(struct host1x_client *client, struct drm_device *drm)
+{
+	return 0;
+}
+
+static int gr3d_drm_exit(struct host1x_client *client)
+{
+	return 0;
+}
+
+static int gr3d_open_channel(struct host1x_client *client,
+			     struct host1x_drm_context *context)
+{
+	struct gr3d *gr3d = to_gr3d(client);
+
+	context->channel = host1x_channel_get(gr3d->channel);
+	if (!context->channel)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void gr3d_close_channel(struct host1x_drm_context *context)
+{
+	host1x_channel_put(context->channel);
+}
+
+static struct host1x_bo *host1x_bo_lookup(struct drm_device *drm,
+					  struct drm_file *file,
+					  u32 handle)
+{
+	struct drm_gem_object *gem;
+	struct tegra_bo *bo;
+
+	gem = drm_gem_object_lookup(drm, file, handle);
+	if (!gem)
+		return 0;
+
+	mutex_lock(&drm->struct_mutex);
+	drm_gem_object_unreference(gem);
+	mutex_unlock(&drm->struct_mutex);
+
+	bo = to_tegra_bo(gem);
+	return &bo->base;
+}
+
+static int gr3d_is_addr_reg(struct device *dev, u32 class, u32 reg)
+{
+	return 0;
+}
+
+static int gr3d_submit(struct host1x_drm_context *context,
+		       struct drm_tegra_submit *args, struct drm_device *drm,
+		       struct drm_file *file)
+{
+	struct host1x_job *job;
+	unsigned int num_cmdbufs = args->num_cmdbufs;
+	unsigned int num_relocs = args->num_relocs;
+	unsigned int num_waitchks = args->num_waitchks;
+	struct drm_tegra_cmdbuf __user *cmdbufs =
+		(void * __user)(uintptr_t)args->cmdbufs;
+	struct drm_tegra_reloc __user *relocs =
+		(void * __user)(uintptr_t)args->relocs;
+	struct drm_tegra_waitchk __user *waitchks =
+		(void * __user)(uintptr_t)args->waitchks;
+	struct drm_tegra_syncpt syncpt;
+	int err;
+
+	/* We don't yet support other than one syncpt_incr struct per submit */
+	if (args->num_syncpts != 1)
+		return -EINVAL;
+
+	job = host1x_job_alloc(context->channel, args->num_cmdbufs,
+			       args->num_relocs, args->num_waitchks);
+	if (!job)
+		return -ENOMEM;
+
+	job->num_relocs = args->num_relocs;
+	job->num_waitchk = args->num_waitchks;
+	job->client = (u32)args->context;
+	job->class = context->client->class;
+	job->serialize = true;
+
+	while (num_cmdbufs) {
+		struct drm_tegra_cmdbuf cmdbuf;
+		struct host1x_bo *bo;
+
+		err = copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf));
+		if (err)
+			goto fail;
+
+		bo = host1x_bo_lookup(drm, file, cmdbuf.handle);
+		if (!bo)
+			goto fail;
+
+		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
+		num_cmdbufs--;
+		cmdbufs++;
+	}
+
+	err = copy_from_user(job->relocarray, relocs,
+			     sizeof(*relocs) * num_relocs);
+	if (err)
+		goto fail;
+
+	while (num_relocs--) {
+		struct host1x_reloc *reloc = &job->relocarray[num_relocs];
+		struct host1x_bo *cmdbuf, *target;
+
+		cmdbuf = host1x_bo_lookup(drm, file, (u32)reloc->cmdbuf);
+		target = host1x_bo_lookup(drm, file, (u32)reloc->target);
+
+		reloc->cmdbuf = cmdbuf;
+		reloc->target = target;
+
+		if (!reloc->target || !reloc->cmdbuf)
+			goto fail;
+	}
+
+	err = copy_from_user(job->waitchk, waitchks,
+			     sizeof(*waitchks) * num_waitchks);
+	if (err)
+		goto fail;
+
+	err = host1x_job_pin(job, context->client->dev);
+	if (err)
+		goto fail;
+
+	err = copy_from_user(&syncpt, (void * __user)(uintptr_t)args->syncpts,
+			     sizeof(syncpt));
+	if (err)
+		goto fail;
+
+	job->syncpt_id = syncpt.id;
+	job->syncpt_incrs = syncpt.incrs;
+	job->timeout = 10000;
+	job->is_addr_reg = gr3d_is_addr_reg;
+	if (args->timeout && args->timeout < 10000)
+		job->timeout = args->timeout;
+
+	err = host1x_job_submit(job);
+	if (err)
+		goto fail_submit;
+
+	args->fence = job->syncpt_end;
+
+	host1x_job_put(job);
+	return 0;
+
+fail_submit:
+	host1x_job_unpin(job);
+fail:
+	host1x_job_put(job);
+	return err;
+}
+
+static const struct host1x_client_ops gr3d_client_ops = {
+	.drm_init = gr3d_drm_init,
+	.drm_exit = gr3d_drm_exit,
+	.open_channel = gr3d_open_channel,
+	.close_channel = gr3d_close_channel,
+	.submit = gr3d_submit,
+};
+
+static int gr3d_probe(struct platform_device *pdev)
+{
+	struct host1x_drm *host1x = host1x_get_drm_data(pdev->dev.parent);
+	struct host1x_syncpt **syncpts;
+	struct gr3d *gr3d;
+	int err;
+
+	gr3d = devm_kzalloc(&pdev->dev, sizeof(*gr3d), GFP_KERNEL);
+	if (!gr3d)
+		return -ENOMEM;
+
+	syncpts = devm_kzalloc(&pdev->dev, 1 * sizeof(*syncpts), GFP_KERNEL);
+	if (!syncpts)
+		return -ENOMEM;
+
+	gr3d->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(gr3d->clk)) {
+		dev_err(&pdev->dev, "cannot get clock\n");
+		return PTR_ERR(gr3d->clk);
+	}
+
+	err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D, gr3d->clk);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to power up 3D unit\n");
+		return err;
+	}
+
+	gr3d->channel = host1x_channel_request(&pdev->dev);
+	if (!gr3d->channel)
+		return -ENOMEM;
+
+	syncpts[0] = host1x_syncpt_request(&pdev->dev, 0);
+	if (!syncpts[0]) {
+		host1x_channel_free(gr3d->channel);
+		return -ENOMEM;
+	}
+
+	gr3d->client.class = HOST1X_CLASS_GR3D;
+	gr3d->client.ops = &gr3d_client_ops;
+	gr3d->client.dev = &pdev->dev;
+
+	gr3d->client.syncpts = syncpts;
+	gr3d->client.num_syncpts = 1;
+
+	err = host1x_register_client(host1x, &gr3d->client);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
+			err);
+		return err;
+	}
+
+	platform_set_drvdata(pdev, gr3d);
+
+	return 0;
+}
+
+static int __exit gr3d_remove(struct platform_device *pdev)
+{
+	struct host1x_drm *host1x = host1x_get_drm_data(pdev->dev.parent);
+	struct gr3d *gr3d = platform_get_drvdata(pdev);
+	unsigned int i;
+	int err;
+
+	err = host1x_unregister_client(host1x, &gr3d->client);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
+			err);
+		return err;
+	}
+
+	for (i = 0; i < gr3d->client.num_syncpts; i++)
+		host1x_syncpt_free(gr3d->client.syncpts[i]);
+
+	host1x_channel_free(gr3d->channel);
+	clk_disable_unprepare(gr3d->clk);
+
+	return 0;
+}
+
+static const struct of_device_id tegra_gr3d_match[] = {
+	{ .compatible = "nvidia,tegra30-gr3d" },
+	{ .compatible = "nvidia,tegra20-gr3d" },
+	{ }
+};
+
+struct platform_driver tegra_gr3d_driver = {
+	.probe = gr3d_probe,
+	.remove = __exit_p(gr3d_remove),
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = "gr3d",
+		.of_match_table = tegra_gr3d_match,
+	},
+};
diff --git a/drivers/gpu/host1x/host1x.h b/drivers/gpu/host1x/host1x.h
index a2bc1e6..70dfe56 100644
--- a/drivers/gpu/host1x/host1x.h
+++ b/drivers/gpu/host1x/host1x.h
@@ -24,7 +24,8 @@
 enum host1x_class {
 	HOST1X_CLASS_HOST1X	= 0x1,
 	HOST1X_CLASS_GR2D	= 0x51,
-	HOST1X_CLASS_GR2D_SB    = 0x52
+	HOST1X_CLASS_GR2D_SB	= 0x52,
+	HOST1X_CLASS_GR3D	= 0x60,
 };
 
 #endif
-- 
1.8.2
