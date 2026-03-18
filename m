Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9193B7B63;
	Wed, 18 Mar 2026 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827230; cv=fail; b=cSRr+B5m1n49gQ4OIcY51cETrQ2nakOGJ/i1YASszLv4MxktgUMKuepIRaWB4El8Sb7BE1E0xt71uAGttccuLGz+C1FzjdHOZv05qjvbYUo11arAS8GXdyyiK4RvirIqS5yNzo7L/Er6vkTYxD3TAN7Acd74bq2a2rvB+3eQNfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827230; c=relaxed/simple;
	bh=F7EX9QDhEWiNBLtb2RoWQs1fLtrJ3EOSnhBzQNWeMA4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FDEZsJtWGFqMXgyTCmEy6Wd/YAOkix0A9N5WUT/okG/wX4n8OZM92DJJO9oqdoTeaMTdWmKfXS4CEF8Cf+0+9fCOS5rMAlNVey4YWzJxbm6RzMlHqYheN9psNr+om/XrAfMLXQROrCZ5QonLa5dCuItouDzBwZ2FqpEEbsc5YrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KfGxhiD2; arc=fail smtp.client-ip=52.101.85.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KfGxhiD2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8wlhe3p04v0aT70DjcrDhlo+ulg7Qk6KmBog4xH3pUzSDH+V3DBwM5f9HW/+IqwF+xJ4M0lF8sNcOKWWzeK5iL/yMi+zMD4p8hdPO6f/iVUSklzcU8FRt45xCCWtfqmhQTAi/D1ArSKy774b6UIXRTYz33l00V1c2pOfVmeVn/hH46iY9atJ5rvEP7jSSXXuc5IF2BJwpqktldEjh2yhMEug/aojFfygDtwMdZFSuOBC3pxvYmf447Eoaga6kCiJ4iXubQiTTHwWDajVCOBn2EERgwLutGk064nf4NAGYzVrmTh07egpMJJj5gBWDkIf5724rYb2FfmLohujXtYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfL2WxKtl/YlYh+C+kRBkXJLQFmJ6kzOIQobMK4LS9o=;
 b=FVtv+um2zcu3aXK3c7AhFZ/ePsLfARni69PJx1YSRjW4rEOuZPHTnZwFOe4TwACT3Q4CaRgreZ9aKXCVWbrAx5UJTAzIv/5Z3odU1P1GOB4NBDEeXIBknqKilA5RbJ8+b69Tw/YleUYuhxOpcTz/qL4Gl5Aj5LN/uf0fFTNIo/eGbnA+57YfRvbsJKfnc0ZC1jP2h3dBWmhtHyUFd2crjsU0UBmDTOXtB5c026RqXrDZvuz8IJPKqqnESHOEXVlw7d/KUlZqUKrdP9lhe0Bx5XcgCTgpaGV7oK5RnIzU1ZLO6Q6IGn+3wKRetnv4l3fYrxC6KmxfOAq8g4ixE7uDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfL2WxKtl/YlYh+C+kRBkXJLQFmJ6kzOIQobMK4LS9o=;
 b=KfGxhiD2M7cDtRQdCMT9BMASqX1l01eBTxsjgLUXSFMuq3iKVD8ZBSA+r7dKZfXVbaxnlqmALm/Tu295Zh1t1xau1bw/v2dKr9FIMpNHd5S98LAy5jW1T2Cp0mJd5+EdlrHa7IP9zhkoarhRZFNXXpKbPOqK3a+mg1b8i3OIkPYkq06rEbHWb3CxqRcqNfp1jQtYp/w+8R975J1MELcjqJ8Zob2XE8L2wWIhZhDRzOO3bX+EiX9dOmm/q4hOil/HsP8oXJh8TISksGmMmF9OOtszAEZznQLWudKu7z4GQ+x28ErDNnb2XtSQML7xnqj+VJsBeWUmOPugoQTx8lKVPg==
Received: from DM5PR07CA0098.namprd07.prod.outlook.com (2603:10b6:4:ae::27) by
 MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Wed, 18 Mar 2026 09:46:49 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::17) by DM5PR07CA0098.outlook.office365.com
 (2603:10b6:4:ae::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 09:46:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 09:46:49 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 02:46:36 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 18 Mar 2026 02:46:36 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 18 Mar 2026 02:46:35 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH] ASoC: tegra: Add error logging for probe and callback failures
Date: Wed, 18 Mar 2026 09:46:31 +0000
Message-ID: <20260318094631.1769708-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|MW3PR12MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: 62254386-cf07-44d0-eb73-08de84d346ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3OadXpoNbgNy71b14OB5TFZg/UXQGPsC7xUTC0nNYE2CR3B3AGU/4xDGVMBxvSGYWtk0aL5Yd+sEehVkAwftLj5ermOc/WtgDcZwauRbFcFOO+l3ehOIZRpX7D8RFVbOvNen/F/EByXcKV3p5eixCIBG0svD3BQ8VIUe3xOjeHy1jPQhqQjcHiZe8wxTij33718k51aEj9REy9MdoeSpTJ4NT2XBW8dsa1aB7KXD4T2NmxIW7nuEONXYAwGb2Ig8nAQ5/xxPrqVZ3YDomZ3x+KJ0rHMGeqLFx5H6OKIlv0+Pk6nHngE66TI95Tqe5VJLV4ybuBheWBxRRdo1sZuUPKWAql3MAVgJwYWGX/+WmbNhr+eK5G/gIJBAR2SehHc5hmmoCNKQKAoLnGDwPG7h3IEdW34t1PgfQJnpPBlCTr7WEpdLHXk49RvlRSy/j+BQH4rGAPrM2bX4xfH8PbkcoWI7EeAReynW/pTNLiOu/FjDLHGJAbqyjni53vZufgQaoMUkKwfWXdTotg8Qfbv++HBTltKQ0v+9UzxNcrOmoSL45VlWPk2LDG+i9ki1n4XUYttu3f4HDXtyU2MmjonGugMSeXrZlgeK7QbTrriEE9QfoJ5NhBqR1A5KBpphg2Z+FrVhH+ULADVnmC6bncXo7ssyWlcAYWggqFG6dDoe1oMqmCjicOVCBUTqM6LfpXmi6BM15t5ubLgj8BKt56M3njd646D/fB5fhjf7zctbnmAgC4ZSJ2HjqRHIrR/NCEPbnAgN19EE5KYgL/sGSW2Uog==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XCmCmfahw0+LjR8fEsHXRULckKsDcwrJPpTtxgX+jY6v4indR+EcydFp1Oww5qoiMBSKuPvAS8Lnz+5ugg7AnLzeUVYEmZutZSfuG8zewvHfDbgiFjoSl1olVIsTgKpLmZdci6l/IEZdhN719xoviS9rGyoKb6+N3kz72/JkJLjY5TcQ7Nsb46N3xh5axc3hK2LQ/3ej4dPuAeVczG4OUwvsvqN2loaP93N4uexPNh0+9GYURlFCDWOXAXJVMDF/DowaumJ2Bh/cylY2F+DdrUy12SmlAsvJfyP7eqef2JmGfPgvxpyjObfZIF8Qhh4vyOs9sLY9ahN3+dG0eprwJfL04MqJAH0U33HDCHZlx8SWBmGv+EjMszctuDyuB5u2wO+WmHGZF2RXH5KdEt9fUSmE4PiWjhQ3okb0PUWPV9srE5LLdHHwdUncbKdlY84j
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 09:46:49.0583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62254386-cf07-44d0-eb73-08de84d346ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347

Add dev_err_probe() and dev_err() logging across probe and runtime
error paths in Tegra audio drivers to improve debuggability.
Use dev_err_probe() only where -EPROBE_DEFER can be returned.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c          | 11 +++--
 sound/soc/tegra/tegra186_dspk.c          | 21 ++++----
 sound/soc/tegra/tegra210_admaif.c        | 22 +++++----
 sound/soc/tegra/tegra210_adx.c           | 17 ++++---
 sound/soc/tegra/tegra210_ahub.c          | 25 +++++-----
 sound/soc/tegra/tegra210_amx.c           | 13 +++--
 sound/soc/tegra/tegra210_dmic.c          | 18 +++----
 sound/soc/tegra/tegra210_i2s.c           | 22 +++++----
 sound/soc/tegra/tegra210_mbdrc.c         | 10 ++--
 sound/soc/tegra/tegra210_mixer.c         | 13 +++--
 sound/soc/tegra/tegra210_mvc.c           | 11 +++--
 sound/soc/tegra/tegra210_ope.c           | 15 +++---
 sound/soc/tegra/tegra210_peq.c           | 10 ++--
 sound/soc/tegra/tegra210_sfc.c           | 11 +++--
 sound/soc/tegra/tegra_asoc_machine.c     | 61 +++++++++++++-----------
 sound/soc/tegra/tegra_audio_graph_card.c | 21 ++++----
 16 files changed, 169 insertions(+), 132 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index d2a5ec7c54cc..98e911e2ed74 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -984,8 +984,10 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, asrc);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	asrc->regmap = devm_regmap_init_mmio(dev, regs,
 					     &tegra186_asrc_regmap_config);
@@ -1016,10 +1018,9 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra186_asrc_cmpnt,
 					      tegra186_asrc_dais,
 					      ARRAY_SIZE(tegra186_asrc_dais));
-	if (err) {
-		dev_err(dev, "can't register ASRC component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register ASRC component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 8816e4967331..1aa94c98294a 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -496,14 +496,15 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dspk);
 
 	dspk->clk_dspk = devm_clk_get(dev, "dspk");
-	if (IS_ERR(dspk->clk_dspk)) {
-		dev_err(dev, "can't retrieve DSPK clock\n");
-		return PTR_ERR(dspk->clk_dspk);
-	}
+	if (IS_ERR(dspk->clk_dspk))
+		return dev_err_probe(dev, PTR_ERR(dspk->clk_dspk),
+				     "can't retrieve DSPK clock\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	dspk->regmap = devm_regmap_init_mmio(dev, regs, &tegra186_dspk_regmap);
 	if (IS_ERR(dspk->regmap)) {
@@ -516,11 +517,9 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra186_dspk_cmpnt,
 					      tegra186_dspk_dais,
 					      ARRAY_SIZE(tegra186_dspk_dais));
-	if (err) {
-		dev_err(dev, "can't register DSPK component, err: %d\n",
-			err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register DSPK component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 0976779d29f2..5d690a2f8509 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -408,6 +408,7 @@ static int tegra_admaif_start(struct snd_soc_dai *dai, int direction)
 		reg = CH_RX_REG(TEGRA_ADMAIF_RX_ENABLE, dai->id);
 		break;
 	default:
+		dev_err(dai->dev, "invalid stream direction: %d\n", direction);
 		return -EINVAL;
 	}
 
@@ -441,6 +442,7 @@ static int tegra_admaif_stop(struct snd_soc_dai *dai, int direction)
 		reset_reg = CH_RX_REG(TEGRA_ADMAIF_RX_SOFT_RESET, dai->id);
 		break;
 	default:
+		dev_err(dai->dev, "invalid stream direction: %d\n", direction);
 		return -EINVAL;
 	}
 
@@ -489,6 +491,7 @@ static int tegra_admaif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		return tegra_admaif_stop(dai, substream->stream);
 	default:
+		dev_err(dai->dev, "invalid trigger command: %d\n", cmd);
 		return -EINVAL;
 	}
 }
@@ -953,8 +956,10 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 	}
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(&pdev->dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	admaif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					       admaif->soc_data->regmap_conf);
@@ -966,10 +971,9 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 	regcache_cache_only(admaif->regmap, true);
 
 	err = tegra_isomgr_adma_register(&pdev->dev);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to add interconnect path\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to add interconnect path\n");
 
 	regmap_update_bits(admaif->regmap, admaif->soc_data->global_base +
 			   TEGRA_ADMAIF_GLOBAL_ENABLE, 1, 1);
@@ -1009,11 +1013,9 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 					      admaif->soc_data->cmpnt,
 					      admaif->soc_data->dais,
 					      admaif->soc_data->num_ch);
-	if (err) {
-		dev_err(&pdev->dev,
-			"can't register ADMAIF component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "can't register ADMAIF component\n");
 
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 95875c75ddf8..d7d075fd54b2 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -134,8 +134,11 @@ static int tegra210_adx_set_audio_cif(struct snd_soc_dai *dai,
 
 	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
 
-	if (channels < 1 || channels > adx->soc_data->max_ch)
+	if (channels < 1 || channels > adx->soc_data->max_ch) {
+		dev_err(dai->dev, "invalid channels: %u (max %u)\n",
+			channels, adx->soc_data->max_ch);
 		return -EINVAL;
+	}
 
 	switch (format) {
 	case SNDRV_PCM_FORMAT_S8:
@@ -149,6 +152,7 @@ static int tegra210_adx_set_audio_cif(struct snd_soc_dai *dai,
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
 	default:
+		dev_err(dai->dev, "unsupported format: %d\n", format);
 		return -EINVAL;
 	}
 
@@ -688,8 +692,10 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, adx);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	adx->regmap = devm_regmap_init_mmio(dev, regs,
 					    soc_data->regmap_conf);
@@ -717,10 +723,9 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_adx_cmpnt,
 					      tegra210_adx_dais,
 					      ARRAY_SIZE(tegra210_adx_dais));
-	if (err) {
-		dev_err(dev, "can't register ADX component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register ADX component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 43a45f785d5b..4626dd0a4d55 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -64,8 +64,11 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 	unsigned int i, bit_pos, reg_idx = 0, reg_val = 0;
 	int change = 0;
 
-	if (item[0] >= e->items)
+	if (item[0] >= e->items) {
+		dev_err(cmpnt->dev, "invalid MUX item: %u >= %u\n",
+			item[0], e->items);
 		return -EINVAL;
+	}
 
 	if (value) {
 		/* Get the register index and value to set */
@@ -2265,14 +2268,15 @@ static int tegra_ahub_probe(struct platform_device *pdev)
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
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(&pdev->dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	ahub->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					     ahub->soc_data->regmap_config);
@@ -2287,16 +2291,15 @@ static int tegra_ahub_probe(struct platform_device *pdev)
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
+		dev_err(&pdev->dev, "failed to populate child nodes: %d\n", err);
 		pm_runtime_disable(&pdev->dev);
 		return err;
 	}
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index bfda82505298..1b7fb84a0f34 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -163,6 +163,8 @@ static int tegra210_amx_set_audio_cif(struct snd_soc_dai *dai,
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
 	default:
+		dev_err(dai->dev, "unsupported format: %d\n",
+			params_format(params));
 		return -EINVAL;
 	}
 
@@ -738,8 +740,10 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, amx);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	amx->regmap = devm_regmap_init_mmio(dev, regs,
 					    amx->soc_data->regmap_conf);
@@ -767,10 +771,9 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_amx_cmpnt,
 					      tegra210_amx_dais,
 					      ARRAY_SIZE(tegra210_amx_dais));
-	if (err) {
-		dev_err(dev, "can't register AMX component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register AMX component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index 93def7ac4fde..5a4bd5cef30a 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -507,14 +507,15 @@ static int tegra210_dmic_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dmic);
 
 	dmic->clk_dmic = devm_clk_get(dev, "dmic");
-	if (IS_ERR(dmic->clk_dmic)) {
-		dev_err(dev, "can't retrieve DMIC clock\n");
-		return PTR_ERR(dmic->clk_dmic);
-	}
+	if (IS_ERR(dmic->clk_dmic))
+		return dev_err_probe(dev, PTR_ERR(dmic->clk_dmic),
+				     "can't retrieve DMIC clock\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	dmic->regmap = devm_regmap_init_mmio(dev, regs,
 					     &tegra210_dmic_regmap_config);
@@ -528,10 +529,9 @@ static int tegra210_dmic_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_dmic_compnt,
 					      tegra210_dmic_dais,
 					      ARRAY_SIZE(tegra210_dmic_dais));
-	if (err) {
-		dev_err(dev, "can't register DMIC component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register DMIC component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index d8e02f0a3025..7bf76c9b640f 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -161,6 +161,7 @@ static int tegra210_i2s_init(struct snd_soc_dapm_widget *w,
 		stream = SNDRV_PCM_STREAM_CAPTURE;
 		status_reg = TEGRA210_I2S_TX_STATUS + i2s->soc_data->tx_offset;
 	} else {
+		dev_err(dev, "invalid I2S direction register 0x%x\n", w->reg);
 		return -EINVAL;
 	}
 
@@ -235,6 +236,7 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 		val = I2S_CTRL_MASTER_EN;
 		break;
 	default:
+		dev_err(dai->dev, "invalid clock provider format 0x%x\n", fmt);
 		return -EINVAL;
 	}
 
@@ -270,6 +272,7 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 		tegra210_i2s_set_data_offset(i2s, 0);
 		break;
 	default:
+		dev_err(dai->dev, "invalid I2S frame format 0x%x\n", fmt);
 		return -EINVAL;
 	}
 
@@ -290,6 +293,7 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 		val ^= I2S_CTRL_LRCK_POL_MASK;
 		break;
 	default:
+		dev_err(dai->dev, "invalid I2S clock inversion 0x%x\n", fmt);
 		return -EINVAL;
 	}
 
@@ -1070,10 +1074,9 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, i2s);
 
 	i2s->clk_i2s = devm_clk_get(dev, "i2s");
-	if (IS_ERR(i2s->clk_i2s)) {
-		dev_err(dev, "can't retrieve I2S bit clock\n");
-		return PTR_ERR(i2s->clk_i2s);
-	}
+	if (IS_ERR(i2s->clk_i2s))
+		return dev_err_probe(dev, PTR_ERR(i2s->clk_i2s),
+				     "can't retrieve I2S bit clock\n");
 
 	/*
 	 * Not an error, as this clock is needed only when some other I/O
@@ -1085,8 +1088,10 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 		dev_dbg(dev, "can't retrieve I2S sync input clock\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	i2s->regmap = devm_regmap_init_mmio(dev, regs,
 					    i2s->soc_data->regmap_conf);
@@ -1108,10 +1113,9 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, i2s->soc_data->i2s_cmpnt,
 					      tegra210_i2s_dais,
 					      ARRAY_SIZE(tegra210_i2s_dais));
-	if (err) {
-		dev_err(dev, "can't register I2S component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register I2S component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index 6a268dbb7197..558b7a21b0be 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -987,8 +987,10 @@ int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
 	int err;
 
 	child = of_get_child_by_name(dev->of_node, "dynamic-range-compressor");
-	if (!child)
+	if (!child) {
+		dev_err(dev, "missing 'dynamic-range-compressor' DT child node\n");
 		return -ENODEV;
+	}
 
 	err = of_address_to_resource(child, 0, &mem);
 	of_node_put(child);
@@ -999,13 +1001,15 @@ int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
 
 	mem.flags = IORESOURCE_MEM;
 	regs = devm_ioremap_resource(dev, &mem);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map MBDRC registers\n");
 		return PTR_ERR(regs);
+	}
 
 	ope->mbdrc_regmap = devm_regmap_init_mmio(dev, regs,
 						  &tegra210_mbdrc_regmap_cfg);
 	if (IS_ERR(ope->mbdrc_regmap)) {
-		dev_err(dev, "regmap init failed\n");
+		dev_err(dev, "MBDRC regmap init failed\n");
 		return PTR_ERR(ope->mbdrc_regmap);
 	}
 
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 6d3a2b76fd61..d9318aaaf32e 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -253,6 +253,8 @@ static int tegra210_mixer_set_audio_cif(struct tegra210_mixer *mixer,
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
 	default:
+		dev_err(regmap_get_device(mixer->regmap),
+			"unsupported format for MIXER CIF\n");
 		return -EINVAL;
 	}
 
@@ -636,8 +638,10 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
 		mixer->gain_value[i] = gain_params.gain_value;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	mixer->regmap = devm_regmap_init_mmio(dev, regs,
 					      &tegra210_mixer_regmap_config);
@@ -651,10 +655,9 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_mixer_cmpnt,
 					      tegra210_mixer_dais,
 					      ARRAY_SIZE(tegra210_mixer_dais));
-	if (err) {
-		dev_err(dev, "can't register MIXER component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register MIXER component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 6cdc5e1f5507..11bd0ea22797 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -726,8 +726,10 @@ static int tegra210_mvc_platform_probe(struct platform_device *pdev)
 	mvc->ctrl_value = TEGRA210_MVC_CTRL_DEFAULT;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	mvc->regmap = devm_regmap_init_mmio(dev, regs,
 					    &tegra210_mvc_regmap_config);
@@ -741,10 +743,9 @@ static int tegra210_mvc_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_mvc_cmpnt,
 					      tegra210_mvc_dais,
 					      ARRAY_SIZE(tegra210_mvc_dais));
-	if (err) {
-		dev_err(dev, "can't register MVC component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register MVC component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index a440888dcdbd..e311de41a078 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -313,8 +313,10 @@ static int tegra210_ope_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	ope->regmap = devm_regmap_init_mmio(dev, regs,
 					    &tegra210_ope_regmap_config);
@@ -329,23 +331,22 @@ static int tegra210_ope_probe(struct platform_device *pdev)
 
 	err = tegra210_peq_regmap_init(pdev);
 	if (err < 0) {
-		dev_err(dev, "PEQ init failed\n");
+		dev_err(dev, "PEQ init failed: %d\n", err);
 		return err;
 	}
 
 	err = tegra210_mbdrc_regmap_init(pdev);
 	if (err < 0) {
-		dev_err(dev, "MBDRC init failed\n");
+		dev_err(dev, "MBDRC init failed: %d\n", err);
 		return err;
 	}
 
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
index 2f72e9d541dc..4b692c2055bc 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -407,8 +407,10 @@ int tegra210_peq_regmap_init(struct platform_device *pdev)
 	int err;
 
 	child = of_get_child_by_name(dev->of_node, "equalizer");
-	if (!child)
+	if (!child) {
+		dev_err(dev, "missing 'equalizer' DT child node\n");
 		return -ENODEV;
+	}
 
 	err = of_address_to_resource(child, 0, &mem);
 	of_node_put(child);
@@ -419,12 +421,14 @@ int tegra210_peq_regmap_init(struct platform_device *pdev)
 
 	mem.flags = IORESOURCE_MEM;
 	regs = devm_ioremap_resource(dev, &mem);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map PEQ registers\n");
 		return PTR_ERR(regs);
+	}
 	ope->peq_regmap = devm_regmap_init_mmio(dev, regs,
 						&tegra210_peq_regmap_config);
 	if (IS_ERR(ope->peq_regmap)) {
-		dev_err(dev, "regmap init failed\n");
+		dev_err(dev, "PEQ regmap init failed\n");
 		return PTR_ERR(ope->peq_regmap);
 	}
 
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index b298bf0421b1..0f342fae058f 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3593,8 +3593,10 @@ static int tegra210_sfc_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, sfc);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
+	if (IS_ERR(regs)) {
+		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(regs);
+	}
 
 	sfc->regmap = devm_regmap_init_mmio(dev, regs,
 					    &tegra210_sfc_regmap_config);
@@ -3608,10 +3610,9 @@ static int tegra210_sfc_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_sfc_cmpnt,
 					      tegra210_sfc_dais,
 					      ARRAY_SIZE(tegra210_sfc_dais));
-	if (err) {
-		dev_err(dev, "can't register SFC component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register SFC component\n");
 
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 10834f9c3422..d7245a10bba1 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -431,8 +431,10 @@ static int tegra_machine_register_codec(struct device *dev, const char *name)
 		return 0;
 
 	pdev = platform_device_register_simple(name, -1, NULL, 0);
-	if (IS_ERR(pdev))
+	if (IS_ERR(pdev)) {
+		dev_err(dev, "failed to register codec %s\n", name);
 		return PTR_ERR(pdev);
+	}
 
 	err = devm_add_action_or_reset(dev, tegra_machine_unregister_codec,
 				       pdev);
@@ -468,32 +470,38 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,hp-mute", GPIOD_OUT_HIGH);
 	machine->gpiod_hp_mute = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get hp-mute GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,hp-det", GPIOD_IN);
 	machine->gpiod_hp_det = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get hp-det GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,mic-det", GPIOD_IN);
 	machine->gpiod_mic_det = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get mic-det GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,spkr-en", GPIOD_OUT_LOW);
 	machine->gpiod_spkr_en = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get spkr-en GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,int-mic-en", GPIOD_OUT_LOW);
 	machine->gpiod_int_mic_en = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get int-mic-en GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,ext-mic-en", GPIOD_OUT_LOW);
 	machine->gpiod_ext_mic_en = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get ext-mic-en GPIO\n");
 
 	err = snd_soc_of_parse_card_name(card, "nvidia,model");
 	if (err)
@@ -549,22 +557,19 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 		card->driver_name = "tegra";
 
 	machine->clk_pll_a = devm_clk_get(dev, "pll_a");
-	if (IS_ERR(machine->clk_pll_a)) {
-		dev_err(dev, "Can't retrieve clk pll_a\n");
-		return PTR_ERR(machine->clk_pll_a);
-	}
+	if (IS_ERR(machine->clk_pll_a))
+		return dev_err_probe(dev, PTR_ERR(machine->clk_pll_a),
+				     "can't retrieve clk pll_a\n");
 
 	machine->clk_pll_a_out0 = devm_clk_get(dev, "pll_a_out0");
-	if (IS_ERR(machine->clk_pll_a_out0)) {
-		dev_err(dev, "Can't retrieve clk pll_a_out0\n");
-		return PTR_ERR(machine->clk_pll_a_out0);
-	}
+	if (IS_ERR(machine->clk_pll_a_out0))
+		return dev_err_probe(dev, PTR_ERR(machine->clk_pll_a_out0),
+				     "can't retrieve clk pll_a_out0\n");
 
 	machine->clk_cdev1 = devm_clk_get(dev, "mclk");
-	if (IS_ERR(machine->clk_cdev1)) {
-		dev_err(dev, "Can't retrieve clk cdev1\n");
-		return PTR_ERR(machine->clk_cdev1);
-	}
+	if (IS_ERR(machine->clk_cdev1))
+		return dev_err_probe(dev, PTR_ERR(machine->clk_cdev1),
+				     "can't retrieve clk cdev1\n");
 
 	/*
 	 * If clock parents are not set in DT, configure here to use clk_out_1
@@ -578,26 +583,24 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 		dev_warn(dev, "Please update DT to use assigned-clock-parents\n");
 
 		clk_extern1 = devm_clk_get(dev, "extern1");
-		if (IS_ERR(clk_extern1)) {
-			dev_err(dev, "Can't retrieve clk extern1\n");
-			return PTR_ERR(clk_extern1);
-		}
+		if (IS_ERR(clk_extern1))
+			return dev_err_probe(dev, PTR_ERR(clk_extern1),
+					     "can't retrieve clk extern1\n");
 
 		err = clk_set_parent(clk_extern1, machine->clk_pll_a_out0);
 		if (err < 0) {
-			dev_err(dev, "Set parent failed for clk extern1\n");
+			dev_err(dev, "Set parent failed for clk extern1: %d\n", err);
 			return err;
 		}
 
 		clk_out_1 = devm_clk_get(dev, "pmc_clk_out_1");
-		if (IS_ERR(clk_out_1)) {
-			dev_err(dev, "Can't retrieve pmc_clk_out_1\n");
-			return PTR_ERR(clk_out_1);
-		}
+		if (IS_ERR(clk_out_1))
+			return dev_err_probe(dev, PTR_ERR(clk_out_1),
+					     "can't retrieve pmc_clk_out_1\n");
 
 		err = clk_set_parent(clk_out_1, clk_extern1);
 		if (err < 0) {
-			dev_err(dev, "Set parent failed for pmc_clk_out_1\n");
+			dev_err(dev, "Set parent failed for pmc_clk_out_1: %d\n", err);
 			return err;
 		}
 
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index ea10e6e8a9fe..b93a61db9ed0 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -174,20 +174,23 @@ static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 {
 	struct simple_util_priv *simple = snd_soc_card_get_drvdata(card);
 	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
+	int ret;
 
 	priv->clk_plla = devm_clk_get(card->dev, "pll_a");
-	if (IS_ERR(priv->clk_plla)) {
-		dev_err(card->dev, "Can't retrieve clk pll_a\n");
-		return PTR_ERR(priv->clk_plla);
-	}
+	if (IS_ERR(priv->clk_plla))
+		return dev_err_probe(card->dev, PTR_ERR(priv->clk_plla),
+				     "can't retrieve clk pll_a\n");
 
 	priv->clk_plla_out0 = devm_clk_get(card->dev, "plla_out0");
-	if (IS_ERR(priv->clk_plla_out0)) {
-		dev_err(card->dev, "Can't retrieve clk plla_out0\n");
-		return PTR_ERR(priv->clk_plla_out0);
-	}
+	if (IS_ERR(priv->clk_plla_out0))
+		return dev_err_probe(card->dev, PTR_ERR(priv->clk_plla_out0),
+				     "can't retrieve clk plla_out0\n");
+
+	ret = graph_util_card_probe(card);
+	if (ret < 0)
+		return dev_err_probe(card->dev, ret, "graph_util_card_probe failed\n");
 
-	return graph_util_card_probe(card);
+	return ret;
 }
 
 static int tegra_audio_graph_probe(struct platform_device *pdev)
-- 
2.17.1

