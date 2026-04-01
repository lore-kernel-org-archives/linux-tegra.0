Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651D3F7A8E;
	Wed,  1 Apr 2026 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042748; cv=fail; b=KrCniwuxqiQXPyI6yzjDf2e0umBGo+cexFVdzHfNX/pkShBtg1v85n8IGC3Oi2i23dSZFR4tvA/XHRJP+gpLXIeg5BNNGd5s5tbUSogatu7a/E/PIrVAYql+TY3b+10ZCjbALk+IQnRFeF4ySR7/HkeLn2NhxsrHD0MQZ2yr1+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042748; c=relaxed/simple;
	bh=c1FwFPi38nkFh/0Lbbg9UBofAs7X+Jch4qx+TZE+a+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KshAFZ8D3MBG0FuYQ7G/Xantl47gHKA6h9NMD9pudj4HWtmnE/jRXnmcwotvEf73pJZ8kWWtDS9BDxtCMsEKJcxBAD7jgqnPH7bSLJkywnV9zj5Ktx6X8Rzed5ia1pDh5LbgE2p3gY6VtnwlIr+0k6XsIgoJ92YVV/G4BawRn6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GsyS/k1x; arc=fail smtp.client-ip=52.101.85.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GsyS/k1x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXzhCreVqXNX4QkFSdOBjkVOg95EJGfy45I6uRBUMyE2jSLjrRDxHVEpWEaQzGnSW9f8ACQEY0WaX2LBnRmaQeSilMD6aTXXXxGqRWvIOcezIeHCcFDCEDAefM6d5cif+Tt9hWt8Ht5W4DATG/tpZLl1QBgwZWov8CAs4Hp15mJkoun7XOPAGROBpIB8Z0URyJRh2FXDTzX19OTfV3OApVUTeSIFflgVF6yaYWvXuvXg85kMLLr6ij4FXkklmSoyptVi1vVg8KV5WoMzOYqk3i0cY828O8i/7K26J1TXNYjpZISp4UF/Q++qc6P8JQikVihlEBALVIOQedaxruI34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1Oid8xl+AzPC0WVnPtFZQgnKBbYiGoGmsOkz48Jv/s=;
 b=neKNAZ99HbOpZR5hrUuAQAQqTslGHbLgHYS2S515GlkaShybzigMkg60dQXsXzN10qeP7b/qBZD9mKfbxZvOby5Dq3gGoIdQmBnBY4WVZ6p6SLYLF8kssQ8XQGl2UF+kb+sm+jUwhgUn5X5sF93Sv3TE9PjLlaNjTKB6dMBoRoN0pLxyV3/Kt5T6JbqNdT+dnIwvGVBTtKoJ+WHnS2B3mB7Hn8jP4JlxsZShiPvlBGCdI6IXU69EGFlMTee8WDIKVfFtvD8j6ulqFUqcCR0JzezCGiCZL2WE2qhsCqFmfsWkH8VMXeQ6fV32DyVXXw9SZX5mqcDXvO3Le2IMjeCqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1Oid8xl+AzPC0WVnPtFZQgnKBbYiGoGmsOkz48Jv/s=;
 b=GsyS/k1xhpRpCsNefTj//UishpiaBYrfrf+oMBAsd1rvvWUj3JTxipnF1lRIlx2TGPNBQfo1EzVRC4F+3OWhRbIxNCGfryt8mIbtERUuaxMMMy7esf1UneFeO6aEvPW5q6aS8wOGcNsw/2OnB+HSEb/2mOfIAWLfZtdJ8cEJtMlwQgrUT3ZS5mBqWyq8Pi29ACikbSPmxXqnyAswNDvRrASCiSobrV7u4nWwFK6ELx4jLA/7iNWIL89/VB/Bk1DjYpgc2G+XLsHFGf/KyQej1WDQxBuCeQEDlPC9++LNkHGXHe6+LGHzcuS2NUl9lLo6/OFQGGdbdRbjNVNFiII47Q==
Received: from PH7P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::10)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 11:25:42 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::ca) by PH7P222CA0027.outlook.office365.com
 (2603:10b6:510:33a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Wed,
 1 Apr 2026 11:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 11:25:41 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:23 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:22 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 1 Apr 2026 04:25:21 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v4 2/4] ASoC: tegra: Use dev_err_probe() in OPE, PEQ and MBDRC drivers
Date: Wed, 1 Apr 2026 11:24:58 +0000
Message-ID: <20260401112500.4076861-3-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: f01a7eae-9ee6-499b-95cd-08de8fe16891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q4s++ViANzS5Ya7y+aLIpwK7+8oNvfZzzB6/DUARRogid/NS2CSEnQHqTRTWXL6I3TtV1hf3HxxmHdDVbfU3uvH1njVPbia6S1hyF+wWLLrRd34hfQFF+XUg9QmZ2SmqdmiF4OTPiF0Rrbjm++q7Xmla8nKvqdnp0mpE/eSHJGqfefcHnNavKacgDd9H3xGks+uBAiz+OcRmoAejJpHSqZ0z2gyAClj35Z5Ij+YDz5dxFLyD8jNLlUEiaFEvJilkkWniJwKDRXZUbuREkuTtHlvLT8+AO/jxXgxpjbqs05iet8vgvGpKrpX1ahZmLcfiN8OQOuvcSvXUf8p908DdERBhRi8w/eCTVsJPLsUSqWkXhplPdDA5hKWbflqtMIXMGZl+FMNh1zKehRvMGej8E617B9R4Gd9JYe+lyaMj2jJv3IJM1bHXkI5YDFJrsYkcc+dy8P8mgADI5zgZ31YyjI9ZqjWrAGg1ad0FHXxlI1PngKOUdNVrq/FtuAw+Ex3crTI4dWLstdoTPimpC8msz4+UreFCzv39gSwXSQ4F5Om8rcD/93S+S2JTICsPO/8XGNRnsncgUhw6w+2HFqy+kHenf5CzcPUp8IAz1HREi2OW8PKCqgvp6LOWUDnqK/NjJkUBzTB9XBccLjGIUGdxIq/ByloWeRKCzbAM2lvEW+mrrM5Mpdv/QvTQzKpmybYd/cB+AxwHVuBUVqeHWn7nevG4X+NdJsPqWMDQMykAshiLiWZP611wtBO22Mq6/6GxycH6N2pA0CFBlJULU0St9Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uCnX6AZmiSFC+XUmT/GGJoR2pm48Qo9fCx8bLuc2+kM3ZR8R4o29Y51yQX87WGGGWblEtbYLaRJh8mBGPX8tlqkPl0mgnwJTHni/58PNsDIRJJGtsxx6bcWF/lkf2ejH6wx+kXsisPdmd6HK0buZ1ffcP6fDW4gngJLKJN4hOoEefgL3jxBokj5naFgVay2BhJh6qFJ0Yu8FfnKM5iLDYF3wXRYoMUjNsgJpxUD7Q/xeaCAj6bpwMM/HWoRFzhp1JW5wD1ckA2c+ICyelG+UZJhXAsikNqUFzdQ/covfaprC5ERc0wzriX9nhU158rLljYrFamiwhf3XvhDdHZmmomgp8pHW6fuquV6sqxH849X4pj2Gis5EwsqnCwhldn/rZ4Z3A1Ne/TNcliE02ARXQ6Cowh4UvpTnBBo/6/q8TZ0dAQBY8Ue6IuRYTutE4yy+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 11:25:41.6824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f01a7eae-9ee6-499b-95cd-08de8fe16891
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265

Log errors in the Tegra210 OPE, PEQ and MBDRC probe paths using
dev_err_probe(). Drop redundant dev_err() at tegra210_peq_regmap_init()
and tegra210_mbdrc_regmap_init() call sites in ope_probe() since
these functions already log errors internally.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_mbdrc.c | 19 ++++++++++---------
 sound/soc/tegra/tegra210_ope.c   | 26 ++++++++++----------------
 sound/soc/tegra/tegra210_peq.c   | 19 ++++++++++---------
 3 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index 6a268dbb7197..b1c2d3e4f5a6 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -988,14 +988,14 @@ int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
 
 	child = of_get_child_by_name(dev->of_node, "dynamic-range-compressor");
 	if (!child)
-		return -ENODEV;
+		return dev_err_probe(dev, -ENODEV,
+				     "missing 'dynamic-range-compressor' DT child node\n");
 
 	err = of_address_to_resource(child, 0, &mem);
 	of_node_put(child);
-	if (err < 0) {
-		dev_err(dev, "fail to get MBDRC resource\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err,
+				     "failed to get MBDRC resource\n");
 
 	mem.flags = IORESOURCE_MEM;
 	regs = devm_ioremap_resource(dev, &mem);
@@ -1004,10 +1004,9 @@ int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
 
 	ope->mbdrc_regmap = devm_regmap_init_mmio(dev, regs,
 						  &tegra210_mbdrc_regmap_cfg);
-	if (IS_ERR(ope->mbdrc_regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(ope->mbdrc_regmap);
-	}
+	if (IS_ERR(ope->mbdrc_regmap))
+		return dev_err_probe(dev, PTR_ERR(ope->mbdrc_regmap),
+				     "MBDRC regmap init failed\n");
 
 	regcache_cache_only(ope->mbdrc_regmap, true);
 
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index a440888dcdbd..c1d2e3f4a5b6 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -318,10 +318,9 @@ static int tegra210_ope_probe(struct platform_device *pdev)
 
 	ope->regmap = devm_regmap_init_mmio(dev, regs,
 					    &tegra210_ope_regmap_config);
-	if (IS_ERR(ope->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(ope->regmap);
-	}
+	if (IS_ERR(ope->regmap))
+		return dev_err_probe(dev, PTR_ERR(ope->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(ope->regmap, true);
 
@@ -328,14 +327,10 @@ static int tegra210_ope_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, ope);
 
 	err = tegra210_peq_regmap_init(pdev);
-	if (err < 0) {
-		dev_err(dev, "PEQ init failed\n");
-		return err;
-	}
+	if (err < 0)
+		return err;
 
 	err = tegra210_mbdrc_regmap_init(pdev);
-	if (err < 0) {
-		dev_err(dev, "MBDRC init failed\n");
-		return err;
-	}
+	if (err < 0)
+		return err;
 
@@ -342,10 +337,9 @@ static int tegra210_ope_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_ope_cmpnt,
 					      tegra210_ope_dais,
 					      ARRAY_SIZE(tegra210_ope_dais));
-	if (err) {
-		dev_err(dev, "can't register OPE component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register OPE component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
index 2f72e9d541dc..d1e2f3a4b5c6 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -408,14 +408,14 @@ int tegra210_peq_regmap_init(struct platform_device *pdev)
 
 	child = of_get_child_by_name(dev->of_node, "equalizer");
 	if (!child)
-		return -ENODEV;
+		return dev_err_probe(dev, -ENODEV,
+				     "missing 'equalizer' DT child node\n");
 
 	err = of_address_to_resource(child, 0, &mem);
 	of_node_put(child);
-	if (err < 0) {
-		dev_err(dev, "fail to get PEQ resource\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err,
+				     "failed to get PEQ resource\n");
 
 	mem.flags = IORESOURCE_MEM;
 	regs = devm_ioremap_resource(dev, &mem);
@@ -423,10 +423,9 @@ int tegra210_peq_regmap_init(struct platform_device *pdev)
 		return PTR_ERR(regs);
 	ope->peq_regmap = devm_regmap_init_mmio(dev, regs,
 						&tegra210_peq_regmap_config);
-	if (IS_ERR(ope->peq_regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(ope->peq_regmap);
-	}
+	if (IS_ERR(ope->peq_regmap))
+		return dev_err_probe(dev, PTR_ERR(ope->peq_regmap),
+				     "PEQ regmap init failed\n");
 
 	regcache_cache_only(ope->peq_regmap, true);
 
-- 
2.17.1

