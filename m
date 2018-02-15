From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: [PATCH] nvc0: Use GP100_COMPUTE_CLASS on GP10B
Date: Thu, 15 Feb 2018 20:13:20 +0200
Message-ID: <20180215181320.17589-1-cyndis@kapsi.fi>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

GP10B requires the use of GP100_COMPUTE_CLASS instead of
GP104_COMPUTE_CLASS as is used for other non-GP100 chips.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/gallium/drivers/nouveau/nvc0/nve4_compute.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nve4_compute.c b/src/gallium/drivers/nouveau/nvc0/nve4_compute.c
index f641f47..28460f8 100644
--- a/src/gallium/drivers/nouveau/nvc0/nve4_compute.c
+++ b/src/gallium/drivers/nouveau/nvc0/nve4_compute.c
@@ -59,7 +59,8 @@ nve4_screen_compute_setup(struct nvc0_screen *screen,
       obj_class = GM200_COMPUTE_CLASS;
       break;
    case 0x130:
-      obj_class = dev->chipset == 0x130 ? GP100_COMPUTE_CLASS : GP104_COMPUTE_CLASS;
+      obj_class = (dev->chipset == 0x130 || dev->chipset == 0x13b) ?
+                      GP100_COMPUTE_CLASS : GP104_COMPUTE_CLASS;
       break;
    default:
       NOUVEAU_ERR("unsupported chipset: NV%02x\n", dev->chipset);
-- 
2.9.3
