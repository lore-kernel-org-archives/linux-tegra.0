From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC 15/16] drm/nouveau: support GK20A in nouveau_accel_init()
Date: Sat,  1 Feb 2014 12:16:57 +0900
Message-ID: <1391224618-3794-16-git-send-email-acourbot@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391224618-3794-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

GK20A does not embed a dedicated COPY engine and thus cannot allocate
the copy channel that nouveau_accel_init() attempts to create. It also
lacks any display hardware, so the creation of a software channel does
not apply neither.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 8d55a50..87bdf04 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -171,6 +171,11 @@ nouveau_accel_init(struct nouveau_drm *drm)
 		return;
 	}
 
+	if (device->chipset == 0xea) {
+		/* gk20a does not have CE0/CE1 */
+		arg0 = NVE0_CHANNEL_IND_ENGINE_GR;
+		arg1 = 1;
+	} else
 	if (device->card_type >= NV_E0) {
 		ret = nouveau_channel_new(drm, &drm->client, NVDRM_DEVICE,
 					  NVDRM_CHAN + 1,
@@ -207,6 +212,10 @@ nouveau_accel_init(struct nouveau_drm *drm)
 		return;
 	}
 
+	/* Need to figure out how to handle sw for gk20a */
+	if (device->chipset == 0xea)
+		goto skip_sw_init;
+
 	ret = nouveau_object_new(nv_object(drm), NVDRM_CHAN, NVDRM_NVSW,
 				 nouveau_abi16_swclass(drm), NULL, 0, &object);
 	if (ret == 0) {
@@ -233,6 +242,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
 		return;
 	}
 
+skip_sw_init:
 	if (device->card_type < NV_C0) {
 		ret = nouveau_gpuobj_new(drm->device, NULL, 32, 0, 0,
 					&drm->notify);
-- 
1.8.5.3
