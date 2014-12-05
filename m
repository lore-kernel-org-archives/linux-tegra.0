From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3] drm/tegra: dsi: Adjust D-PHY timing
Date: Fri, 5 Dec 2014 15:30:05 -0800
Message-ID: <1417822205-24372-1-git-send-email-davidu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fix D-PHY HS Trail setting on Tegra.
It is found that HS Trail is off -12% during compliance testing

Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index f787445..34fb82d 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -335,6 +335,12 @@ static int tegra_dsi_set_phy_timing(struct tegra_dsi *dsi)
 	if (err < 0)
 		return err;
 
+	/*
+	 * Tegra DSI progamming guide requires additional adjustments
+	 * to HS trail for compliance.
+	 */
+	timing->hstrail += 3 * period * 8;
+
 	err = mipi_dphy_timing_validate(&timing, period);
 	if (err < 0) {
 		dev_err(dsi->dev, "failed to validate D-PHY timing: %d\n", err);
-- 
1.8.1.5
