Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BD4C43217
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E74E611C3
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236941AbhJEXEB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 19:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236970AbhJEXDE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 19:03:04 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406C4C061749;
        Tue,  5 Oct 2021 16:01:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i24so2203420lfj.13;
        Tue, 05 Oct 2021 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wutDD2lE1c9tdavCZUxMDse3d2oFG2g7M0e7JKOr2FM=;
        b=fvVC86lAz1EnJck2tSMBQvmHn52iOIOyJ98rYaFxnj6L1Pxm1FgXU4MaIvjvDygqkF
         w6t1UZ6ruY+UrpqE7bjzIWy34838XHWZTY7jOWr6JFsb7IRBfk8N/siEjmIhW7p1DQJe
         zsdrqvgP793JK4KpV7ELvy4/rjyGPIPMcW2Ai96ZxariI0LUQNlN9BKGcuWeokKD8RR/
         knzNhYJ2my1F/pAY75ob3SiWnJrkae0mY/YOYAk07liM23AQ5MQwjNTxHDxeukmaA7se
         8fyhJKeo9nQB6qS+ahKLmD3MlHqO5yz0QT2yvUtvvyhkjRdjmiPHoSPzgooHrtnZJzf4
         WuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wutDD2lE1c9tdavCZUxMDse3d2oFG2g7M0e7JKOr2FM=;
        b=HW7H0E5nAt3/SzL3vpYmqa7ahqKTshjk+iXW7CMB0kgan05h4lJbsV31+IH35moQlt
         R5Pmfk8T2vEVOmp3UCHIiH9o0mq79fSKVh1lQCtJtlEufjvnXIG/Xd6F1I1qxltiTnck
         wYBAnn/gBUHGvfE9EpmY9WtBzKmWOPGCMEDZ4NPeh/mKzviOCFUCTatH/Kg2ZSasGLT5
         gdOP7IW9zMBRnVhx8ZERYV4i/A2CLEtINtM3n8TLRCNS/Ew8Pi5o2Eq8IU2FDTGXaiPK
         hOCGGC2APeIdwMEUYVbt9Z2dqtecmMjMw0x9rts8yla06UmOUlV09l6KT94vKiV1ZucY
         ISgg==
X-Gm-Message-State: AOAM533xXSeLH7uVjghOkgiAMbXCkdNU6/ROYxM0qXWYZLErXHcoxaw9
        uV98cnhR52dJoYp8mJawW4IgCnPuL8M=
X-Google-Smtp-Source: ABdhPJyVMfuzWMkPVeWjTN04Z/0GK+aP7qFi9EEQbuX1zRz+cE33hr3/5FQ4bh/abOzK3HZcivf9vg==
X-Received: by 2002:a2e:979a:: with SMTP id y26mr25335326lji.107.1633474871556;
        Tue, 05 Oct 2021 16:01:11 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id j18sm2101125lfu.84.2021.10.05.16.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:01:11 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 7/7] memory: tegra20-emc: Support matching timings by LPDDR2 configuration
Date:   Wed,  6 Oct 2021 02:00:09 +0300
Message-Id: <20211005230009.3635-8-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211005230009.3635-1-digetx@gmail.com>
References: <20211005230009.3635-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

ASUS Transformer TF101 doesn't provide RAM code and in this case memory
timings should be selected based on identity information read out from
SDRAM chip. Support matching timings by LPDDR2 configuration.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |   1 +
 drivers/memory/tegra/tegra20-emc.c | 199 +++++++++++++++++++++++++++--
 2 files changed, 186 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index f9bae36c03a3..7951764b4efe 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -16,6 +16,7 @@ config TEGRA20_EMC
 	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select PM_DEVFREQ
+	select DDR
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra20 chips. The EMC controls the external DRAM on the board.
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index c3462dbc8c22..77c5cd52d1a2 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -5,6 +5,7 @@
  * Author: Dmitry Osipenko <digetx@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
 #include <linux/debugfs.h>
@@ -27,11 +28,15 @@
 #include <soc/tegra/common.h>
 #include <soc/tegra/fuse.h>
 
+#include "../jedec_ddr.h"
+#include "../of_memory.h"
+
 #include "mc.h"
 
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
 #define EMC_DBG					0x008
+#define EMC_ADR_CFG_0				0x010
 #define EMC_TIMING_CONTROL			0x028
 #define EMC_RC					0x02c
 #define EMC_RFC					0x030
@@ -68,6 +73,7 @@
 #define EMC_QUSE_EXTRA				0x0ac
 #define EMC_ODT_WRITE				0x0b0
 #define EMC_ODT_READ				0x0b4
+#define EMC_MRR					0x0ec
 #define EMC_FBIO_CFG5				0x104
 #define EMC_FBIO_CFG6				0x114
 #define EMC_STAT_CONTROL			0x160
@@ -94,6 +100,7 @@
 
 #define EMC_REFRESH_OVERFLOW_INT		BIT(3)
 #define EMC_CLKCHANGE_COMPLETE_INT		BIT(4)
+#define EMC_MRR_DIVLD_INT			BIT(5)
 
 #define EMC_DBG_READ_MUX_ASSEMBLY		BIT(0)
 #define EMC_DBG_WRITE_MUX_ACTIVE		BIT(1)
@@ -102,11 +109,25 @@
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
@@ -201,6 +222,14 @@ struct tegra_emc {
 	struct mutex rate_lock;
 
 	struct devfreq_simple_ondemand_data ondemand_data;
+
+	/* memory chip identity information */
+	union lpddr2_basic_config4 basic_conf4;
+	unsigned int manufacturer_id;
+	unsigned int revision_id1;
+	unsigned int revision_id2;
+
+	bool mrr_error;
 };
 
 static irqreturn_t tegra_emc_isr(int irq, void *data)
@@ -397,15 +426,19 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 	if (!emc->timings)
 		return -ENOMEM;
 
-	emc->num_timings = child_count;
 	timing = emc->timings;
 
 	for_each_child_of_node(node, child) {
+		if (of_node_name_eq(child, "lpddr2"))
+			continue;
+
 		err = load_one_timing_from_dt(emc, timing++, child);
 		if (err) {
 			of_node_put(child);
 			return err;
 		}
+
+		emc->num_timings++;
 	}
 
 	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,
@@ -422,12 +455,18 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 }
 
 static struct device_node *
-tegra_emc_find_node_by_ram_code(struct device *dev)
+tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
 {
+	struct device *dev = emc->dev;
 	struct device_node *np;
 	u32 value, ram_code;
 	int err;
 
+	if (emc->mrr_error) {
+		dev_warn(dev, "memory timings skipped due to MRR error\n");
+		return NULL;
+	}
+
 	if (of_get_child_count(dev->of_node) == 0) {
 		dev_info_once(dev, "device-tree doesn't have memory timings\n");
 		return NULL;
@@ -442,8 +481,49 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 	     np = of_find_node_by_name(np, "emc-tables")) {
 		err = of_property_read_u32(np, "nvidia,ram-code", &value);
 		if (err || value != ram_code) {
-			of_node_put(np);
-			continue;
+			struct device_node *lpddr2_np;
+			bool cfg_mismatches = false;
+
+			lpddr2_np = of_find_node_by_name(np, "lpddr2");
+			if (lpddr2_np) {
+				const struct lpddr2_info *info;
+
+				info = of_lpddr2_get_info(lpddr2_np, dev);
+				if (info) {
+					if (info->manufacturer_id >= 0 &&
+					    info->manufacturer_id != emc->manufacturer_id)
+						cfg_mismatches = true;
+
+					if (info->revision_id1 >= 0 &&
+					    info->revision_id1 != emc->revision_id1)
+						cfg_mismatches = true;
+
+					if (info->revision_id2 >= 0 &&
+					    info->revision_id2 != emc->revision_id2)
+						cfg_mismatches = true;
+
+					if (info->density != emc->basic_conf4.density)
+						cfg_mismatches = true;
+
+					if (info->io_width != emc->basic_conf4.io_width)
+						cfg_mismatches = true;
+
+					if (info->arch_type != emc->basic_conf4.arch_type)
+						cfg_mismatches = true;
+				} else {
+					dev_err(dev, "failed to parse %pOF\n", lpddr2_np);
+					cfg_mismatches = true;
+				}
+
+				of_node_put(lpddr2_np);
+			} else {
+				cfg_mismatches = true;
+			}
+
+			if (cfg_mismatches) {
+				of_node_put(np);
+				continue;
+			}
 		}
 
 		return np;
@@ -455,10 +535,72 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 	return NULL;
 }
 
+static int emc_read_lpddr_mode_register(struct tegra_emc *emc,
+					unsigned int emem_dev,
+					unsigned int register_addr,
+					unsigned int *register_data)
+{
+	u32 memory_dev = emem_dev + 1;
+	u32 val, mr_mask = 0xff;
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
+		dev_err(emc->dev, "mode register %u read failed: %d\n",
+			register_addr, err);
+		emc->mrr_error = true;
+		return err;
+	}
+
+	/* read out mode register data */
+	val = readl_relaxed(emc->regs + EMC_MRR);
+	*register_data = FIELD_GET(EMC_MRR_MRR_DATA, val) & mr_mask;
+
+	return 0;
+}
+
+static void emc_read_lpddr_sdram_info(struct tegra_emc *emc,
+				      unsigned int emem_dev,
+				      bool print_out)
+{
+	/* these registers are standard for all LPDDR JEDEC memory chips */
+	emc_read_lpddr_mode_register(emc, emem_dev, 5, &emc->manufacturer_id);
+	emc_read_lpddr_mode_register(emc, emem_dev, 6, &emc->revision_id1);
+	emc_read_lpddr_mode_register(emc, emem_dev, 7, &emc->revision_id2);
+	emc_read_lpddr_mode_register(emc, emem_dev, 8, &emc->basic_conf4.value);
+
+	if (!print_out)
+		return;
+
+	dev_info(emc->dev, "SDRAM[dev%u]: manufacturer: 0x%x (%s) rev1: 0x%x rev2: 0x%x prefetch: S%u density: %uMbit iowidth: %ubit\n",
+		 emem_dev, emc->manufacturer_id,
+		 lpddr2_jedec_manufacturer(emc->manufacturer_id),
+		 emc->revision_id1, emc->revision_id2,
+		 4 >> emc->basic_conf4.arch_type,
+		 64 << emc->basic_conf4.density,
+		 32 >> emc->basic_conf4.io_width);
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
 
@@ -496,7 +638,36 @@ static int emc_setup_hw(struct tegra_emc *emc)
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
@@ -1049,14 +1220,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
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
@@ -1065,6 +1228,14 @@ static int tegra_emc_probe(struct platform_device *pdev)
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

