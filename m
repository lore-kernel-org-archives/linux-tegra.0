From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Mon,  7 Oct 2013 10:34:25 +0200
Message-ID: <1381134884-5816-9-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Rework the address table code for the host1x firewall. The previous
implementation allocated a bitfield but didn't check for a valid pointer
so it could potentially crash. Furthermore setting up a bitfield makes
the code more complex than it needs to be.

Don't annotate the driver's .remove() function __exit. Even if built in
the driver can be unloaded via sysfs, so .remove() needs to stick around
after initialization. Also remove the explicit initialization of the
driver's .owner field to THIS_MODULE because that's now handled by the
driver core.

Furthermore make an error message more consistent with other subdrivers,
index the syncpts array for better readability, remove a gratuituous
newline and reorder some variable declarations to make the code easier
to read.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/gr2d.c | 95 +++++++++++++++++++------------------------
 1 file changed, 41 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index 8d9a10f..07f0425 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -27,9 +27,8 @@
 
 struct gr2d {
 	struct host1x_client client;
-	struct clk *clk;
 	struct host1x_channel *channel;
-	unsigned long *addr_regs;
+	struct clk *clk;
 };
 
 static inline struct gr2d *to_gr2d(struct host1x_client *client)
@@ -37,8 +36,6 @@ static inline struct gr2d *to_gr2d(struct host1x_client *client)
 	return container_of(client, struct gr2d, client);
 }
 
-static int gr2d_is_addr_reg(struct device *dev, u32 class, u32 reg);
-
 static int gr2d_client_init(struct host1x_client *client,
 			    struct drm_device *drm)
 {
@@ -56,7 +53,6 @@ static int gr2d_open_channel(struct host1x_client *client,
 	struct gr2d *gr2d = to_gr2d(client);
 
 	context->channel = host1x_channel_get(gr2d->channel);
-
 	if (!context->channel)
 		return -ENOMEM;
 
@@ -87,11 +83,38 @@ static struct host1x_bo *host1x_bo_lookup(struct drm_device *drm,
 	return &bo->base;
 }
 
+static const u32 gr2d_addr_regs[] = {
+	0x1a, 0x1b, 0x26, 0x2b, 0x2c, 0x2d, 0x31, 0x32,
+	0x48, 0x49, 0x4a, 0x4b, 0x4c
+};
+
+static int gr2d_is_addr_reg(struct device *dev, u32 class, u32 offset)
+{
+	unsigned int i;
+
+	switch (class) {
+	case HOST1X_CLASS_HOST1X:
+		if (offset == 0x2b)
+			return 1;
+
+		break;
+
+	case HOST1X_CLASS_GR2D:
+	case HOST1X_CLASS_GR2D_SB:
+		for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
+			if (offset == gr2d_addr_regs[i])
+				return 1;
+
+		break;
+	}
+
+	return 0;
+}
+
 static int gr2d_submit(struct tegra_drm_context *context,
 		       struct drm_tegra_submit *args, struct drm_device *drm,
 		       struct drm_file *file)
 {
-	struct host1x_job *job;
 	unsigned int num_cmdbufs = args->num_cmdbufs;
 	unsigned int num_relocs = args->num_relocs;
 	unsigned int num_waitchks = args->num_waitchks;
@@ -102,6 +125,7 @@ static int gr2d_submit(struct tegra_drm_context *context,
 	struct drm_tegra_waitchk __user *waitchks =
 		(void * __user)(uintptr_t)args->waitchks;
 	struct drm_tegra_syncpt syncpt;
+	struct host1x_job *job;
 	int err;
 
 	/* We don't yet support other than one syncpt_incr struct per submit */
@@ -205,41 +229,6 @@ static struct host1x_client_ops gr2d_client_ops = {
 	.submit = gr2d_submit,
 };
 
-static void gr2d_init_addr_reg_map(struct device *dev, struct gr2d *gr2d)
-{
-	const u32 gr2d_addr_regs[] = {0x1a, 0x1b, 0x26, 0x2b, 0x2c, 0x2d, 0x31,
-				      0x32, 0x48, 0x49, 0x4a, 0x4b, 0x4c};
-	unsigned long *bitmap;
-	int i;
-
-	bitmap = devm_kzalloc(dev, DIV_ROUND_UP(256, BITS_PER_BYTE),
-			      GFP_KERNEL);
-
-	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); ++i) {
-		u32 reg = gr2d_addr_regs[i];
-		bitmap[BIT_WORD(reg)] |= BIT_MASK(reg);
-	}
-
-	gr2d->addr_regs = bitmap;
-}
-
-static int gr2d_is_addr_reg(struct device *dev, u32 class, u32 reg)
-{
-	struct gr2d *gr2d = dev_get_drvdata(dev);
-
-	switch (class) {
-	case HOST1X_CLASS_HOST1X:
-		return reg == 0x2b;
-	case HOST1X_CLASS_GR2D:
-	case HOST1X_CLASS_GR2D_SB:
-		reg &= 0xff;
-		if (gr2d->addr_regs[BIT_WORD(reg)] & BIT_MASK(reg))
-			return 1;
-	default:
-		return 0;
-	}
-}
-
 static const struct of_device_id gr2d_match[] = {
 	{ .compatible = "nvidia,tegra30-gr2d" },
 	{ .compatible = "nvidia,tegra20-gr2d" },
@@ -248,11 +237,11 @@ static const struct of_device_id gr2d_match[] = {
 
 static int gr2d_probe(struct platform_device *pdev)
 {
+	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
 	struct device *dev = &pdev->dev;
-	struct tegra_drm *tegra = host1x_get_drm_data(dev->parent);
-	int err;
-	struct gr2d *gr2d = NULL;
 	struct host1x_syncpt **syncpts;
+	struct gr2d *gr2d;
+	int err;
 
 	gr2d = devm_kzalloc(dev, sizeof(*gr2d), GFP_KERNEL);
 	if (!gr2d)
@@ -278,8 +267,8 @@ static int gr2d_probe(struct platform_device *pdev)
 	if (!gr2d->channel)
 		return -ENOMEM;
 
-	*syncpts = host1x_syncpt_request(dev, false);
-	if (!(*syncpts)) {
+	syncpts[0] = host1x_syncpt_request(dev, false);
+	if (!syncpts[0]) {
 		host1x_channel_free(gr2d->channel);
 		return -ENOMEM;
 	}
@@ -296,14 +285,12 @@ static int gr2d_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	gr2d_init_addr_reg_map(dev, gr2d);
-
 	platform_set_drvdata(pdev, gr2d);
 
 	return 0;
 }
 
-static int __exit gr2d_remove(struct platform_device *pdev)
+static int gr2d_remove(struct platform_device *pdev)
 {
 	struct tegra_drm *tegra = host1x_get_drm_data(pdev->dev.parent);
 	struct gr2d *gr2d = platform_get_drvdata(pdev);
@@ -312,7 +299,8 @@ static int __exit gr2d_remove(struct platform_device *pdev)
 
 	err = host1x_unregister_client(tegra, &gr2d->client);
 	if (err < 0) {
-		dev_err(&pdev->dev, "failed to unregister client: %d\n", err);
+		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
+			err);
 		return err;
 	}
 
@@ -326,11 +314,10 @@ static int __exit gr2d_remove(struct platform_device *pdev)
 }
 
 struct platform_driver tegra_gr2d_driver = {
-	.probe = gr2d_probe,
-	.remove = __exit_p(gr2d_remove),
 	.driver = {
-		.owner = THIS_MODULE,
 		.name = "gr2d",
 		.of_match_table = gr2d_match,
-	}
+	},
+	.probe = gr2d_probe,
+	.remove = gr2d_remove,
 };
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
