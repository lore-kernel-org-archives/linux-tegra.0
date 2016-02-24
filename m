From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 08/11] gr/gf100: add support for securely-managed falcons
Date: Wed, 24 Feb 2016 14:42:21 +0900
Message-ID: <1456292544-32206-9-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Start securely-managed falcons using secboot functions since the process
for them is different from just writing CPUCTL.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/gr/gf100.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c b/drm/nouveau/nvkm/engine/gr/gf100.c
index 3fc5f7d962be..c56a886229f1 100644
--- a/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -28,6 +28,7 @@
 #include <core/client.h>
 #include <core/option.h>
 #include <core/firmware.h>
+#include <subdev/secboot.h>
 #include <subdev/fb.h>
 #include <subdev/mc.h>
 #include <subdev/pmu.h>
@@ -1428,21 +1429,40 @@ gf100_gr_init_ctxctl(struct gf100_gr *gr)
 	const struct gf100_grctx_func *grctx = gr->func->grctx;
 	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
 	struct nvkm_device *device = subdev->device;
+	struct nvkm_secboot *sb = device->secboot;
 	int i;
 
 	if (gr->firmware) {
 		/* load fuc microcode */
 		nvkm_mc_unk260(device->mc, 0);
-		gf100_gr_init_fw(gr, 0x409000, &gr->fuc409c, &gr->fuc409d);
-		gf100_gr_init_fw(gr, 0x41a000, &gr->fuc41ac, &gr->fuc41ad);
+
+		/* securely-managed falcons must be reset using secure boot */
+		if (nvkm_secboot_is_managed(sb, NVKM_SECBOOT_FALCON_FECS))
+			nvkm_secboot_reset(sb, NVKM_SECBOOT_FALCON_FECS);
+		else
+			gf100_gr_init_fw(gr, 0x409000, &gr->fuc409c,
+					 &gr->fuc409d);
+		if (nvkm_secboot_is_managed(sb, NVKM_SECBOOT_FALCON_GPCCS))
+			nvkm_secboot_reset(sb, NVKM_SECBOOT_FALCON_GPCCS);
+		else
+			gf100_gr_init_fw(gr, 0x41a000, &gr->fuc41ac,
+					 &gr->fuc41ad);
+
 		nvkm_mc_unk260(device->mc, 1);
 
 		/* start both of them running */
 		nvkm_wr32(device, 0x409840, 0xffffffff);
 		nvkm_wr32(device, 0x41a10c, 0x00000000);
 		nvkm_wr32(device, 0x40910c, 0x00000000);
-		nvkm_wr32(device, 0x41a100, 0x00000002);
-		nvkm_wr32(device, 0x409100, 0x00000002);
+
+		if (nvkm_secboot_is_managed(sb, NVKM_SECBOOT_FALCON_GPCCS))
+			nvkm_secboot_start(sb, NVKM_SECBOOT_FALCON_GPCCS);
+		else
+			nvkm_wr32(device, 0x41a100, 0x00000002);
+		if (nvkm_secboot_is_managed(sb, NVKM_SECBOOT_FALCON_FECS))
+			nvkm_secboot_start(sb, NVKM_SECBOOT_FALCON_FECS);
+		else
+			nvkm_wr32(device, 0x409100, 0x00000002);
 		if (nvkm_msec(device, 2000,
 			if (nvkm_rd32(device, 0x409800) & 0x00000001)
 				break;
-- 
2.7.1
