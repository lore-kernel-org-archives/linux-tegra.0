From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/3] gk20a: use NOUVEAU_BO_GART as VRAM domain
Date: Wed, 19 Nov 2014 14:41:45 +0900
Message-ID: <1416375705-14068-4-git-send-email-acourbot@nvidia.com>
References: <1416375705-14068-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416375705-14068-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

GK20A does not have dedicated VRAM, therefore allocating in VRAM can be
sub-optimal and sometimes even harmful. Set its VRAM domain to
NOUVEAU_BO_GART so all objects are allocated in system memory.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index 506165d179de..b3f462ade11c 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -617,6 +617,16 @@ nvc0_screen_create(struct nouveau_device *dev)
       return NULL;
    pscreen = &screen->base.base;
 
+   /* Recognize chipsets with no VRAM */
+   switch (dev->chipset) {
+   /* GK20A */
+   case 0xea:
+      screen->base.vram_domain = NOUVEAU_BO_GART;
+      break;
+   default:
+      break;
+   }
+
    ret = nouveau_screen_init(&screen->base, dev);
    if (ret) {
       nvc0_screen_destroy(pscreen);
@@ -633,6 +643,11 @@ nvc0_screen_create(struct nouveau_device *dev)
    screen->base.sysmem_bindings |=
       PIPE_BIND_VERTEX_BUFFER | PIPE_BIND_INDEX_BUFFER;
 
+   if (screen->base.vram_domain & NOUVEAU_BO_GART) {
+      screen->base.sysmem_bindings |= screen->base.vidmem_bindings;
+      screen->base.vidmem_bindings = 0;
+   }
+
    pscreen->destroy = nvc0_screen_destroy;
    pscreen->context_create = nvc0_create;
    pscreen->is_format_supported = nvc0_screen_is_format_supported;
-- 
2.1.3
