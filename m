From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] dmaengine: tegra210-adma: fix transfer failure
Date: Thu, 20 Jun 2019 21:45:48 +0530
Message-ID: <1561047348-14413-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, dan.j.williams@intel.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From Tegra186 onwards OUTSTANDING_REQUESTS field is added in channel
configuration register (bits 7:4). ADMA allows a maximum of 8 reads
to source and that many writes to target memory be outstanding at any
given point of time. If this field is not programmed, DMA transfers
fail to happen.

Thus added 'ch_pending_req' member in chip data structure and the
same is populated with maximum allowed pending requests. Since the
field is not applicable to Tegra210, mentioned bit fields are unused
and hence the member is initialized with 0.

Fixes: 433de642a76c ("dmaengine: tegra210-adma: add support for Tegra186/Tegra194")

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/dma/tegra210-adma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 17ea4dd99..8d291cf 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -96,6 +96,7 @@ struct tegra_adma;
  * @ch_req_tx_shift: Register offset for AHUB transmit channel select.
  * @ch_req_rx_shift: Register offset for AHUB receive channel select.
  * @ch_base_offset: Register offset of DMA channel registers.
+ * @ch_pending_req: Outstaning DMA requests for a channel.
  * @ch_fifo_ctrl: Default value for channel FIFO CTRL register.
  * @ch_req_mask: Mask for Tx or Rx channel select.
  * @ch_req_max: Maximum number of Tx or Rx channels available.
@@ -109,6 +110,7 @@ struct tegra_adma_chip_data {
 	unsigned int ch_req_tx_shift;
 	unsigned int ch_req_rx_shift;
 	unsigned int ch_base_offset;
+	unsigned int ch_pending_req;
 	unsigned int ch_fifo_ctrl;
 	unsigned int ch_req_mask;
 	unsigned int ch_req_max;
@@ -613,6 +615,7 @@ static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
 			 ADMA_CH_CTRL_FLOWCTRL_EN;
 	ch_regs->config |= cdata->adma_get_burst_config(burst_size);
 	ch_regs->config |= ADMA_CH_CONFIG_WEIGHT_FOR_WRR(1);
+	ch_regs->config |= cdata->ch_pending_req;
 	ch_regs->fifo_ctrl = cdata->ch_fifo_ctrl;
 	ch_regs->tc = desc->period_len & ADMA_CH_TC_COUNT_MASK;
 
@@ -797,6 +800,7 @@ static const struct tegra_adma_chip_data tegra210_chip_data = {
 	.ch_req_tx_shift	= 28,
 	.ch_req_rx_shift	= 24,
 	.ch_base_offset		= 0,
+	.ch_pending_req		= 0,
 	.ch_fifo_ctrl		= TEGRA210_FIFO_CTRL_DEFAULT,
 	.ch_req_mask		= 0xf,
 	.ch_req_max		= 10,
@@ -811,6 +815,7 @@ static const struct tegra_adma_chip_data tegra186_chip_data = {
 	.ch_req_tx_shift	= 27,
 	.ch_req_rx_shift	= 22,
 	.ch_base_offset		= 0x10000,
+	.ch_pending_req		= (8 << 4),
 	.ch_fifo_ctrl		= TEGRA186_FIFO_CTRL_DEFAULT,
 	.ch_req_mask		= 0x1f,
 	.ch_req_max		= 20,
-- 
2.7.4
