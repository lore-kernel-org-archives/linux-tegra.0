Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B09C07E96
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Jul 2021 10:34:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B55260041
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Jul 2021 10:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhGOKha (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Jul 2021 06:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241433AbhGOKha (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Jul 2021 06:37:30 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D515C061762;
        Thu, 15 Jul 2021 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=a6pMukHAQ7xrk69NfRuJ5+OsqyBQF6NV8veupMmJlGU=; b=wPWKd1GsdKfHdXaysXDu5GxXYe
        WJX2TFa/PjMRCqy8kV7JlW2upP86f0yADODrOoanZSTGQE9X/NFaTR6nVefyghtLmFKN1dOUDMfKs
        UOEPasSTidKiMv2LHsGEM9mKgwLBG0uX0+eTFyxK9fkuf0/uM8tACfWWCjTc2TGruSizTjd4dOGPf
        AalfDfXK9/MAXXADvEdLAdicPW6f0A1IsuzpYL6VzWAYhTRmF3/VDTpEzJ4kNyKVwII4y+/TTnA0i
        ooHTy5OMOvkJ/x5Xna2Ayi+nwXpMaCOMxQRZQ/FQnT5pM81tZ/NpfqYzXu7Goep605dMpQE9adCA2
        uiQHFoNQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1m3yhF-0004sT-To; Thu, 15 Jul 2021 13:34:32 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     ykaukab@suse.de, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2] misc: sram: Only map reserved areas in Tegra SYSRAM
Date:   Thu, 15 Jul 2021 13:34:23 +0300
Message-Id: <20210715103423.1811101-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tegra186 and later, a portion of the SYSRAM may be reserved for use
by TZ. Non-TZ memory accesses to this portion, including speculative
accesses, trigger SErrors that bring down the system. This does also
happen in practice occasionally (due to speculative accesses).

To fix the issue, add a flag to the SRAM driver to only map the
device tree-specified reserved areas depending on a flag set
based on the compatibility string. This would not affect non-Tegra
systems that rely on the entire thing being memory mapped.

If 64K pages are being used, we cannot exactly map the 4K regions
that are placed in SYSRAM - ioremap code instead aligns to closest
64K pages. However, since in practice the non-accessible memory area
is 64K aligned, these mappings do not overlap with the non-accessible
memory area and things work out.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
* Removed default config, instead use a null config if not specified
* Add comma at end of field initializer
* Add __iomem specifier to temporary variable
---
 drivers/misc/sram.c | 103 +++++++++++++++++++++++++++++++-------------
 drivers/misc/sram.h |   9 ++++
 2 files changed, 82 insertions(+), 30 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 93638ae2753a..4c26b19f5154 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -97,7 +97,24 @@ static int sram_add_partition(struct sram_dev *sram, struct sram_reserve *block,
 	struct sram_partition *part = &sram->partition[sram->partitions];
 
 	mutex_init(&part->lock);
-	part->base = sram->virt_base + block->start;
+
+	if (sram->config && sram->config->map_only_reserved) {
+		void __iomem *virt_base;
+
+		if (sram->no_memory_wc)
+			virt_base = devm_ioremap_resource(sram->dev, &block->res);
+		else
+			virt_base = devm_ioremap_resource_wc(sram->dev, &block->res);
+
+		if (IS_ERR(virt_base)) {
+			dev_err(sram->dev, "could not map SRAM at %pr\n", &block->res);
+			return PTR_ERR(virt_base);
+		}
+
+		part->base = virt_base;
+	} else {
+		part->base = sram->virt_base + block->start;
+	}
 
 	if (block->pool) {
 		ret = sram_add_pool(sram, block, start, part);
@@ -198,6 +215,7 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 
 		block->start = child_res.start - res->start;
 		block->size = resource_size(&child_res);
+		block->res = child_res;
 		list_add_tail(&block->list, &reserve_list);
 
 		if (of_find_property(child, "export", NULL))
@@ -295,15 +313,17 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 		 */
 		cur_size = block->start - cur_start;
 
-		dev_dbg(sram->dev, "adding chunk 0x%lx-0x%lx\n",
-			cur_start, cur_start + cur_size);
+		if (sram->pool) {
+			dev_dbg(sram->dev, "adding chunk 0x%lx-0x%lx\n",
+				cur_start, cur_start + cur_size);
 
-		ret = gen_pool_add_virt(sram->pool,
-				(unsigned long)sram->virt_base + cur_start,
-				res->start + cur_start, cur_size, -1);
-		if (ret < 0) {
-			sram_free_partitions(sram);
-			goto err_chunks;
+			ret = gen_pool_add_virt(sram->pool,
+					(unsigned long)sram->virt_base + cur_start,
+					res->start + cur_start, cur_size, -1);
+			if (ret < 0) {
+				sram_free_partitions(sram);
+				goto err_chunks;
+			}
 		}
 
 		/* next allocation after this reserved block */
@@ -331,40 +351,63 @@ static int atmel_securam_wait(void)
 					10000, 500000);
 }
 
+static const struct sram_config atmel_securam_config = {
+	.init = atmel_securam_wait,
+};
+
+/*
+ * SYSRAM contains areas that are not accessible by the
+ * kernel, such as the first 256K that is reserved for TZ.
+ * Accesses to those areas (including speculative accesses)
+ * trigger SErrors. As such we must map only the areas of
+ * SYSRAM specified in the device tree.
+ */
+static const struct sram_config tegra_sysram_config = {
+	.map_only_reserved = true,
+};
+
 static const struct of_device_id sram_dt_ids[] = {
 	{ .compatible = "mmio-sram" },
-	{ .compatible = "atmel,sama5d2-securam", .data = atmel_securam_wait },
+	{ .compatible = "atmel,sama5d2-securam", .data = &atmel_securam_config },
+	{ .compatible = "nvidia,tegra186-sysram", .data = &tegra_sysram_config },
+	{ .compatible = "nvidia,tegra194-sysram", .data = &tegra_sysram_config },
 	{}
 };
 
 static int sram_probe(struct platform_device *pdev)
 {
+	const struct sram_config *config;
 	struct sram_dev *sram;
 	int ret;
 	struct resource *res;
-	int (*init_func)(void);
+
+	config = of_device_get_match_data(&pdev->dev);
 
 	sram = devm_kzalloc(&pdev->dev, sizeof(*sram), GFP_KERNEL);
 	if (!sram)
 		return -ENOMEM;
 
 	sram->dev = &pdev->dev;
+	sram->no_memory_wc = of_property_read_bool(pdev->dev.of_node, "no-memory-wc");
+	sram->config = config;
+
+	if (!config || !config->map_only_reserved) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (sram->no_memory_wc)
+			sram->virt_base = devm_ioremap_resource(&pdev->dev, res);
+		else
+			sram->virt_base = devm_ioremap_resource_wc(&pdev->dev, res);
+		if (IS_ERR(sram->virt_base)) {
+			dev_err(&pdev->dev, "could not map SRAM registers\n");
+			return PTR_ERR(sram->virt_base);
+		}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (of_property_read_bool(pdev->dev.of_node, "no-memory-wc"))
-		sram->virt_base = devm_ioremap_resource(&pdev->dev, res);
-	else
-		sram->virt_base = devm_ioremap_resource_wc(&pdev->dev, res);
-	if (IS_ERR(sram->virt_base)) {
-		dev_err(&pdev->dev, "could not map SRAM registers\n");
-		return PTR_ERR(sram->virt_base);
+		sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
+						  NUMA_NO_NODE, NULL);
+		if (IS_ERR(sram->pool))
+			return PTR_ERR(sram->pool);
 	}
 
-	sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
-					  NUMA_NO_NODE, NULL);
-	if (IS_ERR(sram->pool))
-		return PTR_ERR(sram->pool);
-
 	sram->clk = devm_clk_get(sram->dev, NULL);
 	if (IS_ERR(sram->clk))
 		sram->clk = NULL;
@@ -378,15 +421,15 @@ static int sram_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sram);
 
-	init_func = of_device_get_match_data(&pdev->dev);
-	if (init_func) {
-		ret = init_func();
+	if (config && config->init) {
+		ret = config->init();
 		if (ret)
 			goto err_free_partitions;
 	}
 
-	dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
-		gen_pool_size(sram->pool) / 1024, sram->virt_base);
+	if (sram->pool)
+		dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
+			gen_pool_size(sram->pool) / 1024, sram->virt_base);
 
 	return 0;
 
@@ -405,7 +448,7 @@ static int sram_remove(struct platform_device *pdev)
 
 	sram_free_partitions(sram);
 
-	if (gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
+	if (sram->pool && gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
 		dev_err(sram->dev, "removed while SRAM allocated\n");
 
 	if (sram->clk)
diff --git a/drivers/misc/sram.h b/drivers/misc/sram.h
index 9c1d21ff7347..d2058d8c8f1d 100644
--- a/drivers/misc/sram.h
+++ b/drivers/misc/sram.h
@@ -5,6 +5,11 @@
 #ifndef __SRAM_H
 #define __SRAM_H
 
+struct sram_config {
+	int (*init)(void);
+	bool map_only_reserved;
+};
+
 struct sram_partition {
 	void __iomem *base;
 
@@ -15,8 +20,11 @@ struct sram_partition {
 };
 
 struct sram_dev {
+	const struct sram_config *config;
+
 	struct device *dev;
 	void __iomem *virt_base;
+	bool no_memory_wc;
 
 	struct gen_pool *pool;
 	struct clk *clk;
@@ -29,6 +37,7 @@ struct sram_reserve {
 	struct list_head list;
 	u32 start;
 	u32 size;
+	struct resource res;
 	bool export;
 	bool pool;
 	bool protect_exec;
-- 
2.30.1

