From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] gr: support for securely-booted FECS firmware
Date: Mon, 26 Oct 2015 14:47:36 +0900
Message-ID: <1445838457-26737-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Trigger the loading of FECS/GPCCS using secure boot if required, and
start managed falcons using the CPUCTL_ALIAS register since CPUCTL is
protected in that case.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/gr/gf100.c | 56 +++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c b/drm/nouveau/nvkm/engine/gr/gf100.c
index dda7a7d224c9..67691941d7ba 100644
--- a/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -27,6 +27,7 @@
 
 #include <core/client.h>
 #include <core/option.h>
+#include <core/secure_boot.h>
 #include <subdev/fb.h>
 #include <subdev/mc.h>
 #include <subdev/pmu.h>
@@ -1342,16 +1343,40 @@ gf100_gr_init_ctxctl(struct gf100_gr *gr)
 	if (gr->firmware) {
 		/* load fuc microcode */
 		nvkm_mc_unk260(device->mc, 0);
-		gf100_gr_init_fw(gr, 0x409000, &gr->fuc409c, &gr->fuc409d);
-		gf100_gr_init_fw(gr, 0x41a000, &gr->fuc41ac, &gr->fuc41ad);
+
+		if (nvkm_is_secure(device, LSF_FALCON_ID_FECS) ||
+		    nvkm_is_secure(device, LSF_FALCON_ID_GPCCS)) {
+			int err = nvkm_secure_boot(subdev->device);
+
+			if (err)
+				return err;
+		}
+
+		if (!nvkm_is_secure(device, LSF_FALCON_ID_FECS))
+			gf100_gr_init_fw(gr, 0x409000, &gr->fuc409c,
+					 &gr->fuc409d);
+
+		if (!nvkm_is_secure(device, LSF_FALCON_ID_GPCCS))
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
+		/* Use FALCON_CPUCTL_ALIAS if falcon is in secure mode */
+		if (nvkm_rd32(device, 0x41a100) & 0x40)
+			nvkm_wr32(device, 0x41a130, 0x00000002);
+		else
+			nvkm_wr32(device, 0x41a100, 0x00000002);
+
+		/* Use FALCON_CPUCTL_ALIAS if falcon is in secure mode */
+		if (nvkm_rd32(device, 0x409100) & 0x40)
+			nvkm_wr32(device, 0x409130, 0x00000002);
+		else
+			nvkm_wr32(device, 0x409100, 0x00000002);
 		if (nvkm_msec(device, 2000,
 			if (nvkm_rd32(device, 0x409800) & 0x00000001)
 				break;
@@ -1659,6 +1684,7 @@ int
 gf100_gr_ctor(const struct gf100_gr_func *func, struct nvkm_device *device,
 	      int index, struct gf100_gr *gr)
 {
+	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
 	int ret;
 
 	gr->func = func;
@@ -1672,12 +1698,22 @@ gf100_gr_ctor(const struct gf100_gr_func *func, struct nvkm_device *device,
 		return ret;
 
 	if (gr->firmware) {
-		nvkm_info(&gr->base.engine.subdev, "using external firmware\n");
-		if (gf100_gr_ctor_fw(gr, "fecs_inst", &gr->fuc409c) ||
-		    gf100_gr_ctor_fw(gr, "fecs_data", &gr->fuc409d) ||
-		    gf100_gr_ctor_fw(gr, "gpccs_inst", &gr->fuc41ac) ||
-		    gf100_gr_ctor_fw(gr, "gpccs_data", &gr->fuc41ad))
-			return -ENODEV;
+		nvkm_info(subdev, "using external firmware\n");
+		if (!nvkm_is_secure(device, LSF_FALCON_ID_FECS)) {
+			if (gf100_gr_ctor_fw(gr, "fecs_inst", &gr->fuc409c) ||
+			    gf100_gr_ctor_fw(gr, "fecs_data", &gr->fuc409d))
+				return -ENODEV;
+		} else {
+			nvkm_info(subdev, "FECS firmware securely managed\n");
+		}
+
+		if (!nvkm_is_secure(device, LSF_FALCON_ID_GPCCS)) {
+			if (gf100_gr_ctor_fw(gr, "gpccs_inst", &gr->fuc41ac) ||
+			    gf100_gr_ctor_fw(gr, "gpccs_data", &gr->fuc41ad))
+				return -ENODEV;
+		} else {
+			nvkm_info(subdev, "GPCCS firmware securely managed\n");
+		}
 	}
 
 	return 0;
-- 
2.6.1
