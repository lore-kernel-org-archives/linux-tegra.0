From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] net: stmmac: Fix crash observed if PHY does not support EEE
Date: Wed, 26 Jun 2019 11:23:22 +0100
Message-ID: <20190626102322.18821-2-jonathanh@nvidia.com>
References: <20190626102322.18821-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190626102322.18821-1-jonathanh@nvidia.com>
Sender: netdev-owner@vger.kernel.org
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If the PHY does not support EEE mode, then a crash is observed when the
ethernet interface is enabled. The crash occurs, because if the PHY does
not support EEE, then although the EEE timer is never configured, it is
still marked as enabled and so the stmmac ethernet driver is still
trying to update the timer by calling mod_timer(). This triggers a BUG()
in the mod_timer() because we are trying to update a timer when there is
no callback function set because timer_setup() was never called for this
timer.

The problem is caused because we return true from the function
stmmac_eee_init(), marking the EEE timer as enabled, even when we have
not configured the EEE timer. Fix this by ensuring that we return false
if the PHY does not support EEE and hence, 'eee_active' is not set.

Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6c6c6ec3c781..8f5ebd51859e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -398,10 +398,12 @@ bool stmmac_eee_init(struct stmmac_priv *priv)
 	mutex_lock(&priv->lock);
 
 	/* Check if it needs to be deactivated */
-	if (!priv->eee_active && priv->eee_enabled) {
-		netdev_dbg(priv->dev, "disable EEE\n");
-		del_timer_sync(&priv->eee_ctrl_timer);
-		stmmac_set_eee_timer(priv, priv->hw, 0, tx_lpi_timer);
+	if (!priv->eee_active) {
+		if (priv->eee_enabled) {
+			netdev_dbg(priv->dev, "disable EEE\n");
+			del_timer_sync(&priv->eee_ctrl_timer);
+			stmmac_set_eee_timer(priv, priv->hw, 0, tx_lpi_timer);
+		}
 		mutex_unlock(&priv->lock);
 		return false;
 	}
-- 
1.9.1
