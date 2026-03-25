Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8890939B975;
	Wed, 25 Mar 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433742; cv=fail; b=PJ6yDMi2ffxyH3WD4SxQdkktHAh+rUyXa4bWwY1hh4lc4FrE9yG/p/B86PpCH+9uYDajMNWzlfnQ2YGyavMtHbk6zoCfz9+F+JjxYjfAn0HE+aqd2GJSbefSo/NREGdE800Ns9wIc51oKnmWVGvLAJoHiEkLmPxUz3n2EcyXtho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433742; c=relaxed/simple;
	bh=K7f1Msv04YEoPhPN8j1BQn8LaE6rjzmJd5sM1VaOVXU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAUqujo9Zr5RpLK2Iy90Mf4EN15bEVDHIkGzeVvFWruILLU2Vi7DGJlnG4D3XEmPb2pJbVfCTIdnte+PAD07OjzTYG6NIfe18b8E3WSrqln4Tu7UotQV1k491EgCa3GHhA3OKtlmRiz/Utbkuy1DNvP/oYq1FzNeAqAL9vRcdjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k7W+fis2; arc=fail smtp.client-ip=52.101.57.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k7W+fis2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUCLO/xoMKsiiGSJ3wQf6XsmQZYKjhZt2z0syP43nDYImKkQ4U1lAWtWdfwnzfEEWcjjrnHiQ7K6Cd+oin2G2i7m3BwrZ6dwqE+Clo9jSHb/9Cklpac2Vhq4aAfVWTqz6zo8OinXmdOuHxPvoz/kzntGK6AGb2LaOvC0YoN+k960emtJS4Sor7iYFB3CLXytW8pIDjEag78cNDaMV8JXfi0Z3DSnQeR023hn3QItJnfHlvtbAvX4S5cNCehclyy7REUA/M1vCuXDFFArwcavCydUN1RYjq4AmoWWCuuXEvQJfJi9GZ6+IJQWPmcJ2WwfPKmp1kVsgt9qMIWI6kRyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/AlCPxmI+33MtBqDSDf3fiR8KmrgCDHy59ZF1J3hoY=;
 b=EcnPg2Z8PwgHipFNuwfbcQEUU0AKF6F7+o0pB+DVsTQOptZclo22hx3KY0LPU/mqb4wDiOpNKPb2LZaP7O+B/xxvUVMWIbV1tqnNlvBYNdgZDcQ8hv/hKxzf/nuA/aWEr0y50PurGOOUa4t/pLO5CV5Uy2jrqGCPuipXWosieQyQ6226tSsVUke5CmOAjFhmWIhVVzwx1JPrlSKxBSRkcam4HuHLT+numZpHRe4QF97R8nPmOHJ/R4ijun1dGkQ6d3Gs6A3kO1sftGl9ZU/B/qGJjEWgQtXnDu/XeA5Mcz0lOP6CQvmng/lG2SUyOEUkeetloswJnrs7nQpGbjgQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/AlCPxmI+33MtBqDSDf3fiR8KmrgCDHy59ZF1J3hoY=;
 b=k7W+fis2Tklnrs0T2VTV6+z6jpKZQoxNEf8OmNHLstGFl3a1Uo/OWauqsvSbdFtDWBOdz9apxcmJedvPxDqb8ILCt8LLf8mAnSrxJug9SUDMfw6oOa9DJCGycNDKNvt1Nn8+wohEjEBiSTZrgDmLlVXok67YdK0zEDVZHaAH6ExhEeJZzl3I+AUY/01sunLQbS00PT2DVNiv+kjpcW+OcFwVsWOkyOt6uREywJ2I0mfqOkOFwt0NQxmihhzNsZfsyCLfA2WfCw9D2IRaroxHviNW+l25w24DEaJSwA69Xt1MeRoIZcU1CaMj6sVOV7zyeePgsqdym6SQpiDwbqvELw==
Received: from CH5P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::12)
 by DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:15:33 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::ce) by CH5P222CA0020.outlook.office365.com
 (2603:10b6:610:1ee::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 10:15:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:33 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:21 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:21 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:20 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 05/14] ASoC: tegra: Use dev_err_probe() in tegra210_ahub probe
Date: Wed, 25 Mar 2026 10:14:28 +0000
Message-ID: <20260325101437.3059693-6-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260325101437.3059693-1-sheetal@nvidia.com>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DM4PR12MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 6679a675-4b59-4f58-30db-08de8a577372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OI4ybQI8cTL6USQcKND0SULzv47EVNoBnFaObuVHOeC2SJrOLNenTqJR7oUL+7Ce/xYj+PyD96CPztTmZKVJ6rbKV3u08suubo8PX5MPvITbeRv2DK/6EdNDOVHtLdMSnd6xCgBg4tjulAZrvu5f7McAPN8O3G6teMxObR87DvqNXJ3aBZ6aWNhOVLcdLtP1J6tUX4op6LlqOX98DM2hB6m/R4RaO1HtmSSaYbV971M9ELMEBbEStc9bQgYU8Z/V0srJ1yHEv3O6hBtgKkIVelRsPWnnK0ZnGzoX9o0I/iz+55HzkQ2Y8nt6We2wXlcIPKY4soqFpOE74C1msxQ93ghSK0Qc8QZCMIp/6FVT+PZNMNLhCT6N4qVRFWI1ii5gjkfAUt+2TV/BAHFwGBt9tkA82ljFczQWX4TlUr5L+L6yGBw+zexBUu+uKrmlZXS6csgyvwXSjEFA55ExLUU2j+Zd1DfHI4pazPW/5EoHag7yoVK5W8NU0Kr9a1kDcV6+zuCko2vJp83EZfGXTEdPQktYmfqyYlCz/f94bp1RdNv4KSRTI9yWjG4YS1QgPPXXcgRumUrZtXaVpjjOpFDsoTYiFK+28Pc/4jyX9YDSkRos+WYUJ7pJZv683LeuTgRAqd+sdYVzH9W3LYzDY8H1XWr+6CIAJ2yRK4Mi4YvrzUNvbr8uLmUTwGk+lZOiLLNYUfleg4C4w+d4Lnv/KCQad2vcO83RUT61O7GAf/16byMeYvijaui0YsMAEYSQFDnJ4JAnFMq+pzOSfACQdfwdRw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EwmPtDKaNZsZfPhSo92wN96MXL0C2CdOE7r1aKMq6LMWvZfv5GEFdsu+vJM4A78ndkgIY+mobliAb98jSDWqDjMejR2Q/YerOsGrYrYh4A/bEvDrtl02bPr+idisQbPJVh9Jb3fgrV2VJHzieQGdi5vVPgg7pq4b5yG6PAHofFc7W8E8WcunnRWSm4fVmAm2Gn3Hel+D4CmRYLKczITHR8lLFu5T9//IK03iW3Vxgwvs3T3KxRy9x+2c+FhBb67Kof20Pi6LQC1IUqfm/pTOG4vYEGA94GQ3aA48I6GOLjsyWMcBvk/6LHcRduz/pO2bX+pDJtafgXHwaA4rbc1WDKOoaawiOM/itFjliUYCqCaSce3Db+2cEQt0kSxIofCIfQTxahG2r6SlPSP/INEv3blE9gWuH4wUJNqWf8xESpyuKfaomIu3J60BRAkA3iKc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:33.5374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6679a675-4b59-4f58-30db-08de8a577372
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663

Log errors in the Tegra210 AHUB probe path using dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 43a45f785d5b..4626dd0a4d55 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2265,10 +2265,9 @@ static int tegra_ahub_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ahub);
 
 	ahub->clk = devm_clk_get(&pdev->dev, "ahub");
-	if (IS_ERR(ahub->clk)) {
-		dev_err(&pdev->dev, "can't retrieve AHUB clock\n");
-		return PTR_ERR(ahub->clk);
-	}
+	if (IS_ERR(ahub->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ahub->clk),
+				     "can't retrieve AHUB clock\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
@@ -2287,16 +2286,15 @@ static int tegra_ahub_probe(struct platform_device *pdev)
 					      ahub->soc_data->cmpnt_drv,
 					      ahub->soc_data->dai_drv,
 					      ahub->soc_data->num_dais);
-	if (err) {
-		dev_err(&pdev->dev, "can't register AHUB component, err: %d\n",
-			err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "can't register AHUB component\n");
 
 	pm_runtime_enable(&pdev->dev);
 
 	err = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 	if (err) {
 		pm_runtime_disable(&pdev->dev);
-		return err;
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to populate child nodes\n");
 	}
-- 
2.17.1

