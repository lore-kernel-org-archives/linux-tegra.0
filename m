Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013011.outbound.protection.outlook.com [40.107.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AF93C278A;
	Mon, 15 Jun 2026 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512691; cv=fail; b=ukxHqbkNBWP2lCVvU39FXCEjV+wT1u4iQs3Qv+7zjbAe3xYtuF0d5XSXM/zNesYjDmxDnsOs6gLoU/MJHRu8fvb4H/BMD+WR1lGiJXP4ZX/3cP3AwjAMRonfrPLQ6b/nPdyYdT30szge1vunBeTGXgwaBO5i7XzCFSXjDXs1CCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512691; c=relaxed/simple;
	bh=zqrzuOrk90QABd2Hf75iZgVk8pvIM2bmLKSUpnk/EH0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGB8x4RW+3pZ5dl5sIeV5yOypjM7aO7NoRFfUp7FZb9MU5cDA270SIZT9mdZWXKsCNOuIkGt/Rxl1FvB3aRfaXCc1077sChx+/PbAEDmb4Tz5cwJbqUqTHIQmIc3Qj8eH/AteANNV26YucYYedZKpLz4eldFQVfeUQ3koTlO6FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q10GQQb5; arc=fail smtp.client-ip=40.107.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q10GQQb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYxHumLv/U1N//DFP/e3jambh7ZEYcfb4vEI/dNlOd31mlO0YoTIdriKG/PLawiUOrtKxi16i8ES8kln8zYkCi4jKBCMfYJoYqkwhHEEN8s7ekY61erS+HsSciO9lN1Ceg88WWzWJ4XRnC8/UjNzryAjuUpOqQRa4Jquyk47AtxLP6LHzTcDQ9acP02WdwveCM1oAAIgNVz8tGOQO3UvZUtjv7zld8+RIxKffVEuJ5Ptf6zjnC6uAujgquyF6TRsYsTNT2Gnl46xkaFwpKKzlDaIM8ZK5u+6M6bcDVdDDkD3cdxPrDJ2hlVDujWPjQRFOCXknWvH5CLVnkxZrgHUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdphysfdZT5SuiHpiROwq7QdaPdMr3vSW+xqoyBeTLc=;
 b=OTgMU8fuV4LVDb7L5Moi7tBZG3cKt8IQypRFGSh5+RwHmiOrpemoLPR0hIwxA9tTTL0HX/PiUnrBdR0A9qGXBmO6S8oKGn/knNLPDmQKNy9Y2SRtuxKY/PpoGiCMOtSyI4Hu2ZZt0klr/+XvavX0Crnnd57RTh1lVJODIvW5URFV2exbIA/8eorAcW0edEJFAOY7rhTYsdA0pJW3773KhpsDx7LK4ADqSht1659JWTcJSrqItrvPruzx2s9y4YWpHjUCp2kGtOzh6E7xUJHTcTk3E87/gdzJyCJ8XJrBO8dXDIoCsuMpJeKw2cQO4q8GD3OiVi83jEYP0oKG4Sl6Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdphysfdZT5SuiHpiROwq7QdaPdMr3vSW+xqoyBeTLc=;
 b=Q10GQQb5zanM2JbcH3I4FmeB6RuNaX10taky/pcojyrLQTuX+NxZCS4JAjtXBzi+7jb/N0/sEYI131rv0UFKQHlnTFgOAaFcuyjh8yy0kV/eBLTP3jQIkoUrykJhhf+RY3phpc2GHPkR/3C3ymNdgB3AYPuXcLkmR8W6KHyVk5nSSTtx2m1B/dd0Jo9NeAV1EzS6pFh3cxfNU6wNa5YAIMZ+C1kDyTjXYkOuwtGjFGu0TQaxsjSmk/f1yALVTM8BzCb+gHTsreMXLxaTrrd0dO/WrUaIUoKTo6VjJH0u31wd48phlC89mTAlmciayAS4OGaMMW1AwxcrGuwIl9A9xQ==
Received: from SN7PR04CA0076.namprd04.prod.outlook.com (2603:10b6:806:121::21)
 by DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:38:05 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::9f) by SN7PR04CA0076.outlook.office365.com
 (2603:10b6:806:121::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 08:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 08:38:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Jun
 2026 01:37:50 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Jun 2026 01:37:49 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH 2/6] firmware: tegra: bpmp: Move channel, resource init to helper
Date: Mon, 15 Jun 2026 08:37:27 +0000
Message-ID: <20260615083731.888055-3-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615083731.888055-1-anrao@nvidia.com>
References: <20260615083731.888055-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DS0PR12MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4e9f23-30ec-4add-37ea-08decab96b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	HZBih+vsRE2h8CrkN0WZN1fIXY2h8CkNId5Ik0Pj5YMI5Ob0TOIKIQFNK9igXUWvYlwfQcWlg5N8vgPGzrZvw473ekZWeWKgRM3q+eigMIrJ3sZVToygY4mlA86LrA9WqSnnKWDgEd2Gx9abkAML/BYU97gbUUAmfcIld/cBKhulPjGiMYZI2MFHCvieT8tOBoXe/kK6eE+UvdSzrhX+sAEG5A4o73jYMeLQPk1Eu74rUGtzAVZwbQbDaTL/TzygqGtus26YL9YGVcl13PjdXVjd14MKKuBJUf6mdLIkmRaLk8BWU0+DCihSdSYn8yad5HYfzSrvQgwX7bDBDVo/KMY7fRKh2AnGC5sSR08R1dLixkG6XdAqLieeZJEdMRQKOSI/rBMiosWb1dxpm0LEUR6/HyWxUt4x0En8D6iWQBWa0Xbynm+R8+KIo5g7+C/ukF3ggT1ARZ/HaDuyK+7ERc1MnuSyjPUy0tNI+BJoA+N3xUEMppVMd+u7G/apua87er28p5UO3I1RpgQzo+qPK+A1xwTAqalxEwo/9e4Ng4t/cZV7B6MQuDNZRYDEnSZOcoG4SYUsUIuAqo5s3VZfh7VZWvYkFbLPLKCCfuRlJPoaL/KjnYKJ5xzYrhF5nX40p6RVOBXsxlWaC/OsStjXmDzFrnbnDTHlaV8yLwgBcsCXoyNK4lsgmH9FcCbWxkoGs1vyj1FkP8V24bAYQDJCL0RmqtyjBE1eYwRKq6odkH0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KTmUo0qwFxFWWbcgf2PFZO57z66kyCnkhi4jpbcGh5fbMnA8HasGHruVvSkQY8UBt+v82avs3ml+rkVi76tRF7RTvcs07wBZAmXgWRhNf78w6CYUf2ML1XDfKKTRYOVMLDjJrAyAKwqSeTjLS7btvoU9KBSyrEGVO37JJjPo3DVSq7ccw8zNZfViEX8e81oXfntRzdg5YLNfFkxn6t59yBRzYMtbHWBX4+dW+1wX8fKJrnrtLFQjW1MyxKDAoay/KW2ZDGskCojfFuaN1lsRSFUJHGHFN4X+x3q3YsjZTar0HZofTtgxv0G5UQ1136wpjRC2Zpz3qj2DxnwmT3GppFh3XEgVKzQ96bC8OENZlsrW9ZVNNbi8sBmBTZsS1ViCBQoRRNpsU5Ed2OlZyT233MxDR4oJgTQdy6HXWnln1YoPapagqcJknDxoeFfiVwvP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:38:04.7811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4e9f23-30ec-4add-37ea-08decab96b31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9060

Refactor the BPMP driver by moving channel initialization and Device Tree
resource parsing into separate helper functions.

This prepares the driver for ACPI support, where these helpers will be
skipped because channel initialization is handled by ACPI AML methods on
ACPI-based systems.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 94 +++++++++++++++++++++--------------
 1 file changed, 57 insertions(+), 37 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 753472b53bd8..16ca0d104c1d 100644
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
@@ -755,37 +745,85 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
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
+	bpmp->rx_channel = devm_kzalloc(bpmp->dev, sizeof(*bpmp->rx_channel),
 	                                GFP_KERNEL);
 	if (!bpmp->rx_channel)
 		return -ENOMEM;
 
-	bpmp->threaded_channels = devm_kcalloc(&pdev->dev, bpmp->threaded.count,
+	bpmp->threaded_channels = devm_kcalloc(bpmp->dev, bpmp->threaded.count,
 					       sizeof(*bpmp->threaded_channels),
 					       GFP_KERNEL);
 	if (!bpmp->threaded_channels)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, bpmp);
+	return 0;
+}
+
+static int tegra_bpmp_init_resources(struct tegra_bpmp *bpmp)
+{
+	int err;
+
+	err = of_platform_default_populate(bpmp->dev->of_node, NULL, bpmp->dev);
+	if (err < 0)
+		return err;
+
+	if (of_property_present(bpmp->dev->of_node, "#clock-cells")) {
+		err = tegra_bpmp_init_clocks(bpmp);
+		if (err < 0)
+			return err;
+	}
+
+	if (of_property_present(bpmp->dev->of_node, "#reset-cells")) {
+		err = tegra_bpmp_init_resets(bpmp);
+		if (err < 0)
+			return err;
+	}
+
+	if (of_property_present(bpmp->dev->of_node, "#power-domain-cells"))
+		err = tegra_bpmp_init_powergates(bpmp);
+
+	return err;
+}
+
+static int tegra_bpmp_probe(struct platform_device *pdev)
+{
+	struct tegra_bpmp *bpmp;
+	char tag[TAG_SZ];
+	int err;
 
-	err = bpmp->soc->ops->init(bpmp);
+	bpmp = devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
+	if (!bpmp)
+		return -ENOMEM;
+
+	bpmp->soc = device_get_match_data(&pdev->dev);
+	bpmp->dev = &pdev->dev;
+
+	err = tegra_bpmp_init_channels(bpmp);
 	if (err < 0)
 		return err;
 
+	platform_set_drvdata(pdev, bpmp);
+
+	if (bpmp->soc->ops->init) {
+		err = bpmp->soc->ops->init(bpmp);
+		if (err < 0)
+			return err;
+	}
+
 	err = tegra_bpmp_request_mrq(bpmp, MRQ_PING,
 				     tegra_bpmp_mrq_handle_ping, bpmp);
 	if (err < 0)
@@ -805,28 +843,10 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "firmware: %.*s\n", (int)sizeof(tag), tag);
 
-	err = of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->dev);
+	err = tegra_bpmp_init_resources(bpmp);
 	if (err < 0)
 		goto free_mrq;
 
-	if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
-		err = tegra_bpmp_init_clocks(bpmp);
-		if (err < 0)
-			goto free_mrq;
-	}
-
-	if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
-		err = tegra_bpmp_init_resets(bpmp);
-		if (err < 0)
-			goto free_mrq;
-	}
-
-	if (of_property_present(pdev->dev.of_node, "#power-domain-cells")) {
-		err = tegra_bpmp_init_powergates(bpmp);
-		if (err < 0)
-			goto free_mrq;
-	}
-
 	err = tegra_bpmp_init_debugfs(bpmp);
 	if (err < 0)
 		dev_err(&pdev->dev, "debugfs initialization failed: %d\n", err);
-- 
2.43.0

