Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E783233ED
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466811; cv=fail; b=C/oCSern6jETgr0XaIGk34WFZ+RdZuFL6A9l6Aa8K2jAIhtSiJzF3MVaDN6LL/+y5e0aEmvUywm++NZr2TnZj3wDRfZWo69AbtalXlNM2solHliNS4cNBYdfb1N+XtZggDx3lZrZBHcydREQQrKmRbj9jonnvh1DYM+oGg/JDVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466811; c=relaxed/simple;
	bh=DV9u/EkdU++CZ1GDHGJ+jbqHsNKBkZF4MIBz768qSa4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDwLhAhJErhLi0uvm8MrW1q3BXwb/0w1Vz6PP7PwoeL8xoTgAvciD5SIG8nEI1Lp62vpTASnWbCAB0YitMu2Muhl48rj3PR0eA5HgNWtyf8B1XDlKNNc/9Y85yYRG6rwui54YasXK9MsXm512SgHQE7pDL3GUsve1yR8KIVid7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PZIz7pVG; arc=fail smtp.client-ip=52.101.85.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PZIz7pVG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMgypcK91YHOtHYas33frs0myvILdnDvsKNJgcU+xYur88StL6nkMh45xu69WFgYkqywS4puSQAnSsfOh6RrolfeNemIZ2rwEYhTvfu8bx/v+XxEuCqGX21g1EBmz5goLEtXb9+lX3GxbQsd6MqoLzwNMmN9mqmerRnDnpomVK2WuYJZhU6TNSKiLTT/CWDJfgadby4DtE4xFPfJ8aDb8+LY5L/h2arZJLxyoy8lhp7nCZc3JBrNpJwYCTr0gl9+2+I2+eoYWPLgzeIodr+UQp/+cnpQ7UhRoqqFQ+8F6G+eM6c6yu0+CFy2PmqLDT12mlHGgLREXOYnpFBfBjvSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjQrMCOswGp5N9TLLYn3ziSJz9NNR6AortYe/43PUZ8=;
 b=yoZo5f0BYy7/5AykioZFZL6vSY5kw1gt6NwWdQtm52jeNwTMnlKV0VHJp/V/iFfCMZ+we/FlZ3edrWyESrCwxccvDfJLaStMkWwBG88BMdFXzZgk6N/cf0FB4xhpA6Nm2j58+M2LDeCJqaPwNy37wRXqoOi9Ls1lFswevMKKnpsJTKJDZNZfmRnfFBcuHUy9va3L59dP97lAlIkxR1BKWtSj2ipNC7YgbmAcaL5/vTOxnUlrxEUy14wRL4XSiN4wW5ETDSMKVQ5mvGwkqkNVMtw02+puAntHqTGTZxniGXyez27K4saM8h1zn4NRBYK4lA+c2XP6Uo7qI7JzflKNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjQrMCOswGp5N9TLLYn3ziSJz9NNR6AortYe/43PUZ8=;
 b=PZIz7pVG7O+vQHynHkzI7E+6iRCsmWYnEYRmNX1icdWvfcBBgKs8H7OAi5NjxvRynayORMovyn8Pi+QZNGMbgLUI6TxvgfMxb9X5eUv2tsC1RQKv43fq6IlY4Use/ulY0pu/KsJg+hzy4guHaPmi96gTZYyMdJSEmT1wT9/gNnYpFUfH0HN+qeaNgi8wIeJmKm/p8ROSZstYX0tZAO0ljNws26nxM4/HinxSNlUQ3qdoRCyBakq0R2PPFh/nNKVmJL9ZB63HWIDYL9SoFsRETXEbgYgPjiiMsVNmoxmIfIsXlpjEB7MC9prSaHCdQKPW81WPlltuY+TSqz9i08EYhw==
Received: from BLAPR03CA0045.namprd03.prod.outlook.com (2603:10b6:208:32d::20)
 by LV8PR12MB9082.namprd12.prod.outlook.com (2603:10b6:408:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:46 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::29) by BLAPR03CA0045.outlook.office365.com
 (2603:10b6:208:32d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 19:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:45 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:28 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:28 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:27 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 05/10] soc/tegra: pmc: Add support for SoC specific AOWAKE offsets
Date: Wed, 25 Mar 2026 19:25:55 +0000
Message-ID: <20260325192601.239554-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|LV8PR12MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: 113ecf96-3e98-4203-e0f3-08de8aa4741a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uqqFGS98RDWkrNaWQbVesS+xZiT6oeHZbFLva4flCHIeR4XObHs8JR3aL+uLa78VqcQe1gzSQSL37Af2/659akre4LlQwb/qsZSAhVmy4QPk0LVLe2zcYbt8pPMI+nFFoI0DiWLCfq9Z2XRb9yhxNoJvT4oxDhj/V+AxlkgqY2qYiVDlmFl+NaVZT9gOxxXm7OmcfaFc5MCVxp1pImUO1/CRFR7HSRXKsRb8vODF8tdhHn6LUYP5eeM+aqHQResSu3izyTnSioIta6+uwVjhejkPr1EfBP+Em6AoYY62DLVLnYsmjRg5D5HK/jkkP0GAk1G5Z0LFw/6YFCx4+njDJElSwJxlQ7RpC4NvodkEnPikYfxUX6pFZmXHlX0L6MTMWf77zddST16jKK1bvQA3xXaF6UZa2jnXpuwrkeiTBD1fW7bvZp2b4TbvIuUsaqVsycAgP+3VIJLz11U+iQLQFHoGvOMJ5mNANaTM3qhaMHH5wNaxlhh4bOA1LBoGio+IEOoQFoMeq8KwbZ7qIFyWUpvKypUoPDIw8YTnXuGm/qF6TCamJcY41OA3feGlQ5nsPOp1mkHmT/moShunx6K4UIEKFSZKLwcAgT6J4Q/OCE5rj8Y3a4UeEWgNleq7sQ05x1j8nzkFcFz4Nc1ReJXvQQ0QizVGDbA2Kh0nRsQAnki/5RiSOZbeLgH4Rw/eIjHmi/Aw1rOYIMjDXRljQWqeZ4Yak1II0SIoJJNr/VN9/E3kuaPp5/QYfZoWPHaADcBXTwSEV/a+4jQqLgPwrT0QXA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kk6Oa43d/oM+mPRrfYEshjYy8UcbiBNTetp/Rd+0Is+Rm0cwHfGZ95SDsKY6eNs3/Ck4Ow/coCbnml3NesswN6gPzrArGBboYwPqfVhLd8ppH8Ll9yHuM5JxNAH3Pfu/9VhCFEArUmq6w1xNivc+LJwNXxmcmLY89H6Zs5iqF1w841ltGzOlMPPK8A4TjeROliw7CQT6zI3nMGr5UjKBVotm1K3yBjLs9jwj0LriBvR+fS/AqyhSJJkaEwmjjjewsXrbxhed0vx+m5fmDmt9ZwkgK1DLQZDqWAWB1TjNhF15rc+McOXg38PTjdKbEt4KhjSCXMDxpKG1m6YxuQUbDRDCl2STUdCZlqZBpZ+Tqo5AQ80AuBeyI2TYm8pqObchNr5JJT5c9Ty3A5UQx1OIs2iw1eZ8SkTUR3ytH0qhJ+MuFK11hnaNvS5iRK3L9BO7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:45.8454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113ecf96-3e98-4203-e0f3-08de8aa4741a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9082

For Tegra264, some of the AOWAKE registers have different register
offsets. Prepare for adding the Tegra264 AOWAKE register by moving the
offsets for the AOWAKE registers that are different for Tegra264 into
the 'tegra_pmc_regs' structure and populate these offsets for the SoCs
that support these registers.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 86 +++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 55c1117b1741..42176abb96ea 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -180,16 +180,18 @@
 #define WAKE_AOWAKE_CNTRL(x) (0x000 + ((x) << 2))
 #define WAKE_AOWAKE_CNTRL_LEVEL (1 << 3)
 #define WAKE_AOWAKE_CNTRL_SR_CAPTURE_EN (1 << 1)
-#define WAKE_AOWAKE_MASK_W(x) (0x180 + ((x) << 2))
-#define WAKE_AOWAKE_STATUS_W(x) (0x30c + ((x) << 2))
-#define WAKE_AOWAKE_STATUS_R(x) (0x48c + ((x) << 2))
-#define WAKE_AOWAKE_TIER2_ROUTING(x) (0x4cc + ((x) << 2))
-#define WAKE_AOWAKE_SW_STATUS_W_0	0x49c
-#define WAKE_AOWAKE_SW_STATUS(x)	(0x4a0 + ((x) << 2))
-#define WAKE_LATCH_SW			0x498
-
-#define WAKE_AOWAKE_CTRL 0x4f4
-#define  WAKE_AOWAKE_CTRL_INTR_POLARITY BIT(0)
+#define WAKE_AOWAKE_MASK_W(_pmc, x) \
+	((_pmc)->soc->regs->aowake_mask_w + ((x) << 2))
+#define WAKE_AOWAKE_STATUS_W(_pmc, x) \
+	((_pmc)->soc->regs->aowake_status_w + ((x) << 2))
+#define WAKE_AOWAKE_STATUS_R(_pmc, x) \
+	((_pmc)->soc->regs->aowake_status_r + ((x) << 2))
+#define WAKE_AOWAKE_TIER2_ROUTING(_pmc, x) \
+	((_pmc)->soc->regs->aowake_tier2_routing + ((x) << 2))
+#define WAKE_AOWAKE_SW_STATUS(_pmc, x) \
+	((_pmc)->soc->regs->aowake_sw_status + ((x) << 2))
+
+#define WAKE_AOWAKE_CTRL_INTR_POLARITY BIT(0)
 
 #define SW_WAKE_ID		83 /* wake83 */
 
@@ -302,6 +304,14 @@ struct tegra_pmc_regs {
 	unsigned int rst_source_mask;
 	unsigned int rst_level_shift;
 	unsigned int rst_level_mask;
+	unsigned int aowake_mask_w;
+	unsigned int aowake_status_w;
+	unsigned int aowake_status_r;
+	unsigned int aowake_tier2_routing;
+	unsigned int aowake_sw_status_w;
+	unsigned int aowake_sw_status;
+	unsigned int aowake_latch_sw;
+	unsigned int aowake_ctrl;
 };
 
 struct tegra_wake_event {
@@ -2629,20 +2639,20 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	bit = data->hwirq % 32;
 
 	/* clear wake status */
-	writel(0x1, pmc->wake + WAKE_AOWAKE_STATUS_W(data->hwirq));
+	writel(0x1, pmc->wake + WAKE_AOWAKE_STATUS_W(pmc, data->hwirq));
 
 	/* route wake to tier 2 */
-	value = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(offset));
+	value = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(pmc, offset));
 
 	if (!on)
 		value &= ~(1 << bit);
 	else
 		value |= 1 << bit;
 
-	writel(value, pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(offset));
+	writel(value, pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(pmc, offset));
 
 	/* enable wakeup event */
-	writel(!!on, pmc->wake + WAKE_AOWAKE_MASK_W(data->hwirq));
+	writel(!!on, pmc->wake + WAKE_AOWAKE_MASK_W(pmc, data->hwirq));
 
 	return 0;
 }
@@ -3309,7 +3319,7 @@ static void wke_write_wake_levels(struct tegra_pmc *pmc)
 
 static void wke_clear_sw_wake_status(struct tegra_pmc *pmc)
 {
-	wke_32kwritel(pmc, 1, WAKE_AOWAKE_SW_STATUS_W_0);
+	wke_32kwritel(pmc, 1, pmc->soc->regs->aowake_sw_status_w);
 }
 
 static void wke_read_sw_wake_status(struct tegra_pmc *pmc)
@@ -3322,7 +3332,7 @@ static void wke_read_sw_wake_status(struct tegra_pmc *pmc)
 
 	wke_clear_sw_wake_status(pmc);
 
-	wke_32kwritel(pmc, 1, WAKE_LATCH_SW);
+	wke_32kwritel(pmc, 1, pmc->soc->regs->aowake_latch_sw);
 
 	/*
 	 * WAKE_AOWAKE_SW_STATUS is edge triggered, so in order to
@@ -3340,12 +3350,12 @@ static void wke_read_sw_wake_status(struct tegra_pmc *pmc)
 	 */
 	udelay(300);
 
-	wke_32kwritel(pmc, 0, WAKE_LATCH_SW);
+	wke_32kwritel(pmc, 0, pmc->soc->regs->aowake_latch_sw);
 
 	bitmap_zero(pmc->wake_sw_status_map, pmc->soc->max_wake_events);
 
 	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
-		status = readl(pmc->wake + WAKE_AOWAKE_SW_STATUS(i));
+		status = readl(pmc->wake + WAKE_AOWAKE_SW_STATUS(pmc, i));
 
 		for_each_set_bit(wake, &status, 32)
 			set_bit(wake + (i * 32), pmc->wake_sw_status_map);
@@ -3359,11 +3369,12 @@ static void wke_clear_wake_status(struct tegra_pmc *pmc)
 	u32 mask;
 
 	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
-		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(i));
-		status = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(i)) & mask;
+		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(pmc, i));
+		status = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(pmc, i)) & mask;
 
 		for_each_set_bit(wake, &status, 32)
-			wke_32kwritel(pmc, 0x1, WAKE_AOWAKE_STATUS_W((i * 32) + wake));
+			wke_32kwritel(pmc, 0x1, WAKE_AOWAKE_STATUS_W(pmc,
+							(i * 32) + wake));
 	}
 }
 
@@ -3374,8 +3385,9 @@ static void tegra186_pmc_wake_syscore_resume(void *data)
 	u32 mask;
 
 	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
-		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(i));
-		pmc->wake_status[i] = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(i)) & mask;
+		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(pmc, i));
+		pmc->wake_status[i] = readl(pmc->wake +
+					    WAKE_AOWAKE_STATUS_R(pmc, i)) & mask;
 	}
 
 	/* Schedule IRQ work to process wake IRQs (if any) */
@@ -4062,6 +4074,14 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
 	.rst_source_mask = 0x3c,
 	.rst_level_shift = 0x0,
 	.rst_level_mask = 0x3,
+	.aowake_mask_w = 0x180,
+	.aowake_status_w = 0x30c,
+	.aowake_status_r = 0x48c,
+	.aowake_tier2_routing = 0x4cc,
+	.aowake_sw_status_w = 0x49c,
+	.aowake_sw_status = 0x4a0,
+	.aowake_latch_sw = 0x498,
+	.aowake_ctrl = 0x4f4,
 };
 
 static void tegra186_pmc_init(struct tegra_pmc *pmc)
@@ -4094,14 +4114,14 @@ static void tegra186_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 		return;
 	}
 
-	value = readl(wake + WAKE_AOWAKE_CTRL);
+	value = readl(wake + pmc->soc->regs->aowake_ctrl);
 
 	if (invert)
 		value |= WAKE_AOWAKE_CTRL_INTR_POLARITY;
 	else
 		value &= ~WAKE_AOWAKE_CTRL_INTR_POLARITY;
 
-	writel(value, wake + WAKE_AOWAKE_CTRL);
+	writel(value, wake + pmc->soc->regs->aowake_ctrl);
 
 	iounmap(wake);
 }
@@ -4281,6 +4301,14 @@ static const struct tegra_pmc_regs tegra194_pmc_regs = {
 	.rst_source_mask = 0x7c,
 	.rst_level_shift = 0x0,
 	.rst_level_mask = 0x3,
+	.aowake_mask_w = 0x180,
+	.aowake_status_w = 0x30c,
+	.aowake_status_r = 0x48c,
+	.aowake_tier2_routing = 0x4cc,
+	.aowake_sw_status_w = 0x49c,
+	.aowake_sw_status = 0x4a0,
+	.aowake_latch_sw = 0x498,
+	.aowake_ctrl = 0x4f4,
 };
 
 static const char * const tegra194_reset_sources[] = {
@@ -4400,6 +4428,14 @@ static const struct tegra_pmc_regs tegra234_pmc_regs = {
 	.rst_source_mask = 0xfc,
 	.rst_level_shift = 0x0,
 	.rst_level_mask = 0x3,
+	.aowake_mask_w = 0x180,
+	.aowake_status_w = 0x30c,
+	.aowake_status_r = 0x48c,
+	.aowake_tier2_routing = 0x4cc,
+	.aowake_sw_status_w = 0x49c,
+	.aowake_sw_status = 0x4a0,
+	.aowake_latch_sw = 0x498,
+	.aowake_ctrl = 0x4f4,
 };
 
 static const char * const tegra234_reset_sources[] = {
-- 
2.43.0

