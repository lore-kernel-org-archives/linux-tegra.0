From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH net-next 2/2] net: stmmac: Do not request stmmaceth clock
Date: Fri, 26 Jul 2019 12:27:41 +0200
Message-ID: <20190726102741.27872-2-thierry.reding@gmail.com>
References: <20190726102741.27872-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190726102741.27872-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The stmmaceth clock is specified by the slave_bus and apb_pclk clocks in
the device tree bindings for snps,dwc-qos-ethernet-4.10 compatible nodes
of this IP.

The subdrivers for these bindings will be requesting the stmmac clock
correctly at a later point, so there is no need to request it here and
cause an error message to be printed to the kernel log.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 333b09564b88..7ad2bb90ceb1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -521,13 +521,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	}
 
 	/* clock setup */
-	plat->stmmac_clk = devm_clk_get(&pdev->dev,
-					STMMAC_RESOURCE_NAME);
-	if (IS_ERR(plat->stmmac_clk)) {
-		dev_warn(&pdev->dev, "Cannot get CSR clock\n");
-		plat->stmmac_clk = NULL;
+	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
+		plat->stmmac_clk = devm_clk_get(&pdev->dev,
+						STMMAC_RESOURCE_NAME);
+		if (IS_ERR(plat->stmmac_clk)) {
+			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
+			plat->stmmac_clk = NULL;
+		}
+		clk_prepare_enable(plat->stmmac_clk);
 	}
-	clk_prepare_enable(plat->stmmac_clk);
 
 	plat->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(plat->pclk)) {
-- 
2.22.0
