From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm/tegra: Setup PHY_TIMING & BTA_TIMING registers in
 setup_clock()
Date: Fri, 26 Sep 2014 16:06:11 -0400
Message-ID: <1411761971-6510-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Make sure we initialize the dsi PHY_TIMING and BTA_TIMING registers
when we setup the clocks, as opposed to in dsi_configure. The phy
timings must be initialized before drm_panel prepare() so that any
DCS commands sent at this time are using the appropriate timings.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/tegra/dsi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index c0258ae..6923c9b 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -369,6 +369,9 @@ static int tegra_dsi_set_phy_timing(struct tegra_dsi *dsi)
 		DSI_TIMING_FIELD(timing.tago, period, 1);
 	tegra_dsi_writel(dsi, value, DSI_BTA_TIMING);
 
+	if (dsi->slave)
+		return tegra_dsi_set_phy_timing(dsi->slave);
+
 	return 0;
 }
 
@@ -482,10 +485,6 @@ static int tegra_output_dsi_enable(struct tegra_output *output)
 	value &= ~DSI_CONTROL_HOST_ENABLE;
 	tegra_dsi_writel(dsi, value, DSI_CONTROL);
 
-	err = tegra_dsi_set_phy_timing(dsi);
-	if (err < 0)
-		return err;
-
 	for (i = 0; i < NUM_PKT_SEQ; i++)
 		tegra_dsi_writel(dsi, pkt_seq[i], DSI_PKT_SEQ_0_LO + i);
 
@@ -660,6 +659,12 @@ static int tegra_output_dsi_setup_clock(struct tegra_output *output,
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
