Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25700C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 20:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2050615A4
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 20:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346278AbhI2UFS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Sep 2021 16:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343734AbhI2UFR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Sep 2021 16:05:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BABC06161C;
        Wed, 29 Sep 2021 13:03:35 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g41so15528034lfv.1;
        Wed, 29 Sep 2021 13:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0DNapmtU9Tsx/OrVyhsmt2GmuP2QJHORaDaRtcU17xY=;
        b=bLRLDVmzlSzYQmhy0NAJxW8HK/RSYo7mjWvn9lVfLP6sx8Br4kgH6dAzzFZzcFLgMm
         gIb2AHpL7UVB8LOr7ahzx4wxtyvgT0HGKNv2zAlykmeNUNkG8/KuQxSWxfywvRCae+6l
         E/l/VB37yrZXiz/76wllL9068KQiPKLKY3j0Ly/6EiEZ93s/G0HcVHcVvair8MHVJjKx
         cA3pGf/P0upoYT4Yn1iL3yFIwCSiHVs+OyLoW4R/3OE91pX48iBOhRvC41vBEJJQ1HOZ
         Lt7Ze3pBQnKp5Iv+OR6zts+1QCJK/NSmgTBxkYmqG9TMdhbaBFFf4p9l5LKy63be2DWt
         DOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0DNapmtU9Tsx/OrVyhsmt2GmuP2QJHORaDaRtcU17xY=;
        b=05Jm9gCxApP3u/FpercgI1ZADbxMiduZVSGLpqSfsxlzMftzdFge64MVnBXW4SC0ZS
         aKdHpx6vz5T3GXY6OhS87WpP0eooCflipD0w0JbVzXvT1JvB3rsJ5/s5RyJZzLJU0YIh
         GfoYMgz6Aek9j3W//FRBqFhL8lN/a1a6zNsdHqHysjJRMKKM6VtwFmquTemKSowoZu8/
         N4TiZIGq61fcdtnTltXA2xh+b0Jg09pGGOBPTTUwlKkeUjuHbgAcjqCwbTNHjw5FoYdV
         QjyTZKp7zJDjKvZDb8Lus74BhQjPWi/Dt5FB9QmAX7LUGSHsrgrEJ2OfHeS4s7nDZ2OX
         UaOg==
X-Gm-Message-State: AOAM533wK29ik8naA2/Jwt3TjL7s6IeDu4cbShqoY9QnRWDQcef8ZYm/
        Dh0XHO7KFA+YzyNBYF08pZh9/NKJ5mQ=
X-Google-Smtp-Source: ABdhPJz+JObrvlf0Y/6oD1ablgpH2aD0Xipu1BqwE2JBHdP/jIvH7DXXuC6HupvDCGBdtNe1mdIhRw==
X-Received: by 2002:a2e:9707:: with SMTP id r7mr1748843lji.121.1632945814194;
        Wed, 29 Sep 2021 13:03:34 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id u7sm99578lft.79.2021.09.29.13.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 13:03:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/2] memory: tegra20-emc: Support timings matching by LPDDR configuration
Date:   Wed, 29 Sep 2021 23:03:05 +0300
Message-Id: <20210929200305.4245-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929200305.4245-1-digetx@gmail.com>
References: <20210929200305.4245-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Asus Transformer TF101 doesn't provide RAM code and in this case memory
timings should be selected based on identity information read out from
SDRAM chip. Support matching timings by LPDDR configuration.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 209 +++++++++++++++++++++++++++--
 1 file changed, 196 insertions(+), 13 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index c3462dbc8c22..8384707f021c 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -5,6 +5,7 @@
  * Author: Dmitry Osipenko <digetx@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
@@ -32,6 +33,7 @@
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
 #define EMC_DBG					0x008
+#define EMC_ADR_CFG_0				0x010
 #define EMC_TIMING_CONTROL			0x028
 #define EMC_RC					0x02c
 #define EMC_RFC					0x030
@@ -68,6 +70,7 @@
 #define EMC_QUSE_EXTRA				0x0ac
 #define EMC_ODT_WRITE				0x0b0
 #define EMC_ODT_READ				0x0b4
+#define EMC_MRR					0x0ec
 #define EMC_FBIO_CFG5				0x104
 #define EMC_FBIO_CFG6				0x114
 #define EMC_STAT_CONTROL			0x160
@@ -94,6 +97,7 @@
 
 #define EMC_REFRESH_OVERFLOW_INT		BIT(3)
 #define EMC_CLKCHANGE_COMPLETE_INT		BIT(4)
+#define EMC_MRR_DIVLD_INT			BIT(5)
 
 #define EMC_DBG_READ_MUX_ASSEMBLY		BIT(0)
 #define EMC_DBG_WRITE_MUX_ACTIVE		BIT(1)
@@ -102,11 +106,25 @@
 #define EMC_DBG_CFG_PRIORITY			BIT(24)
 
 #define EMC_FBIO_CFG5_DRAM_WIDTH_X16		BIT(4)
+#define EMC_FBIO_CFG5_DRAM_TYPE			GENMASK(1, 0)
+
+#define EMC_MRR_DEV_SELECTN			GENMASK(31, 30)
+#define EMC_MRR_MRR_MA				GENMASK(23, 16)
+#define EMC_MRR_MRR_DATA			GENMASK(15, 0)
+
+#define EMC_ADR_CFG_0_EMEM_NUMDEV		GENMASK(25, 24)
 
 #define EMC_PWR_GATHER_CLEAR			(1 << 8)
 #define EMC_PWR_GATHER_DISABLE			(2 << 8)
 #define EMC_PWR_GATHER_ENABLE			(3 << 8)
 
+enum emc_dram_type {
+	DRAM_TYPE_RESERVED,
+	DRAM_TYPE_DDR1,
+	DRAM_TYPE_LPDDR2,
+	DRAM_TYPE_DDR2,
+};
+
 static const u16 emc_timing_registers[] = {
 	EMC_RC,
 	EMC_RFC,
@@ -173,6 +191,16 @@ struct emc_rate_request {
 	unsigned long max_rate;
 };
 
+union lpddr_basic_config4 {
+	u32 value;
+
+	struct {
+		unsigned int prefetch_type : 2;
+		unsigned int density : 4;
+		unsigned int width : 2;
+	} __packed;
+};
+
 struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
@@ -201,6 +229,12 @@ struct tegra_emc {
 	struct mutex rate_lock;
 
 	struct devfreq_simple_ondemand_data ondemand_data;
+
+	/* memory chip identity information */
+	union lpddr_basic_config4 basic_conf4;
+	unsigned int manufacturer_id;
+	unsigned int revision_id1;
+	unsigned int revision_id2;
 };
 
 static irqreturn_t tegra_emc_isr(int irq, void *data)
@@ -422,8 +456,9 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 }
 
 static struct device_node *
-tegra_emc_find_node_by_ram_code(struct device *dev)
+tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
 {
+	struct device *dev = emc->dev;
 	struct device_node *np;
 	u32 value, ram_code;
 	int err;
@@ -442,8 +477,56 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 	     np = of_find_node_by_name(np, "emc-tables")) {
 		err = of_property_read_u32(np, "nvidia,ram-code", &value);
 		if (err || value != ram_code) {
-			of_node_put(np);
-			continue;
+			unsigned int mr_mismatches = 0;
+			bool mr_compared = false;
+
+			mr_mismatches += of_property_read_bool(np, "jedec,lpddr-manufacturer-id");
+			mr_mismatches += of_property_read_bool(np, "jedec,lpddr-revision-id1");
+			mr_mismatches += of_property_read_bool(np, "jedec,lpddr-revision-id2");
+			mr_mismatches += of_property_read_bool(np, "jedec,lpddr-density-mbits");
+			mr_mismatches += of_property_read_bool(np, "jedec,lpddr-io-width-bits");
+			mr_mismatches += of_property_read_bool(np, "jedec,lpddr-type");
+
+			if (!of_property_read_u32(np, "jedec,lpddr-manufacturer-id", &value) &&
+			    emc->manufacturer_id == value) {
+				mr_compared = true;
+				mr_mismatches--;
+			}
+
+			if (!of_property_read_u32(np, "jedec,lpddr-revision-id1", &value) &&
+			    emc->revision_id1 == value) {
+				mr_compared = true;
+				mr_mismatches--;
+			}
+
+			if (!of_property_read_u32(np, "jedec,lpddr-revision-id2", &value) &&
+			    emc->revision_id2 == value) {
+				mr_compared = true;
+				mr_mismatches--;
+			}
+
+			if (!of_property_read_u32(np, "jedec,lpddr-density-mbits", &value) &&
+			    64 << emc->basic_conf4.density == value) {
+				mr_compared = true;
+				mr_mismatches--;
+			}
+
+			if (!of_property_read_u32(np, "jedec,lpddr-io-width-bits", &value) &&
+			    32 >> emc->basic_conf4.width == value) {
+				mr_compared = true;
+				mr_mismatches--;
+			}
+
+			if (!of_property_read_u32(np, "jedec,lpddr-type", &value) &&
+			    4 >> emc->basic_conf4.prefetch_type == value) {
+				mr_compared = true;
+				mr_mismatches--;
+			}
+
+			if (!mr_compared || mr_mismatches) {
+				of_node_put(np);
+				continue;
+			}
 		}
 
 		return np;
@@ -455,10 +538,81 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 	return NULL;
 }
 
+static int emc_read_lpddr_mode_register(struct tegra_emc *emc,
+					unsigned int emem_dev,
+					unsigned int register_addr,
+					unsigned int *register_data)
+{
+	u32 memory_dev = emem_dev + 1, val;
+	int err;
+
+	/* clear data-valid interrupt status */
+	writel_relaxed(EMC_MRR_DIVLD_INT, emc->regs + EMC_INTSTATUS);
+
+	/* issue mode register read request */
+	val  = FIELD_PREP(EMC_MRR_DEV_SELECTN, memory_dev);
+	val |= FIELD_PREP(EMC_MRR_MRR_MA, register_addr);
+
+	writel_relaxed(val, emc->regs + EMC_MRR);
+
+	/* wait for the LPDDR2 data-valid interrupt */
+	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_INTSTATUS, val,
+						val & EMC_MRR_DIVLD_INT,
+						1, 100);
+	if (err) {
+		dev_err(emc->dev, "mode-register %u read failed: %d\n",
+			register_addr, err);
+		return err;
+	}
+
+	/* read out register data */
+	val = readl_relaxed(emc->regs + EMC_MRR);
+	*register_data = FIELD_GET(EMC_MRR_MRR_DATA, val);
+
+	return 0;
+}
+
+static void emc_read_lpddr_sdram_info(struct tegra_emc *emc,
+				      unsigned int emem_dev,
+				      bool print_out)
+{
+	const char *emem_vendor_name = "";
+
+	/* these registers are standard for all LPDDR JEDEC memory chips */
+	emc_read_lpddr_mode_register(emc, emem_dev, 5, &emc->manufacturer_id);
+	emc_read_lpddr_mode_register(emc, emem_dev, 6, &emc->revision_id1);
+	emc_read_lpddr_mode_register(emc, emem_dev, 7, &emc->revision_id2);
+	emc_read_lpddr_mode_register(emc, emem_dev, 8, &emc->basic_conf4.value);
+
+	if (!print_out)
+		return;
+
+	switch (emc->manufacturer_id) {
+	case 0x303:
+		emem_vendor_name = " (Elpida)";
+		break;
+
+	case 0x606:
+		emem_vendor_name = " (Hynix)";
+		break;
+	}
+
+	dev_info(emc->dev, "SDRAM[dev%u]: manufacturer: 0x%x%s rev1: 0x%x rev2: 0x%x prefetch: S%u density: %uMbit iowidth: %ubit\n",
+		 emem_dev, emc->manufacturer_id, emem_vendor_name,
+		 emc->revision_id1, emc->revision_id2,
+		 4 >> emc->basic_conf4.prefetch_type,
+		 64 << emc->basic_conf4.density,
+		 32 >> emc->basic_conf4.width);
+}
+
 static int emc_setup_hw(struct tegra_emc *emc)
 {
+	u32 emc_cfg, emc_dbg, emc_fbio, emc_adr_cfg;
 	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
-	u32 emc_cfg, emc_dbg, emc_fbio;
+	static bool print_sdram_info_once;
+	enum emc_dram_type dram_type;
+	const char *dram_type_str;
+	unsigned int emem_numdev;
 
 	emc_cfg = readl_relaxed(emc->regs + EMC_CFG_2);
 
@@ -496,7 +650,36 @@ static int emc_setup_hw(struct tegra_emc *emc)
 	else
 		emc->dram_bus_width = 32;
 
-	dev_info_once(emc->dev, "%ubit DRAM bus\n", emc->dram_bus_width);
+	dram_type = FIELD_GET(EMC_FBIO_CFG5_DRAM_TYPE, emc_fbio);
+
+	switch (dram_type) {
+	case DRAM_TYPE_RESERVED:
+		dram_type_str = "INVALID";
+		break;
+	case DRAM_TYPE_DDR1:
+		dram_type_str = "DDR1";
+		break;
+	case DRAM_TYPE_LPDDR2:
+		dram_type_str = "LPDDR2";
+		break;
+	case DRAM_TYPE_DDR2:
+		dram_type_str = "DDR2";
+		break;
+	}
+
+	emc_adr_cfg = readl_relaxed(emc->regs + EMC_ADR_CFG_0);
+	emem_numdev = FIELD_GET(EMC_ADR_CFG_0_EMEM_NUMDEV, emc_adr_cfg) + 1;
+
+	dev_info_once(emc->dev, "%ubit DRAM bus, %u %s %s attached\n",
+		      emc->dram_bus_width, emem_numdev, dram_type_str,
+		      emem_numdev == 2 ? "devices" : "device");
+
+	if (dram_type == DRAM_TYPE_LPDDR2) {
+		while (emem_numdev--)
+			emc_read_lpddr_sdram_info(emc, emem_numdev,
+						  !print_sdram_info_once);
+		print_sdram_info_once = true;
+	}
 
 	return 0;
 }
@@ -1049,14 +1232,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	emc->clk_nb.notifier_call = tegra_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
-	np = tegra_emc_find_node_by_ram_code(&pdev->dev);
-	if (np) {
-		err = tegra_emc_load_timings_from_dt(emc, np);
-		of_node_put(np);
-		if (err)
-			return err;
-	}
-
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
@@ -1065,6 +1240,14 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	np = tegra_emc_find_node_by_ram_code(emc);
+	if (np) {
+		err = tegra_emc_load_timings_from_dt(emc, np);
+		of_node_put(np);
+		if (err)
+			return err;
+	}
+
 	err = devm_request_irq(&pdev->dev, irq, tegra_emc_isr, 0,
 			       dev_name(&pdev->dev), emc);
 	if (err) {
-- 
2.32.0

