From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 3/3] soc/tegra: fuse: Explicitly request DMA channel from APB DMA driver
Date: Tue, 26 Sep 2017 01:35:39 +0300
Message-ID: <b43be9bcd588d5e4496d3efd6571f9f6561a7844.1506378772.git.digetx@gmail.com>
References: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Currently efuse driver requests DMA channel from an arbitrary DMA device,
it is not a problem since there is only one DMA provider for Tegra20 yet,
but it will become troublesome once another provider would be added.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra20.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index a33f48c06771..06ec3f9573e6 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -98,14 +98,9 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 
 static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 {
-	dma_cap_mask_t mask;
-
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_SLAVE, mask);
-
-	fuse->apbdma.chan = dma_request_channel(mask, NULL, NULL);
-	if (!fuse->apbdma.chan)
-		return -EPROBE_DEFER;
+	fuse->apbdma.chan = dma_request_chan(fuse->dev, "fuse");
+	if (IS_ERR(fuse->apbdma.chan))
+		return PTR_ERR(fuse->apbdma.chan);
 
 	fuse->apbdma.virt = dma_alloc_coherent(fuse->dev, sizeof(u32),
 					       &fuse->apbdma.phys,
-- 
2.14.1
