From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] soc/tegra: fuse: Explicitly request DMA channel from APB DMA driver
Date: Fri, 20 Oct 2017 01:08:04 +0300
Message-ID: <059ca713c7416aedeb0080ab4b8a49da430a30b9.1508450681.git.digetx@gmail.com>
References: <cover.1508450681.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1508450681.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1508450681.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1508450681.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Currently fuse driver requests DMA channel from an arbitrary DMA device,
it is not a problem since there is only one DMA provider for Tegra20 yet,
but it may become troublesome if another provider will appear.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra20.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index 27e9ac7d3165..49ff017f3ded 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -96,6 +96,13 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 	return value;
 }
 
+static bool dma_filter(struct dma_chan *chan, void *filter_param)
+{
+	struct device_node *np = chan->device->dev->of_node;
+
+	return of_device_is_compatible(np, "nvidia,tegra20-apbdma");
+}
+
 static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 {
 	dma_cap_mask_t mask;
@@ -103,7 +110,7 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 	dma_cap_zero(mask);
 	dma_cap_set(DMA_SLAVE, mask);
 
-	fuse->apbdma.chan = dma_request_channel(mask, NULL, NULL);
+	fuse->apbdma.chan = __dma_request_channel(&mask, dma_filter, NULL);
 	if (!fuse->apbdma.chan)
 		return -EPROBE_DEFER;
 
-- 
2.14.2
