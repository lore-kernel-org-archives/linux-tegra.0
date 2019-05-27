From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] net: stmmac: Do not output error on deferred probe
Date: Mon, 27 May 2019 12:52:51 +0200
Message-ID: <20190527105251.11198-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If the subdriver defers probe, do not show an error message. It's
perfectly fine for this error to occur since the driver will get another
chance to probe after some time and will usually succeed after all of
the resources that it requires have been registered.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 3256e5cbad27..5bc224834c77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -455,7 +455,11 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	priv = data->probe(pdev, plat_dat, &stmmac_res);
 	if (IS_ERR(priv)) {
 		ret = PTR_ERR(priv);
-		dev_err(&pdev->dev, "failed to probe subdriver: %d\n", ret);
+
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to probe subdriver: %d\n",
+				ret);
+
 		goto remove_config;
 	}
 
-- 
2.21.0
