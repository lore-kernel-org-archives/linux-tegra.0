From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH net-next v4 1/2] net: stmmac: Only enable enhanced addressing mode when needed
Date: Wed,  2 Oct 2019 16:52:57 +0200
Message-ID: <20191002145258.178745-2-thierry.reding@gmail.com>
References: <20191002145258.178745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191002145258.178745-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Florian Fainelli <f.fainelli@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enhanced addressing mode is only required when more than 32 bits need to
be addressed. Add a DMA configuration parameter to enable this mode only
when needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- enable EAME only if DMA addresses can be larger than 32 bits

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 5 ++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 7 +++++++
 include/linux/stmmac.h                             | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 965cbe3e6f51..7cc331996cd8 100644
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
index c76a1336a451..b8ac1744950e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4515,6 +4515,13 @@ int stmmac_dvr_probe(struct device *device,
 		if (!ret) {
 			dev_info(priv->device, "Using %d bits DMA width\n",
 				 priv->dma_cap.addr64);
+
+			/*
+			 * If more than 32 bits can be addressed, make sure to
+			 * enable enhanced addressing mode.
+			 */
+			if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
+				priv->plat->dma_cfg->eame = true;
 		} else {
 			ret = dma_set_mask_and_coherent(device, DMA_BIT_MASK(32));
 			if (ret) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index dc60d03c4b60..86f9464c3f5d 100644
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
