Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011061.outbound.protection.outlook.com [52.101.57.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546703FF8A7;
	Wed,  1 Apr 2026 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042750; cv=fail; b=TvUFHVH/1wFOFAn6ymD3WdL1QGUvyDppXTvwxYa2XrpANN2iJg2O+pbVmVdgM71BtX8IlD5sGJkllN3N2G1FGZwSfUNTLSlPyN8hi52Vu104yHl/Y2L27hfzbhclSSRFfsX+lGEdbNZmw0j9j28AQx1zQ8/yYCmg/60Xw+L1fQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042750; c=relaxed/simple;
	bh=EbIeRfsy39aSDfvWCLtcaWpE0M5QxkZOHoo0s3B5pOI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gynbjDgSUdlNDl+CCvtxWCucrjinXzsKKESHvlJbqMrgozUy4IU71pyf12M1LpWPAG3V/A+MKBhoTDjy4ycl6Ar1GKQ/Jz5TwY29wtg35/l+73FZFGalL6P+lHG8jNBclvANgVsQG2kZ6sWYKj1BvJ7XDDP/JmIfV2myuAgLKPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CTKsSZRj; arc=fail smtp.client-ip=52.101.57.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CTKsSZRj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMOf6BZB66k4MPHuIrn6Qc60kFEERDs4U4FuK5zBxHJkdVPZlpJ2DRlIJJJkmB0PWfIia+8PkDDDpHQaYh4MtLZIliMy4cDd+/NJxYv6icDpMf60DXdy9q38GK1tHFGbkuCYIBchU4vdCGR3X/bfKIIdKFUhp1TmdLjZGIeW1kUws8h6BJ3Th9mPuNeEh2OHRz/UpCn2j7V9lHP4VjnnUS5OjsinjUP4l1eMZkw8z86wtUX3glVZBfGsMOjADTmahEeOUTfOZWjWHuFJkMTbgBy95+UKCgOpxMQ6tBeDjfGbLfLN1vSG5Fwt/7LFbtZl7iw/SMCOwTIa9LLgpP8nMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB3265jc3QkancotM8dMKAIacfp+WXk8R5pBfM21fk4=;
 b=rMl1r6ufUjKAwGLkFpCQDogrxfxRImnAEmr9tLLvRFV2H9jfLyclKjzVqnFGV1TCjaIpZd6omoKK09hdU3P/zfy9J4FPzDEQ0NAYZ29tGqXFHl4GM8GxnGi4hySYGi3CA+Q5hF92XGrpXwwH4qiREwKVsxxjeII+cFSNH+bA+bWp6f1t34d2R4MWO+6LM3QyGu+qRRmGdl49tz2z4zu9eXbpww8QCULR0kfdzdGGE7Wxlmme80BnCLvKZ9Bw7iVpoEOFeGXoM0PDh+XzF3TWhK0WiJ3RMVkXxc6Wk+/LxCBmxK/cFnBhu6M5UPt9sz+Q0HzFlkZGUmS5gKE4xbmWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gB3265jc3QkancotM8dMKAIacfp+WXk8R5pBfM21fk4=;
 b=CTKsSZRjJFvjOnOl/dVtmFaqVfSwmUspwdCH6v1bvnX7go5gGCsN8R9pDoM7HzS68uHCpnsoJOQ5HOO0kx3JojHVAHb3PULrsMZXJss5iakU46jLiFatw887NCGnUkYebsN0AASZwDDrtNq29yUJfRCezY1PBytgmIeOTsKbmoZWS+fSGEGWgUeK5FVGpspgZIH0k76a0U03w03GFjUwCYJ+uLylvx4UXGX/XlPlk2zt4+Yts0VUU+GIsbUnsuyUDRQHOcUk1afMz8ds97C4MdwT/2rxXHDaXHQZrh928Py+vXmWG0aTsLin97I9cCAFFk0RwZV2AHqwdNSWqfB2bg==
Received: from PH7P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::22)
 by SJ2PR12MB9237.namprd12.prod.outlook.com (2603:10b6:a03:554::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 11:25:43 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::61) by PH7P222CA0019.outlook.office365.com
 (2603:10b6:510:33a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 11:25:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 11:25:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:25 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:24 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 1 Apr 2026 04:25:24 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v4 3/4] ASoC: tegra: Use dev_err_probe() for regmap init failures
Date: Wed, 1 Apr 2026 11:24:59 +0000
Message-ID: <20260401112500.4076861-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260401112500.4076861-1-sheetal@nvidia.com>
References: <20260401112500.4076861-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|SJ2PR12MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ba1a57-fe31-47c6-981c-08de8fe16981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	w/Zk/YSo21imbLSpEnDO+eR9rRTFVoUMfz0qp0Ocn1JiiaBs8LWP5l076/gRBlaCBplhuBO9Tj6kjVTnDsiunsdkF3x8xXv1RUzV9HZZJdaKcIqpxuDdTWRaocvkgFD3e1eJiGYca1Adhu8b8UECe0KjMCgSPw4LCyyYdjnO4GWfEalNgs8Y6q/Y1cQAJCOOfrjnnwdV+1W+FhbCWR5YkklpJSn6YJv55+zVZuwzXydS1neNtArdxLQRzO9OKo3hVo9nTZjbfXv4ZhmWznxcd9hJMYxajymUPn60QH64YPlyQ4CpCr25nCurzgsyLFVIAYicby4H0HQQKG5xRacrSE7gGJaQJgCJqme7SFw0rw86QLsNNjjGN64ue3KQUpDGP/Ivg8eI+wu0KFqhd2EksksVdtr69tpBG9shF7MF5Hkg+OwJ3kbXfx97WKJRxGHs9WT0bk6BC6lW/shYWx/Ieo0YqDFsYweeoRIgUgcUkKjqhsZuWu9zVgPu3caWyDU7Xxa9ZP2Oy80W1bWZP3iYqeihGsLlS3mXgO8eLE56ACFWmMFa8eMxpqGtmjelidJ5ixIkc9OuL6F0k4X8/6sc7Bt1qhXWM5XoH9jL+cJlnJj2rpq6TgSaNBzDEi+xH3/8BDfq0qogPBaHcRIQAewT+hRZwwXaAslvwAqjMXgnnLC4HHBKXZ9k1fNv2UA821iTMbVE3qhgRaoiKSFmTsWA8XA31Pi5y6l90h64FXziY5Np546ra+tj0+IG1OFYQWORYCNPrV1KKE8oWwfbZrllRQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SaTQ1ayITAodM2+6VnMCsWbFMLusIAzZbYDVG7e+9J16yvAoT8lX9IJijEM8JE3C11uhXJnJF2HsPQkzPbP/mR4zRB7M58tNK+GkIJ6jHm5kEqY0KO4L8knqy+DZkMhB5TTZWqjvNR4IQGQ1F0Nv8Xm0ioAlIL7eIUQblmQ402U6F6mMADD+kWwmacb1rXBiC/KmJmBeDbbY4a05ncDJM3seRvvU7MycRK+Autpj70DDyTO0h++vEKwWspD7uk9Pq38Cgwof5d3KyXlGZlerJDWNLUJMvHpyLlAw0P/3151VYu4JBG3NzB0ArHew8tQ1CQmiycTkcJqBbj7M5DxK2F+iIGGlSHLpXuwe0FQ9J2SZFKEw/Ih8GgxkAeSbSe6nDK6a9RBDC2Ee4hHscO+rRdoQM4EnFQkbetqYKssCzHGvWNZAchqqFVv3HZ8kJseJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 11:25:43.2240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ba1a57-fe31-47c6-981c-08de8fe16981
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9237

Use dev_err_probe() for regmap init failures in Tegra audio driver
probe paths.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c  | 7 +++----
 sound/soc/tegra/tegra186_dspk.c  | 7 +++----
 sound/soc/tegra/tegra210_adx.c   | 7 +++----
 sound/soc/tegra/tegra210_ahub.c  | 7 +++----
 sound/soc/tegra/tegra210_amx.c   | 7 +++----
 sound/soc/tegra/tegra210_dmic.c  | 7 +++----
 sound/soc/tegra/tegra210_i2s.c   | 7 +++----
 sound/soc/tegra/tegra210_mixer.c | 7 +++----
 sound/soc/tegra/tegra210_mvc.c   | 7 +++----
 sound/soc/tegra/tegra210_sfc.c   | 7 +++----
 10 files changed, 30 insertions(+), 40 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 98e911e2ed74..a2b3c4d5e6f7 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -989,10 +989,9 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
 
 	asrc->regmap = devm_regmap_init_mmio(dev, regs,
 					     &tegra186_asrc_regmap_config);
-	if (IS_ERR(asrc->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(asrc->regmap);
-	}
+	if (IS_ERR(asrc->regmap))
+		return dev_err_probe(dev, PTR_ERR(asrc->regmap),
+				     "regmap init failed\n");
 
 	asrc->soc_data = of_device_get_match_data(&pdev->dev);
 
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 1aa94c98294a..b3c4d5e6f7a8 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -505,10 +505,9 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 
 	dspk->regmap = devm_regmap_init_mmio(dev, regs, &tegra186_dspk_regmap);
-	if (IS_ERR(dspk->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(dspk->regmap);
-	}
+	if (IS_ERR(dspk->regmap))
+		return dev_err_probe(dev, PTR_ERR(dspk->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(dspk->regmap, true);
 
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index d7d075fd54b2..c4d5e6f7a8b9 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -697,10 +697,9 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 
 	adx->regmap = devm_regmap_init_mmio(dev, regs,
 					    soc_data->regmap_conf);
-	if (IS_ERR(adx->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(adx->regmap);
-	}
+	if (IS_ERR(adx->regmap))
+		return dev_err_probe(dev, PTR_ERR(adx->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(adx->regmap, true);
 
diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 4626dd0a4d55..d5e6f7a8b9c0 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2275,10 +2275,9 @@ static int tegra_ahub_probe(struct platform_device *pdev)
 
 	ahub->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					     ahub->soc_data->regmap_config);
-	if (IS_ERR(ahub->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
-		return PTR_ERR(ahub->regmap);
-	}
+	if (IS_ERR(ahub->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ahub->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(ahub->regmap, true);
 
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 1b7fb84a0f34..e6f7a8b9c0d1 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -745,10 +745,9 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 
 	amx->regmap = devm_regmap_init_mmio(dev, regs,
 					    amx->soc_data->regmap_conf);
-	if (IS_ERR(amx->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(amx->regmap);
-	}
+	if (IS_ERR(amx->regmap))
+		return dev_err_probe(dev, PTR_ERR(amx->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(amx->regmap, true);
 
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index 5a4bd5cef30a..f7a8b9c0d1e2 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -517,10 +517,9 @@ static int tegra210_dmic_probe(struct platform_device *pdev)
 
 	dmic->regmap = devm_regmap_init_mmio(dev, regs,
 					     &tegra210_dmic_regmap_config);
-	if (IS_ERR(dmic->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(dmic->regmap);
-	}
+	if (IS_ERR(dmic->regmap))
+		return dev_err_probe(dev, PTR_ERR(dmic->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(dmic->regmap, true);
 
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 7bf76c9b640f..a8b9c0d1e2f3 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -1093,10 +1093,9 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 
 	i2s->regmap = devm_regmap_init_mmio(dev, regs,
 					    i2s->soc_data->regmap_conf);
-	if (IS_ERR(i2s->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(i2s->regmap);
-	}
+	if (IS_ERR(i2s->regmap))
+		return dev_err_probe(dev, PTR_ERR(i2s->regmap),
+				     "regmap init failed\n");
 
 	tegra210_parse_client_convert(dev);
 
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index d9318aaaf32e..b9c0d1e2f3a4 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -814,10 +814,9 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
 
 	mixer->regmap = devm_regmap_init_mmio(dev, regs,
 					      &tegra210_mixer_regmap_config);
-	if (IS_ERR(mixer->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(mixer->regmap);
-	}
+	if (IS_ERR(mixer->regmap))
+		return dev_err_probe(dev, PTR_ERR(mixer->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(mixer->regmap, true);
 
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 11bd0ea22797..c0d1e2f3a4b5 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -731,10 +731,9 @@ static int tegra210_mvc_platform_probe(struct platform_device *pdev)
 
 	mvc->regmap = devm_regmap_init_mmio(dev, regs,
 					    &tegra210_mvc_regmap_config);
-	if (IS_ERR(mvc->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(mvc->regmap);
-	}
+	if (IS_ERR(mvc->regmap))
+		return dev_err_probe(dev, PTR_ERR(mvc->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(mvc->regmap, true);
 
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index 0f342fae058f..d1e2f3a4b5c6 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3598,10 +3598,9 @@ static int tegra210_sfc_platform_probe(struct platform_device *pdev)
 
 	sfc->regmap = devm_regmap_init_mmio(dev, regs,
 					    &tegra210_sfc_regmap_config);
-	if (IS_ERR(sfc->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(sfc->regmap);
-	}
+	if (IS_ERR(sfc->regmap))
+		return dev_err_probe(dev, PTR_ERR(sfc->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(sfc->regmap, true);
 
-- 
2.17.1

