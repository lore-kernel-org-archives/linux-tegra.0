From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 1/2] gpu: host1x: Set DMA mask
Date: Fri, 26 Feb 2016 18:06:52 +0900
Message-ID: <1456477613-24995-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The default DMA mask covers a 32 bits address range, but host1x devices
can address a larger range on TK1 and TX1. Set the DMA mask to the range
addressable when we use the IOMMU to prevent the use of bounce buffers.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Change since v3:
- Use the IOMMU-addressable range (when IOMMU is available) for each host1x
  variation. This ensures that we can cover all physical memory while remaining
  conservative if IOMMU is not used.
- Set the DMA range on the host1x device itself so all its childs inherit from it

 drivers/gpu/host1x/dev.c | 7 +++++++
 drivers/gpu/host1x/dev.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 314bf3718cc7..ff348690df94 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -23,6 +23,7 @@
 #include <linux/of_device.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/dma-mapping.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/host1x.h>
@@ -68,6 +69,7 @@ static const struct host1x_info host1x01_info = {
 	.nb_bases	= 8,
 	.init		= host1x01_init,
 	.sync_offset	= 0x3000,
+	.dma_mask	= DMA_BIT_MASK(32),
 };
 
 static const struct host1x_info host1x02_info = {
@@ -77,6 +79,7 @@ static const struct host1x_info host1x02_info = {
 	.nb_bases = 12,
 	.init = host1x02_init,
 	.sync_offset = 0x3000,
+	.dma_mask = DMA_BIT_MASK(32),
 };
 
 static const struct host1x_info host1x04_info = {
@@ -86,6 +89,7 @@ static const struct host1x_info host1x04_info = {
 	.nb_bases = 64,
 	.init = host1x04_init,
 	.sync_offset = 0x2100,
+	.dma_mask = DMA_BIT_MASK(34),
 };
 
 static const struct host1x_info host1x05_info = {
@@ -95,6 +99,7 @@ static const struct host1x_info host1x05_info = {
 	.nb_bases = 64,
 	.init = host1x05_init,
 	.sync_offset = 0x2100,
+	.dma_mask = DMA_BIT_MASK(34),
 };
 
 static struct of_device_id host1x_of_match[] = {
@@ -148,6 +153,8 @@ static int host1x_probe(struct platform_device *pdev)
 	if (IS_ERR(host->regs))
 		return PTR_ERR(host->regs);
 
+	dma_set_mask_and_coherent(host->dev, host->info->dma_mask);
+
 	if (host->info->init) {
 		err = host->info->init(host);
 		if (err)
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 0b6e8e9629c5..dace124994bb 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -96,6 +96,7 @@ struct host1x_info {
 	int	nb_mlocks;		/* host1x: number of mlocks */
 	int	(*init)(struct host1x *); /* initialize per SoC ops */
 	int	sync_offset;
+	u64	dma_mask;		/* mask of addressable memory */
 };
 
 struct host1x {
-- 
2.7.1
