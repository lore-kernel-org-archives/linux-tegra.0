From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 6/6] drm/tegra: Add Tegra186 support for VIC
Date: Tue,  5 Sep 2017 11:43:06 +0300
Message-ID: <20170905084306.19318-7-mperttunen@nvidia.com>
References: <20170905084306.19318-1-mperttunen@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905084306.19318-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sgurrappadi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add Tegra186 support for VIC - no changes are required except for new
firmware and compatibility string.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c |  1 +
 drivers/gpu/drm/tegra/vic.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 3ba659a5940d..e3331a2bc082 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1281,6 +1281,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra210-sor", },
 	{ .compatible = "nvidia,tegra210-sor1", },
 	{ .compatible = "nvidia,tegra210-vic", },
+	{ .compatible = "nvidia,tegra186-vic", },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 2448229fa653..6697a21a250d 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -270,9 +270,16 @@ static const struct vic_config vic_t210_config = {
 	.firmware = NVIDIA_TEGRA_210_VIC_FIRMWARE,
 };
 
+#define NVIDIA_TEGRA_186_VIC_FIRMWARE "nvidia/tegra186/vic04_ucode.bin"
+
+static const struct vic_config vic_t186_config = {
+	.firmware = NVIDIA_TEGRA_186_VIC_FIRMWARE,
+};
+
 static const struct of_device_id vic_match[] = {
 	{ .compatible = "nvidia,tegra124-vic", .data = &vic_t124_config },
 	{ .compatible = "nvidia,tegra210-vic", .data = &vic_t210_config },
+	{ .compatible = "nvidia,tegra186-vic", .data = &vic_t186_config },
 	{ },
 };
 
@@ -405,3 +412,6 @@ MODULE_FIRMWARE(NVIDIA_TEGRA_124_VIC_FIRMWARE);
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 MODULE_FIRMWARE(NVIDIA_TEGRA_210_VIC_FIRMWARE);
 #endif
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_186_VIC_FIRMWARE);
+#endif
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
