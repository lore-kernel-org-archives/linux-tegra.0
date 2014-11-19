From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/3] nouveau: support for custom VRAM domains
Date: Wed, 19 Nov 2014 14:41:43 +0900
Message-ID: <1416375705-14068-2-git-send-email-acourbot@nvidia.com>
References: <1416375705-14068-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416375705-14068-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some NVIDIA chips (e.g. GK20A) do not embed VRAM of their own and have
complete shared access to system memory. For these systems, allocating
objects in VRAM might lead to unneeded copies and sub-optimal memory
management. It will also lead to errors if the kernel does not allow
VRAM objects allocations.

This patch adds a vram_domain member to struct nouveau_screen that can
optionally be initialized to an alternative domain to use for VRAM
allocations (most likely, NOUVEAU_BO_GART to allocate everything in
system memory). If not initialized, the default NOUVEAU_BO_VRAM domain
is used.

Code that allocates GPU objects is then expected to use the
NV_VRAM_DOMAIN() macro in place of NOUVEAU_BO_VRAM to ensure correct
behavior on VRAM-less chips.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_screen.c | 6 ++++++
 src/gallium/drivers/nouveau/nouveau_screen.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index 517978d88588..e4598c3fd24f 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -158,6 +158,12 @@ nouveau_screen_init(struct nouveau_screen *screen, struct nouveau_device *dev)
 		size = sizeof(nvc0_data);
 	}
 
+	/*
+	 * Set default VRAM domain if not overridden
+	 */
+	if (!screen->vram_domain)
+		screen->vram_domain = NOUVEAU_BO_VRAM;
+
 	ret = nouveau_object_new(&dev->object, 0, NOUVEAU_FIFO_CHANNEL_CLASS,
 				 data, size, &screen->channel);
 	if (ret)
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/drivers/nouveau/nouveau_screen.h
index cf06f7e88aa0..30041b271c94 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.h
+++ b/src/gallium/drivers/nouveau/nouveau_screen.h
@@ -51,6 +51,8 @@ struct nouveau_screen {
 
 	boolean hint_buf_keep_sysmem_copy;
 
+	unsigned vram_domain;
+
 	struct {
 		unsigned profiles_checked;
 		unsigned profiles_present;
@@ -94,6 +96,8 @@ struct nouveau_screen {
 #endif
 };
 
+#define NV_VRAM_DOMAIN(screen) ((screen)->vram_domain)
+
 #ifdef NOUVEAU_ENABLE_DRIVER_STATISTICS
 # define NOUVEAU_DRV_STAT(s, n, v) do {         \
       (s)->stats.named.n += (v);               \
-- 
2.1.3
