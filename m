From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] soc/tegra: fuse: Explicitly request DMA channel from APB DMA driver
Date: Wed,  4 Oct 2017 01:35:09 +0300
Message-ID: <c2b55552d079f47564456ebfcd982116aad32be8.1507068874.git.digetx@gmail.com>
References: <cover.1507068874.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1507068874.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1507068874.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1507068874.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Currently fuse driver requests DMA channel from an arbitrary DMA device,
it is not a problem since there is only one DMA provider for Tegra20 yet,
but it will become troublesome once another provider will be added.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra20.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index a33f48c06771..e9e127a24c70 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -37,6 +37,11 @@
 #define FUSE_UID_LOW	0x08
 #define FUSE_UID_HIGH	0x0c
 
+static const struct of_device_id apbdma_of_match[] = {
+	{ .compatible = "nvidia,tegra20-apbdma" },
+	{ },
+};
+
 static u32 tegra20_fuse_read_early(struct tegra_fuse *fuse, unsigned int offset)
 {
 	return readl_relaxed(fuse->base + FUSE_BEGIN + offset);
@@ -96,6 +101,11 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 	return value;
 }
 
+static bool dma_filter(struct dma_chan *chan, void *filter_param)
+{
+	return of_match_device(apbdma_of_match, chan->device->dev) != NULL;
+}
+
 static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 {
 	dma_cap_mask_t mask;
@@ -103,7 +113,7 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 	dma_cap_zero(mask);
 	dma_cap_set(DMA_SLAVE, mask);
 
-	fuse->apbdma.chan = dma_request_channel(mask, NULL, NULL);
+	fuse->apbdma.chan = __dma_request_channel(&mask, dma_filter, NULL);
 	if (!fuse->apbdma.chan)
 		return -EPROBE_DEFER;
 
-- 
2.14.1
