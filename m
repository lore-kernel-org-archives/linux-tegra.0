From: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] arm: drm: tegra: Set MODULE_FIRMWARE for the VIC
Date: Tue, 11 Jul 2017 10:39:04 +0200
Message-ID: <20170711083904.6969-1-kwizart@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The defines are set anyway to prevent an empty string.
The test for the soc is same as nouveau for the tegra gpu firmware
(see drivers/gpu/drm/nouveau/nouveau_platform.c)

Fixes: 0ae797a8ba05 ("drm/tegra: Add VIC support")

v2:
 - Place the defines above each chip's vic_config struct
 - MODULE_FIRMWARE() at the end of the file

Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/vic.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index cd804e404a11..819e485fde72 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -258,12 +258,16 @@ static const struct tegra_drm_client_ops vic_ops = {
 	.submit = tegra_drm_submit,
 };
 
+#define NVIDIA_TEGRA_124_VIC_FIRMWARE "nvidia/tegra124/vic03_ucode.bin"
+
 static const struct vic_config vic_t124_config = {
-	.firmware = "nvidia/tegra124/vic03_ucode.bin",
+	.firmware = NVIDIA_TEGRA_124_VIC_FIRMWARE,
 };
 
+#define NVIDIA_TEGRA_210_VIC_FIRMWARE "nvidia/tegra210/vic04_ucode.bin"
+
 static const struct vic_config vic_t210_config = {
-	.firmware = "nvidia/tegra210/vic04_ucode.bin",
+	.firmware = NVIDIA_TEGRA_210_VIC_FIRMWARE,
 };
 
 static const struct of_device_id vic_match[] = {
@@ -394,3 +398,10 @@ struct platform_driver tegra_vic_driver = {
 	.probe = vic_probe,
 	.remove = vic_remove,
 };
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_124_VIC_FIRMWARE);
+#endif
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_210_VIC_FIRMWARE);
+#endif
-- 
2.13.0
