Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1887E2E7F22
	for <linux-tegra@vger.kernel.org>; Thu,  6 Nov 2025 17:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449999; cv=fail; b=UnyMg1By4b1gOK/qMkKKgZ9GjCSwgUxaHQDIlh5tTCXSH2q6+poscWWuPVOjvSj4uZPkaEyQesLFV3DK1atl4JmsPSrIyPi8sjO55r4wt+LRB75VQm32qBtoI89KJ0fXxzmsQtouXifIx544fcfCjwUATYY45B62UEAfRUGosFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449999; c=relaxed/simple;
	bh=taM9PaRS6FzjBfa/DLEvaUvSYBZYAdI4X5zFqfR9lhE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lhchjNApnseBRf3DMmVzBlPQGBHWS59un6Muk0JP7pw1R+ylMSWn24FCcLfzaaiF+aBIJ/HlwC46FPl7jc9X7JyC4DZSNDVidw5bA9yyOem+WFX+V+/8e903DfHFlDZEdvhyabV30ANRaf1Zw8RQpITARjDUrgBCKdxcbjt7cso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N1JNl/YM; arc=fail smtp.client-ip=52.101.48.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N1JNl/YM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvwaAz62aJkmdIVWQP8ngJtBaDqxPmu4a8EWM4DgtZgPnOFT0kgghR98uQ07UKA2BOc8ArsqbRIwStPGoli8B2tp5Dh7hhebOJIUzJxApX/J7CsV02E5GdGv5ofoAINvgD3TYcBEj35c0dwHqXmh80D4d3lR28yPp9ho5S2MBqesZ06mZditvo7Wwat/Ew1ejVNmj198rFQ+25z9wIDEALhINFU3Ix2mvHVeMUxTOi0E9QjqOEtVOCJOa0Jcr+5KzX4WH9XN/C3/7ztSaL1AB/ghKApKT8hv/bZzp3iXtWNJJBAtQbw2th3NQ7vougYXw+uB7l/BEqjw6X7o1oryjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZbbbwvjRXUyfvnKT0dHughdIJggJuKI8jd8BnxNwBc=;
 b=cEk0iILJLbd4m5SThvDSUstlkNoFzHt6g+gd51LxucEBcm/v3YM0CGBJNmpMob6pRplNHx416IyUQeLCqomlX66Rvvc1mkQndFJ1KBcvXbxFCcv9cFRUPJjZCX9BdPFLx/4LdmE/dlAuo25TYPANZk4Epeqn9SG8Ghz3541dMacBP6HWX0p3fyKzF1brNeNyVXXaLTQo8Y/zo1xH2A+POVtnYByrKFFTL8aXgbM2tm1/DMDPNGe+AMEEBiXVny+XUox6M90dTo/jjK2EAGTp0OBvsl0P5onyTzFS6u/iv39RUEAWMyPY/pC2WYXswu+ojCpAib70sSm8d/3+tf7S0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZbbbwvjRXUyfvnKT0dHughdIJggJuKI8jd8BnxNwBc=;
 b=N1JNl/YM5mEmFZS9v2Grpnc5k9L5K/ovkavpkUdvVBdQ9rUXZa0YsSqaUZUTzyijE4E8TIPFT/l38OQSAStSawYpa0w+cRxvw6qeUmb6FOEudo7L068zCXD8Bdg5ElrT3fPt6ubIFtGDsOz9OyH45jTSzhv/22jXE4PhtJLfH0BEgiAMaAjK2xerLFUt3SkRsIJzcNhFsYIdkjausoZkwW4dQXf1nosIavj+RodYY+KNra0TY0MCtZHaeo+kFICC/gtk4aX4686AVDEBXyzPbZqN+qJAw6zbsnquPKwSKbZz6IARpLEblX2ItzBZlRFytMenHfHWHIWdofxGwQbQ3Q==
Received: from SN7PR04CA0078.namprd04.prod.outlook.com (2603:10b6:806:121::23)
 by LV8PR12MB9156.namprd12.prod.outlook.com (2603:10b6:408:181::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:26:31 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::19) by SN7PR04CA0078.outlook.office365.com
 (2603:10b6:806:121::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Thu, 6
 Nov 2025 17:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 17:26:31 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 09:26:12 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 09:26:12 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 09:26:11 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] memory: tegra186-emc: Fix missing put_bpmp
Date: Thu, 6 Nov 2025 17:26:00 +0000
Message-ID: <20251106172600.1708237-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|LV8PR12MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 73288aa1-3284-48a9-d149-08de1d59a042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zSkchpISGh5q3/inz2dn7/XgjVZdGyoqbcoRpC5g+81HnfI/efY1Q7tVBxW1?=
 =?us-ascii?Q?Vcx/pk3IH8D2z5aSJa+B9fnz8s8i0e77fd2qnK7f4RM1c4snbfH5Qw37BKJy?=
 =?us-ascii?Q?jl0JV4Qtxi/1O8d/QHBziFwtXpLJ8HCU0q3s7xS2s9ffxeKyqnKS/s91v5sZ?=
 =?us-ascii?Q?MVmnfH0eP6uuPMeI87AJzViSVSQ8BFA8aasL86iuMljvtmEvxyn9eDfv0xxV?=
 =?us-ascii?Q?UYLVo7jxE3hoadEcoKE0euaZmNWCeUozl6GXMGIMcCgl1TEmUSTJySEO1N9E?=
 =?us-ascii?Q?PM/VLt1msOPFWvpUkrWh3DSA/+PuER5pcua9G5dDtA3GBhe5eG21veIjQLmV?=
 =?us-ascii?Q?W5bsnClCrghuz4EKwFkDrFIUY1f89/mHi1BSaUEhQ96F/jiQf4hluALFRLVl?=
 =?us-ascii?Q?qTvfAon3Peqo7ee3E/GW2MLXJg5Cxiye+clwyrA9cJFBFyT5MAhjC3iVZzPO?=
 =?us-ascii?Q?oDgsfGIIsEAZHAjpDuGWYbT+E8S98Uv29HPu2Iendh5imKuB2DsYmFYKCA2T?=
 =?us-ascii?Q?Ug92DQNSudsUwSeof64EdgEdnMpsozjiGz9FV3a3g9y3cDuaEikgxtVItQnl?=
 =?us-ascii?Q?nfx9+zp2Ma77sP5RJ5HCTBc11Z7dL/kXVm4mFTdbopl8qkuqVYu7YjUX7AdJ?=
 =?us-ascii?Q?sCPOnnjP6606VALSnfzpFR+YfLE4MwavLLivtDLuQz8Ve86I2B8V4L51xQ/2?=
 =?us-ascii?Q?1Q3Bnc8TnuNbfycuU3Hzuy0iEEnircis2j7bCmCEc0qljqyYsNoTkENEvZUP?=
 =?us-ascii?Q?yoSNE0wlPbBlG0bwIVi+tAzuUdkx+XBhq1JzCmWR0uSOYEO9JyPOnMm/zCUS?=
 =?us-ascii?Q?JsfaOZ5C/k1eEf+xzvX+IkNrOlSpkToZ1Ob0qERyH+jg+0JIHkgxIJ4I1CXs?=
 =?us-ascii?Q?07AzF8hJaBY4e5Jknore3vzUByeJmAYyDkS9SPWEFz+uOFhWuAvqE6DTI/hZ?=
 =?us-ascii?Q?SKdzrfqvcFKiTeSaYeVbTbrYVtPQ5ysigdbKZOUZmyvwf+QJrQG70QcPr4pL?=
 =?us-ascii?Q?xRxyo1HsEV2uP7CjXQDPkZcsZYaHI4JC42fOGEaiEsWPFtWCoLa0EcgVRvCc?=
 =?us-ascii?Q?G8ti0PwjKqOuneDIlxEVQnjUIlOHaDlp/WQ4PxHp37zMcUzrDfqzsIm/R/gw?=
 =?us-ascii?Q?ZhQbEUclVxf614l2ycj+vVbeMofF/IGN8p6t/+o16J7A0FvqhTb9QfvKSP0n?=
 =?us-ascii?Q?+mVu7NOkK1iB7agccaTJgcQq01nlq50NtwxAqJo0znWMu4SDXvTcWCdiLow6?=
 =?us-ascii?Q?WJG+Nde72veY8eOaZmj1b3ry7rs5bCRhAFyNryoCUj67LC8sNMRBEKsXKOqc?=
 =?us-ascii?Q?600tRdJPVjwQuO6Mr7Vj9HKey/73u36L7AkGNf97lbSSx/iKTWB1B/22WwzL?=
 =?us-ascii?Q?RNhTCKXqwW3pBFLwDHnDojq11HuIbw67IoC3N1wIqAEtdYl7Arfc2atM2ksF?=
 =?us-ascii?Q?GNSX5a1vlBLH4Bmj8CCjsywfRf2REeTaO/ZuLD/YaUM9pPX9fiw9GYf2wFgs?=
 =?us-ascii?Q?roTLQyLS9cP91DNdPOLuVMO6uB5GNGEVdwQ6RnAHEOQmTR0+LkLa2NfHTrAv?=
 =?us-ascii?Q?zpYVeRc2kk+osk5PWQA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:26:31.0099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73288aa1-3284-48a9-d149-08de1d59a042
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9156

Commit a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred
probe with dev_err_probe()") accidently dropped a call to 'put_bpmp' to
release a handle to the BPMP when getting the EMC clock fails. Fix this
by restoring the 'goto put_bpmp' if devm_clk_get() fails.

Fixes: a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/memory/tegra/tegra186-emc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 74be09968baa..2c3377ea7fa4 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -448,9 +448,11 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 				     "failed to get BPMP\n");
 
 	emc->clk = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(emc->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
-				     "failed to get EMC clock\n");
+	if (IS_ERR(emc->clk)) {
+		err = PTR_ERR(emc->clk);
+		dev_err_probe(&pdev->dev, err, "failed to get EMC clock: %d\n");
+		goto put_bpmp;
+	}
 
 	platform_set_drvdata(pdev, emc);
 	emc->dev = &pdev->dev;
-- 
2.43.0

