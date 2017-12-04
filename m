From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau/bar/gf100: fix hang when calling ->fini() before ->init()
Date: Mon,  4 Dec 2017 18:37:58 +0000
Message-ID: <be610a7596ad8fee7da092161888c532c2eb2908.1512411775.git.guillaume.tucker@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If the firmware fails to load then ->fini() will be called before the
device has been initialised, causing the kernel to hang while trying
to write to a register.  Add a test in ->fini() to avoid this issue.

This fixes a kernel hang on tegra124.

Fixes: b17de35a2ebbe ("drm/nouveau/bar: implement bar1 teardown")
Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
CC: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
index a3ba7f50198b..95e2aba64aad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
@@ -43,9 +43,12 @@ gf100_bar_bar1_wait(struct nvkm_bar *base)
 }
 
 void
-gf100_bar_bar1_fini(struct nvkm_bar *bar)
+gf100_bar_bar1_fini(struct nvkm_bar *base)
 {
-	nvkm_mask(bar->subdev.device, 0x001704, 0x80000000, 0x00000000);
+	struct nvkm_device *device = base->subdev.device;
+
+	if (base->subdev.oneinit)
+		nvkm_mask(device, 0x001704, 0x80000000, 0x00000000);
 }
 
 void
-- 
2.11.0
