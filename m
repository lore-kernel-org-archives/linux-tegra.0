From: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 1/4] misc: sram: add support for remapping reserved regions only
Date: Tue, 12 May 2020 16:48:00 +0200
Message-ID: <20200512144803.24344-1-ykaukab@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some SRAM kernel users may be interested in SRAM’s reserved regions
only, though a bigger SRAM is available on the platform. Add an
optional flag 'reserved-only' which allows to ioremap reserved regions
only. Rest of SRAM is not remapped. ioremap type is selected depending
upon no-memory-wc as usual.

Signed-off-by: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
---
*Tested only on Jetson TX2. Jetson AGX Xavier is untested.*

 drivers/misc/sram.c | 73 ++++++++++++++++++++++++++++++++++-----------
 drivers/misc/sram.h |  3 ++
 2 files changed, 58 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 6c1a23cb3e8c..44e459f39e22 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -97,7 +97,7 @@ static int sram_add_partition(struct sram_dev *sram, struct sram_reserve *block,
 	struct sram_partition *part = &sram->partition[sram->partitions];
 
 	mutex_init(&part->lock);
-	part->base = sram->virt_base + block->start;
+	part->base = block->virt_start;
 
 	if (block->pool) {
 		ret = sram_add_pool(sram, block, start, part);
@@ -153,6 +153,25 @@ static int sram_reserve_cmp(void *priv, struct list_head *a,
 	return ra->start - rb->start;
 }
 
+static int sram_remap_resource(struct sram_dev *sram,
+		struct resource *res, void __iomem **virt)
+{
+	void __iomem *addr;
+
+	if (sram->no_memory_wc)
+		addr = devm_ioremap_resource(sram->dev, res);
+	else
+		addr = devm_ioremap_resource_wc(sram->dev, res);
+
+	if (IS_ERR(addr)) {
+		dev_err(sram->dev, "could not map SRAM region\n");
+		return PTR_ERR(addr);
+	}
+
+	*virt = addr;
+	return 0;
+}
+
 static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 {
 	struct device_node *np = sram->dev->of_node, *child;
@@ -239,6 +258,16 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 				block->start, block->start + block->size);
 		}
 
+		/* ioremap reserved block as whole sram is not remapped */
+		if (sram->reserved_only) {
+			ret = sram_remap_resource(sram, &child_res,
+					&block->virt_start);
+			if (ret)
+				goto err_chunks;
+		} else {
+			block->virt_start = sram->virt_base + block->start;
+		}
+
 		block++;
 	}
 	child = NULL;
@@ -282,8 +311,11 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 			}
 		}
 
-		/* current start is in a reserved block, so continue after it */
-		if (block->start == cur_start) {
+		/*
+		 * Current start is in a reserved block, so continue after it.
+		 * Or if only using reserved blocks
+		 */
+		if (block->start == cur_start || sram->reserved_only) {
 			cur_start = block->start + block->size;
 			continue;
 		}
@@ -342,6 +374,7 @@ static int sram_probe(struct platform_device *pdev)
 	struct sram_dev *sram;
 	int ret;
 	int (*init_func)(void);
+	struct resource *res;
 
 	sram = devm_kzalloc(&pdev->dev, sizeof(*sram), GFP_KERNEL);
 	if (!sram)
@@ -349,19 +382,22 @@ static int sram_probe(struct platform_device *pdev)
 
 	sram->dev = &pdev->dev;
 
-	if (of_property_read_bool(pdev->dev.of_node, "no-memory-wc"))
-		sram->virt_base = devm_platform_ioremap_resource(pdev, 0);
-	else
-		sram->virt_base = devm_platform_ioremap_resource_wc(pdev, 0);
-	if (IS_ERR(sram->virt_base)) {
-		dev_err(&pdev->dev, "could not map SRAM registers\n");
-		return PTR_ERR(sram->virt_base);
-	}
+	sram->no_memory_wc =
+		of_property_read_bool(pdev->dev.of_node, "no-memory-wc");
+	sram->reserved_only =
+		of_property_read_bool(pdev->dev.of_node, "reserved-only");
 
-	sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
-					  NUMA_NO_NODE, NULL);
-	if (IS_ERR(sram->pool))
-		return PTR_ERR(sram->pool);
+	if (!sram->reserved_only) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		ret = sram_remap_resource(sram, res, &sram->virt_base);
+		if (ret)
+			return ret;
+
+		sram->pool = devm_gen_pool_create(sram->dev,
+				ilog2(SRAM_GRANULARITY), NUMA_NO_NODE, NULL);
+		if (IS_ERR(sram->pool))
+			return PTR_ERR(sram->pool);
+	}
 
 	sram->clk = devm_clk_get(sram->dev, NULL);
 	if (IS_ERR(sram->clk))
@@ -383,8 +419,9 @@ static int sram_probe(struct platform_device *pdev)
 			goto err_free_partitions;
 	}
 
-	dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
-		gen_pool_size(sram->pool) / 1024, sram->virt_base);
+	if (sram->pool)
+		dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
+			gen_pool_size(sram->pool) / 1024, sram->virt_base);
 
 	return 0;
 
@@ -403,7 +440,7 @@ static int sram_remove(struct platform_device *pdev)
 
 	sram_free_partitions(sram);
 
-	if (gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
+	if (sram->pool && gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
 		dev_err(sram->dev, "removed while SRAM allocated\n");
 
 	if (sram->clk)
diff --git a/drivers/misc/sram.h b/drivers/misc/sram.h
index 9c1d21ff7347..a485fa29458b 100644
--- a/drivers/misc/sram.h
+++ b/drivers/misc/sram.h
@@ -23,6 +23,8 @@ struct sram_dev {
 
 	struct sram_partition *partition;
 	u32 partitions;
+	bool no_memory_wc;
+	bool reserved_only;
 };
 
 struct sram_reserve {
@@ -33,6 +35,7 @@ struct sram_reserve {
 	bool pool;
 	bool protect_exec;
 	const char *label;
+	void __iomem *virt_start;
 };
 
 #ifdef CONFIG_SRAM_EXEC
-- 
2.25.0
