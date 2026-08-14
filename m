Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E336D9E7;
	Fri, 14 Aug 2026 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700227; cv=fail; b=q+8fWJYlNw2L04R9n/jt7GS3pyoOOQJVvdzVgmDgeUx4y7duIf+vtmes/QpsZ5faI+CI+Xlt0Z1w0sfk2hK89fxAxD/VWp0qFNPwpJe0V6pcKwexXjWaKSPgBmlsAYzPW9Za3ljB9/G9Bi/2IoGTapU4MZ9bzZOKeMRSnZxh0/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700227; c=relaxed/simple;
	bh=upse2GObzawi8z/6vL2ffJzOb+gmW0QWmTktY0imFv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U3uSh6RlS28TMIjAkdoDR5AgaAfkOXXdeFQHcJSal+DcqYZuiKTDeQ0CJyBZ+lnUVh4mZgszynVjD4Iv/OMnRfVmTxY8Xxlek3As7aNQbA9BBkynyej4fay67kgs9vk1LaJOpWvV1NVuIk/MO4ShTRQHIC+yAIGONw2uv4zXd48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gGTb14VI; arc=fail smtp.client-ip=52.101.62.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gGTb14VI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcWVySusL7+qprHo5ICaqyCRZwePXwk41Dzxr99vGxiAl2yurTl9TMCBimQA4ZjXDcAqVqCmUe9dumBTqGfb0m+lMHgqjgjleKJNDdPhgNqyynEHR/AxRVr7tOL0ZjvMJVwjISNb7jDjDA8mvPEbiBOfX8Vy/SNUdk0abaPxk+MRXAmwiH1NYBl68TY7s8RBGFy0v2dSkeArafjd+ZSPP6EOp+v3Gzn5J2R/efd11YZQ/l714YC0sNdYESkBC2TtC2Pqlh1fpMqY1HnpAIZRjv9VrdnaMKxITJICQNjWG2LHi8rgEXLXsdP82gtUSp+NPfUI7Ix21Fa0EurSOQRkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+w+RHpmednhPGhk1nD5X9sMrgYauIoDv7nPLPg8SUIk=;
 b=oEa/emsGCT+BXd/vty5j3wedOA/YSxyvue7RQ/ftcdVkE+N78+1vZT/oJnPmm/7lzB7nX0qR514wcyefYwKnuCUGFRiK3aJJU3WBeHKsNSOMPaqO70NCeOZWdf3XFRSITV6Be2wjDdSTReLnpF2hRyO/eDm6nsk3bQ3wEmO3efNFkp5NxlSAYSoxfhTZ3EtAUi2FNxQoHJDLrPBaEHo1wXH4cYzKPTx6fruoSup8p64NVwEUPksMFn+QQvt4wFjiLxQ86PPD0eGi4qUahRL0IMRkS2I0DAcPAgQ856m5t/GK7SKFvHPhir3rnsmhgt+tvs+pkUPnVK3xnt8JqmaluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+w+RHpmednhPGhk1nD5X9sMrgYauIoDv7nPLPg8SUIk=;
 b=gGTb14VINBWT6fOQYkJSPOfLtawxLdo1B/iB5UrNtrEmyMBp5/u5Ou2ppzyZv9et4G90fEpRqIQg0wFcZ84i8a0qbJjfqnVswj/W3HGz1JtzLqL8Th3XBCGP+9jgFKGDOCVot0U+uSh3VcqQcGEcCz7k6A4xbuYEzF4uH9sz6WusufYMAWesMMUVik7DBnDqTi3ws3BU7rz05zMAuXwOjpZpFahQiv/JNBqQh6BWjoaOzLB0wp7E3HyF4dPymCHabWyfRZ62ZqlV04DMepOhC6oVinM/rfNREwZgy9IfUFb/6lyFc3gz7i4Ja3pdwvBykvZP2Tm8Xolndq43BgO1CQ==
Received: from MN2PR22CA0030.namprd22.prod.outlook.com (2603:10b6:208:238::35)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 09:37:02 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:238:cafe::39) by MN2PR22CA0030.outlook.office365.com
 (2603:10b6:208:238::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 09:37:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 09:37:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 14 Aug
 2026 02:36:43 -0700
Received: from build-anrao-noble-20260527.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 14 Aug 2026 02:36:43 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v3 1/5] firmware: tegra: bpmp: Move channel initialization to helper
Date: Fri, 14 Aug 2026 09:36:21 +0000
Message-ID: <20260814093625.1567353-2-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814093625.1567353-1-anrao@nvidia.com>
References: <20260814093625.1567353-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6189ed-dc88-4fec-7b45-08def9e79832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6G45aSWtkgXW5vPc1ZDhGhFbF15XqK2gHXGWuJVeaUc7rEPUUNRbBk+38DWZAHYzNW9XjVXh0YhiefuH0Pw44235mEGdjtYuegd5YY5hF3gARJU1IHUCNh3QEVEDjHvyV+EEX3yGd+UOmtNzo+NqCVRwEjd5IUPxj7DK2fXaeCgsY05qSyaAfiUPeNC/19NdKJ/skgXgsVKtRpxOluRtgW45iUHw/l8e3FgXarks0fgtnFMVL8AkY7EAbL/nZ5WfTraTbTKj0uLxEUBh02bC68Zokr6u9j3zEULPTf0x0eOteMNQfsqRsMOUTIfK4x2j8GTClfLcGO07aJ5dQJMvzSX8ouCCs3DohEw9pt3zDXZXdkWFZuITVhk96hZFXZvr4mL96OZ2MBIHnVtCft05hjytmd7IyoSfVOk5gg64KeII3ZIRbdZyP/AvHeweyY5yhfOqFDluo3McLIdCukY3XarNhWowpFAUTO5QyYExuwur+/3vaTczuon61vbCmW4pATVwhWvF+oi4vQKEm6gAJ2jvvvwF51zf9D9M4/sMa4gzwdTFDP9JYNK9GDTfyy1A8wyua03ITJjs9N2DKa6Jr2XJGjYZBLTgwS0zAfFQqoWw5hD712fR/xt0U1tTf8MofQdcwxKkFzcI6xWdIrdW4iwoL7j/zo57P4eUEeeSJx2U3bvahg4cg5gCcn/fXGeNK6fTTcu33PbhTtHHi2PzfQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5/5rZjaA6vbflFq5ARqUGl1G/24h9gernBH7JsLTLByCpBSvufBCPed3PfwIKeb1D4ua4pFZFec9faHRj9gWVdlbYAmA5+ymuYhaGMZHZLFyOTS91NHAPeo91vnGzyp37Bv3YHVo4av5iDIxkPkljy1lM0bvyBN8g47tAqSfHqQe4SJmcN/Oi+Fv+F+3Knd2Lc9VI7OH7A9vhFV98fAB9x6ZljLyf5EoJ81SgHfGStbwLCs64puLMK9Wk/RcDOGRBp6fbIEvpgp3deGxWf6MB9vjrBuJ8i0S8vKJnRTO90rsw0GBd3bsM65wAwWiy9VN5sgRKva3uhBGjVh3/B2fIVMf0Y/8xskos5HPYOo6C1pwWr5jPLQdiq4Ug13K8q8pmW1LTa/ZYLI9kU1k2tz1ehzOPu4BRJhDxcYwQsjTaXd3WlQY9KU/RlmWjrhIbca8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:37:01.7239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6189ed-dc88-4fec-7b45-08def9e79832
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410

Move BPMP channel allocation and initialization into a helper.

This keeps the probe function focused on sequencing.

It also lets later patches decide whether mailbox/IVC setup is needed.

No functional change is intended.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v2:
- No change.

Changes since v1:
- Keep OF resource initialization in tegra_bpmp_probe().
- Move only BPMP channel allocation and initialization into a helper.

 drivers/firmware/tegra/bpmp.c | 44 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 753472b53bd8..0eb99b1c5068 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -733,19 +733,9 @@ void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp)
 	spin_unlock(&bpmp->lock);
 }
 
-static int tegra_bpmp_probe(struct platform_device *pdev)
+static int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
 {
-	struct tegra_bpmp *bpmp;
-	char tag[TAG_SZ];
 	size_t size;
-	int err;
-
-	bpmp = devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
-	if (!bpmp)
-		return -ENOMEM;
-
-	bpmp->soc = of_device_get_match_data(&pdev->dev);
-	bpmp->dev = &pdev->dev;
 
 	INIT_LIST_HEAD(&bpmp->mrqs);
 	spin_lock_init(&bpmp->lock);
@@ -755,31 +745,51 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
 	size = BITS_TO_LONGS(bpmp->threaded.count) * sizeof(long);
 
-	bpmp->threaded.allocated = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
+	bpmp->threaded.allocated = devm_kzalloc(bpmp->dev, size, GFP_KERNEL);
 	if (!bpmp->threaded.allocated)
 		return -ENOMEM;
 
-	bpmp->threaded.busy = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
+	bpmp->threaded.busy = devm_kzalloc(bpmp->dev, size, GFP_KERNEL);
 	if (!bpmp->threaded.busy)
 		return -ENOMEM;
 
 	spin_lock_init(&bpmp->atomic_tx_lock);
-	bpmp->tx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->tx_channel),
+	bpmp->tx_channel = devm_kzalloc(bpmp->dev, sizeof(*bpmp->tx_channel),
 					GFP_KERNEL);
 	if (!bpmp->tx_channel)
 		return -ENOMEM;
 
-	bpmp->rx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->rx_channel),
-	                                GFP_KERNEL);
+	bpmp->rx_channel = devm_kzalloc(bpmp->dev, sizeof(*bpmp->rx_channel),
+					GFP_KERNEL);
 	if (!bpmp->rx_channel)
 		return -ENOMEM;
 
-	bpmp->threaded_channels = devm_kcalloc(&pdev->dev, bpmp->threaded.count,
+	bpmp->threaded_channels = devm_kcalloc(bpmp->dev, bpmp->threaded.count,
 					       sizeof(*bpmp->threaded_channels),
 					       GFP_KERNEL);
 	if (!bpmp->threaded_channels)
 		return -ENOMEM;
 
+	return 0;
+}
+
+static int tegra_bpmp_probe(struct platform_device *pdev)
+{
+	struct tegra_bpmp *bpmp;
+	char tag[TAG_SZ];
+	int err;
+
+	bpmp = devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
+	if (!bpmp)
+		return -ENOMEM;
+
+	bpmp->soc = of_device_get_match_data(&pdev->dev);
+	bpmp->dev = &pdev->dev;
+
+	err = tegra_bpmp_init_channels(bpmp);
+	if (err < 0)
+		return err;
+
 	platform_set_drvdata(pdev, bpmp);
 
 	err = bpmp->soc->ops->init(bpmp);
-- 
2.43.0
