From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 7/7] DMA: tegra-adma: Add support for Tegra210 ADMA
Date: Tue, 18 Aug 2015 14:49:15 +0100
Message-ID: <1439905755-25150-8-git-send-email-jonathanh@nvidia.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439905755-25150-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the Tegra210 Audio DMA controller that is used for
transferring data between system memory and the Audio sub-system.

This driver is based upon the work by Dara Ramesh <dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/Kconfig           |  12 +
 drivers/dma/Makefile          |   1 +
 drivers/dma/tegra-common.c    |   3 +-
 drivers/dma/tegra-common.h    |  42 ++-
 drivers/dma/tegra20-apb-dma.c |  37 +--
 drivers/dma/tegra210-adma.c   | 710 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 782 insertions(+), 23 deletions(-)
 create mode 100644 drivers/dma/tegra210-adma.c

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index dd79b0bf0876..25b474965d66 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -205,6 +205,18 @@ config TEGRA20_APB_DMA
 	  This DMA controller transfers data from memory to peripheral fifo
 	  or vice versa. It does not support memory to memory data transfer.
 
+config TEGRA210_ADMA
+	bool "NVIDIA Tegra210 ADMA support"
+	depends on ARCH_TEGRA
+	select DMA_ENGINE
+	select TEGRA_DMA_COMMON
+	help
+	  Support for the NVIDIA Tegra210 ADMA controller driver. The
+	  DMA controller is having multiple DMA channel and it configured
+	  for audio. This DMA controller transfers data from memory to
+	  peripheral fifo or vice versa. It does not support memory to
+	  memory data transfer.
+
 config S3C24XX_DMAC
 	tristate "Samsung S3C24XX DMA support"
 	depends on ARCH_S3C24XX
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index d9c2bf5ef0bd..9c5b8afc53a1 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_SIRF_DMA) += sirf-dma.o
 obj-$(CONFIG_TI_EDMA) += edma.o
 obj-$(CONFIG_STE_DMA40) += ste_dma40.o ste_dma40_ll.o
 obj-$(CONFIG_TEGRA20_APB_DMA) += tegra20-apb-dma.o
+obj-$(CONFIG_TEGRA210_ADMA) += tegra210-adma.o
 obj-$(CONFIG_TEGRA_DMA_COMMON) += tegra-common.o
 obj-$(CONFIG_S3C24XX_DMAC) += s3c24xx-dma.o
 obj-$(CONFIG_PL330_DMA) += pl330.o
diff --git a/drivers/dma/tegra-common.c b/drivers/dma/tegra-common.c
index fff0a143f5bb..b3f7e3322c15 100644
--- a/drivers/dma/tegra-common.c
+++ b/drivers/dma/tegra-common.c
@@ -620,7 +620,8 @@ struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (ops->get_xfer_params_cyclic(tdc, &sg_base, direction, flags) < 0)
+	if (ops->get_xfer_params_cyclic(tdc, &sg_base, buf_len, period_len,
+					direction, flags) < 0)
 		return NULL;
 
 	dma_desc = tegra_dma_desc_get(tdc);
diff --git a/drivers/dma/tegra-common.h b/drivers/dma/tegra-common.h
index e0d4d2b13cb8..c1a369e7efa6 100644
--- a/drivers/dma/tegra-common.h
+++ b/drivers/dma/tegra-common.h
@@ -34,7 +34,7 @@ struct tegra_dma_chip_data {
 /*
  * DMA channel registers
  */
-struct tegra_dma_channel_regs {
+struct tegra_apb_chan_regs {
 	unsigned long	csr;
 	unsigned long	ahb_ptr;
 	unsigned long	apb_ptr;
@@ -44,6 +44,18 @@ struct tegra_dma_channel_regs {
 };
 
 /*
+ * ADMA channel registers
+ */
+struct tegra_adma_chan_regs {
+	unsigned long   ctrl;
+	unsigned long   config;
+	unsigned long   src_ptr;
+	unsigned long   tgt_ptr;
+	unsigned long   ahub_fifo_ctrl;
+	unsigned long   tc;
+};
+
+/*
  * tegra_dma_sg_req: Dma request details to configure hardware. This
  * contains the details for one transfer to configure DMA hw.
  * The client's request for data transfer can be broken into multiple
@@ -52,7 +64,10 @@ struct tegra_dma_channel_regs {
  * DMA descriptor which manages the transfer details.
  */
 struct tegra_dma_sg_req {
-	struct tegra_dma_channel_regs	ch_regs;
+	union {
+		struct tegra_apb_chan_regs	apb_ch_regs;
+		struct tegra_adma_chan_regs	adma_ch_regs;
+	};
 	int				req_len;
 	bool				configured;
 	bool				last_sg;
@@ -109,7 +124,10 @@ struct tegra_dma_channel {
 	/* Channel-slave specific configuration */
 	unsigned int slave_id;
 	struct dma_slave_config dma_sconfig;
-	struct tegra_dma_channel_regs	channel_reg;
+	union {
+		struct tegra_apb_chan_regs	apb_ch_regs;
+		struct tegra_adma_chan_regs	adma_ch_regs;
+	};
 };
 
 /*
@@ -119,6 +137,7 @@ struct tegra_dma_ops {
 	u32 (*get_xfer_count)(struct tegra_dma_channel *tdc);
 	int (*get_xfer_params_cyclic)(struct tegra_dma_channel *tdc,
 				      struct tegra_dma_sg_req *sg_req,
+				      size_t buf_len, size_t period_len,
 				      enum dma_transfer_direction direction,
 				      unsigned int flags);
 	int (*get_xfer_params_sg)(struct tegra_dma_channel *tdc,
@@ -149,6 +168,7 @@ struct tegra_dma {
 	struct dma_device		dma_dev;
 	struct device			*dev;
 	struct clk			*dma_clk;
+	struct clk			*domain_clk;
 	struct reset_control		*rst;
 	spinlock_t			global_lock;
 	void __iomem			*base_addr;
@@ -163,7 +183,10 @@ struct tegra_dma {
 	u32				global_pause_count;
 
 	/* Some register need to be cache before suspend */
-	u32				reg_gen;
+	union {
+		u32				reg_gen;
+		u32				reg_global;
+	};
 
 	/* Last member of the structure */
 	struct tegra_dma_channel channels[0];
@@ -190,6 +213,17 @@ static inline u32 tdc_read(struct tegra_dma_channel *tdc, u32 reg)
 	return readl(tdc->chan_addr + reg);
 }
 
+static inline void tdc_set_field(struct tegra_dma_channel *tdc, u32 reg,
+				 u32 shift, u32 mask, u32 val)
+{
+	u32 t;
+
+	t = tdc_read(tdc, reg);
+	t &= ~(mask << shift);
+	t |= (val & mask) << shift;
+	tdc_write(tdc, reg, t);
+}
+
 static inline struct tegra_dma_channel *to_tegra_dma_chan(struct dma_chan *dc)
 {
 	return container_of(dc, struct tegra_dma_channel, dma_chan);
diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 0895732aaa28..b800f10860eb 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -188,13 +188,13 @@ static u32 tegra_dma_irq_clear(struct tegra_dma_channel *tdc)
 static void tegra_dma_program(struct tegra_dma_channel *tdc,
 			      struct tegra_dma_sg_req *nsg_req)
 {
-	tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, nsg_req->ch_regs.apb_ptr);
-	tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, nsg_req->ch_regs.ahb_ptr);
+	tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, nsg_req->apb_ch_regs.apb_ptr);
+	tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, nsg_req->apb_ch_regs.ahb_ptr);
 	if (tdc->tdma->chip_data->support_separate_wcount_reg)
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
-			  nsg_req->ch_regs.wcount);
+			  nsg_req->apb_ch_regs.wcount);
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
-		  nsg_req->ch_regs.csr | TEGRA_APBDMA_CSR_ENB);
+		  nsg_req->apb_ch_regs.csr | TEGRA_APBDMA_CSR_ENB);
 	nsg_req->configured = true;
 }
 
@@ -246,7 +246,7 @@ static void tegra_dma_stop(struct tegra_dma_channel *tdc)
 static void tegra_dma_start(struct tegra_dma_channel *tdc,
 		struct tegra_dma_sg_req *sg_req)
 {
-	struct tegra_dma_channel_regs *ch_regs = &sg_req->ch_regs;
+	struct tegra_apb_chan_regs *ch_regs = &sg_req->apb_ch_regs;
 
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR, ch_regs->csr);
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_APBSEQ, ch_regs->apb_seq);
@@ -327,7 +327,7 @@ static inline int get_burst_size(struct tegra_dma_channel *tdc,
 }
 
 static int tegra_dma_get_xfer_params(struct tegra_dma_channel *tdc,
-				     struct tegra_dma_channel_regs *ch_regs,
+				     struct tegra_apb_chan_regs *ch_regs,
 				     enum dma_transfer_direction direction,
 				     unsigned int flags)
 {
@@ -367,7 +367,7 @@ static int tegra_dma_get_xfer_params_sg(struct tegra_dma_channel *tdc,
 					enum dma_transfer_direction direction,
 					unsigned int flags)
 {
-	struct tegra_dma_channel_regs *ch_regs = &sg_req->ch_regs;
+	struct tegra_apb_chan_regs *ch_regs = &sg_req->apb_ch_regs;
 	int ret;
 
 	ret = tegra_dma_get_xfer_params(tdc, ch_regs, direction, flags);
@@ -381,16 +381,17 @@ static int tegra_dma_get_xfer_params_sg(struct tegra_dma_channel *tdc,
 
 static int tegra_dma_get_xfer_params_cyclic(struct tegra_dma_channel *tdc,
 					struct tegra_dma_sg_req *sg_req,
+					size_t buf_len, size_t period_len,
 					enum dma_transfer_direction direction,
 					unsigned int flags)
 {
-	struct tegra_dma_channel_regs *ch_regs = &sg_req->ch_regs;
+	struct tegra_apb_chan_regs *ch_regs = &sg_req->apb_ch_regs;
 
 	return tegra_dma_get_xfer_params(tdc, ch_regs, direction, flags);
 }
 
 static void tegra_dma_prep_wcount(struct tegra_dma_channel *tdc,
-	struct tegra_dma_channel_regs *ch_regs, u32 len)
+	struct tegra_apb_chan_regs *ch_regs, u32 len)
 {
 	u32 len_field = (len - 4) & 0xFFFC;
 
@@ -406,13 +407,13 @@ static void tegra_dma_set_xfer_params(struct tegra_dma_channel *tdc,
 				      enum dma_transfer_direction direction,
 				      u32 mem, u32 len)
 {
-	sg_req->ch_regs.ahb_seq |= get_burst_size(tdc, direction, len);
-	sg_req->ch_regs.apb_ptr = sg_base->ch_regs.apb_ptr;
-	sg_req->ch_regs.ahb_ptr = mem;
-	sg_req->ch_regs.csr = sg_base->ch_regs.csr;
-	tegra_dma_prep_wcount(tdc, &sg_req->ch_regs, len);
-	sg_req->ch_regs.apb_seq = sg_base->ch_regs.apb_seq;
-	sg_req->ch_regs.ahb_seq = sg_base->ch_regs.ahb_seq;
+	sg_req->apb_ch_regs.ahb_seq |= get_burst_size(tdc, direction, len);
+	sg_req->apb_ch_regs.apb_ptr = sg_base->apb_ch_regs.apb_ptr;
+	sg_req->apb_ch_regs.ahb_ptr = mem;
+	sg_req->apb_ch_regs.csr = sg_base->apb_ch_regs.csr;
+	tegra_dma_prep_wcount(tdc, &sg_req->apb_ch_regs, len);
+	sg_req->apb_ch_regs.apb_seq = sg_base->apb_ch_regs.apb_seq;
+	sg_req->apb_ch_regs.ahb_seq = sg_base->apb_ch_regs.ahb_seq;
 	sg_req->configured = false;
 	sg_req->last_sg = false;
 	sg_req->req_len = len;
@@ -742,7 +743,7 @@ static int tegra_dma_pm_suspend(struct device *dev)
 	tdma->reg_gen = tdma_read(tdma, TEGRA_APBDMA_GENERAL);
 	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
-		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
+		struct tegra_apb_chan_regs *ch_reg = &tdc->apb_ch_regs;
 
 		ch_reg->csr = tdc_read(tdc, TEGRA_APBDMA_CHAN_CSR);
 		ch_reg->ahb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBPTR);
@@ -773,7 +774,7 @@ static int tegra_dma_pm_resume(struct device *dev)
 
 	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
-		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
+		struct tegra_apb_chan_regs *ch_reg = &tdc->apb_ch_regs;
 
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBSEQ, ch_reg->apb_seq);
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, ch_reg->apb_ptr);
diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
new file mode 100644
index 000000000000..23e4ee15f147
--- /dev/null
+++ b/drivers/dma/tegra210-adma.c
@@ -0,0 +1,710 @@
+/*
+ * ADMA driver for Nvidia's Tegra210 ADMA controller.
+ *
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_dma.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/clk/tegra.h>
+
+#include "dmaengine.h"
+
+#include  "tegra-common.h"
+
+/* Register offsets from ADMA*_BASE */
+#define ADMA_CH_CMD						0x00
+#define ADMA_CH_STATUS						0x0c
+#define ADMA_CH_STATUS_TRANSFER_PAUSED				BIT(1)
+#define ADMA_CH_STATUS_TRANSFER_ENABLED				BIT(0)
+
+#define ADMA_CH_INT_STATUS					0x10
+#define ADMA_CH_INT_TD_STATUS					BIT(0)
+
+#define ADMA_CH_INT_CLEAR					0x1c
+#define ADMA_CH_CTRL						0x24
+#define ADMA_CH_CTRL_TX_REQUEST_SELECT_SHIFT			28
+#define ADMA_CH_CTRL_TX_REQUEST_SELECT_MASK	\
+	(0xf << ADMA_CH_CTRL_TX_REQUEST_SELECT_SHIFT)
+#define ADMA_CH_CTRL_RX_REQUEST_SELECT_SHIFT			24
+#define ADMA_CH_CTRL_RX_REQUEST_SELECT_MASK	\
+	(0xf << ADMA_CH_CTRL_RX_REQUEST_SELECT_SHIFT)
+#define ADMA_CH_CTRL_TRANSFER_DIRECTION_SHIFT			12
+#define ADMA_CH_CTRL_TRANSFER_DIRECTION_MASK	\
+	(0xf << ADMA_CH_CTRL_TRANSFER_DIRECTION_SHIFT)
+#define ADMA_CH_CTRL_TRANSFER_MODE_SHIFT			8
+#define ADMA_CH_CTRL_TRANSFER_MODE_MASK		\
+	(0x7 << ADMA_CH_CTRL_TRANSFER_MODE_SHIFT)
+#define ADMA_CH_CTRL_TRANSFER_PAUSE_SHIFT			0
+#define ADMA_CH_CTRL_TRANSFER_PAUSE_MASK	\
+	(0x1 << ADMA_CH_CTRL_TRANSFER_PAUSE_SHIFT)
+#define ADMA_CH_CTRL_TRANSFER_PAUSE				BIT(0)
+
+#define ADMA_CH_CONFIG						0x28
+#define ADMA_CH_CONFIG_SOURCE_MEMORY_BUFFER_SHIFT		28
+#define ADMA_CH_CONFIG_SOURCE_MEMORY_BUFFER_MASK	\
+	(0x7 << ADMA_CH_CONFIG_SOURCE_MEMORY_BUFFER_SHIFT)
+#define ADMA_CH_CONFIG_TARGET_MEMORY_BUFFER_SHIFT		24
+#define ADMA_CH_CONFIG_TARGET_MEMORY_BUFFER_MASK	\
+	(0x7 << ADMA_CH_CONFIG_TARGET_MEMORY_BUFFER_SHIFT)
+#define ADMA_CH_CONFIG_BURST_SIZE_SHIFT				20
+#define ADMA_CH_CONFIG_BURST_SIZE_MASK		\
+	(0x7 << ADMA_CH_CONFIG_BURST_SIZE_SHIFT)
+#define ADMA_CH_CONFIG_MAX_MEM_BUFFERS				8
+
+#define ADMA_CH_AHUB_FIFO_CTRL					0x2c
+#define ADMA_CH_AHUB_FIFO_CTRL_FETCHING_POLICY_SHIFT		31
+#define ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_SHIFT		8
+#define ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_MASK	\
+	(0xf << ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_SHIFT)
+#define ADMA_CH_AHUB_FIFO_CTRL_RX_FIFO_SIZE_SHIFT		0
+#define ADMA_CH_AHUB_FIFO_CTRL_RX_FIFO_SIZE_MASK	\
+	(0xf << ADMA_CH_AHUB_FIFO_CTRL_RX_FIFO_SIZE_SHIFT)
+
+#define ADMA_CH_TC_STATUS					0x30
+#define ADMA_CH_TC_STATUS_COUNT_MASK				0x3ffffffc
+
+#define ADMA_CH_LOWER_SOURCE_ADDR				0x34
+#define ADMA_CH_LOWER_TARGET_ADDR				0x3c
+#define ADMA_CH_TC						0x44
+
+#define ADMA_GLOBAL_CMD						0xc00
+#define ADMA_GLOBAL_SOFT_RESET					0xc04
+#define ADMA_GLOBAL_INT_CLEAR					0xc20
+#define ADMA_GLOBAL_CTRL					0xc24
+
+#define ADMA_BURSTSIZE_16					5
+#define ADMA_FIFO_DEFAULT_SIZE					3
+#define ADMA_MODE_ONESHOT					1
+#define ADMA_MODE_CONTINUOUS					2
+#define AHUB_TO_MEMORY						2
+#define MEMORY_TO_AHUB						4
+
+/*
+ * If any burst is in flight and ADMA paused then this is the time to complete
+ * on-flight burst and update ADMA status register.
+ */
+#define TEGRA_ADMA_BURST_COMPLETE_TIME				20
+
+static int tegra_adma_runtime_suspend(struct device *dev);
+static int tegra_adma_runtime_resume(struct device *dev);
+
+static int tegra_adma_global_soft_reset(struct tegra_dma *tdma)
+{
+	u32 status;
+
+	/* Clear any interrupts */
+	tdma_write(tdma, ADMA_GLOBAL_INT_CLEAR, 0x1);
+
+	/* Assert soft reset */
+	tdma_write(tdma, ADMA_GLOBAL_SOFT_RESET, 0x1);
+
+	/* Wait for reset to clear */
+	return readx_poll_timeout(readl,
+				  tdma->base_addr + ADMA_GLOBAL_SOFT_RESET,
+				  status, status == 0,
+				  TEGRA_ADMA_BURST_COMPLETE_TIME, 10000);
+}
+
+static u32 tegra_adma_get_xfer_count(struct tegra_dma_channel *tdc)
+{
+	u32 wcount = tdc_read(tdc, ADMA_CH_TC_STATUS);
+
+	return wcount & ADMA_CH_TC_STATUS_COUNT_MASK;
+}
+
+static u32 tegra_adma_irq_status(struct tegra_dma_channel *tdc)
+{
+	u32 status = tdc_read(tdc, ADMA_CH_INT_STATUS);
+
+	return status & ADMA_CH_INT_TD_STATUS;
+}
+
+static u32 tegra_adma_irq_clear(struct tegra_dma_channel *tdc)
+{
+	u32 status = tegra_adma_irq_status(tdc);
+
+	if (status) {
+		dev_dbg(tdc2dev(tdc), "%s():clearing interrupt\n", __func__);
+		tdc_write(tdc, ADMA_CH_INT_CLEAR, status);
+	}
+
+	return status;
+}
+
+static void tegra_adma_pause(struct tegra_dma_channel *tdc,
+	bool wait_for_burst_complete)
+{
+	u32 status;
+
+	tdc_set_field(tdc, ADMA_CH_CTRL, ADMA_CH_CTRL_TRANSFER_PAUSE_SHIFT,
+		      ADMA_CH_CTRL_TRANSFER_PAUSE_MASK, 1);
+
+	if (readx_poll_timeout(readl, tdc->chan_addr + ADMA_CH_STATUS, status,
+			       status & ADMA_CH_STATUS_TRANSFER_PAUSED,
+			       TEGRA_ADMA_BURST_COMPLETE_TIME, 10000))
+		dev_err(tdc2dev(tdc), "%s(): unable to pause DMA\n", __func__);
+}
+
+static void tegra_adma_program(struct tegra_dma_channel *tdc,
+			       struct tegra_dma_sg_req *nsg_req)
+{
+	tdc_write(tdc, ADMA_CH_LOWER_SOURCE_ADDR,
+		  nsg_req->adma_ch_regs.src_ptr);
+	tdc_write(tdc, ADMA_CH_LOWER_TARGET_ADDR,
+		  nsg_req->adma_ch_regs.tgt_ptr);
+	tdc_write(tdc, ADMA_CH_TC, nsg_req->adma_ch_regs.tc);
+	tdc_write(tdc, ADMA_CH_CTRL, nsg_req->adma_ch_regs.ctrl);
+	tdc_write(tdc, ADMA_CH_AHUB_FIFO_CTRL,
+			nsg_req->adma_ch_regs.ahub_fifo_ctrl);
+	tdc_write(tdc, ADMA_CH_CONFIG, nsg_req->adma_ch_regs.config);
+	tdc_write(tdc, ADMA_CH_CMD, 1);
+	nsg_req->configured = true;
+}
+
+static void tegra_adma_resume(struct tegra_dma_channel *tdc)
+{
+	tdc_set_field(tdc, ADMA_CH_CTRL, ADMA_CH_CTRL_TRANSFER_PAUSE_SHIFT,
+		      ADMA_CH_CTRL_TRANSFER_PAUSE_MASK, 0);
+}
+
+static void tegra_adma_stop(struct tegra_dma_channel *tdc)
+{
+	u32 status;
+
+	/* TODO: Do we need to disable interrupts here? */
+
+	/* Disable ADMA */
+	tdc_write(tdc, ADMA_CH_CMD, 0);
+
+	/* Clear interrupt status */
+	tegra_adma_irq_clear(tdc);
+
+	if (readx_poll_timeout(readl, tdc->chan_addr + ADMA_CH_STATUS, status,
+			       !(status & ADMA_CH_STATUS_TRANSFER_ENABLED),
+			       TEGRA_ADMA_BURST_COMPLETE_TIME, 10000))
+		dev_err(tdc2dev(tdc), "%s(): unable to stop DMA\n", __func__);
+	else
+		tdc->busy = false;
+}
+
+static void tegra_adma_start(struct tegra_dma_channel *tdc,
+		struct tegra_dma_sg_req *sg_req)
+{
+	struct tegra_adma_chan_regs *ch_regs = &sg_req->adma_ch_regs;
+
+	/* Update transfer done count for position calculation */
+	tdc->adma_ch_regs.tc = ch_regs->tc;
+	tdc_write(tdc, ADMA_CH_TC, ch_regs->tc);
+	tdc_write(tdc, ADMA_CH_CTRL, ch_regs->ctrl);
+	tdc_write(tdc, ADMA_CH_LOWER_SOURCE_ADDR, ch_regs->src_ptr);
+	tdc_write(tdc, ADMA_CH_LOWER_TARGET_ADDR, ch_regs->tgt_ptr);
+	tdc_write(tdc, ADMA_CH_AHUB_FIFO_CTRL, ch_regs->ahub_fifo_ctrl);
+	tdc_write(tdc, ADMA_CH_CONFIG, ch_regs->config);
+	/* Start ADMA */
+	tdc_write(tdc, ADMA_CH_CMD, 1);
+}
+
+static int tegra_adma_get_xfer_params(struct tegra_dma_channel *tdc,
+				      struct tegra_adma_chan_regs *ch_regs,
+				      enum dma_transfer_direction direction)
+{
+	u32 burst_size, ctrl, ctrl_mask, slave_id, fifo_mask, fifo_shift;
+
+	ch_regs->ahub_fifo_ctrl = tdc_read(tdc, ADMA_CH_AHUB_FIFO_CTRL);
+	ch_regs->config = tdc_read(tdc, ADMA_CH_CONFIG);
+	ch_regs->ctrl = tdc_read(tdc, ADMA_CH_CTRL);
+	slave_id = tdc->dma_sconfig.slave_id;
+
+	switch (direction) {
+	case DMA_MEM_TO_DEV:
+		burst_size = fls(tdc->dma_sconfig.dst_maxburst);
+		ctrl_mask = ADMA_CH_CTRL_TX_REQUEST_SELECT_MASK;
+		ctrl = MEMORY_TO_AHUB << ADMA_CH_CTRL_TRANSFER_DIRECTION_SHIFT;
+		ctrl |= slave_id << ADMA_CH_CTRL_TX_REQUEST_SELECT_SHIFT;
+		fifo_mask = ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_MASK;
+		fifo_shift = ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_SHIFT;
+		break;
+	case DMA_DEV_TO_MEM:
+		burst_size = fls(tdc->dma_sconfig.src_maxburst);
+		ctrl_mask = ADMA_CH_CTRL_RX_REQUEST_SELECT_MASK;
+		ctrl = AHUB_TO_MEMORY << ADMA_CH_CTRL_TRANSFER_DIRECTION_SHIFT;
+		ctrl |= slave_id << ADMA_CH_CTRL_RX_REQUEST_SELECT_SHIFT;
+		fifo_mask = ADMA_CH_AHUB_FIFO_CTRL_RX_FIFO_SIZE_MASK;
+		fifo_shift = ADMA_CH_AHUB_FIFO_CTRL_RX_FIFO_SIZE_SHIFT;
+		break;
+	default:
+		dev_err(tdc2dev(tdc), "Dma direction is not supported\n");
+		return -EINVAL;
+	}
+
+	if (!burst_size || burst_size > ADMA_BURSTSIZE_16)
+		burst_size = ADMA_BURSTSIZE_16;
+
+	ch_regs->ahub_fifo_ctrl &= ~fifo_mask;
+	ch_regs->ahub_fifo_ctrl |= ADMA_FIFO_DEFAULT_SIZE << fifo_shift;
+	ch_regs->config &= ~ADMA_CH_CONFIG_BURST_SIZE_MASK;
+	ch_regs->config |= burst_size << ADMA_CH_CONFIG_BURST_SIZE_SHIFT;
+	ch_regs->ctrl &= ~(ctrl_mask | ADMA_CH_CTRL_TRANSFER_DIRECTION_MASK);
+	ch_regs->ctrl |= ctrl;
+
+	return -EINVAL;
+}
+
+static int tegra_adma_get_xfer_params_sg(struct tegra_dma_channel *tdc,
+					 struct tegra_dma_sg_req *sg_base,
+					 enum dma_transfer_direction direction,
+					 unsigned int flags)
+{
+	struct tegra_adma_chan_regs *ch_regs = &sg_base->adma_ch_regs;
+	int ret;
+
+	ret = tegra_adma_get_xfer_params(tdc, ch_regs, direction);
+	if (ret < 0)
+		return ret;
+
+	ch_regs->ctrl &= ~ADMA_CH_CTRL_TRANSFER_MODE_MASK;
+	ch_regs->ctrl |= ADMA_MODE_ONESHOT << ADMA_CH_CTRL_TRANSFER_MODE_SHIFT;
+
+	return 0;
+}
+
+static int tegra_adma_get_xfer_params_cyclic(struct tegra_dma_channel *tdc,
+					struct tegra_dma_sg_req *sg_base,
+					size_t buf_len, size_t period_len,
+					enum dma_transfer_direction direction,
+					unsigned int flags)
+{
+	struct tegra_adma_chan_regs *ch_regs = &sg_base->adma_ch_regs;
+	unsigned int num_bufs, mask, shift;
+	int ret;
+
+	ret = tegra_adma_get_xfer_params(tdc, ch_regs, direction);
+	if (ret < 0)
+		return ret;
+
+	ch_regs->ctrl &= ~ADMA_CH_CTRL_TRANSFER_MODE_MASK;
+	ch_regs->ctrl |= ADMA_MODE_CONTINUOUS <<
+			ADMA_CH_CTRL_TRANSFER_MODE_SHIFT;
+
+	num_bufs = buf_len / period_len;
+
+	if (num_bufs <= ADMA_CH_CONFIG_MAX_MEM_BUFFERS) {
+		if (direction == DMA_MEM_TO_DEV) {
+			mask = ADMA_CH_CONFIG_SOURCE_MEMORY_BUFFER_MASK;
+			shift = ADMA_CH_CONFIG_SOURCE_MEMORY_BUFFER_SHIFT;
+		} else {
+			mask = ADMA_CH_CONFIG_TARGET_MEMORY_BUFFER_MASK;
+			shift = ADMA_CH_CONFIG_TARGET_MEMORY_BUFFER_SHIFT;
+		}
+		ch_regs->config &= ~mask;
+		ch_regs->config |= (num_bufs - 1) << shift;
+	}
+
+	return 0;
+}
+
+static void tegra_adma_set_xfer_params(struct tegra_dma_channel *tdc,
+				       struct tegra_dma_sg_req *sg_req,
+				       struct tegra_dma_sg_req *sg_base,
+				       enum dma_transfer_direction direction,
+				       u32 mem, u32 len)
+{
+	if (direction == DMA_MEM_TO_DEV)
+		sg_req->adma_ch_regs.src_ptr = mem;
+	else
+		sg_req->adma_ch_regs.tgt_ptr = mem;
+
+	sg_req->adma_ch_regs.tc = len;
+	sg_req->adma_ch_regs.ctrl = sg_base->adma_ch_regs.ctrl;
+	sg_req->adma_ch_regs.ahub_fifo_ctrl =
+			sg_base->adma_ch_regs.ahub_fifo_ctrl;
+	sg_req->adma_ch_regs.config = sg_base->adma_ch_regs.config;
+	sg_req->configured = false;
+	sg_req->last_sg = false;
+	sg_req->req_len = len;
+}
+
+static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
+					   struct of_dma *ofdma)
+{
+	struct tegra_dma *tdma = ofdma->of_dma_data;
+	struct dma_chan *chan;
+
+	chan = dma_get_any_slave_channel(&tdma->dma_dev);
+	if (!chan)
+		return NULL;
+
+	return chan;
+}
+
+static const struct tegra_dma_chip_data tegra210_adma_chip_data = {
+	.burst_time		= TEGRA_ADMA_BURST_COMPLETE_TIME,
+	.channel_reg_size       = 0x80,
+	.max_dma_count          = 1024UL * 64,
+	.nr_channels		= 10,
+};
+
+static const struct of_device_id tegra_adma_of_match[] = {
+	{
+		.compatible = "nvidia,tegra210-adma",
+		.data = &tegra210_adma_chip_data,
+	}, {
+	},
+};
+MODULE_DEVICE_TABLE(of, tegra_adma_of_match);
+
+static struct platform_device_id tegra_adma_devtype[] = {
+	{
+		.name = "tegra210-adma",
+		.driver_data = (unsigned long)&tegra210_adma_chip_data,
+	},
+};
+
+static const struct tegra_dma_ops tegra_adma_ops = {
+	.get_xfer_count		= tegra_adma_get_xfer_count,
+	.get_xfer_params_sg	= tegra_adma_get_xfer_params_sg,
+	.get_xfer_params_cyclic	= tegra_adma_get_xfer_params_cyclic,
+	.irq_clear		= tegra_adma_irq_clear,
+	.irq_status		= tegra_adma_irq_status,
+	.pause			= tegra_adma_pause,
+	.program		= tegra_adma_program,
+	.resume			= tegra_adma_resume,
+	.set_xfer_params	= tegra_adma_set_xfer_params,
+	.start			= tegra_adma_start,
+	.stop			= tegra_adma_stop,
+};
+
+static struct device *dma_device;
+
+static int tegra_adma_probe(struct platform_device *pdev)
+{
+	struct resource	*res;
+	struct tegra_dma *tdma;
+	int ret, i;
+
+	const struct tegra_dma_chip_data *cdata = NULL;
+	const struct of_device_id *match;
+
+	if (!pdev->dev.of_node) {
+		dev_err(&pdev->dev, "No device tree node for ADMA driver");
+		return -ENODEV;
+	}
+
+	match = of_match_device(of_match_ptr(tegra_adma_of_match),
+				&pdev->dev);
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+	cdata = match->data;
+
+	tdma = devm_kzalloc(&pdev->dev, sizeof(*tdma) + cdata->nr_channels *
+			sizeof(struct tegra_dma_channel), GFP_KERNEL);
+	if (!tdma)
+		return -ENOMEM;
+
+	tdma->dev = &pdev->dev;
+	tdma->chip_data = cdata;
+	platform_set_drvdata(pdev, tdma);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "No mem resource for ADMA\n");
+		return -EINVAL;
+	}
+
+	tdma->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tdma->base_addr))
+		return PTR_ERR(tdma->base_addr);
+
+	tdma->dma_clk = devm_clk_get(&pdev->dev, "adma");
+	if (IS_ERR(tdma->dma_clk)) {
+		dev_err(&pdev->dev, "Error: Missing controller clock\n");
+		return PTR_ERR(tdma->dma_clk);
+	}
+
+	tdma->domain_clk = devm_clk_get(&pdev->dev, "adma.ape");
+	if (IS_ERR(tdma->domain_clk)) {
+		dev_err(&pdev->dev, "Error: Missing APE clock\n");
+		return PTR_ERR(tdma->domain_clk);
+	}
+
+	spin_lock_init(&tdma->global_lock);
+
+	dma_device = &pdev->dev;
+
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev))
+		ret = tegra_adma_runtime_resume(&pdev->dev);
+	else
+		ret = pm_runtime_get_sync(&pdev->dev);
+
+	if (ret)
+		goto err_pm_disable;
+
+	/* Reset ADMA controller */
+	ret = tegra_adma_global_soft_reset(tdma);
+	if (ret)
+		return ret;
+
+	INIT_LIST_HEAD(&tdma->dma_dev.channels);
+	for (i = 0; i < cdata->nr_channels; i++) {
+		struct tegra_dma_channel *tdc = &tdma->channels[i];
+
+		tdc->chan_addr = tdma->base_addr + cdata->channel_reg_size * i;
+
+		tdc->irq = platform_get_irq(pdev, i);
+		if (tdc->irq < 0) {
+			ret = -EPROBE_DEFER;
+			dev_err(&pdev->dev, "No irq resource for chan %d\n", i);
+			goto err_irq;
+		}
+
+		snprintf(tdc->name, sizeof(tdc->name), "adma.%d", i);
+		ret = devm_request_irq(&pdev->dev, tdc->irq,
+				tegra_dma_isr, 0, tdc->name, tdc);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"request_irq failed with err %d channel %d\n",
+				ret, i);
+			goto err_irq;
+		}
+
+		tdc->dma_chan.device = &tdma->dma_dev;
+		dma_cookie_init(&tdc->dma_chan);
+		list_add_tail(&tdc->dma_chan.device_node,
+				&tdma->dma_dev.channels);
+		tdc->tdma = tdma;
+		tdc->id = i;
+
+		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
+				(unsigned long)tdc);
+		spin_lock_init(&tdc->lock);
+
+		INIT_LIST_HEAD(&tdc->pending_sg_req);
+		INIT_LIST_HEAD(&tdc->free_sg_req);
+		INIT_LIST_HEAD(&tdc->free_dma_desc);
+		INIT_LIST_HEAD(&tdc->cb_desc);
+	}
+
+	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
+	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
+	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
+
+	tdma->dma_dev.dev = &pdev->dev;
+	tdma->dma_dev.device_alloc_chan_resources =
+					tegra_dma_alloc_chan_resources;
+	tdma->dma_dev.device_free_chan_resources =
+					tegra_dma_free_chan_resources;
+	tdma->dma_dev.device_prep_slave_sg = tegra_dma_prep_slave_sg;
+	tdma->dma_dev.device_prep_dma_cyclic = tegra_dma_prep_dma_cyclic;
+	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
+	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
+
+	tdma->ops = &tegra_adma_ops;
+
+	/* Enable global ADMA registers */
+	tdma_write(tdma, ADMA_GLOBAL_CMD, 1);
+
+	ret = dma_async_device_register(&tdma->dma_dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Tegra210 ADMA driver registration failed %d\n", ret);
+		goto err_irq;
+	}
+
+	ret = of_dma_controller_register(pdev->dev.of_node,
+					 tegra_dma_of_xlate, tdma);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Tegra210 ADMA OF registration failed %d\n", ret);
+		goto err_unregister_dma_dev;
+	}
+
+	pm_runtime_put(&pdev->dev);
+
+	dev_info(&pdev->dev, "Tegra210 ADMA driver register %d channels\n",
+			cdata->nr_channels);
+	return 0;
+
+err_unregister_dma_dev:
+	dma_async_device_unregister(&tdma->dma_dev);
+err_irq:
+	while (--i >= 0) {
+		struct tegra_dma_channel *tdc = &tdma->channels[i];
+
+		tasklet_kill(&tdc->tasklet);
+	}
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra_adma_runtime_suspend(&pdev->dev);
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static int tegra_adma_remove(struct platform_device *pdev)
+{
+	struct tegra_dma *tdma = platform_get_drvdata(pdev);
+	int i;
+	struct tegra_dma_channel *tdc;
+
+	dma_async_device_unregister(&tdma->dma_dev);
+
+	for (i = 0; i < tdma->chip_data->nr_channels; ++i) {
+		tdc = &tdma->channels[i];
+		tasklet_kill(&tdc->tasklet);
+	}
+
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra_adma_runtime_suspend(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int tegra_adma_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct tegra_dma *tdma = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(tdma->dma_clk);
+	clk_disable_unprepare(tdma->domain_clk);
+	return 0;
+}
+
+static int tegra_adma_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct tegra_dma *tdma = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(tdma->domain_clk);
+	if (ret < 0) {
+		dev_err(dev, "clk_prepare_enable failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(tdma->dma_clk);
+	if (ret < 0) {
+		dev_err(dev, "clk_prepare_enable failed: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int tegra_adma_pm_suspend(struct device *dev)
+{
+	struct tegra_dma *tdma = dev_get_drvdata(dev);
+	int i;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		return ret;
+
+	tdma->reg_global = tdma_read(tdma, ADMA_GLOBAL_CMD);
+	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
+		struct tegra_dma_channel *tdc = &tdma->channels[i];
+		struct tegra_adma_chan_regs *ch_reg = &tdc->adma_ch_regs;
+
+		ch_reg->tc = tdc_read(tdc, ADMA_CH_TC);
+		ch_reg->src_ptr = tdc_read(tdc, ADMA_CH_LOWER_SOURCE_ADDR);
+		ch_reg->tgt_ptr = tdc_read(tdc, ADMA_CH_LOWER_TARGET_ADDR);
+		ch_reg->ctrl = tdc_read(tdc, ADMA_CH_CTRL);
+		ch_reg->ahub_fifo_ctrl =
+			tdc_read(tdc, ADMA_CH_AHUB_FIFO_CTRL);
+		ch_reg->config = tdc_read(tdc, ADMA_CH_CONFIG);
+	}
+	pm_runtime_put(dev);
+	return 0;
+}
+
+static int tegra_adma_pm_resume(struct device *dev)
+{
+	struct tegra_dma *tdma = dev_get_drvdata(dev);
+	int i;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		return ret;
+
+	tdma_write(tdma, ADMA_GLOBAL_CMD, tdma->reg_global);
+
+	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
+		struct tegra_dma_channel *tdc = &tdma->channels[i];
+		struct tegra_adma_chan_regs *ch_reg = &tdc->adma_ch_regs;
+
+		tdc_write(tdc, ADMA_CH_TC, ch_reg->tc);
+		tdc_write(tdc, ADMA_CH_LOWER_SOURCE_ADDR, ch_reg->src_ptr);
+		tdc_write(tdc, ADMA_CH_LOWER_TARGET_ADDR, ch_reg->tgt_ptr);
+		tdc_write(tdc, ADMA_CH_CTRL, ch_reg->ctrl);
+		tdc_write(tdc, ADMA_CH_AHUB_FIFO_CTRL,
+				ch_reg->ahub_fifo_ctrl);
+		tdc_write(tdc, ADMA_CH_CONFIG, ch_reg->config);
+	}
+	pm_runtime_put(dev);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops tegra_adma_dev_pm_ops = {
+#ifdef CONFIG_PM
+	.runtime_suspend = tegra_adma_runtime_suspend,
+	.runtime_resume = tegra_adma_runtime_resume,
+#endif
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_adma_pm_suspend, tegra_adma_pm_resume)
+};
+
+static struct platform_driver tegra_admac_driver = {
+	.driver = {
+		.name	= "tegra-adma",
+		.owner = THIS_MODULE,
+		.pm	= &tegra_adma_dev_pm_ops,
+		.of_match_table = of_match_ptr(tegra_adma_of_match),
+	},
+	.probe		= tegra_adma_probe,
+	.remove		= tegra_adma_remove,
+	.id_table	= tegra_adma_devtype,
+};
+
+module_platform_driver(tegra_admac_driver);
+
+MODULE_ALIAS("platform:tegra210-adma");
+MODULE_DESCRIPTION("NVIDIA Tegra ADMA Controller driver");
+MODULE_AUTHOR("Dara Ramesh <dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
+MODULE_AUTHOR("Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.1.4
