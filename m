From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH net-next 1/2] net: stmmac: Only enable enhanced addressing mode when needed
Date: Mon,  9 Sep 2019 14:36:26 +0200
Message-ID: <20190909123627.29928-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enhanced addressing mode is only required when more than 32 bits need to
be addressed. Add a DMA configuration parameter to enable this mode only
when needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 5 ++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 6 ++++++
 include/linux/stmmac.h                             | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 64956465c030..3e00fd8befcf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -27,7 +27,10 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 	if (dma_cfg->aal)
 		value |= XGMAC_AAL;
 
-	writel(value | XGMAC_EAME, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+	if (dma_cfg->eame)
+		value |= XGMAC_EAME;
+
+	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
 }
 
 static void dwxgmac2_dma_init_chan(void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 06ccd216ae90..ecd461207dbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4497,6 +4497,12 @@ int stmmac_dvr_probe(struct device *device,
 		if (!ret) {
 			dev_info(priv->device, "Using %d bits DMA width\n",
 				 priv->dma_cap.addr64);
+
+			/*
+			 * If more than 32 bits can be addressed, make sure to
+			 * enable enhanced addressing mode.
+			 */
+			priv->plat->dma_cfg->eame = true;
 		} else {
 			ret = dma_set_mask_and_coherent(device, DMA_BIT_MASK(32));
 			if (ret) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 7ad7ae35cf88..d300ac907c76 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -92,6 +92,7 @@ struct stmmac_dma_cfg {
 	int fixed_burst;
 	int mixed_burst;
 	bool aal;
+	bool eame;
 };
 
 #define AXI_BLEN	7
-- 
2.23.0
