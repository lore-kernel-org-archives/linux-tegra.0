From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH net-next v2 2/2] net: stmmac: Support enhanced addressing mode for DWMAC 4.10
Date: Mon,  9 Sep 2019 17:25:46 +0200
Message-ID: <20190909152546.383-2-thierry.reding@gmail.com>
References: <20190909152546.383-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190909152546.383-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The address width of the controller can be read from hardware feature
registers much like on XGMAC. Add support for parsing the ADDR64 field
so that the DMA mask can be set accordingly.

This avoids getting swiotlb involved for DMA on Tegra186 and later.

Also make sure that the upper 32 bits of the DMA address are written to
the DMA descriptors when enhanced addressing mode is used. Similarily,
for each channel, the upper 32 bits of the DMA descriptor ring's base
address also need to be programmed to make sure the correct memory can
be fetched when the DMA descriptor ring is located beyond the 32-bit
boundary.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- also program the upper 32 bits of the DMA descriptor base address for
  each channel

 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  1 +
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 28 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  3 ++
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 2ed11a581d80..f634fa09dffc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -183,6 +183,7 @@ enum power_event {
 #define GMAC_HW_HASH_TB_SZ		GENMASK(25, 24)
 #define GMAC_HW_FEAT_AVSEL		BIT(20)
 #define GMAC_HW_TSOEN			BIT(18)
+#define GMAC_HW_ADDR64			GENMASK(15, 14)
 #define GMAC_HW_TXFIFOSIZE		GENMASK(10, 6)
 #define GMAC_HW_RXFIFOSIZE		GENMASK(4, 0)
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index dbde23e7e169..d546041d2fcd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -431,8 +431,8 @@ static void dwmac4_get_addr(struct dma_desc *p, unsigned int *addr)
 
 static void dwmac4_set_addr(struct dma_desc *p, dma_addr_t addr)
 {
-	p->des0 = cpu_to_le32(addr);
-	p->des1 = 0;
+	p->des0 = cpu_to_le32(lower_32_bits(addr));
+	p->des1 = cpu_to_le32(upper_32_bits(addr));
 }
 
 static void dwmac4_clear(struct dma_desc *p)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 3ed5508586ef..e77410f21d7d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -79,6 +79,10 @@ static void dwmac4_dma_init_rx_chan(void __iomem *ioaddr,
 	value = value | (rxpbl << DMA_BUS_MODE_RPBL_SHIFT);
 	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(chan));
 
+	if (dma_cfg->eame)
+		writel(upper_32_bits(dma_rx_phy),
+		       ioaddr + DMA_CHAN_RX_BASE_ADDR_HI(chan));
+
 	writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_CHAN_RX_BASE_ADDR(chan));
 }
 
@@ -97,6 +101,10 @@ static void dwmac4_dma_init_tx_chan(void __iomem *ioaddr,
 
 	writel(value, ioaddr + DMA_CHAN_TX_CONTROL(chan));
 
+	if (dma_cfg->eame)
+		writel(upper_32_bits(dma_tx_phy),
+		       ioaddr + DMA_CHAN_TX_BASE_ADDR_HI(chan));
+
 	writel(lower_32_bits(dma_tx_phy), ioaddr + DMA_CHAN_TX_BASE_ADDR(chan));
 }
 
@@ -132,6 +140,9 @@ static void dwmac4_dma_init(void __iomem *ioaddr,
 	if (dma_cfg->aal)
 		value |= DMA_SYS_BUS_AAL;
 
+	if (dma_cfg->eame)
+		value |= DMA_SYS_BUS_EAME;
+
 	writel(value, ioaddr + DMA_SYS_BUS_MODE);
 }
 
@@ -354,6 +365,23 @@ static void dwmac4_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->hash_tb_sz = (hw_cap & GMAC_HW_HASH_TB_SZ) >> 24;
 	dma_cap->av = (hw_cap & GMAC_HW_FEAT_AVSEL) >> 20;
 	dma_cap->tsoen = (hw_cap & GMAC_HW_TSOEN) >> 18;
+
+	dma_cap->addr64 = (hw_cap & GMAC_HW_ADDR64) >> 14;
+	switch (dma_cap->addr64) {
+	case 0:
+		dma_cap->addr64 = 32;
+		break;
+	case 1:
+		dma_cap->addr64 = 40;
+		break;
+	case 2:
+		dma_cap->addr64 = 48;
+		break;
+	default:
+		dma_cap->addr64 = 32;
+		break;
+	}
+
 	/* RX and TX FIFO sizes are encoded as log2(n / 128). Undo that by
 	 * shifting and store the sizes in bytes.
 	 */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index b66da0237d2a..5299fa1001a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -65,6 +65,7 @@
 #define DMA_SYS_BUS_MB			BIT(14)
 #define DMA_AXI_1KBBE			BIT(13)
 #define DMA_SYS_BUS_AAL			BIT(12)
+#define DMA_SYS_BUS_EAME		BIT(11)
 #define DMA_AXI_BLEN256			BIT(7)
 #define DMA_AXI_BLEN128			BIT(6)
 #define DMA_AXI_BLEN64			BIT(5)
@@ -91,7 +92,9 @@
 #define DMA_CHAN_CONTROL(x)		DMA_CHANX_BASE_ADDR(x)
 #define DMA_CHAN_TX_CONTROL(x)		(DMA_CHANX_BASE_ADDR(x) + 0x4)
 #define DMA_CHAN_RX_CONTROL(x)		(DMA_CHANX_BASE_ADDR(x) + 0x8)
+#define DMA_CHAN_TX_BASE_ADDR_HI(x)	(DMA_CHANX_BASE_ADDR(x) + 0x10)
 #define DMA_CHAN_TX_BASE_ADDR(x)	(DMA_CHANX_BASE_ADDR(x) + 0x14)
+#define DMA_CHAN_RX_BASE_ADDR_HI(x)	(DMA_CHANX_BASE_ADDR(x) + 0x18)
 #define DMA_CHAN_RX_BASE_ADDR(x)	(DMA_CHANX_BASE_ADDR(x) + 0x1c)
 #define DMA_CHAN_TX_END_ADDR(x)		(DMA_CHANX_BASE_ADDR(x) + 0x20)
 #define DMA_CHAN_RX_END_ADDR(x)		(DMA_CHANX_BASE_ADDR(x) + 0x28)
-- 
2.23.0
