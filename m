From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] dmaengine: squash lines for immediate return
Date: Tue, 13 Sep 2016 04:20:54 +0900
Message-ID: <1473708054-30989-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Remove unneeded variables and assignments.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 drivers/dma/cppi41.c          | 30 +++++-------------------------
 drivers/dma/imx-sdma.c        | 15 ++++-----------
 drivers/dma/ppc4xx/adma.c     | 15 ++++++---------
 drivers/dma/tegra20-apb-dma.c |  4 +---
 4 files changed, 16 insertions(+), 48 deletions(-)

diff --git a/drivers/dma/cppi41.c b/drivers/dma/cppi41.c
index 4b23174..dfad278 100644
--- a/drivers/dma/cppi41.c
+++ b/drivers/dma/cppi41.c
@@ -339,11 +339,7 @@ static irqreturn_t cppi41_irq(int irq, void *data)
 
 static dma_cookie_t cppi41_tx_submit(struct dma_async_tx_descriptor *tx)
 {
-	dma_cookie_t cookie;
-
-	cookie = dma_cookie_assign(tx);
-
-	return cookie;
+	return dma_cookie_assign(tx);
 }
 
 static int cppi41_dma_alloc_chan_resources(struct dma_chan *chan)
@@ -433,11 +429,7 @@ static u32 get_host_pd0(u32 length)
 
 static u32 get_host_pd1(struct cppi41_channel *c)
 {
-	u32 reg;
-
-	reg = 0;
-
-	return reg;
+	return 0;
 }
 
 static u32 get_host_pd2(struct cppi41_channel *c)
@@ -452,12 +444,8 @@ static u32 get_host_pd2(struct cppi41_channel *c)
 
 static u32 get_host_pd3(u32 length)
 {
-	u32 reg;
-
 	/* PD3 = packet size */
-	reg = length;
-
-	return reg;
+	return length;
 }
 
 static u32 get_host_pd6(u32 length)
@@ -473,20 +461,12 @@ static u32 get_host_pd6(u32 length)
 
 static u32 get_host_pd4_or_7(u32 addr)
 {
-	u32 reg;
-
-	reg = addr;
-
-	return reg;
+	return addr;
 }
 
 static u32 get_host_pd5(void)
 {
-	u32 reg;
-
-	reg = 0;
-
-	return reg;
+	return 0;
 }
 
 static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 03ec76f..6aaddbf 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -947,7 +947,6 @@ static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
 static int sdma_config_channel(struct dma_chan *chan)
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
-	int ret;
 
 	sdma_disable_channel(chan);
 
@@ -999,9 +998,7 @@ static int sdma_config_channel(struct dma_chan *chan)
 		sdmac->watermark_level = 0; /* FIXME: M3_BASE_ADDRESS */
 	}
 
-	ret = sdma_load_context(sdmac);
-
-	return ret;
+	return sdma_load_context(sdmac);
 }
 
 static int sdma_set_channel_priority(struct sdma_channel *sdmac,
@@ -1520,13 +1517,9 @@ out:
 static int sdma_get_firmware(struct sdma_engine *sdma,
 		const char *fw_name)
 {
-	int ret;
-
-	ret = request_firmware_nowait(THIS_MODULE,
-			FW_ACTION_HOTPLUG, fw_name, sdma->dev,
-			GFP_KERNEL, sdma, sdma_load_firmware);
-
-	return ret;
+	return request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG, fw_name,
+				       sdma->dev, GFP_KERNEL, sdma,
+				       sdma_load_firmware);
 }
 
 static int sdma_init(struct sdma_engine *sdma)
diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index da3688b..39f2138 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -2780,7 +2780,6 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_xor_zero_sum(
 		struct dma_chan *chan, dma_addr_t *src, unsigned int src_cnt,
 		size_t len, enum sum_check_flags *result, unsigned long flags)
 {
-	struct dma_async_tx_descriptor *tx;
 	dma_addr_t pq[2];
 
 	/* validate P, disable Q */
@@ -2788,10 +2787,9 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_xor_zero_sum(
 	pq[1] = 0;
 	flags |= DMA_PREP_PQ_DISABLE_Q;
 
-	tx = ppc440spe_adma_prep_dma_pqzero_sum(chan, pq, &src[1],
-						src_cnt - 1, 0, len,
-						result, flags);
-	return tx;
+	return ppc440spe_adma_prep_dma_pqzero_sum(chan, pq, &src[1],
+						  src_cnt - 1, 0, len,
+						  result, flags);
 }
 
 /**
@@ -4363,7 +4361,6 @@ static ssize_t store_ppc440spe_r6enable(struct device_driver *dev,
 
 static ssize_t show_ppc440spe_r6poly(struct device_driver *dev, char *buf)
 {
-	ssize_t size = 0;
 	u32 reg;
 
 #ifdef CONFIG_440SP
@@ -4375,9 +4372,9 @@ static ssize_t show_ppc440spe_r6poly(struct device_driver *dev, char *buf)
 	reg &= 0xFF;
 #endif
 
-	size = snprintf(buf, PAGE_SIZE, "PPC440SP(e) RAID-6 driver "
-			"uses 0x1%02x polynomial.\n", reg);
-	return size;
+	return snprintf(buf, PAGE_SIZE,
+			"PPC440SP(e) RAID-6 driver uses 0x1%02x polynomial.\n",
+			reg);
 }
 
 static ssize_t store_ppc440spe_r6poly(struct device_driver *dev,
diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 6ab9eb9..89795a2 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -337,9 +337,7 @@ static struct tegra_dma_sg_req *tegra_dma_sg_req_get(
 	}
 	spin_unlock_irqrestore(&tdc->lock, flags);
 
-	sg_req = kzalloc(sizeof(struct tegra_dma_sg_req), GFP_NOWAIT);
-
-	return sg_req;
+	return kzalloc(sizeof(struct tegra_dma_sg_req), GFP_NOWAIT);
 }
 
 static int tegra_dma_slave_config(struct dma_chan *dc,
-- 
1.9.1
