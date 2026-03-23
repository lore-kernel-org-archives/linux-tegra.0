Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012057.outbound.protection.outlook.com [40.107.200.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553EC386436;
	Mon, 23 Mar 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260814; cv=fail; b=Uo3rZaHbZ7V0c6po88oNbk95svgY0/LJuBnI5nKbRbvYj2AXO1X62QiApy7mwcUIhAjSIln/d4Grn842GHFutLVu0byqV+C5TnElK3tm0iZsbntDs9/2lcjgko2e/VRB6SXzmk4iHVmvAETWtFQ1c0kqbQQjOESaS/c6w2woD/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260814; c=relaxed/simple;
	bh=+bTqvw+FxUvH6uvMfzw4yHjia4Wi1I9+geGlPVZLRqg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YlWyLKoeZ/EwEn639lxce6cQOilGR5Hq1/jwDBvQJs1FT1ltvV9JjZxSxzLeWAL1zgoy6+d2jAHroWhloPvJrOiT1klia82DmW3jOfEGf4VZ6zG1nqST1fpKDOHSZiP8/SZqiWpGzD7+gvqu2oco/rcYXwj7uUbr7xE8lI1TWGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p3vb1Q5c; arc=fail smtp.client-ip=40.107.200.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p3vb1Q5c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYwZssbMRNeGZjaolga9+SigkPMiSxCB+hSI+8G6fDRCNPvGO27XhfYW7U6MhhE602oQ++LOg2SGnT8tBXMJ5DOMUGCg2qeSDLDK7VJDK+JxB1esLARST26N1YA4lrGH/Uk8OUWJIPaHaaLgU8s9pwjGhWFsh1g+8QgY9SV8p9611Z56WfAIQozQMnNbTNnj8RMyUhbWwFvomlJwSxQKh0HKTflPf8EUID8Y2rOe+P5+2V0ztWDqRxpCHEil+LGbt/7yfYOc48YNWj9nJq92C/XDV2O5xZz2bEg/yjAHn4cOgyKzUOCTxY450PD5BSQMIR7RiZOluPQcJehr0XqYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y94a3udPE+tyEHx0FV+drw1q3ulVaCVN2sgqV55rFb0=;
 b=IhOW1nhfsrNpPDSKI18Tu98nwMKzaXvNPiv1IgP7Q4Vb9QqRWF+nnScannBtgxJr3P8y3wz0pPkvm1FznvHzG6qPwit5yPKhciDtz+CtkCumpMrVo7N3U1v3aiUCQSWwD/yK9c3Ynhkb+fJ15uSlctXTgEE+UcH5QEGsGJMNSpwRfWXhnxRpteW967kkn1sHhdYXPihuSifOxxb4fJr+7wAgpiEDZxkEO+tifvQTjZ6TwDkrcqYP9vt+v/kBY/yqjhm8O0mR+MpfZLRR1yUnjYkL1hXrwCXgJ94EcLUgx5TER69jTQQSEw6Wo3YNmrYO9+zcDMUK7QBLlUL9ekkj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y94a3udPE+tyEHx0FV+drw1q3ulVaCVN2sgqV55rFb0=;
 b=p3vb1Q5cDp2unjDauqO0ZEmuoQpH1ge3UqsX45hMYI0NmtGyO9wtyjJCO8ZHmemB3lw8vF67Y8HeoJqdxSANqmJHOjQayvGFz7zK3EjUNaczwaxX2M0sgiqQ4VqNHr55QoV/MyqudTB3ccseMqRuKmA3cb0tGiTuOA1XcudSb+P9h5C2IsOotnxEUHm0LRsJWIkkGxXgXHt1hemvMIwBKkS2wlmQIB4VLxrk5iX2KcFLDhSCQKH/Jvn+z4jIwJfUZHX2WtoKcwM9ZuvmX8Gu/9vekBVAOe3QdyFdP69fNMBzn4swGfpvmoAM7h3CpsB0aXxcZrMxIHuuG3pW7B1Cvg==
Received: from DSSP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::9) by
 PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 10:13:21 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:3d3:cafe::54) by DSSP220CA0010.outlook.office365.com
 (2603:10b6:8:3d3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 10:13:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 10:13:20 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 03:13:08 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 03:13:08 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 23 Mar 2026 03:13:06 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2] ASoC: tegra: Add error logging for probe and callback failures
Date: Mon, 23 Mar 2026 10:12:42 +0000
Message-ID: <20260323101242.3100108-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|PH0PR12MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 354246eb-04bb-40ae-6857-08de88c4cf50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yG/4IfAeVMsURJNUDI0+2yzVdYhE6eYgQiuM6mO/Mu31qmB0n4WuFvSwevzDCpvia1JcgG9NpYY4wS996erpA8SyIgSiMlbO8BxbTVZjA+HzSv2ACcjhtxCcyUxdOFF07wYOcBlAm4mTCwn6uoNygN2kJ53KwmN7Eh9WrCstJ25eKvoXLYxWnN9zAEgvtb6f1kKxq4BAK263MGUzWatb5xQtXNd107HrjANL/mvCeR/4Dsf9/hztSunKl6yETpWbEOb3uLks3cSIGlCccOOj2t809YuflyVLGRCMHvPtimFHARtNrxO0aUB8AO1vmOQampIu8FziejpCdYYHF8gCwsXE4mZ8ctpGuNdumJCum65Silpxf9a5zlZBlEu/XeWoQz6a4up2pAbrRp7kcdYLQ8igzE66sDRS6F/r+KlPXlf2LDQxgwjedAaC5lDXtASz1hQBAu7OqCHcRfW1MPv7cRut9SkxjU7ZNEllJR8LlzpDsF1yMi/DwuVe9noD5ip9AQDnp+y3KEKoxtpDQLw78DzkQ15QL7gxewDXAz1pLgJxOPjKygwkHXfgSjA/7Bw/RliYQoyStJAUz0HEVmvhEYj+42GJZXses2C037WzZpR2py/Y27Tq/GyfXJfpvH65JZuK9ELIRPYoFHycflI/qafsnaxlUlwuErxD4SskQD9ym0mdTQkEHhwJ7Rnn6NV0AJk6hzQU7u/oRZBeAjmTyv1L8TA6yOaBeslpF7xprAkl13hWzpIj1AtM0t+saH9CtFV0tlN0RAQLBM2QFUzNaw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sCvlynOIJ4bNT1k7nfrWxzbF8atXgnpAXyIbUZ0GZKfx1MhOup6lmlzut+okes+texyaEk3BrcLbP3ncopSVj8d+e08hTg42b0yY6z3/A1j7pi+3c4ie2MINj6xofsGxDFRP7VQrqaLLQHID7JhUEW2/rU+9aBijlGqMgyRWmHtfT+HZjP1hpZKER072AyHGbvBmma9rU2TM4xIWi9F31w/qsx2YzCmzxzsI1gX1Ty7MWpbmszDrl2p2T792O+p8DE90OangUt51XC4zoy3M8zkgaHhOIYywsmMwn7D/cXC5bTeBL6Uwpu0PGCjsnwP6r7WbRpWUpg4UfdOB63agNfMpIzfNHZZWrRyZYqwCU6cOdWzEQyRNmpLbzjP6cdjIp5M25UDG4YmlKDZ7C/9/0wKSgZTNRJLygsSn0yZMUVy28kGkPS5C933Nhrb2dFT2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:13:20.4694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 354246eb-04bb-40ae-6857-08de88c4cf50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792

Add error logging across probe and runtime error paths in Tegra audio
drivers to improve debuggability. Use dev_err_probe() in all probe
error paths as a defensive measure against future API changes that
may return -EPROBE_DEFER. Use dev_err() for runtime callback paths.
Skip redundant logging where the underlying API already reports errors.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
Changes in v2:
- Use dev_err_probe() in all probe error paths as a defensive measure,
  instead of only where -EPROBE_DEFER is currently known to be returned.
- Drop redundant error logging for devm_platform_ioremap_resource() and
  devm_ioremap_resource() since these APIs already log errors internally.

 sound/soc/tegra/tegra186_asrc.c          |  7 ++---
 sound/soc/tegra/tegra186_dspk.c          | 15 +++------
 sound/soc/tegra/tegra210_admaif.c        | 18 +++++++----
 sound/soc/tegra/tegra210_adx.c           | 13 ++++---
 sound/soc/tegra/tegra210_ahub.c          | 23 +++++++------
 sound/soc/tegra/tegra210_amx.c           |  9 +++--
 sound/soc/tegra/tegra210_dmic.c          | 14 +++-----
 sound/soc/tegra/tegra210_i2s.c           | 18 +++++-----
 sound/soc/tegra/tegra210_mbdrc.c         | 12 ++++---
 sound/soc/tegra/tegra210_mixer.c         | 10 ++++--
 sound/soc/tegra/tegra210_mvc.c           |  7 ++---
 sound/soc/tegra/tegra210_ope.c           | 19 +++-------
 sound/soc/tegra/tegra210_peq.c           | 12 ++++---
 sound/soc/tegra/tegra210_sfc.c           |  7 ++---
 sound/soc/tegra/tegra_asoc_machine.c     | 70 ++++++++++++++++++--------------
 sound/soc/tegra/tegra_audio_graph_card.c | 21 ++++------
 16 files changed, 137 insertions(+), 138 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index d2a5ec7c54cc..98e911e2ed74 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -1016,10 +1016,9 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
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
@@ -496,10 +496,9 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
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
 	if (IS_ERR(regs))
@@ -516,11 +515,9 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
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
@@ -966,10 +969,9 @@ static int tegra_admaif_probe(struct platform_device *pdev)
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
@@ -1009,11 +1011,9 @@ static int tegra_admaif_probe(struct platform_device *pdev)
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
 
@@ -717,10 +721,9 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
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
@@ -2265,10 +2268,9 @@ static int tegra_ahub_probe(struct platform_device *pdev)
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
@@ -2287,16 +2289,15 @@ static int tegra_ahub_probe(struct platform_device *pdev)
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
 
@@ -767,10 +769,9 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
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
@@ -507,10 +507,9 @@ static int tegra210_dmic_probe(struct platform_device *pdev)
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
 	if (IS_ERR(regs))
@@ -528,10 +527,9 @@ static int tegra210_dmic_probe(struct platform_device *pdev)
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
@@ -1108,10 +1111,9 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
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
@@ -987,8 +987,9 @@ int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
 	int err;
 
 	child = of_get_child_by_name(dev->of_node, "dynamic-range-compressor");
 	if (!child)
-		return -ENODEV;
+		return dev_err_probe(dev, -ENODEV,
+				     "missing 'dynamic-range-compressor' DT child node\n");
 
 	err = of_address_to_resource(child, 0, &mem);
 	of_node_put(child);
@@ -1004,7 +1005,6 @@ int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
 	ope->mbdrc_regmap = devm_regmap_init_mmio(dev, regs,
 						  &tegra210_mbdrc_regmap_cfg);
-	if (IS_ERR(ope->mbdrc_regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(ope->mbdrc_regmap);
-	}
+	if (IS_ERR(ope->mbdrc_regmap))
+		return dev_err_probe(dev, PTR_ERR(ope->mbdrc_regmap),
+				     "MBDRC regmap init failed\n");
 
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 6d3a2b76fd61..d9318aaaf32e 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -253,6 +253,9 @@ static int tegra210_mixer_set_audio_cif(struct tegra210_mixer *mixer,
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
 	default:
+		dev_err(regmap_get_device(mixer->regmap),
+			"unsupported format for MIXER CIF: %d\n",
+			params_format(params));
 		return -EINVAL;
 	}
 
@@ -651,10 +654,9 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
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
@@ -741,10 +741,9 @@ static int tegra210_mvc_platform_probe(struct platform_device *pdev)
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
@@ -329,23 +329,18 @@ static int tegra210_ope_probe(struct platform_device *pdev)
 
 	err = tegra210_peq_regmap_init(pdev);
-	if (err < 0) {
-		dev_err(dev, "PEQ init failed\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "PEQ init failed\n");
 
 	err = tegra210_mbdrc_regmap_init(pdev);
-	if (err < 0) {
-		dev_err(dev, "MBDRC init failed\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "MBDRC init failed\n");
 
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
@@ -407,8 +407,9 @@ int tegra210_peq_regmap_init(struct platform_device *pdev)
 	int err;
 
 	child = of_get_child_by_name(dev->of_node, "equalizer");
 	if (!child)
-		return -ENODEV;
+		return dev_err_probe(dev, -ENODEV,
+				     "missing 'equalizer' DT child node\n");
 
 	err = of_address_to_resource(child, 0, &mem);
 	of_node_put(child);
@@ -424,7 +425,6 @@ int tegra210_peq_regmap_init(struct platform_device *pdev)
 	ope->peq_regmap = devm_regmap_init_mmio(dev, regs,
 						&tegra210_peq_regmap_config);
-	if (IS_ERR(ope->peq_regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(ope->peq_regmap);
-	}
+	if (IS_ERR(ope->peq_regmap))
+		return dev_err_probe(dev, PTR_ERR(ope->peq_regmap),
+				     "PEQ regmap init failed\n");
 
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index b298bf0421b1..0f342fae058f 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3608,10 +3608,9 @@ static int tegra210_sfc_platform_probe(struct platform_device *pdev)
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
@@ -431,8 +431,9 @@ static int tegra_machine_register_codec(struct device *dev, const char *name)
 		return 0;
 
 	pdev = platform_device_register_simple(name, -1, NULL, 0);
 	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+		return dev_err_probe(dev, PTR_ERR(pdev),
+				     "failed to register codec %s\n", name);
 
 	err = devm_add_action_or_reset(dev, tegra_machine_unregister_codec,
 				       pdev);
@@ -468,32 +469,38 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
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
@@ -549,22 +556,19 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
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
@@ -578,26 +582,22 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
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
-		if (err < 0) {
-			dev_err(dev, "Set parent failed for clk extern1\n");
-			return err;
-		}
+		if (err < 0)
+			return dev_err_probe(dev, err,
+					     "set parent failed for clk extern1\n");
 
 		clk_out_1 = devm_clk_get(dev, "pmc_clk_out_1");
-		if (IS_ERR(clk_out_1)) {
-			dev_err(dev, "Can't retrieve pmc_clk_out_1\n");
-			return PTR_ERR(clk_out_1);
-		}
+		if (IS_ERR(clk_out_1))
+			return dev_err_probe(dev, PTR_ERR(clk_out_1),
+					     "can't retrieve pmc_clk_out_1\n");
 
 		err = clk_set_parent(clk_out_1, clk_extern1);
-		if (err < 0) {
-			dev_err(dev, "Set parent failed for pmc_clk_out_1\n");
-			return err;
-		}
+		if (err < 0)
+			return dev_err_probe(dev, err,
+					     "set parent failed for pmc_clk_out_1\n");
 
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

