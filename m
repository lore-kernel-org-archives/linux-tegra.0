Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF95F3D5672;
	Wed,  1 Apr 2026 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042745; cv=fail; b=AFd0VV5mXApa065NHnqY6/GP0gDzo1ruFS1H1896hUx+OHjxkYl/3TYCQylK4mmYv7GY3hJoPAjg1nDR9fGctWA78Q2TZ/Q2yyO1XwFiStsUHtBgxwS6sQtd8scZ9RTHV4yae1cHkB9U//OtzRTYQ9TtFzBIY+VsejBWf1Nvyao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042745; c=relaxed/simple;
	bh=hOLgUlXstXn4TchGmexlf+MxRm4hBKswQl9AjYazGuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YZnt8dGu6XPiAb0tX8Oi0uK1eimpEk2mYcNNUbKDEzdeJ4kugADtFzK/Pe77+bHp3c1hJoHw57hchk3PVlZQAPeBZD2UJ3mGerjhMqdfN2xCL7XJJoiLexk0LmJLp+5YUBMo+O7QQ37adzAkQkiHbQnll+6ul4odfwt9NGftkGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aJoLAx4H; arc=fail smtp.client-ip=52.101.61.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aJoLAx4H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4FaKTFVI+dKYng+Fh3K6L+AtKysvwOo9ojDaetJJS6Xq3c58CSCngNBm6IrGqQuih3hQrZIYEJmOXpltUpUSQxmUSFaZbIZLfTlLpwZRGZpcHTFPQxhujSUxD1Rd6kXD+olHTIXM6pitxjQFtN2ImAM9ZAEOe4cQ8wJ8H1du88URASkDhq1lFUOqYfwcMDlsuTEWtk2Ywq2ALD1ZChx5V4BlPAc10HXb6t+BsrgMiSPWoUBGTk8KAaBib0hmGsV5B4PehrLK7xeVJXCBBpFgad7H6m1vFpgLm5kvhj15GKq4m3jRamZVHSAfLTgw3VSb3/sKvpXqOyweDFPWODxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvirwrUE/YExDvcA9SPmgv3tlGooNzaTEIGNDwREI2k=;
 b=s9c0bkrFg1wcnOoVDNeFhjuLuvEGBVSYdWp0DTEbiZnaqMH4xSGrIVUJQQgghBtkmCPCchoU8CsnUmvPL18GefzEN75ImeLq+Sx1iMXGfOrXsoCME6N1IpslOvTtucxKV1NvcdZwaT1dN0fjo9IAXVJifVLxJIOAHjl+2ao+fdjUKr1ggklH6y/UG6YvUCGYeDsKqa+1n6CRddg4Y4WXGo2s+RxP8Mn5flccX3FWEeeNpETR3AakrghcTDg4peTe2xHOirXWN9FyV1bp7iS67IRqaJnJmAZ1XeNN7uun3Wb0iVCP7rMUAn9GpMsL7O7ks0HqXm8g11sNFWhqk07LNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvirwrUE/YExDvcA9SPmgv3tlGooNzaTEIGNDwREI2k=;
 b=aJoLAx4Hg9vxXIm0bmLyerrxrKjmJTzUxW5CqLTqAW2MaR6A7N0fiTLk3wBd84lbmJZwXFSbcw5ifpEqfMkvH3NuzQTZ4hhPxMa9o7kaU5DY6e2OmkgRaz4gFPVZSLUyXxCd7uWtzJ1Hc/xO6C3WxO6YUEklBdzQHg7qo88snXihSUKWAb3jf3U1PCX6TSi6N+TTXBlHl1YXlkzU7HnxLB9ZHzv9/5LFpapFvQooX9FzJhAmmMIWF/IGPAlQqpAzQSOFThr0SNeN/EEGuyDWiCHrp6b+UJRhyoCNya6I7nu6tp5tIEtFlKvAEgT8cKLdBc3anYyP2Q2QhamMEsDRiQ==
Received: from SA9PR10CA0011.namprd10.prod.outlook.com (2603:10b6:806:a7::16)
 by CY3PR12MB9653.namprd12.prod.outlook.com (2603:10b6:930:ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 11:25:37 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:a7:cafe::68) by SA9PR10CA0011.outlook.office365.com
 (2603:10b6:806:a7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Wed,
 1 Apr 2026 11:25:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 11:25:36 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:19 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:19 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 1 Apr 2026 04:25:18 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v4 1/4] ASoC: tegra: Add error logging in tegra210_admaif driver
Date: Wed, 1 Apr 2026 11:24:57 +0000
Message-ID: <20260401112500.4076861-2-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|CY3PR12MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb8bff2-eb3a-4b6e-e551-08de8fe165a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7I4wsPoOjIyPwlvDsb7vWxgyHX+cRfwQGbxC19+PCIiIr2bprPn57qVTwKIidCu8ZJBb80XjOesmXuYKSl8mRo3GBM9gqCeUBCT32vcTaLKe+2Qrqnm6+XWWLbREdvtmidIMU+5gSWQQZdyQHNYqfKDm7GzJa6i1L9xgFim39CIFz8kcUKWEjSKqH2A6ituTj/esUsnXwEDIxcS469QY4fgdJudTbvRI/5mg0EK8yhNQp6I5AnXaMkSA/NsR0uAQNySDH/bp7vEKI2xCcVscYQuYzAflwV2XyDSIU+pL35DjlTM7+w4rtzYLxHC8znEwBbFluJcai74wFJrUo9y9zK3ba2x/IEBpWR8jqKBKOjJC1JYvRRi80AL8/qp10LjRHlagaQ15w5e7e9iQni7P76eA9QVg70pGAyFadlnmXApJA3VPJbDw8dOaPZKa4MOoV2tR+TcMORFf5td5pI9MMaG5BapuzOrsRl+9RxyQlpeuas0CBDg2mtkvef0Bxi0vWJjbjj2Se+nnWyvoLSCf7yfOXNVvyAc9myvkwnisf1pvOTLOzf4W0YqNVeRTJI3PnOPYQfVkxq+4+DKA1fqvQx1kiPKJPFTE4CYFce1wTlJLjLsIv6pEcRa/B+Wpue8IWvAP4bYkg3sBsE7Uy24hu1mnEsuxMXE0BFqLkWTKIW6b69oDdGHNy1P/NwYAg6H1o5mo4XPcVqL8p6HlnVMhPCjTgZDXsN9eg2po4k80IVQUfcvNUbwZ0n9Dx4IgJ8EKRmgAsIRkW1CAu8tS424jkQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cGn/F14wdivIO8WeGq5vGD0Et47t2Q71o05znUePwExp1+dHXUkDOBRWGjrwGMBAGIMvkETgdH6ob7sBPHbbrNzEWlDSLrIhMAQANrw1t5Bqc9ISy3ivLCKF5YMJKs687icF6dCp8iIqg/I6q3n1KNfnTgVxBFSmY7M3o1x23ZU8p2J7B5w3qplivWE3GTNxk0Z10isRKpve2t7B8K5hJdeErIcPiBa1puHbnTCsyMLPjTOhhRNt2PqhH1AawhprpKUJfpROsZtHD4pbLXtQBvkNtsxP40HvyzluD2E1bLRJOBo3pdQfjBnLUSZ8nsj0p0kngoMMESijYiOh7PpnCjQqcXzLwaG2XTmegGjCfkBFO4Hb9LULbcFmwowQDMixxISQqvgWW7MGz26CVnneKwmIEX26J8pXJwfWzwsRgfHzaM5O+F1JCwZDVDjksL/l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 11:25:36.6979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb8bff2-eb3a-4b6e-e551-08de8fe165a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9653

Log errors in the Tegra210 ADMAIF probe and runtime callback paths.
Drop redundant dev_err() at tegra_isomgr_adma_register() call site
since it already logs errors internally.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_admaif.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 0976779d29f2..a1b2c3d4e5f6 100644
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
@@ -958,10 +961,9 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 
 	admaif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					       admaif->soc_data->regmap_conf);
-	if (IS_ERR(admaif->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
-		return PTR_ERR(admaif->regmap);
-	}
+	if (IS_ERR(admaif->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(admaif->regmap),
+				     "regmap init failed\n");
 
 	regcache_cache_only(admaif->regmap, true);
 
@@ -968,7 +970,5 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 	err = tegra_isomgr_adma_register(&pdev->dev);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to add interconnect path\n");
-		return err;
-	}
+	if (err)
+		return err;
 
 	regmap_update_bits(admaif->regmap, admaif->soc_data->global_base +
@@ -1009,11 +1009,9 @@ static int tegra_admaif_probe(struct platform_device *pdev)
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
 
-- 
2.17.1

