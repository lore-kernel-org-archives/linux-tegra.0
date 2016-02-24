From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: platform: Fix deferred probe
Date: Wed, 24 Feb 2016 18:34:43 +0100
Message-ID: <1456335283-22097-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The error cleanup paths aren't quite correct and will crash upon
deferred probe.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v4.3+
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_platform.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 40 ++++++++++++++++------
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 8a70cec59bcd..2dfe58af12e4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -24,7 +24,7 @@
 static int nouveau_platform_probe(struct platform_device *pdev)
 {
 	const struct nvkm_device_tegra_func *func;
-	struct nvkm_device *device;
+	struct nvkm_device *device = NULL;
 	struct drm_device *drm;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 7f8a42721eb2..e7e581d6a8ff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -252,32 +252,40 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 
 	if (!(tdev = kzalloc(sizeof(*tdev), GFP_KERNEL)))
 		return -ENOMEM;
-	*pdevice = &tdev->device;
+
 	tdev->func = func;
 	tdev->pdev = pdev;
 	tdev->irq = -1;
 
 	tdev->vdd = devm_regulator_get(&pdev->dev, "vdd");
-	if (IS_ERR(tdev->vdd))
-		return PTR_ERR(tdev->vdd);
+	if (IS_ERR(tdev->vdd)) {
+		ret = PTR_ERR(tdev->vdd);
+		goto free;
+	}
 
 	tdev->rst = devm_reset_control_get(&pdev->dev, "gpu");
-	if (IS_ERR(tdev->rst))
-		return PTR_ERR(tdev->rst);
+	if (IS_ERR(tdev->rst)) {
+		ret = PTR_ERR(tdev->rst);
+		goto free;
+	}
 
 	tdev->clk = devm_clk_get(&pdev->dev, "gpu");
-	if (IS_ERR(tdev->clk))
-		return PTR_ERR(tdev->clk);
+	if (IS_ERR(tdev->clk)) {
+		ret = PTR_ERR(tdev->clk);
+		goto free;
+	}
 
 	tdev->clk_pwr = devm_clk_get(&pdev->dev, "pwr");
-	if (IS_ERR(tdev->clk_pwr))
-		return PTR_ERR(tdev->clk_pwr);
+	if (IS_ERR(tdev->clk_pwr)) {
+		ret = PTR_ERR(tdev->clk_pwr);
+		goto free;
+	}
 
 	nvkm_device_tegra_probe_iommu(tdev);
 
 	ret = nvkm_device_tegra_power_up(tdev);
 	if (ret)
-		return ret;
+		goto remove;
 
 	tdev->gpu_speedo = tegra_sku_info.gpu_speedo_value;
 	ret = nvkm_device_ctor(&nvkm_device_tegra_func, NULL, &pdev->dev,
@@ -285,9 +293,19 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 			       cfg, dbg, detect, mmio, subdev_mask,
 			       &tdev->device);
 	if (ret)
-		return ret;
+		goto powerdown;
+
+	*pdevice = &tdev->device;
 
 	return 0;
+
+powerdown:
+	nvkm_device_tegra_power_down(tdev);
+remove:
+	nvkm_device_tegra_remove_iommu(tdev);
+free:
+	kfree(tdev);
+	return ret;
 }
 #else
 int
-- 
2.7.1
