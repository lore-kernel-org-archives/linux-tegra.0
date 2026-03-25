Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EC139478D;
	Wed, 25 Mar 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433738; cv=fail; b=BxQDBunVtKFRr+PWz77mnTsxtqFJsCc5y7njqfy2hd+acaPE+Zl8EI6VyVffnIH6RNK1d7xY9fckkJbzVIvKdiW7ilybzKo5mdwf3bVGjNLRJdllDE/QqH+ayYx+luaJUF5P2ef/l1ym+7kxU55yvYMf3+APPjMf5NLvab/zzaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433738; c=relaxed/simple;
	bh=E8jyob7/BmIoE0KzitN0m3vSwaA75FsbNAvnqIQfaPY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNG3Kg4VAJ7rdYFwyamFWW5mFIeZN0Wy/dO1Km4jGEk2KLRbwN7fHdij1/wpdkic/eHpcD0Lkn5z9MyDzx0I+ESIC9QAQLyG309xZh40w2Je7zosg64vjlY7o2a5O1N50kyN4GkpvoZrWwhdYBhwaWVmGBwI0wyFShlhaS904aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YNsXCFD3; arc=fail smtp.client-ip=52.101.193.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YNsXCFD3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+k+qgLsQYuQDX5U/eZqSwFOSAeaV7eRY0VKtIHE283gTbGeD4xjiTQozVYvZ6CA8V3nF6ZFyMUtWJEMg9INmzOJIKsdxzWodXCCq6B7y2a5eEDorWpPI4S2bjbCCYNUwy30aucCP+g4BLwn8Mi7g0V2SoIVIePf3vNrN7pgsO+n1Vr0SW7A/abCnopWFtnifFcMUBnUbf6amv7oGsQrgflyqobuKVnSNgdiyK/Fkyc4ROa7SnNbcn8lF6WMqXCm/+Us20LltBtgrdRYum9/VXkX0AWmDbClnvDKjEZ5RVp41nLIMpMzeY0R3Za8Qh8SWW6HCI/+PuoPdzNOBqRpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wY+pg8ITt1QLSU/LkSJUBTvsiNR3xABqHdrsHnuZCVs=;
 b=jsfx4YYDiFf92VaU38qlCJ7lEJa/f8BOEo4rIt1DbRvXw52rzvY/Uyq1YsxLnvpt4acONpT9xU25ORGQRgvXiiUnG2Y7sd3388YzV6ujJ2fOVRZ/w+MH179IcBDLLWVbwllDeWki2jhWrHK02wKH8WM05g1nQwT3maETsKnaPeoS8tDXysSMn4ekSgcLmOh1zEfOgED6nye80s847OA5DbpYuTdStssjr0S4JaMjKgnCRHB2Cll0IGltqMA5JgcOmbbK1WpV7AjHoDHkTKt2TnnBHKPvr3CnRAVCvfPOvGYbvJGvgeclx8HtCCL9FaY3ur6Me6thqT5YIYPyD2/aJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wY+pg8ITt1QLSU/LkSJUBTvsiNR3xABqHdrsHnuZCVs=;
 b=YNsXCFD3jthXf6it4j+Hp4gNXng1bFQMykD7KBJ4pt7SFc5/CYNfTaJ6R9vc2BcF7ExSqT2PtToxr0G15FEZI7P59/kM1s/LLpaVxCqlDq4Oi0iNT2m+uHh0Ar9rVw/0vdZU7F5+XB6OIzTNukDv3qC6sQiKG70YAqEHNrCa1wUHzA7hroPTqgP8n1irSNvopPvPcvldLdN3n5W7k8TFYWTSPkeEjzh1BJuzJlNK03IHu6iOceDik6Huu1VFwDJKzR50flFpI5abYh3TmhsGsTJ4HSBuLEKd/0WJBQHBrR3NDbDI8sI7dSQWQs2Dd8xmHg42Hzskrq/cDUiKTeVDkA==
Received: from CH5P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::19)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:15:32 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::40) by CH5P222CA0007.outlook.office365.com
 (2603:10b6:610:1ee::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 10:15:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:32 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:19 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:19 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:18 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 03/14] ASoC: tegra: Add error logging in tegra210_admaif driver
Date: Wed, 25 Mar 2026 10:14:26 +0000
Message-ID: <20260325101437.3059693-4-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 2473b67e-c472-4853-e918-08de8a57729a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	525cd3Eca5cXJYgYkCDYHT5gYns0qyE87ZKTG7zQvJCvWuq69gKS8RGlOHvyj7tyJY7CJHSTcU4R/L+65uw5shfG2AjKsxko7M/miGuMRjGHRzALveRSfk9SM5cofuOMj3oFdXRABaFEDQ+Nc6P+MJHSYibpKsEGLNkfuBcDE72GSdcTrUPJ5Qa4vYG9KzEZN6k6AkCMzzRcqedo+xF2gOJi2MUA2s6fHcZqVXc/LktOtMtXDcNgG77zuHTrmTx3IDOPSNeHQgQ36Q69mUk4+8juJaMHM35swkiE4L7pCzOLknEviXzCZ4Dnj3lp3rYjRvW75IjFzkS4KrwuxcZ0GnOlelr3nNLym2Di6823I9GmnEifLz+Wl6xpJOCqHvFbAX9lRujvWOmL4UBicYrDXaw9LCYI9QkxNXQj24fppIB8s3Ob1N/DJiUsuM+T4hKx/rwOvSIIq/4+DGdJt0NRNGV+uaw86og9XceTFwo+DuLFRU4fyNivDoIQQlJUhppOtSKS4pHGUHPGS75VyBjM0mwmGdMdANHRqU2nFyvJwzegX2eeqHTiwtLxpfn/RvuXfjFCUqnCuVtf6ROHhSX8KjkrES+i5R9lJ9fibN74V4uPXWwvhaaX6b0LoJfqM1dkxzuzahaH2zaoKdeHpL7AfnNtC+y1AYSuvOahWQmzBDyNLayohzeoTJnUMD+CUDzXQYPoTXc3NvlNlAXGS512wZXZRp/hxtCsMEa/Dmyi1tvMmOx3LCsWDakhVdGiz5BK/RFpQLIByWZioMDfzlGYBg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hhz4ccW6cdJNO8y9BtDlQSws7z3/S2b00ELMtNqzSS144zu1nJuwFo7KS1Z/2Ub/QPuD6dlynrkChYMz4VZ4UPysNkz+sRmICYyJwpd2a7Et/T2E8uj/EOHwNSnv7YxaXxgil7McWfymlOIO0o4IG7PawpBXqSJ27kqL6cYKoQh4seDx7knf3xGuStupxZmdQZqhb6ghtUD5d3TNdufePW5QJ7Ho9aWGZlhRR28FCHLKEmsyE0sTd3tgF/JZeARMP7U6KL+uvdIiF/BFc0RQv9FVOKHkk0qU8m8I5HRm2BilFEcNOCeUxeg53fydMEKnxqBfhIuMFGqi26/8gEbY1Ny9GMYAASDo/z0r+XAQNHtzYTeA4Xrkj47Wj5CLNeKMIWi62E84s/tU8Yd3BOpBU6H3t/8t6IMdVOE9Xfhweod1F4AiNR2G0/KwHZXO9fkq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:32.1101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2473b67e-c472-4853-e918-08de8a57729a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029

Log errors in the Tegra210 ADMAIF probe and runtime callback paths.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_admaif.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

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
 
-- 
2.17.1

