From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 7/9] drm/tegra: Split DC_CMD_STATE_CONTROL register write
Date: Thu, 21 Feb 2013 15:35:59 +0100
Message-ID: <1361457361-13838-8-git-send-email-thierry.reding@avionic-design.de>
References: <1361457361-13838-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361457361-13838-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Tegra TRM says that the ACT_REQ and UPDATE fields cannot be
programmed at the same time so they are updated in two consecutive
writes instead.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index c5d825f..2086400 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -689,9 +689,10 @@ static void tegra_crtc_commit(struct drm_crtc *crtc)
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 	unsigned long value;
 
-	value = GENERAL_ACT_REQ | WIN_A_ACT_REQ |
-		GENERAL_UPDATE | WIN_A_UPDATE;
+	value = GENERAL_UPDATE | WIN_A_UPDATE;
+	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
 
+	value = GENERAL_ACT_REQ | WIN_A_ACT_REQ;
 	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
 
 	drm_vblank_post_modeset(crtc->dev, dc->pipe);
-- 
1.8.1.2
