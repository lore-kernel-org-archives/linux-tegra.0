From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 14/14] drm/tegra: dsi: Set up PHY_TIMING & BTA_TIMING
 registers earlier
Date: Mon, 13 Oct 2014 12:21:55 +0200
Message-ID: <1413195715-4719-14-git-send-email-thierry.reding@gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Make sure the DSI PHY_TIMING and BTA_TIMING registers are initialized
when the clocks are set up as opposed to when the output is enabled.
This makes sure that the PHY timings are properly set up when the panel
is prepared and that DCS commands sent at that time use the appropriate
timings.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/tegra/dsi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index b7b205496e8c..0adc7804e261 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -389,6 +389,9 @@ static int tegra_dsi_set_phy_timing(struct tegra_dsi *dsi)
 		DSI_TIMING_FIELD(timing.tago, period, 1);
 	tegra_dsi_writel(dsi, value, DSI_BTA_TIMING);
 
+	if (dsi->slave)
+		return tegra_dsi_set_phy_timing(dsi->slave);
+
 	return 0;
 }
 
@@ -536,10 +539,6 @@ static int tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 	value &= ~DSI_CONTROL_HOST_ENABLE;
 	tegra_dsi_writel(dsi, value, DSI_CONTROL);
 
-	err = tegra_dsi_set_phy_timing(dsi);
-	if (err < 0)
-		return err;
-
 	for (i = 0; i < NUM_PKT_SEQ; i++)
 		tegra_dsi_writel(dsi, pkt_seq[i], DSI_PKT_SEQ_0_LO + i);
 
@@ -860,6 +859,10 @@ static int tegra_output_dsi_setup_clock(struct tegra_output *output,
 	 */
 	tegra_dsi_set_timeout(dsi, bclk, vrefresh);
 
+	err = tegra_dsi_set_phy_timing(dsi);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
-- 
2.1.2
