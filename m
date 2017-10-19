From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/2] soc/tegra: fuse: Fix reading registers using DMA on Tegra20
Date: Fri, 20 Oct 2017 01:08:03 +0300
Message-ID: <dc62a64444227d549d9f7d46b39e4552e8c7b6fc.1508450681.git.digetx@gmail.com>
References: <cover.1508450681.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1508450681.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1508450681.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1508450681.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

FUSE driver doesn't configure DMA channel properly, because of it DMA
transfer is never issued and tegra20_fuse_read() always return 0x0.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c   | 1 +
 drivers/soc/tegra/fuse/fuse-tegra20.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b7c552e3133c..73a3a2c74021 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -132,6 +132,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 
 	/* take over the memory region from the early initialization */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	fuse->phys = res->start;
 	fuse->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(fuse->base))
 		return PTR_ERR(fuse->base);
diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index 294413a969a0..27e9ac7d3165 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -59,7 +59,7 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 
 	mutex_lock(&fuse->apbdma.lock);
 
-	fuse->apbdma.config.src_addr = fuse->apbdma.phys + FUSE_BEGIN + offset;
+	fuse->apbdma.config.src_addr = fuse->phys + FUSE_BEGIN + offset;
 
 	err = dmaengine_slave_config(fuse->apbdma.chan, &fuse->apbdma.config);
 	if (err)
@@ -119,6 +119,8 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
 	fuse->apbdma.config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	fuse->apbdma.config.src_maxburst = 1;
 	fuse->apbdma.config.dst_maxburst = 1;
+	fuse->apbdma.config.direction = DMA_DEV_TO_MEM;
+	fuse->apbdma.config.device_fc = false;
 
 	init_completion(&fuse->apbdma.wait);
 	mutex_init(&fuse->apbdma.lock);
-- 
2.14.2
