From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] net: stmmac: Fix possible deadlock when disabling EEE support
Date: Wed, 26 Jun 2019 11:23:21 +0100
Message-ID: <20190626102322.18821-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When stmmac_eee_init() is called to disable EEE support, then the timer
for EEE support is stopped and we return from the function. Prior to
stopping the timer, a mutex was acquired but in this case it is never
released and so could cause a deadlock. Fix this by releasing the mutex
prior to returning from stmmax_eee_init() when stopping the EEE timer.

Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b628c697cee9..6c6c6ec3c781 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -402,6 +402,7 @@ bool stmmac_eee_init(struct stmmac_priv *priv)
 		netdev_dbg(priv->dev, "disable EEE\n");
 		del_timer_sync(&priv->eee_ctrl_timer);
 		stmmac_set_eee_timer(priv, priv->hw, 0, tx_lpi_timer);
+		mutex_unlock(&priv->lock);
 		return false;
 	}
 
-- 
1.9.1
