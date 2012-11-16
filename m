From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drm: Add NVIDIA Tegra30 support
Date: Fri, 16 Nov 2012 12:58:09 +0800
Message-ID: <1353041889-3114-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch is based on Thierry's drm patch for Tegra20:
- [PATCH v2 0/6] Device tree updates for host1x support
- [PATCH v3 0/2] NVIDIA Tegra DRM driver

It adds the support for NVIDIA Tegra30.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c     |    1 +
 drivers/gpu/drm/tegra/host1x.c |    3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 216cd0f..6e9f1b4 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -819,6 +819,7 @@ static int tegra_dc_remove(struct platform_device *pdev)
 
 static struct of_device_id tegra_dc_of_match[] = {
        { .compatible = "nvidia,tegra20-dc", },
+	{ .compatible = "nvidia,tegra30-dc", },
        { },
 };
 
diff --git a/drivers/gpu/drm/tegra/host1x.c b/drivers/gpu/drm/tegra/host1x.c
index 3d02554..07b7e27 100644
--- a/drivers/gpu/drm/tegra/host1x.c
+++ b/drivers/gpu/drm/tegra/host1x.c
@@ -68,6 +68,8 @@ static int host1x_parse_dt(struct host1x *host1x)
        static const char * const compat[] = {
                "nvidia,tegra20-dc",
                "nvidia,tegra20-hdmi",
+		"nvidia,tegra30-dc",
+		"nvidia,tegra30-hdmi",
        };
        unsigned int i;
        int err;
@@ -269,6 +271,7 @@ int host1x_unregister_client(struct host1x *host1x,
 
 static struct of_device_id tegra_host1x_of_match[] = {
        { .compatible = "nvidia,tegra20-host1x", },
+	{ .compatible = "nvidia,tegra30-host1x", },
        { },
 };
 MODULE_DEVICE_TABLE(of, tegra_host1x_of_match);
-- 
1.7.9.5
