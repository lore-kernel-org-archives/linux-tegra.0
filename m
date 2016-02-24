From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 09/11] gr/gm200: do not load firmware for secure falcons
Date: Wed, 24 Feb 2016 14:42:22 +0900
Message-ID: <1456292544-32206-10-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Secure falcons' firmware is managed by secboot. Do not load it in GR for
them.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/gr/gm200.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/gr/gm200.c b/drm/nouveau/nvkm/engine/gr/gm200.c
index f0e087a15cd2..038f9b338a85 100644
--- a/drm/nouveau/nvkm/engine/gr/gm200.c
+++ b/drm/nouveau/nvkm/engine/gr/gm200.c
@@ -24,6 +24,8 @@
 #include "gf100.h"
 #include "ctxgf100.h"
 
+#include <subdev/secboot.h>
+
 #include <nvif/class.h>
 
 /*******************************************************************************
@@ -365,12 +367,19 @@ int gm200_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 	if (ret)
 		return ret;
 
-	if ((ret = gf100_gr_ctor_fw(gr, "gr/fecs_inst", &gr->fuc409c)) ||
-	    (ret = gf100_gr_ctor_fw(gr, "gr/fecs_data", &gr->fuc409d)))
-		return ret;
-	if ((ret = gf100_gr_ctor_fw(gr, "gr/gpccs_inst", &gr->fuc41ac)) ||
-	    (ret = gf100_gr_ctor_fw(gr, "gr/gpccs_data", &gr->fuc41ad)))
-		return ret;
+	/* Load firmwares for non-secure falcons */
+	if (!nvkm_secboot_is_managed(device->secboot,
+				     NVKM_SECBOOT_FALCON_FECS)) {
+		if ((ret = gf100_gr_ctor_fw(gr, "gr/fecs_inst", &gr->fuc409c)) ||
+		    (ret = gf100_gr_ctor_fw(gr, "gr/fecs_data", &gr->fuc409d)))
+			return ret;
+	}
+	if (!nvkm_secboot_is_managed(device->secboot,
+				     NVKM_SECBOOT_FALCON_GPCCS)) {
+		if ((ret = gf100_gr_ctor_fw(gr, "gr/gpccs_inst", &gr->fuc41ac)) ||
+		    (ret = gf100_gr_ctor_fw(gr, "gr/gpccs_data", &gr->fuc41ad)))
+			return ret;
+	}
 
 	if ((ret = gk20a_gr_av_to_init(gr, "gr/sw_nonctx", &gr->fuc_sw_nonctx)) ||
 	    (ret = gk20a_gr_aiv_to_init(gr, "gr/sw_ctx", &gr->fuc_sw_ctx)) ||
-- 
2.7.1
