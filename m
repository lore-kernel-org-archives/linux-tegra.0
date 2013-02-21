From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 8/9] drm/tegra: Fix color expansion
Date: Thu, 21 Feb 2013 15:36:00 +0100
Message-ID: <1361457361-13838-9-git-send-email-thierry.reding@avionic-design.de>
References: <1361457361-13838-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361457361-13838-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

bpp stores the number of bytes per pixel, but color expansion needs to
be enabled for less than 24 bits per pixel.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 2086400..bf8095c 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -500,7 +500,7 @@ int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 		tegra_dc_writel(dc, 0x0000, DC_WIN_CSC_KVB);
 
 		value |= CSC_ENABLE;
-	} else if (bpp < 24) {
+	} else if (window->bits_per_pixel < 24) {
 		value |= COLOR_EXPAND;
 	}
 
-- 
1.8.1.2
