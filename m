From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] drm/tegra: Setup PHY_TIMING & BTA_TIMING registers in setup_clock()
Date: Mon, 29 Sep 2014 11:33:18 -0400
Message-ID: <1412004798-18233-1-git-send-email-seanpaul@chromium.org>
References: <1411761971-6510-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411761971-6510-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Make sure we initialize the dsi PHY_TIMING and BTA_TIMING registers
when we setup the clocks. If left uninitialized, they can cause DCS
transfers to fail.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2:
	- Removed the recursive slave call in set_phy_timing, this will need
	  to be applied once ganging is applied

 drivers/gpu/drm/tegra/dsi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index f787445..b87b5a4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -482,10 +482,6 @@ static int tegra_output_dsi_enable(struct tegra_output *output)
 	value &= ~DSI_CONTROL_HOST_ENABLE;
 	tegra_dsi_writel(dsi, value, DSI_CONTROL);
 
-	err = tegra_dsi_set_phy_timing(dsi);
-	if (err < 0)
-		return err;
-
 	for (i = 0; i < NUM_PKT_SEQ; i++)
 		tegra_dsi_writel(dsi, pkt_seq[i], DSI_PKT_SEQ_0_LO + i);
 
@@ -660,6 +656,12 @@ static int tegra_output_dsi_setup_clock(struct tegra_output *output,
 	value = DSI_TALLY_TA(0) | DSI_TALLY_LRX(0) | DSI_TALLY_HTX(0);
 	tegra_dsi_writel(dsi, value, DSI_TO_TALLY);
 
+	err = tegra_dsi_set_phy_timing(dsi);
+	if (err) {
+		dev_err(dsi->dev, "failed to setup phy timing: %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.1.1
