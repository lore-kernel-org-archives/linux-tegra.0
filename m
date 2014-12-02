From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gpu: drm: tegra: Adjust dsi phy timing
Date: Mon, 1 Dec 2014 16:52:02 -0800
Message-ID: <1417481522-32110-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fixing DSI phy setting of HS trail timings.

Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/mipi-phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/mipi-phy.c b/drivers/gpu/drm/tegra/mipi-phy.c
index 486d19d..974bc68 100644
--- a/drivers/gpu/drm/tegra/mipi-phy.c
+++ b/drivers/gpu/drm/tegra/mipi-phy.c
@@ -34,7 +34,7 @@ int mipi_dphy_timing_get_default(struct mipi_dphy_timing *timing,
 	timing->hszero = 145 + 5 * period;
 	timing->hssettle = 85 + 6 * period;
 	timing->hsskip = 40;
-	timing->hstrail = max(8 * period, 60 + 4 * period);
+	timing->hstrail = 3 * period * 8 + max(8 * period, 60 + 4 * period);
 	timing->init = 100000;
 	timing->lpx = 60;
 	timing->taget = 5 * timing->lpx;
-- 
1.8.1.5
