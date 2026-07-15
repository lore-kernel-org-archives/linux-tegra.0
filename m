Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013045.outbound.protection.outlook.com [40.93.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23D3B7B6E
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113874; cv=fail; b=MuQhKmTgBXKV61nHBVCacKVDIkD1UJSWaFd3B6PdnDkksj/BbtmPvgtRzecD360nlIxcqeZGZeNsddUK26Vexy2EWKOe/1lPDpOZrxPL4hudSAqkyq26sZymPizoFwB+xO8fqmwfrnlFTuLciHDFZ/+MFiGMRdN2tnrLZcl5PxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113874; c=relaxed/simple;
	bh=mFgSTceeg+MgzebDOXSZjzN5uqcj67XgZc1vez7ByPA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dY6tSX5vfw+trwJ93h4B9eHJmpUrd1vryNbbvQYQYyqkGGuqfbbOaf5eWMOOCnHI+KNDjCVR1dMAvhioLFQ6dOIGaMTo7ghfRN73g1/StJuLFv3j5J0q+8+yM6yedBY+8hC5zGTI588rjTUmbASW+/XX5xHkC2zgqb/7Qg5P1so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a5MT5Oo2; arc=fail smtp.client-ip=40.93.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a5MT5Oo2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUmsvd1nMs/+gLuY67pt/NT2H3zFt8GR8mPuAHc+sQsdi6mcUGLvxcRJBe2ZKn3eH/RLrYFBucWVBFXyLs+tcW6EwyjIRAeWsD7lacgJRZ6vmpxdUdmUNv5xfzd/2uO5AtWM8bumk9UpHra1OFnMNBovC+e0JBcLXnfUDlGfl4MOyGM7MRPC4BBtIDmqdXnNkGkFZsTpZ8gRRNGecfmmDtZY5d3mTEj32MKammo7dWo59aw2AXAc0mWZbjF0Fic6iL986ZzgQJG7/dM+kHtHLrHcrYPlxVkyTHsDZY5vQ5opp6yc9DxDLFgyb5ndqjSNC8bK7Z7FcSt5hE+dfb3FTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+tA/bpn8HTwgEVzSAqdPa6P+jBjfiEpLD+61LMy140=;
 b=fWqSFCiTlRkKRFBH6z25ansUDPXM0QfLdnCYEE/C5bjsKST5rBuYTDW13Nlo8y+AULcON2gE+snZSLSPDqCg/8pjJaAwnm3UfFOMochqQnBjJFOQLKrwWyadFZ4EYLN1TwN50tHm9bjw2IBBvd5WKiuWof8sHYm1DU9a67h10tSAJqaC2/mpd46qE4t0SdkCbgRZXZsh5kDSwFHBuuFypsDy8qmLPoNwqIWdNSED4G57wQTpDWav12/XAgZbPbK2HlEtbKo/Wc3z4lpF99XbnrLjguIr6vf8t/ae7TFbxjB+5VtLKnY5m6y5eWpRkQJluV9JXG2jjX7iQi9nKs8L1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+tA/bpn8HTwgEVzSAqdPa6P+jBjfiEpLD+61LMy140=;
 b=a5MT5Oo2kNBWYgWAdscd5XHh2axmZDDjcHKuRE9xjIGkX5WRacrsI+bVykUT6wRrM+UiSq1eJ/r70AODeShnI/j2PHRHQMg+K7mH6DKyfjwULYuzJB0f0ZbkNRDiG283EX5dLGvxnfMby+j8yV3A/hn6PU17fN2nQyihT4AussrAorUTo0z9No5yMrDcxR1WyQTK0YRUhFwkB+py4y2c4F0n9BL8MM1i36i+JRn34D1WzdvXiuKKQge7IFjCNeLeu7/x10sUbQrsLGM4EX/C0zE4eItDntQke6Z1ZeREn7/Zuh8WOrBB9Vp9EjtQMC9MB7bbZjNMt3fCFbMzdcszpQ==
Received: from SA0PR11CA0177.namprd11.prod.outlook.com (2603:10b6:806:1bb::32)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 11:11:08 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::5f) by SA0PR11CA0177.outlook.office365.com
 (2603:10b6:806:1bb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 11:11:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 11:11:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Jul
 2026 04:10:51 -0700
Received: from moonraker.home (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Jul
 2026 04:10:50 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Don't register sys-off handler for multi-socket devices
Date: Wed, 15 Jul 2026 12:10:37 +0100
Message-ID: <20260715111037.70970-1-jonathanh@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c7d61c-aad1-417a-be40-08dee261c50c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	IKoKTnN1Wz63SOIsz6foKrPbXVNtsE+C7pFLpoQkyXJqWijWWVhb0T0NEaM2jqcQ4QVkUal3ylxwjLP0UsCTGZT3qZxK/5Gx2xj+1A/7MzLmytlyAIleathh+RMn0bxRlfHBGPXKWESfqZzZjhPhsfbGZR2weKAPuOXD2SM6AU/Ew02DZwZExWYfPQVmlZShnDWKw/Njmotje1ry3lt6spHkq00mZrcvQRfGL3i67KNDiCf2sssgYwQr8OFNuo+k+dnBUX/8ACbRMAsSshkRh9w70FERDAoAvuH69dTmR0ZtIXc4t6WSKafSy65dqI+dwJrdltnoIFC6CiW8FL0P280ezAR4iNpXO33ONGTC9Krt/taiBEfX41WRXqe3CELQ0x658vGaBz1b66LY8mWjfjTQlZZQJufKmOnAPLGviVvfVyTlfpDDsINqMLk7EKs2jLAtCtuOwRSPkt1YyU3MW3rNG6njS24RMYUhd2MlbYkYnNblKfIIaNfL8NzaMg+n/gEvo5VT2sNf4ZkpfqC5OPBAErgPJBqwLA20b3pTQr/68Xij/QnEx6dxAib36h4eB2xf4u/Gvsa6ntN6+CBsrBQXkYDxLzB78X1pevyo7PDt89G4Cgkt7tqLS9MJIk+GgvF/HjPDNW/AnETWVYMHUsOFP7verJfER1JKTOBmRrM6Bt86MFC5km9a2FWkvneMsLKmWnrthtna1T1g+Wtvzw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	70wtFNmltewDjw84QwDK/tM3T+tQ096x8IRckHIryKww530P/aFbxh6Iiu3otZGhdO/Og8UJ5Bd9fw49fWZuNV3wDprVb0NtNrEJiik1Lz7Bxz2SvusZI0W7X0vVEm5hGejkztjOUdldQj2CjseLknYlr5IicVQAkNZXxvaOY6TMmRo0RzOGJoO5geYbtMNstk4Bq7DkjpT789DkY1bWvWwKtfU3l7JUiCZtwi8dLe+K4wKylAxfMDg7F30JPuPI1JU2eo+q8s/dBpIetZ+lA2TmSYNNcJ4S/98zVMQfxjZzJvinQc4g4/0ESbhuPUcyy7ye2uoyEZeQcbo//dQgV0awbpuZubwxZzivAl7SeCrlBNIBtwh+Q1j64nIwOoup4kUWJ1I2nMOWxDM3mQdVZiMjYTClvRuoJOTUwlx72xEIKu9fUcn/vgmp//F+iHG5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 11:11:07.7473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c7d61c-aad1-417a-be40-08dee261c50c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387

The kernel does not permit a device to register multiple sys-off
handlers for non-default priority levels. Hence, for multi-socket Tegra
devices, registering the sys-off handler in the Tegra PMC driver (which
uses the low priority level) more than once fails.

The Tegra PMC sys-off handler is supported for all current generations
of the Tegra SoC, however, it is only used as a low priority handler if
everything else fails. For example, on Tegra264 the EFI reboot handler
is called to restart the device. Therefore, for multi-socket devices,
skip the registering of the sys-off handler to because this is not
critical.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f419a5395545..41ed716d5857 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3074,15 +3074,18 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		}
 	}
 
-	err = devm_register_sys_off_handler(&pdev->dev,
-					    SYS_OFF_MODE_RESTART,
-					    SYS_OFF_PRIO_LOW,
-					    tegra_pmc_restart_handler,
-					    pmc);
-	if (err) {
-		dev_err(&pdev->dev, "failed to register sys-off handler: %d\n",
-			err);
-		return err;
+	if (dev_to_node(&pdev->dev) == NUMA_NO_NODE) {
+		err = devm_register_sys_off_handler(&pdev->dev,
+						    SYS_OFF_MODE_RESTART,
+						    SYS_OFF_PRIO_LOW,
+						    tegra_pmc_restart_handler,
+						    pmc);
+		if (err) {
+			dev_err(&pdev->dev,
+				"failed to register sys-off handler: %d\n",
+				err);
+			return err;
+		}
 	}
 
 	/*
-- 
2.43.0

