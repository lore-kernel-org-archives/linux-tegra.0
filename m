From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] drm: tegra: Add Tegra30 support
Date: Wed, 21 Nov 2012 09:50:41 +0100
Message-ID: <1353487841-25955-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add support for host1x, the display controllers and HDMI on the Tegra30
SoC.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi David,

I've rebased this on top of you drm-next branch as you requested. The
change in hdmi.c looks a bit odd, but that's due to the fact that the
nvidia,tegra30-hdmi line was already part of a prior patch where it
shouldn't have been introduced yet. This patch merely adjusts its
sorting order as currently required by the OF code.

Thierry

 drivers/gpu/drm/tegra/dc.c     | 1 +
 drivers/gpu/drm/tegra/hdmi.c   | 2 +-
 drivers/gpu/drm/tegra/host1x.c | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 53b9852..37bd759 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -818,6 +818,7 @@ static int tegra_dc_remove(struct platform_device *pdev)
 }
 
 static struct of_device_id tegra_dc_of_match[] = {
+	{ .compatible = "nvidia,tegra30-dc", },
 	{ .compatible = "nvidia,tegra20-dc", },
 	{ },
 };
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 58f55dc..ab40164 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1318,8 +1318,8 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 }
 
 static struct of_device_id tegra_hdmi_of_match[] = {
-	{ .compatible = "nvidia,tegra20-hdmi", },
 	{ .compatible = "nvidia,tegra30-hdmi", },
+	{ .compatible = "nvidia,tegra20-hdmi", },
 	{ },
 };
 
diff --git a/drivers/gpu/drm/tegra/host1x.c b/drivers/gpu/drm/tegra/host1x.c
index 1f728cd..bdb97a564 100644
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
@@ -268,6 +270,7 @@ int host1x_unregister_client(struct host1x *host1x,
 }
 
 static struct of_device_id tegra_host1x_of_match[] = {
+	{ .compatible = "nvidia,tegra30-host1x", },
 	{ .compatible = "nvidia,tegra20-host1x", },
 	{ },
 };
-- 
1.8.0
