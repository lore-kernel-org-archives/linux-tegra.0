Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D43EF0D4;
	Tue, 24 Mar 2026 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352584; cv=fail; b=c0bJ13YazhfbYqy8X2NMmOl57SyrxE/pN8ghHxGeoL77I2iV9BjT/o8/0KnTWD0gVymeGr8Al/tTdUh1N1oeYHNmRnt7C2anR01bv9WW5N/ftb6kj9aDla2rhLTFxYWgzVh9GRnWDL3t/Lco5sR2QFGis2Ux1JWXjnEHNaWcScc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352584; c=relaxed/simple;
	bh=TOkZ+6i7BABVnOt/yDRqzDw3OyX7kl72WNevvDiqRH4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lWQ4mJ3Ok/Tpo20YsbqLNY28YueNjferLU5Y0/RHkEI7+1c8iEIakhnoFM3RXPAumMhpPxgrmR40UId8QkwEnGkWnXlshNr17YuRsNCEnUgf1vMb+puSwiIkHhzJehxlLA5UbTFS82tpqOmp6zGsrf0BXtKCVMyhvgYdTNZ6oOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ua/4y3Hj; arc=fail smtp.client-ip=52.101.56.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ua/4y3Hj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFesgPangQabxx62sgAQzObkOI1EHWgI3Tm0UH46cfUyQ9h6NNzU4eoUNIbtGmmb3j1yGCzFmtkCtDBoHl74ILd5e9PwjESCGC1wRUcoyJIz96mMtYiJKS1hTg6F+ys9SWqQd1re5Ra8XEsmdKOws3CnFEzIiz5/h2iPnBoMTzlgUZDvpo+2LrzV2VzpUuOSx8f0aThY8cypo3alpeWYRWRBYpjm1yI6uGOc63qHJq/t+LRmxI54Fq2hwXw8AsfcWB44QquzcldwbWIR+Q/Up1sXL2bW6FhDS7Xm6EogZqahPbKwAYalJR43eCFP0QGLOIFCvrgBPXFh2B4lTMlhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZgBK/sHSh5TfACEx1gMah1aWZdELuNCL19VwCQLNMc=;
 b=FxIXQ5zy79fSKVMR14/2F6g8wyDw4R6sR1gvfbIMQcF5/oH/p9MmTER4e9JJhYlTrCyjnSliDorpClhuOOV8DgahpXUOYEnlikqMAXuwAmEQFZkOcbPlUpvkUqHvEGFAYi4uDJPnWdxv1mZ39D+ypgL9/uzOKBQfmiAkD5Bq3rHbNn6+DdP1ryTvBkGgJHa0Rwl98w7F5QoLJ5KVejDcn7kPdR2vyaaD0/fksey1aM2Nvi6JdQcfKmABvU/jqV7T+C4U63B66Z73o/mEFCBvyeOEQEY0gFsucdvAuI5e3FcZ7gAQee4HRpayIvAq71FSXx6W7Hu49siW6OzMSbtp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZgBK/sHSh5TfACEx1gMah1aWZdELuNCL19VwCQLNMc=;
 b=ua/4y3HjUfNdwEkPpvgWtD1nVnk3hfzahN0Ri7wpST6fFUdwqsBGDchG0zoA0jeOehRWFUTpr0bvO9LcteDBML7DdedZbWeDMU3NIr+eK+tGRkPP1GFebTS3Sed+t8QqFa9SLEnZcLCbrhIYPrNTrqXmTm7vWddkynQcu799uMIAXbnGOINKTxW0XAYTr/R06MpxG+xnUWuJ04vK8c8Pf/chJt8r4FJ5L2iojE0WjDbZW4w1ssshd+95fAUPDAssqs+Y8+L2BhPm8XFLUW/6J6y6ZePhF014jhkIPk7vOOeyOeuuP8YYA7I4wCDuEt6pg0hX8Y3MGmyr8MVaBAjpJw==
Received: from BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::31)
 by SN7PR12MB7346.namprd12.prod.outlook.com (2603:10b6:806:299::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Tue, 24 Mar
 2026 11:42:57 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::92) by BN9P222CA0026.outlook.office365.com
 (2603:10b6:408:10c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Tue,
 24 Mar 2026 11:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Tue, 24 Mar 2026 11:42:56 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 04:42:46 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 24 Mar 2026 04:42:46 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 04:42:44 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <kkartik@nvidia.com>,
	<kees@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] soc/tegra: fuse: Register nvmem lookups at probe
Date: Tue, 24 Mar 2026 17:12:42 +0530
Message-ID: <20260324114242.551939-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|SN7PR12MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: fc84d440-a09c-4aed-d23e-08de899a7e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	46xmOxB+T22GX45hTvBYEZ5Fm3w26RDdYWeuVizMoh1QhEIZijf3OheActtBGkwPBHQMQUySv4o84TCfDePfBZDgAvLd5eBTp/oUg0t63xlLyW8/0ltpkY4uCLbWEVCcEK8pB2ajmJv0zPQHJcm80hU67RzQOlLAwV4LsTC+N/228ytvtyKc5PnRkRvIeZ3HRlNWZeOj9Tn2TfVQfvjHo+Rgbi3/plT3p1BWvJEVTeoRpBe0z5keCQWoqCz50bmKatu+PPdhWoLQqhdD4M872PbHBP825hpZFMzJf/PqgbeoaoVnFMlqTa0rudm+ykgWFa6nn2+gCFQ/XUuLQV41rCPoWX79cCugO6mz27Lurf+XFdpL5Qois+ze2SG6mdAzjSY/S5yuMwigcOHeV21HtHMxUtDnueWZhZC8S7I2li0JqZipwSJabsD97ZgO02Qwjyyfy5M5Czng6a+7r7FuKz+xi7HO72egu9eET9VSE7SLem3ksbJz98R2e4D1mQxmEN43+w99TOGUiuebOtus3rI0GgbSayYcF186WjndPV7pGAZDHdgop6or8YflbCrppcXumh2bpmXHM8I7BLWhbDlFxgplN9iLfVyU6vavY30hFRXKVzpaPyMPQXgMjzfDU6CMKRW9It3kMt1spMF+KJpOd99BFva0QKZOuS6UVnzBOSfX59IgcB+/5l5n0neyA0qZDmuZS0CQ8m206p0zXzVmhfgj0+F0dJS44hupQLyFV9WEymPByI4GtUHmU2aUQC8wyJoxGLo/kFjXKr3bbQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w5cPo+nV0rpGuE836xYn67/HQ4HF92odL50AFbm4vlFO6uKxV49CXalgrDKktrO8dhh9hBQKxi8BxstZ8SWMBtSMw9S4BCJLC7DFtopithwPpn7ENzitgwm9QRRRWh8rmtRF6of0KYR23dNAaZIqnsnqgZj3DWBnyQ381q5FZuglBysTUC38iHa3i3Oa6si+OM42ybjACC79/HQeykHPu+EfektPVwqre4MvJ1elbaLTSYV6x4v7aXSFCmdIhpDi+cOZ3DYVAEm7tU5GtGc66mP8A9K8fgO339LOYXXmcvgkQizCtVM5kd1OyxRopD+ym/RlYGZvQk5YN2HkqsXQhu7V7lheXTJgjvtcT/DMJ4R7xTyE78VcezwJYwshG3CPRMaFZBySCG56Z2PAas9RjVJWIRZ0mX4NgYUIDhfZjqO1ySa6pmmDGEmsDBTxeMRl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:42:56.6638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc84d440-a09c-4aed-d23e-08de899a7e34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7346

Register nvmem lookups in tegra_fuse_probe(), after the nvmem device has
been registered, since they can only be used after the nvmem device is
registered.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 291484595dcf..d70ba4572c75 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -182,10 +182,6 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		}
 
 		fuse->soc->init(fuse);
-
-		err = tegra_fuse_add_lookups(fuse);
-		if (err)
-			return dev_err_probe(&pdev->dev, err, "failed to add FUSE lookups\n");
 	}
 
 	fuse->clk = devm_clk_get_optional(&pdev->dev, "fuse");
@@ -231,6 +227,10 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	err = tegra_fuse_add_lookups(fuse);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "failed to add FUSE lookups\n");
+
 	fuse->rst = devm_reset_control_get_optional(&pdev->dev, "fuse");
 	if (IS_ERR(fuse->rst))
 		return dev_err_probe(&pdev->dev, PTR_ERR(fuse->rst), "failed to get FUSE reset\n");
@@ -566,10 +566,6 @@ static int __init tegra_init_fuse(void)
 
 	tegra_fuse_print_sku_info(&tegra_sku_info);
 
-	err = tegra_fuse_add_lookups(fuse);
-	if (err)
-		pr_err("failed to add FUSE lookups\n");
-
 	return err;
 }
 early_initcall(tegra_init_fuse);
-- 
2.43.0

