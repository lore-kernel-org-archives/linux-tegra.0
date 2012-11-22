From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/6] gpu: drm: tegra: Free platform data on remove
Date: Thu, 22 Nov 2012 11:48:02 +0200
Message-ID: <1353577684-7896-5-git-send-email-tbergstrom@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353577684-7896-1-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Platform data was not freed in device removal. This patch adds
missing devm_kfree() calls.

Change-Id: Id00fd1940e786dbc80c7ac5a1bd4d6a4c18720a1
Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c   |    3 +++
 drivers/gpu/drm/tegra/dsi.c  |    3 +++
 drivers/gpu/drm/tegra/hdmi.c |    3 +++
 drivers/gpu/drm/tegra/tvo.c  |    3 +++
 4 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 5ccb809..b9e5a79 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -818,6 +818,9 @@ static int tegra_dc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(dc->clk);
 
+	platform_set_drvdata(pdev, NULL);
+	devm_kfree(&pdev->dev, dc);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 4f4c709..bba1c61 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -149,6 +149,9 @@ static int tegra_dsi_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	platform_set_drvdata(pdev, NULL);
+	devm_kfree(&pdev->dev, dsi);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index b2b8e58..72032e8 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1312,6 +1312,9 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 	clk_unprepare(hdmi->clk_parent);
 	clk_unprepare(hdmi->clk);
 
+	platform_set_drvdata(pdev, NULL);
+	devm_kfree(&pdev->dev, hdmi);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/tvo.c b/drivers/gpu/drm/tegra/tvo.c
index 01ac356..c6219b3 100644
--- a/drivers/gpu/drm/tegra/tvo.c
+++ b/drivers/gpu/drm/tegra/tvo.c
@@ -159,6 +159,9 @@ static int tegra_tvo_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	platform_set_drvdata(pdev, NULL);
+	devm_kfree(&pdev->dev, tvo);
+
 	return 0;
 }
 
-- 
1.7.9.5
