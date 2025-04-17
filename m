Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AFB22758F;
	Thu, 17 Apr 2025 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882312; cv=fail; b=QEcT30OsW/P0cLVni4iDIOLYUwOUz6DkLTlUEgYS3CuHtlM2LO8Du2m4XBc2uH9x8F0RF/xkXk6DEtBWhdO8T0WOzwexviD5gQH50qHD0+tL5EH6q60fpnNQBsVg9iGhaZTXTFtuWpxH8jvWMvW1VjuDoqjivAtLA29SCRFIMUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882312; c=relaxed/simple;
	bh=xZfz5FAwK66wEUeYCsxbiBimCpTD369bxTfjwf6/mow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pflCgnAvf7BnniffEJSmEoryZJGV1gkVVzDvRKiX2g92qVxL4lADmMQf+36QDnxdupjMYZXDRA1TlePOupkstdIj12UojvEfsVuhci6JQBAAcRQ0LFoLCZ80jT7xGE1osyhI69L6JXqFJYsjpG2/7T/BWHzSwjxDqD7Uai5wf4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AC7FIsgm; arc=fail smtp.client-ip=40.107.101.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AC7FIsgm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iW12oxUVQyajP6oDEEcZIfhhCLsBl52dzTIP+BvQqLo4aF3RCO1+tIlAWuRwJcP+yT4EArvVGn5rxQBuD5VDxcNeUP3DessPwAXAPx26he/+DYH439ieeH5GANqZLFQmtmybyGnal1OqTkDawxSqL54cuTZP9iNvUsGUODBdjw9TAZ7cW1QmqfaP5ANRg0HX93bXXJWpY2Zd0ASlP5KWUjq05iHLGkp2bCmd1ngRiqCl7d+vzK5HpogT/1HCaBkKFpI4XeFNbgcD0gcf6UMlGR/5kYvz2IIBjoAbf2MAUhJfGQ1ZXZosg/GPhsbgiGEM05OBzG4IpH0MKG3ZfZhQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BppeThm+uNCh3mivB476OHi5m4/YPuG0/1YOsR/ypVU=;
 b=xTM8/yJcDFGr6dBiKI228vBc592dL2jL6hvPEOuteJeotR6Yz0lW6TuRvux9n1ZqXRsloBETL2GfW5aoOcqY4/4C7E8dqkudF9s4x8Kpor65XKceJtQQUuSbE2q4GPVddEziJxOZmRLDGj6PG17ijJyaySqSS1OBtW00x7fI1tHfYHK02J3dM7fm3qLRRn+TD1GR9VktLnO2+T+JSGSURQ6TlbHJ1LhONqsuGIsBbliuy3GLHoDiBHdyKSlOa8ZUrvSxoesJMptfdV2EBwsaz17fFqfe12HBFNmcv64u9pVDFjnzfkRSH2xqY4Sgi50ANj9/UvUxDkeA5xYlp4/cWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BppeThm+uNCh3mivB476OHi5m4/YPuG0/1YOsR/ypVU=;
 b=AC7FIsgm5w3H7HszuLNjUX2RyesDolnLEcs5j49ncmugHQ7PR2r97kM/PweE82c/g7vkxM7cVv/G66wk/CYJO4is6jb8pwPvuXhlNobcPda/jP87XBQoNL29rZRXILTQRp4afHlGyEf2JpOkRRxM6hkKC1ZyIhXnFrR6VyeGMx5DeqijtmPpusAVZ4gBxrER9/TiDuO/kwIFQAemn/JfFXHFGCBnvxUrW6VFN2hBXgQfDUJsQlY9sxghEs7fipr0XOtlAiqq7dUEdwb/15NCoNczAnz3v/dF0a1pGGgS2PtU41gTX4QESuqXB3WQP3CkuNbZxRdIaeOHiyRwJ1rSQA==
Received: from SN6PR16CA0041.namprd16.prod.outlook.com (2603:10b6:805:ca::18)
 by DS7PR12MB8275.namprd12.prod.outlook.com (2603:10b6:8:ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 09:31:47 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:805:ca:cafe::dc) by SN6PR16CA0041.outlook.office365.com
 (2603:10b6:805:ca::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Thu,
 17 Apr 2025 09:31:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:31:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:31:31 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:31:29 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v4 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
Date: Thu, 17 Apr 2025 17:31:09 +0800
Message-ID: <20250417093110.2751877-3-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417093110.2751877-1-robelin@nvidia.com>
References: <20250417093110.2751877-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: e7110b2c-9c6d-4dc0-1c36-08dd7d92ac65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?btcqsjDCMQouFafsyhxaKKvw5K/oi2qAH4S0LONDMEKZvuMhGxJkMehkpouz?=
 =?us-ascii?Q?JAnAqRBFpjHX5KQesrLiA2EMBwMDsQHGjot+GfWG5bJb3InMWpV71N+wczyo?=
 =?us-ascii?Q?Nz0N2NDwM9Qqbyh1xIaqYtoZzlMaTzrJQtcUyOZeennLt6jkIY+hNVVEBCN/?=
 =?us-ascii?Q?FqJP6eakAmZHcg3TXJOR1GBaWWxpBal8h1JcF8OxvgFMls750nHpDOeMj6RV?=
 =?us-ascii?Q?aWJpGz8xUzR0ZcxjmUhPCsSmjPJSFmxGkJ9amIvF+RLitlfqezzU2foKkfFi?=
 =?us-ascii?Q?P/rzyD/H+++CLX1Ecpx0ZLpB86d2p6Y4IGo0jxYbTXVyHCow/q5aCUrfbtDb?=
 =?us-ascii?Q?WKLvaWzn7TPMuOzUXJrNkkWEn4My0gdtcSmHbV9kEutXNQS7agOKI2xgQQoh?=
 =?us-ascii?Q?g3FDfRAZok1NRCO7/CVWyvxZ8rNTU0iQoIAmwRgwTg/66w+ZM0ep6Y7FSQ2B?=
 =?us-ascii?Q?oj7kH/bVCj9fgYZfK48ASQbcxGSCpDCdfTrXLZCnSBRm1bGUBJoFauP/MYcu?=
 =?us-ascii?Q?HGvBqNXSKWu6CJX6rpOLmNwm7+UjH/RuRVdUbv3JWVJlJjgrXZ+wAQYfjZoc?=
 =?us-ascii?Q?7bsCsNuvw/I9qp3kzht4gSOEy/POGodxJnGrWF6Z9OIIg9hEuCgQTi2ce1qn?=
 =?us-ascii?Q?SPdXtPI5SM39r3aB1BG9IaWVExEcknts8iSqlB5XEcf1IHTkAqrRQ5V2Px/c?=
 =?us-ascii?Q?1vn3pWkfqP/XSvdMZIsz9hOWq+EVPmTHWlaNtjFjMMT/txLqntClNtJ44IME?=
 =?us-ascii?Q?4KD+MMyt4zDAiSy0A8OUXIvTiN+nQDNTQc9oZScPSZWUPfG0dCydW5fyieTp?=
 =?us-ascii?Q?rlqrnCe9+6GXztjj/58HOaYyEQ3ydicJ5+hW8rfeLv79pTawahLy4q0CmSrE?=
 =?us-ascii?Q?feqFLZjixpKDVYVAkhYS41Ii8cPL1rhBTBitoA0LpSNp1IptGXfDxZL4JJbg?=
 =?us-ascii?Q?pWcc0vjWz5zSQS3/75VqIph1B2iRmBIQSbPMtdIzvQWAlN9X+nccvojWkxoB?=
 =?us-ascii?Q?qMrc+Hkm5kKqh5rid2jhTPH3/p0CrMPMWIV5dGdn19BqAWqzjgrnl00VZXOl?=
 =?us-ascii?Q?u/JHRRAH2RcUyN9ZHz9lRCzP8EmEHYq+VNNNOLGNyeaOzrk99kBQaCjvxn/o?=
 =?us-ascii?Q?I8Sfvv7CmmcyLj9qTh+gn5/0PxS9jY+SR1xUCJUYPyAKFpzrvjceLIfjxFus?=
 =?us-ascii?Q?NEMczQQwLCLnb7G3ToxSNlxMGz5rA/M2nuh87htqDW3pKEdHdAf+3qGasSOp?=
 =?us-ascii?Q?dJV2sB6pg2fjR/lcg1kLgNhOJCLQFePcReYVSzT5u0i1x53ip+UTlkXz5lXO?=
 =?us-ascii?Q?a9uGSextYFU1PohgUe/jUxQtkkiET5wW2DPv3SySocc5vaMjlguaS+xia2Tj?=
 =?us-ascii?Q?l/ci02A/2hwVvo7/GauNTz7tuvj2AaduYk1KkowBVrhmhZXOs2dju9iAvL4W?=
 =?us-ascii?Q?Z5i+H6KMGS764esNEt17GdXyzXt/AyZtXEpQ8MNKWiUmP05asVAa4SVzkcq4?=
 =?us-ascii?Q?d3abPLthR5eSXAz+YCFvDUycQ1T6LMjDuXUl?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:31:46.6076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7110b2c-9c6d-4dc0-1c36-08dd7d92ac65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275

From: Pohsun Su <pohsuns@nvidia.com>

This change removes watchdog self-pinging behavior.

The timer irq handler is triggered due to the 1st expiration,
the handler disables and enables watchdog but also implicitly
clears the expiration count so the count can only be 0 or 1.

Since this watchdog supports opened, configured, or pinged by
systemd, We remove this behavior or the watchdog may not bark
when systemd crashes since the 5th expiration never comes.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 201b24ca59f4..708d9f8682ea 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,9 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local interrupt for WDT petting */
-		value |= WDTCR_LOCAL_INT_ENABLE;
-
 		/* enable local FIQ and remote interrupt for debug dump */
 		if (0)
 			value |= WDTCR_REMOTE_INT_ENABLE |
@@ -420,23 +417,10 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
 
-static irqreturn_t tegra186_timer_irq(int irq, void *data)
-{
-	struct tegra186_timer *tegra = data;
-
-	if (watchdog_active(&tegra->wdt->base)) {
-		tegra186_wdt_disable(tegra->wdt);
-		tegra186_wdt_enable(tegra->wdt);
-	}
-
-	return IRQ_HANDLED;
-}
-
 static int tegra186_timer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra186_timer *tegra;
-	unsigned int irq;
 	int err;
 
 	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
@@ -455,8 +439,6 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	irq = err;
-
 	/* create a watchdog using a preconfigured timer */
 	tegra->wdt = tegra186_wdt_create(tegra, 0);
 	if (IS_ERR(tegra->wdt)) {
@@ -483,17 +465,8 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 		goto unregister_osc;
 	}
 
-	err = devm_request_irq(dev, irq, tegra186_timer_irq, 0,
-			       "tegra186-timer", tegra);
-	if (err < 0) {
-		dev_err(dev, "failed to request IRQ#%u: %d\n", irq, err);
-		goto unregister_usec;
-	}
-
 	return 0;
 
-unregister_usec:
-	clocksource_unregister(&tegra->usec);
 unregister_osc:
 	clocksource_unregister(&tegra->osc);
 unregister_tsc:
-- 
2.34.1

