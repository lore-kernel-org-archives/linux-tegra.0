Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013011.outbound.protection.outlook.com [40.93.196.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D38818DF9D;
	Wed, 18 Mar 2026 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817927; cv=fail; b=ffTm13fFTkBMI4VGFd+emaL1YjBwsDKvi0HaxtVr0QFEirfF+dhif7oM0u6gWJyKT1QoLxXx6mYoLJNhVFH+vT5cAK8MRu5zf91zN+J2OiWKPLS4DCuOgO0Rx+grvMCDsOUdXrdcnwh8i6U2PZR4yhTEQ7/6zPUxDdY1hyGKn/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817927; c=relaxed/simple;
	bh=irsgEoMkgjejnL62B7IQksaFWq2MHGUlMhGpTQjZD1Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i9jONPnY4GEAQnHzTRTI4nom4ks7zNHapLI54YZElyNcaHmNqjJFgykzx4BlT/HRJGTN/rDlfgAudLwLuV0pk4ut+hjAV3RcCGfwKIAeGUSOUWO8WXJAHT0K9usogpl7EdqwwrlOrFtGG9USajij9eKZQcc2PkCxeIfG3XCGD6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=REuE2IIN; arc=fail smtp.client-ip=40.93.196.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="REuE2IIN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQNSrIa4CFumZzsSdP7pwtnwiC9zsPNhr0xP50V2SgB7dcU5dlO30iaSnVQ5seBbOE/LUz1DIHN9DN8FXrzOzMM6StTtvkPAgjwBOu4LzekNkTx3Py9nK5y1KPfx3+bt9DBLjfX4S/z8sBcgZuVEKFO5eizroBGG0ZP34V3YUCg4WoPVkUw2VhiZoTkOkNUkRlV1LYSgFcQjqPq8nTF6i+lZANTirE0s6HVGcAVZDtj/Wa7S1ZDB/AUEOQ1E4I0tJHoSKZEHNYX//sMcatOZa+sem+1ZoXrVuRgBhjfYPjRaSZY+ASKJ7J+vCa5w1VaN1G2K/2XkQ2aBIN08vE1QdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMayQd6FG8tN8viSp1K3DN4tBJJS1SIioq6mBERTavE=;
 b=f2RG28XZh0vA6UwqTdvm61y434F8sr394iiFfitlR3wgVMMr0vvi2k2hr8MJbzbJMj+wmTU4FwEjIyjs0AzHVQDWLV/jYUHK6/Nz/QtRXHQnRKLs/+S+8HHI61KXTrgh/wkkqHinhdNRCCKRAQuKA7lSrbyBN1DJwlPyqJONe1ZV95hMNtlCa1JWSq9ny/t7eZCwKwgd1Op3gxrs5z3nBajZmR1ByHT3lOZjyM1Lkl1U+tXdwzudHUxqkf+kyxAJz0Kat/F1H0wPcflVFdlIwQT0SUf+hn03txl230RdJOYi9ppqsjy0I0VdYPxYcOG2RG81BHjt6S/VgH6UFab3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMayQd6FG8tN8viSp1K3DN4tBJJS1SIioq6mBERTavE=;
 b=REuE2IINLZL5/8KGhJr7BaDYtxdXrtO4biotNn8DIx3HkX7NdOW/I6A0zIRB5xRZKMLQIMzzyvkdfI/oDrBvAs8tZUA367K4ZfT8SAIhhMGdI719g7S/ltxzo+K0wuOCPKh/HfM2UchRi7OIIQ7tVxWKr27iHowETzooxpvBAwgpUoY7z4mHrLWKAVklt2pddu/0vGsVPtzRNVItVt0HywEbzQbq7FP9PZOzdWWgBd326XbqFNX05x15GOCPYNx7Y/8cU2evjsJpshHMAb3+upMApckEVYKK9O9HkzafB3jV7oXaAbTo13HteQCJvoqiHsQGQSeWz0fbOwONUGTo8w==
Received: from DM6PR11CA0055.namprd11.prod.outlook.com (2603:10b6:5:14c::32)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 07:12:02 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:14c:cafe::d2) by DM6PR11CA0055.outlook.office365.com
 (2603:10b6:5:14c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Wed,
 18 Mar 2026 07:12:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 07:12:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 00:11:46 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 00:11:46 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Mar 2026 00:11:45 -0700
From: Sheetal <sheetal@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>
CC: Mohan Kumar <mkumard@nvidia.com>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH] bus: tegra-aconnect: Use dev_err_probe for probe error paths
Date: Wed, 18 Mar 2026 07:11:29 +0000
Message-ID: <20260318071129.1758058-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|BY5PR12MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a359f11-6065-483a-e726-08de84bda727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3+rOlVHaJrIVkmFyttViKRnS2aN31sLMyipbprxk2eK9w+SU/8bUVLuXZbX16teGQTFPmDjLovf12fqK0+qJRiXEY8BUIpm5cgjckq8JHbSxAi7Nl+tLj+ExjRds48PAnqfT1/udpYFvFLZVocqqAdhF2MtFyZ61kCJMFEVxszpHZJ61z02p7KruEYvc3fvFnKPXxmgaRAYp5hesAHoyHhtOA7dePRBM1J4Bey7ObERqtNOPWW5l9+yJayAagJ4cxEP2aAnvIm9i6Zb53wymi+xYyF98SIrsDctLEAAG3Nq2rEK+kLw0mAda/P1Mt6kbwzMzPjBxzQ4twGoF7iSbln4kz5J1YXBGqzqhMzWKx/VvWatiHxq+fmraQJgiebc7RRGwxPbgayQafY7T2bJnsLmp0ntLv5XdiS4ZTtOkHw5bBwLF7pcHIVhPrKo9sYo8hSzmWiMSikfewmyhigtybSjvI9YoNinE/ASQwGJJtpuvUsWajqbu8TxoCIo9Lsj8cuZ6veE7HKKtNnIZjfhcuFIVgRSNCam61mJs0Upwa8vKKOrxOzx9+K7uaO9rlI/UAzi+XBi4uughRHC7UAGLDCelDTnExv7dzStx2IOqeQArYToeSySfyrEITqyRB3Ql2UISxTZTIZIh6h3kchvkRtI0OaMOlaF7kc5j/rnesuLv7q8SWQS/6A7peMMi8oKCZcyNzMXme/vYEqsmlovTVMiKvplN2bWxsiZNm0BVDlYT9E4oSg78XfGBhXp/GaJ0+N3u+OT0aOEG38GtbV5KAw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c4Lk1OTI7s5qvIp8zx/TEasg5yTZwdXPT55NiA4XV9iFDUXFSTvhxSlYtJKr0DLaZOYbzm116qFIO30kMwYjMxd2OD/Z1PqZqml/taMOI3tMcPvlhmDs+6qGR8OOmz2ttFY+I42zNjmq4M7odXRnRu0MwlPzacJpcPtnczD367HwMITmWFvK4JgFrJuY/FQ4kBA1NZ8anhuPvcfpbAFURPC+Q1NFsxhn3B6ti83t8Kk1x7zWsGe/tjsdvY2r3Xkr/+kKBYT79QXu2bxC9ilQZxqodHqJpM78oogg1AygOcr4UMzN0RpcIgtYDapE09ZzSBUwJ5qE43Mznt9GsptnH+SBh8eTJ0fAl5eM5miXVYaD0DAUAxPLh8ZlBSdyPt81pCV6kPS9Hr/rqarWYyeoBPOoKCuftXdX6mhoqe4+syAF/2dp+pCfvyE37Ltl9ZE9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 07:12:01.9770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a359f11-6065-483a-e726-08de84bda727
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321

Convert probe error handling to use dev_err_probe() which provides
proper handling of -EPROBE_DEFER.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 drivers/bus/tegra-aconnect.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
index 90e3b0a10816..9b2b227332b2 100644
--- a/drivers/bus/tegra-aconnect.c
+++ b/drivers/bus/tegra-aconnect.c
@@ -32,16 +32,14 @@ static int tegra_aconnect_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	aconnect->ape_clk = devm_clk_get(&pdev->dev, "ape");
-	if (IS_ERR(aconnect->ape_clk)) {
-		dev_err(&pdev->dev, "Can't retrieve ape clock\n");
-		return PTR_ERR(aconnect->ape_clk);
-	}
+	if (IS_ERR(aconnect->ape_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(aconnect->ape_clk),
+				     "can't retrieve ape clock\n");
 
 	aconnect->apb2ape_clk = devm_clk_get(&pdev->dev, "apb2ape");
-	if (IS_ERR(aconnect->apb2ape_clk)) {
-		dev_err(&pdev->dev, "Can't retrieve apb2ape clock\n");
-		return PTR_ERR(aconnect->apb2ape_clk);
-	}
+	if (IS_ERR(aconnect->apb2ape_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(aconnect->apb2ape_clk),
+				     "can't retrieve apb2ape clock\n");
 
 	dev_set_drvdata(&pdev->dev, aconnect);
 	pm_runtime_enable(&pdev->dev);
-- 
2.17.1

