Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3329318A92D;
	Fri,  2 May 2025 04:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746160685; cv=fail; b=Is0v8Osnrz3euOm4rY5s5zxtjxMytXyDR8MJTP85CTFfpNy6MByT3d/hO7Y1ZfCOoUeWbNOvR5PafXL+wpciKMbFR4Y4ebTgXgozIlJiixAGHwkwzongi7tWqYyYh6E1OdQY/gM9m21OXUheQgm8Rm+t3C1IK4pjIQr4BoVzojc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746160685; c=relaxed/simple;
	bh=+uxyM00720tzVVDN3bx4I/RbXGnKb638Ebvdbl9nb2w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2IA5P/O3bUUlILY+3h+RvqcLTugetoGdO6AgOBkOpfNx24Qm/9eBxCpW0jPuIJJuLVu/mtUZwORfpB/m5Na4TOsf41zfLBbca0QKPVdFH3B3nEXAi6vrbJnuzhh86/sKBgXPbM+QuCfQFFoP40acnsxiinvfxpQbnMHPnCES5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gI+5KowH; arc=fail smtp.client-ip=40.107.237.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gI+5KowH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEateLjua/qAnGCbHRSVSSxJ1dvGDIub3/1i+TSS9V181+mdp5rpsp0dKlf8LIRVIYQLkts+uPBq194EGrs3nx2lhseyCT1oLwUf4VL0+5o35nK6E7gvE9uZL8yeKfYpu8s3ljm8K5soWrlKiKfKjM148VICWjvzxTocwvhfC/zX+hXHGpz+T15agIu6ESbpzA82YtqawRkhkcrw1R98OmQmmxMDoChyS4ez9wik3Y15+5AmCTrORmZK+tALv+Ghph5FuS890DweVBZGoYGhQJVUIPG4SmLv9mpivz0AXmf31cMSeCf+Cy0xi2S2d/rSENifEq/HrKOr+PWzLM6KWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPkm6IykS7dvLdeGhAXWC1f3vxIRxaMDAVvz0UVzZow=;
 b=jYVEUwQwVa76DK43mtf+ujZBzf4itDggNcciYZqKGS7aKjvsPAdVShjN+6QdaD1z1iwWQziPxPr9KGlXcC3IXRuY/vG3jOiQLMqv7ChQ+uldRVFLzAQajwt2+U5Ao231S3OO24ZWmgSoZFZ+JL/ONGPd1COPirgoTnJ6u0iLzNj97CQDi7YNKN6RHDoDAi3W6r6ZFU1G2NmoquDaeaL8D9IHY4in2xIcUmBgMqzg57EcDSs5DMxHL2u1ro8osLXwMmyo8Neg2PdRjJe736ZlWJ58dE9UvzFyUPjNrCtoD6ZxmIyimeq/3Q8eUsOGYXEo0CTyFWh13qZrqbZWTODiWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPkm6IykS7dvLdeGhAXWC1f3vxIRxaMDAVvz0UVzZow=;
 b=gI+5KowHAcoOyI3yxjvDyFwKNNdHuT0ECmUC6YagZuHs0lhbQ3LhMzBozsi2QTribVyqOMO/7Nj4fUF/SSHCM8Akp/wua/fLG4TgPrPpgG/L2ijJBXh4b2QXYDnG4jwqwPE2XHtsDDPiSJ+qlvNsuVKLYD322DD2kxsQZc1ROvw+Mu2uVya46FbcWj9IqlOxrM1I7cJxhQw6s7pjnuKRetLFRWKqpVJKV0Q8D7MsTQxL0XAHXZ7+NZZbeM0KiBaXLy7g+AJWMyCyfymBmgDtD1F0KW0dg8Ayl1+Snyu+Uw+9CF95i1+4W05gUWPesYkvjshm52J79jN9bJP5H41/Aw==
Received: from CH0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:610:76::32)
 by IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 04:37:59 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::2) by CH0PR04CA0027.outlook.office365.com
 (2603:10b6:610:76::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Fri,
 2 May 2025 04:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 04:37:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 21:37:51 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 21:37:49 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v7 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
Date: Fri, 2 May 2025 12:37:26 +0800
Message-ID: <20250502043727.396896-3-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502043727.396896-1-robelin@nvidia.com>
References: <20250502043727.396896-1-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2be7f3-2d19-4765-9d9a-08dd89331de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J/l5/9Pn1nu7p3fk8aygKdhDMQo3E28UuTNINgK8atr9Mb97/N/OaRbeB9bQ?=
 =?us-ascii?Q?gn5zH7tlHhxBdtGmUwu8NIzzGOLKxWYuxNN49qaC8xrvkRsYadFcIbopZhY1?=
 =?us-ascii?Q?DIbAUB2SucoXQIC5ADOKcMK8iK4shOMwCu22Ht5w1Cgz48ioPX+TXWCLmhiM?=
 =?us-ascii?Q?iarqGjo64Wy7mZJqgTfAg30oME9p7JR4p30uFNmcDsRTPfkJ5D4Yae/WGWpA?=
 =?us-ascii?Q?BNIw+8P1Agy156FQc5SNQC6H3iiGQ69LXmd6oL1cVw5qoId5Gyb6pQSTt8aw?=
 =?us-ascii?Q?tpz5+8Ud8xmYz1z4Vn6HS3RkAV5O6XN2cY0NG71w4Yo7ji/szDXffaNu/Pph?=
 =?us-ascii?Q?Yu58iZyDLegB7wd46eza5+a+kz8/kuV3OO/9XS/QytEFcK4qaqnXz+Q1hfjm?=
 =?us-ascii?Q?xCHXb5u8pva3hWYUmR716IMoDhpXgNgw7WwUVeCT1v2ZSnv+f1Ser5DDclLS?=
 =?us-ascii?Q?LF3iDf+Hx47QM8NFBOB/JwPF1gzV+4JuEakckLqlYeDB0r6s+PO5OvE7ZQde?=
 =?us-ascii?Q?T5SqbS+3GzM2Ca241TG6mcEANYkd4yPz0mUvjSesTW12q+7Ds+o1ksqG/Cah?=
 =?us-ascii?Q?hhp1XgSQ7cLBuCFVrEYfd5Il98qtGnesbjn8EsazDB1ZWUY+pUq+3CJ/uJu+?=
 =?us-ascii?Q?J9/gjWfVCG+KtCzrk1f2yEmZRjcAotBNVKZB060oQ+CynrwY7yrQO69TKTQ4?=
 =?us-ascii?Q?5+5WGw/LCnu+3CEkfr00nMnmNI+m6k5iW8ErFwsr+DzeNJWBAg3IHbE+mrgF?=
 =?us-ascii?Q?sBU5cPou2v2RanxLCB+X4okSblBwM9ipJnAKdl8BU4BSim/hNlEdJbVy2DgS?=
 =?us-ascii?Q?ZnazYuzNdZNmstMK9st7tSwmpGlx3AeT4Mz/KMbk2FQjAO62+4J9FDeyXB05?=
 =?us-ascii?Q?mnhmUO6ssN/6sVYCink0XYJsP/CnbYWV/ebFGGxPtvcBelZyLhW22221yxuu?=
 =?us-ascii?Q?qExEzxDzGUUSavBg+7mkry5gagL9AytLzx96za0lXLVUCt9csX0apQMIndKW?=
 =?us-ascii?Q?FI9hm+2WrLaVBJcW52p3UT5c+pqT3mz+enRudtEblKnEllqxKeFAPCob22GC?=
 =?us-ascii?Q?FyX2LiSLBB73gyPgQ2iJfPW0gaCfKgj9d000GD/Uvw8LCtMpmOp+QYfiqoxy?=
 =?us-ascii?Q?PqBBogfxptpkMwFPCJr1LbttWpI0wliBQYbTZethBbHbEoKfUdUI6EsF9TYR?=
 =?us-ascii?Q?+Hidrux7V0bMf71TsQY7XAhK6TN31yov4O9cNVU6JeefKHBhNTHHSiWEXgAp?=
 =?us-ascii?Q?/82sZ2kNIvvtXOdeaf/Wk+BnYaVtQOqHGnTsEWQDomFjJlDoK75OTfSiz8J7?=
 =?us-ascii?Q?YHlFn/A5LLibWGGO3Eax6hd6ob8J4L2DAIBWbfD1QPhK1hDnGQXOKVmaQTIu?=
 =?us-ascii?Q?AOkHBv60rUzy/Uu7jpw2ki635Q/qIT7ZvECCXgiMmkIRNsoctIn60u7z1Z8U?=
 =?us-ascii?Q?P8Kdc3S55TICwQCiIeIcMjyUB7NQ7szbyt0I8H24Ez9ELbMBcNLQsugUVZ4H?=
 =?us-ascii?Q?RXvGmU492BySoiap1fTX9k0G5BwbqeoixwYF?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 04:37:59.2855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2be7f3-2d19-4765-9d9a-08dd89331de5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929

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
index 8d5698770cbd..8c8d83ceb1dd 100644
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
@@ -428,23 +425,10 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
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
@@ -463,8 +447,6 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	irq = err;
-
 	/* create a watchdog using a preconfigured timer */
 	tegra->wdt = tegra186_wdt_create(tegra, 0);
 	if (IS_ERR(tegra->wdt)) {
@@ -491,17 +473,8 @@ static int tegra186_timer_probe(struct platform_device *pdev)
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

