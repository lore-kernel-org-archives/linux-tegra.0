Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B27224FA;
	Thu, 14 May 2026 05:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737738; cv=fail; b=qevdGE1xllgZCjOjwtGpHKYy2STjPivEgnJ/YExmln3k5jLYQeXSQefhb5z3wT/UGGP2kn+XOcjWkRc1Umm8+VHLrUQiSlCfZML4JHrLWz36y1Tqb3oExiK8xK5Tf6FItBzSPqWzp9fvCmjrot21V3jNauGhjd5vQD4EIjhj5as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737738; c=relaxed/simple;
	bh=uSZWoFF81Yk6x9YvZRo+itAVUAXpBlUaqWmXJzT2HUM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sOYvMI6nq+Otg6YATtuvBgkMNClJIvbAOcaSt3OMuNLIdagI0XEqJ80sqHZqppojpqADcts7jkM0fSUaniJKqbM+ibOWNJtSxryKBOnho8AAN/fqMAx1bGGV6OGRa32Wcaw7VdyfYKtkp+wAhSLLES5ekwhUbOdSwKm1R4+edN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EgHGil71; arc=fail smtp.client-ip=52.101.56.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EgHGil71"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYWVnpJEGWe3y2nDN/j+3OqfbxeIZcvcm3WiAtgvMnQkqeXvuot+thzHRzKOxF33N0u4yXWCUyjBm4N2F0qWXlGtyKxhKioyr4eCgByZo70rEZOFXI05tj2Hy8fWXO2qCUjPXwfoHSsNloO4i9q1oWapf6ejVfmNeT03biXsUjJQbpImJw6RU4mLhQIxewCQpnQukdAjHVHbazZxJ97bJeBAq+96VdofpsiM9IfBszp/waepPxV7OYDUDyELURCTJC8GGGJSHcycavlcIDfX1HffINx+RkfYPYQgn25pI3pBBStDpo3s0rV/yYMDcp/sdStucUt23CTzmcXcBAc43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYila36lW9pI3kBfLMporOdIDDPApZx/DAFWEBueNbU=;
 b=Tu3lnyGq3SMAxSPeLhL92GmIgMbSb66vVPQGzgmZ3ryKjBK5mFdqFStIEgfxmoRHQQKTiCoJjR2Wz7C09MTFsBkNovIfI08wYaa4xpLlBdyw2bxc2azWbAgThj5lOb5uEauYpAD5WGRMRIu05K7iGMAleB0nX7Fp56X/pRDcGh2IQ7b2P7o/8nU/KobfhHTMwERWtNpLUv9TTi/xKvGtMlI7x6gBNIXOVNBRVjxs9ekouz/dDOY6jZi/uE3XRpMQPkQ+AMIB591jTPY/l+6Bdqng97oWJDBTIpAuQTyahuweA78/pUDLaW6gHKgMCRMcN8pxVnLjUUrracrMt2iuxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYila36lW9pI3kBfLMporOdIDDPApZx/DAFWEBueNbU=;
 b=EgHGil71HXtpx0fR9NqAP/jShJ6bXH2vQ/4UBT7nEjPCsXPxJgnBI6TUdE4yEXTZXl9P4vvaz9QqruQZjQNOLIFl6Rd8P11JFnB1+YAgFo181wU7UpdG761rajGDrgYKBGP4siq9AF91RXnXT+RzHcP+6oV9D3FB/uvJXriy33dWhYBK0DhQ1ekn4eoex2GDOJEE8pzCSk3BA5NO74lftvH4+wCyxnNunYbYV3qeJLlNo45bN9buK8LwDYFsDVQtNPaGwd3ENrajdg+z1FqvsNcHT9LMzDpNjVglnknxJH4n8/VTVOdxRF5KHpK7Hq0GF9zw41iQ2U8KjdT0AubCOQ==
Received: from CY5PR10CA0028.namprd10.prod.outlook.com (2603:10b6:930:1c::21)
 by DM4PR12MB6470.namprd12.prod.outlook.com (2603:10b6:8:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 05:48:48 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:1c:cafe::e2) by CY5PR10CA0028.outlook.office365.com
 (2603:10b6:930:1c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 05:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 05:48:48 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 13 May
 2026 22:48:36 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 13 May 2026 22:48:35 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 13 May 2026 22:48:33 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <kees@kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2] soc/tegra: fuse: Register nvmem lookups at probe
Date: Thu, 14 May 2026 11:18:31 +0530
Message-ID: <20260514054831.2403078-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|DM4PR12MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: fe13eec6-5cac-4500-a522-08deb17c782e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	2VaMqkK8mZ8kWr0tcOgvJiYY903M+0XtixRy8SdAZOU1WAuA7aLN2hCEf60cBBWyh1eiIZ2OgQcnHXM69gbcZnBe6MAhBR/d+jgXluLvj3W4b0uXg9bx0q7jKh7K44awopEkjdzY6HU8olUQyUQTij4TgDXbQIkc+xwf6vVgZxVEr6wPRsHgMnLL14zoYm3AA2DcvWlhkSfHtiN0UhOTXL2eIPi/OhjOvA6IpdmpJd3JE5E9WpvfzT0HF60+rjvtSQMayGZJsV1JT6+OOKl0h7P7sUsNNNUIsD/NBgBEvSyjwl26TFHgQDbVYhHjxF2xfCNBFBafJ5wb29SyE5J8C4YvEA0wEreK/SrfLKuVq/eLFzeTgOeF+vWnTQmL3dDkri8KhL8BFp1npiOFCiNphCOfCdCAR/DgR2rveMM82uV3KlbFy5bmfZxFmcneF7EU/bA5g8jK64JU/LGfauRf9Yh+i0RWdnV1QuzKIVL1wmRiyiOHqf/hefx4kbtOigLvg4MnPAoqnCjO8vRY9E8gyXRU2yxJtII8Z/O9N7cfmBfiNAYPzMabHieOadd+Jy3CGX1rhzLfQC9lvXWr3pEO2JwNdqvDxuWcv8CgqoKFMQNzz6bhra0/2AqDDyhVTUBi8sLIjSIK66vHU3hawec+a+deMa0xE80mZ0BbjhBV4uSnkAaZE9GbVanFn8xaEfbDLj6EKNtqJ51cdGYV8V8Q1yVYUkPuPt3cfzYEM0eOOn7hbuNlc5SiAcgsAU8Onwk0
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5CQE+5ZNQ6GC+KW0agn1Aqviy+zhrjAocTobp4696OLXkphajblY2Ek4WONAyBcIsbFpUdVMjUYDz/cCuQHMG8zGP9cbiBXXG/eLJmHP55fKqYDOCibxBIUXMCfiOkhgY/lt/pHgcVYLuEcxYiz1ZJoevB0lm0mADE/XmOQOxDtRH/OFuQABuUpWskjl2OYlneuwjR7m+l1+7OfVxPPu9KUStq6bwvOHU1vtl3G4wujB4QvoOrJC4MJ+N30qLVFjHNACYi9H9Q0QyMSHo+VeuvqTRak0viQtoO5Xj//cwey3L7y/sRyQv9IeiSTMJOBIwJmZRyjQei2BgPm3cNPI6FECpjRbd55FvK5asiDhFApqhn+OxE10vX7/PfZq+mAtBWP5JfRxmYoFP+F4gD846qBmDZFzPJWqg6gLPy93dh1Tu7uhLYKQCBbO69iEp9Bh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 05:48:48.2342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe13eec6-5cac-4500-a522-08deb17c782e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6470

Register nvmem lookups in tegra_fuse_probe(), after the nvmem device has
been registered, since they can only be used after the nvmem device is
registered.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v2:
 - Fix build warning reported by kernel test robot at
   https://lore.kernel.org/oe-kbuild-all/202603251045.wm2KjZbP-lkp@intel.com/
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index f38107d04ed6..77a54124e9f4 100644
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
@@ -478,7 +478,7 @@ static int __init tegra_init_fuse(void)
 	const struct of_device_id *match;
 	struct device_node *np;
 	struct resource regs;
-	int err;
+	int err = 0;
 
 	tegra_init_apbmisc();
 
@@ -571,10 +571,6 @@ static int __init tegra_init_fuse(void)
 
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

