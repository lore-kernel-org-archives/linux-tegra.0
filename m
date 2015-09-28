From: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] nouveau: arm: Add MODULE_FIRMWARE for gk20a
Date: Mon, 28 Sep 2015 17:08:13 +0200
Message-ID: <1443452893-18246-1-git-send-email-kwizart@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch is needed by initramfs tools to detect
the required firmware files for the module.

This patch tests for either TEGRA_124_SOC or TEGRA_132_SOC
for the firmwares related to the Tegra K1 generation.

v2: move the MODULE_FIRMWARE to the nvidia_platform.c file.
 This will avoid to test for NOUVEAU_PLATFORM_DRIVER

Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 3eb6654..9013141 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -65,3 +65,14 @@ struct platform_driver nouveau_platform_driver = {
 	.probe = nouveau_platform_probe,
 	.remove = nouveau_platform_remove,
 };
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) || IS_ENABLED(CONFIG_ARCH_TEGRA_132_SOC)
+MODULE_FIRMWARE("nvidia/gk20a/fecs_data.bin");
+MODULE_FIRMWARE("nvidia/gk20a/fecs_inst.bin");
+MODULE_FIRMWARE("nvidia/gk20a/gpccs_data.bin");
+MODULE_FIRMWARE("nvidia/gk20a/gpccs_inst.bin");
+MODULE_FIRMWARE("nvidia/gk20a/sw_bundle_init.bin");
+MODULE_FIRMWARE("nvidia/gk20a/sw_ctx.bin");
+MODULE_FIRMWARE("nvidia/gk20a/sw_method_init.bin");
+MODULE_FIRMWARE("nvidia/gk20a/sw_nonctx.bin");
+#endif
-- 
2.4.3
