Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD127276028;
	Mon, 24 Nov 2025 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005753; cv=fail; b=O+viPVOmFlNzeVLJ8ocYDzmrQ+3mcu4+IfW3LoHYO0fEn1+CQZBNLmJ24Pbi0Wg1p8+/XeNxC69t4tZhiBaIXahpFPi9ZUV053qI4lzEiEh0xqDt1wkQi5rde4Eq41yim+pqOXL1gpOTNv09y7XRHBRGJlliZpHU2fhAAkF3brY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005753; c=relaxed/simple;
	bh=e6L0vys8Z65pk2dSWssp6DQZzVq8wvHMqKm3Lv7OaI4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i5UY3XRPEApeq0tewmNM5OtAI9lVPDI7qV58OQsgxXoWJPb7QuFyuNOHoKWJD0CCO50lmEN32qKC2v7TvRlCMx+UqOZ+2N+Z6aqG1d6bdYbyMBf6sljWahsGjHQ0sqB+UXk1HoaPiRmyROFHWBn5+vBJRnAlOWE6dSgnzb4bQRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O4NMTHMs; arc=fail smtp.client-ip=52.101.46.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O4NMTHMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nlq+scOnzpgCJKILUr2OX60khQbdR4eOhe/hgZPYd8ez0nPGO6Opnrhu3Fre2yHlxZjwsHgy9inkfSRmtrPwkwlsayg1SclMw+3pddLG2wfHvMQgbZA6iuVqFc2T/gcl5XvBLdG/IPPZnJGvBdVfVOEM6TPuXTkhQwEpkK6eDYheau16PRjx1zht0yWIkyfEhq61k6b/SFU7/NkAiMO94ropYE8kBw+04Dz9aor4g5SaTClZTALstgkvDJSN+FqsARQez0iNnBEYK2KCzG7D623Q9eI6ot3XiRBRc1g0583TkYnKqoSZq2PEEoXTJ2n5IELmtyrgb33nVtVSGt0mHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuTnJrEI20Z13QmiMqvC3FqVYMifl+eeZZj1lnxbQ6o=;
 b=ad++smAN0hiZotsN08BusWrY0aohBw9jdPwlXyISMwM2w/OXYc+Q6gRjY5YOzuRZBD6ESrNF2Y6/ClqZpxD2toy/N5Jijz6QmR7k6tvP5iuhXepa5Cvc0nn7wbLrxfDFB5BGRxD00S0tl7H/QAmWrP3A20uPPaQo4+b4e/xeFIJ+59eQAoLdaERieJbbTR6ZxSeBsZL1sGwJ9zSeN+wGqtNR7bx+VjmBNN0NralvR4qfBO8vEzOqFzZZ0O+ECxh0N8cSMfbXg+DVS0uX9aqHDTZAMN/kickoUvuQQXIh8bsmhBCCD7wiXUHZsZ+bbuWu7jc7EwNqxuLTzaf49mf4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuTnJrEI20Z13QmiMqvC3FqVYMifl+eeZZj1lnxbQ6o=;
 b=O4NMTHMsO2lynmr71TMe9ML4GK8evMjcvSzCVZNWDQo1DOJgOUgimL35WokvU9XbUOl1piUvoijgthq4+TGN3vuORL0PzqFUXribpHXtIZHpgj9fXHjQm7BFRGwxciqK5dBrbNmmnEIQWuqJ+p5+wdTVwC21Pw7WNvRkIhArNnpw13ZsMnZIWl5RvGnswIxcHg4Vf1z4DYwIXL+BLGhuUjaTYpL8tg/iWsA0zAuhrQDW3tikF115v/lFrFuZBBNjF2597WjQfSoXDlLoLpQCDS8vqIrQPM2aRh97r58sJd3in1MGI9hx2AaCVrHPWRV5WTKz9LwiuvRgx3m15tXbzQ==
Received: from CH2PR04CA0021.namprd04.prod.outlook.com (2603:10b6:610:52::31)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:35:49 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::ee) by CH2PR04CA0021.outlook.office365.com
 (2603:10b6:610:52::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 17:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 17:35:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 09:35:23 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 09:35:23 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 24 Nov 2025 09:35:23 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v4 3/4] memory: tegra: Add support for multiple irqs
Date: Mon, 24 Nov 2025 17:35:09 +0000
Message-ID: <20251124173510.2602663-4-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251124173510.2602663-1-ketanp@nvidia.com>
References: <20251124173510.2602663-1-ketanp@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 950fae79-5c0a-4eb8-2052-08de2b7fe856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PI9rvPSWwXWjGSTZHt3jiiUQOFVV40aPZkcuABDrIY+e7cvDrMa6jvQcVfhd?=
 =?us-ascii?Q?Z1YjDfx8GEab/7/iCPL7TEJCo0Cr6n9vBqqoCKJnz1f3YWUj8ccve1S0G4Df?=
 =?us-ascii?Q?P1+YU4p10dMRpSHqhDwEctTkz4V5IS+hlvHQO1CD9lxr+Fv8GtGwhCzO9zRe?=
 =?us-ascii?Q?/IocwE/j1Sv9MtOE6XYHFFXx4mdGWwf1eovWUqzxBGs/tR3BT6y2e/lCBFEP?=
 =?us-ascii?Q?nHSxYQJZ90/ZbCQKazc5jZ0VE9B+FZrHSFpVHrdYs8H4jPq28i2Ep+A1I61Y?=
 =?us-ascii?Q?lBEI7RHfWb0ifHRGbnGIVN7/Ko3D3HS3iMFEhrZkfZVWYdb717jVgTyGE5LY?=
 =?us-ascii?Q?OqKZmUd4+Td+oBKnJF6pNpwuCqS1iezfySjJljklEMm1LpO/FD73SuE61gAw?=
 =?us-ascii?Q?0ZVDy5DC3UEqYTOENxJ2DH7eTlOgfALvhLOxWNLrHkQPule8nCdWuRpfSQuU?=
 =?us-ascii?Q?YzyRo3nCh2y65HeJZhdSh4UDx8ewZvzbctuQfc3U5n4YjCrNBhywVlo7Bw5+?=
 =?us-ascii?Q?dHcVg1AsgXOqa6Iv0dR01Qho63Gjld24d1RpKli1oaCHuDcugjHM90t6GBi4?=
 =?us-ascii?Q?aYrBDdUYYUwNKfRVSVgyiEadY8MoNONJMb5ryFr2ftLZeSmEyialxwOVc0L1?=
 =?us-ascii?Q?se7JsoCFzDs1tU1qhcr/sWvRwcy9nJ3wakTHSHtYHOrTlKRQzKLU6M9tNIYw?=
 =?us-ascii?Q?3jjlGpN1JmGhpSVH9/qfvaPQYqPEQ5mlVMJi0TB+wtl35XuHr/XFtuBtXJpD?=
 =?us-ascii?Q?atAemSfNUyMeQH3Kroj7qjqwFvbPTIccrca1SbfGlczQWmLHJ0lk+jH0OtqN?=
 =?us-ascii?Q?JPOpf2UWNveEqUGRlBSow61rcfUZ9U9uyC8WP0foasxZcPC+kCtT6knYooW5?=
 =?us-ascii?Q?G76tbB261J0c6Z/xQ59294dEmnWE5YM6UapvPLIqKx/SeHmPliRZyH8cf413?=
 =?us-ascii?Q?LxgY2OPfZwrsos8j1/2ArTNk5gHGD6CO1aVSdSccVLXZ9T3xv/3Ig/AoDBxR?=
 =?us-ascii?Q?AtNd2H7h96OIfNAlMISMaUtyg+kf6ALCigxSzoV+Bpbvgkgyv/tRetTuVpOH?=
 =?us-ascii?Q?zSAicFde0W/L6Hzg4hT12qkgyPX/FOfg0IK/u0Xy/9nT3cz0H/KPCDHoF19Y?=
 =?us-ascii?Q?25s8HZl/z+nTfDMrPg8wyN0YqszMx/o4/y72nqCntpeFUlJCh6n06XheEMUE?=
 =?us-ascii?Q?jc1BdnwEB0EZo0KF7xjZ87Wv5t30g9463hReZGm9a0+9iWW3VH0gTPfo8IkR?=
 =?us-ascii?Q?O6xdJ7msoF/Iok4IDHz9BaHjUaMJUMO2H0+AikBy5q0NAmYzJn4I1CkUofXb?=
 =?us-ascii?Q?wFL0/S7OmXr8O34H6JavfLs5ajRxKXpZj2mZJQoXTHA8dd3sqOefuAXZaVRX?=
 =?us-ascii?Q?VKIU4BX+GdFFG4ZFCWh5E2w4ORrLrqORWENaHAOYzzml6QGMot/ipo9z+iv8?=
 =?us-ascii?Q?6YyJmqzizFjnQn29QoL8RzKmEjh8r0KumO7R9FK/8B3osnPWWSP0D+hTMqaW?=
 =?us-ascii?Q?Y5fHvc+RBPy+AvgfZrLVUeMJlm9NlkfDG0OffYTVzDSiV28G6qV94JKoxNvV?=
 =?us-ascii?Q?nM5PBnbfpEFQmiKG5ho=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:35:49.0397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 950fae79-5c0a-4eb8-2052-08de2b7fe856
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479

Add support to handle multiple MC interrupts lines as the number of
interrupt lines could vary based upon SoC. Add field to specify the
number of interrupts and iterate over the number of interrupts to
register handler for each interrupt. SoC with multiple interrupts
will be added in subsequent patches.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 35 +++++++++++++++++++++------------
 drivers/memory/tegra/mc.h       |  1 +
 drivers/memory/tegra/tegra186.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  7 ++++++-
 include/soc/tegra/mc.h          |  4 +++-
 5 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6c1578b25a61..82a81ae3c50d 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -551,10 +551,15 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 
 const struct tegra_mc_ops tegra30_mc_ops = {
 	.probe = tegra30_mc_probe,
-	.handle_irq = tegra30_mc_handle_irq,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = 1,
 };
 #endif
 
+const irq_handler_t tegra30_mc_irq_handlers[] = {
+	tegra30_mc_handle_irq
+};
+
 static int mc_global_intstatus_to_channel(const struct tegra_mc *mc, u32 status,
 					  unsigned int *mc_channel)
 {
@@ -953,25 +958,29 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	tegra_mc_num_channel_enabled(mc);
 
 	if (mc->soc->ops && mc->soc->ops->handle_irq) {
-		mc->irq = platform_get_irq(pdev, 0);
-		if (mc->irq < 0)
-			return mc->irq;
-
 		WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
+		for (int i = 0; i < mc->soc->ops->num_interrupts; i++) {
+			int irq;
+
+			irq = platform_get_irq(pdev, i);
+			if (irq < 0)
+				return irq;
+
+			err = devm_request_irq(&pdev->dev, irq, mc->soc->ops->handle_irq[i], 0,
+					       dev_name(&pdev->dev), mc);
+			if (err < 0) {
+				dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", irq,
+					err);
+				return err;
+			}
+		}
+
 		if (mc->soc->num_channels)
 			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
 				     MC_INTMASK);
 		else
 			mc_writel(mc, mc->soc->intmask, MC_INTMASK);
-
-		err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
-				       dev_name(&pdev->dev), mc);
-		if (err < 0) {
-			dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
-				err);
-			return err;
-		}
 	}
 
 	if (mc->soc->reset_ops) {
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 482f836f7816..06ae3dd37a47 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -194,6 +194,7 @@ extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
 
 irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
+extern const irq_handler_t tegra30_mc_irq_handlers[];
 extern const char * const tegra_mc_status_names[32];
 extern const char * const tegra_mc_error_names[8];
 
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 1c6d03a82680..b38611962add 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -174,7 +174,8 @@ const struct tegra_mc_ops tegra186_mc_ops = {
 	.remove = tegra186_mc_remove,
 	.resume = tegra186_mc_resume,
 	.probe_device = tegra186_mc_probe_device,
-	.handle_irq = tegra30_mc_handle_irq,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = 1,
 };
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 46e97bb10163..75eeb49054cc 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -761,9 +761,14 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const irq_handler_t tegra20_mc_irq_handlers[] = {
+	tegra20_mc_handle_irq
+};
+
 static const struct tegra_mc_ops tegra20_mc_ops = {
 	.probe = tegra20_mc_probe,
-	.handle_irq = tegra20_mc_handle_irq,
+	.handle_irq = tegra20_mc_irq_handlers,
+	.num_interrupts = 1,
 };
 
 const struct tegra_mc_soc tegra20_mc_soc = {
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index d11dfefbe551..4a2cadbc0084 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -14,6 +14,7 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/tegra-icc.h>
+#include <linux/interrupt.h>
 
 struct clk;
 struct device;
@@ -164,8 +165,9 @@ struct tegra_mc_ops {
 	int (*probe)(struct tegra_mc *mc);
 	void (*remove)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
-	irqreturn_t (*handle_irq)(int irq, void *data);
+	const irq_handler_t *handle_irq;
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
+	unsigned int num_interrupts;
 };
 
 struct tegra_mc_regs {
-- 
2.17.1

