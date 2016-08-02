From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] drm/tegra: dc: Don't disable display power partition
Date: Tue, 2 Aug 2016 11:34:26 +0100
Message-ID: <1470134069-12178-2-git-send-email-jonathanh@nvidia.com>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470134069-12178-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM") disables the
display power partition when probing and this causes the Tegra114
Dalmore to hang during boot.

The hang occurs when accessing the MIPI calibration registers (which are
accessed during the configuration of the DSI interface). Ideally the
MIPI driver should manage the power partition itself to ensure it is on
when needed. The problem is that the legacy PMC APIs used for managing
the power partitions do not support reference counting and so this
cannot be easily done currently. Long-term we will migrate devices to
use generic PM domains and such scenarios will be easy to support. For
now fix this by removing the code to turn off the display power
partition when probing the DC and always keep the DC on so that the
power partition is not turned off. This is consistent with how the power
partition was managed prior to this commit.

Please note that for earlier devices such as Tegra114 the MIPI
calibration logic is part of the display power partition, where as for
newer devices, such as Tegra124/210 it is part of the SOR power
partition. Hence, in the long-term is makes more sense to handle such
power partitions via the generic PM domain framework.

Fixes: 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM")

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Please note that the hang is only seen on Tegra114 with v4.8 if the
patch "ARM: tegra: Correct polarity for Tegra114 PMIC interrupt" (2nd
patch in series) is applied without this patch. Without the fix for the
PMIC interrupt polarity the Palmas PMIC probe fails and the display
probe also fails because the regulators are not found.

 drivers/gpu/drm/tegra/dc.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 8495bd01b544..17bd80a745d6 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1217,8 +1217,6 @@ static void tegra_crtc_disable(struct drm_crtc *crtc)
 
 	tegra_dc_stats_reset(&dc->stats);
 	drm_crtc_vblank_off(crtc);
-
-	pm_runtime_put_sync(dc->dev);
 }
 
 static void tegra_crtc_enable(struct drm_crtc *crtc)
@@ -1228,8 +1226,6 @@ static void tegra_crtc_enable(struct drm_crtc *crtc)
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 	u32 value;
 
-	pm_runtime_get_sync(dc->dev);
-
 	/* initialize display controller */
 	if (dc->syncpt) {
 		u32 syncpt = host1x_syncpt_id(dc->syncpt);
@@ -1997,8 +1993,6 @@ static int tegra_dc_probe(struct platform_device *pdev)
 			dc->powergate = TEGRA_POWERGATE_DIS;
 		else
 			dc->powergate = TEGRA_POWERGATE_DISB;
-
-		tegra_powergate_power_off(dc->powergate);
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2020,6 +2014,11 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dc);
 	pm_runtime_enable(&pdev->dev);
+	err = pm_runtime_get_sync(&pdev->dev);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
+		goto rpm_disable;
+	}
 
 	INIT_LIST_HEAD(&dc->client.list);
 	dc->client.ops = &dc_client_ops;
@@ -2029,10 +2028,17 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		return err;
+		goto rpm_put;
 	}
 
 	return 0;
+
+rpm_put:
+	pm_runtime_put_sync(&pdev->dev);
+rpm_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return err;
 }
 
 static int tegra_dc_remove(struct platform_device *pdev)
@@ -2053,6 +2059,7 @@ static int tegra_dc_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
-- 
2.1.4
