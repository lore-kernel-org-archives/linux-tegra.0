From: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] [RFC] nouveau: arm: Add MODULE_FIRMWARE for gm20b
Date: Tue,  8 Sep 2015 12:18:47 +0200
Message-ID: <1441707527-9890-2-git-send-email-kwizart@gmail.com>
References: <1441707527-9890-1-git-send-email-kwizart@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441707527-9890-1-git-send-email-kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch is needed by initramfs tools to detect
the required firmware files for the module.

This patch tests for NOUVEAU_PLATFORM_DRIVER and
TEGRA_210_SOC for the firmwares related to
the Tegra X1 generation.

RFC tag is because the firmwares are still not
merged into linux-firmware repository

Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 862c225..36a3bc3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1122,3 +1122,17 @@ MODULE_FIRMWARE("nvidia/gk20a/sw_ctx.bin");
 MODULE_FIRMWARE("nvidia/gk20a/sw_method_init.bin");
 MODULE_FIRMWARE("nvidia/gk20a/sw_nonctx.bin");
 #endif
+#if defined(CONFIG_NOUVEAU_PLATFORM_DRIVER) && IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+MODULE_FIRMWARE("nvidia/gm20b/fecs_data.bin");
+MODULE_FIRMWARE("nvidia/gm20b/fecs_inst.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gpccs_data.bin");
+MODULE_FIRMWARE("nvidia/gm20b/gpccs_inst.bin");
+MODULE_FIRMWARE("nvidia/gm20b/sw_bundle_init.bin");
+MODULE_FIRMWARE("nvidia/gm20b/sw_ctx.bin");
+MODULE_FIRMWARE("nvidia/gm20b/sw_method_init.bin");
+MODULE_FIRMWARE("nvidia/gm20b/sw_nonctx.bin");
+MODULE_FIRMWARE("nouveau/nv12b_acr_ucode");
+MODULE_FIRMWARE("nouveau/nv12b_fecs_bl");
+MODULE_FIRMWARE("nouveau/nv12b_fecs_sig");
+MODULE_FIRMWARE("nouveau/nv12b_pmu_bl");
+#endif
-- 
2.4.3
