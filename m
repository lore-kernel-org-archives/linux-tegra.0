Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167F839E17A;
	Wed, 25 Mar 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433743; cv=fail; b=SO9BzFpdhmlZFUhei+eTCBdTINpTofBNf7bTHsQx3c9QwfKAspgd4/PWgytvSYudVZXdRur3RLgv5TqpIF2VqW2qMO0CRjFVdnzCa0JUF9+L6WENkOLXnU6AQDQB269Vv3hoCv8fh1RW6UlKKxnA+syFybEbpK8lm9VkMmUKIyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433743; c=relaxed/simple;
	bh=P8l5UJMnlURCbm3o3gZBwupxj3NsCwDYB5aLJLgrtGw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pPzxFJSApY6IM0jyZvHT4f1YK53UV46/5MGNYyYA2Tmo4Ic53b+epWxFYtIobCvkbZ36z6SQM1gdMYSyARQmX4S6VeVJqWYZsDhfs9Bn7v1SgPk5mFbcH0/iQ0Z7Qq02GJ6Ppu7bI6VM+2+AoUshRpPkUe1V9NJer1wR2B0TrpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g95S0QRA; arc=fail smtp.client-ip=52.101.85.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g95S0QRA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB8ZlE9dLnH9vsZddzNf4dD+7djpgSxrmzR9yW0qnUJ7U/QBk3NsNlFAjr/fZpI4e9/Nio1lDI0bouFH97rltBLWpQ2QnfFltPToo0KiUUjpkEez6rw/OvBeXmYSSKgpAYKaEpuSKF69RamW5HmHCm/mGtYHdjtVeQe6bazwohPyohiVpAWwRqlIYCdcOnuK7pSBgeHhC0qW0D3wyjY9M5gS/3kMeoWASOcT+rrJsuVTMPwV/T6yPmONCFpIp+8e7uUxMLVh3MNGzlS2PT9QDerWtFoIVvw3Oxl28aVO2gYBtMv9f6snoWQPFFMu/8LnbADxBcE2m+2R27yAZdsa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0nECMJ4VNEu1kyO0OPq18XcNcvbfBenqeXOAadh6mc=;
 b=vgq5YvoraqwJKsiTgVqKEa1PZzV0moayI8/euD0ClIqHsBscobHnRe7BZiIyNv+/3TFc6TCVtgy1FjOxxo8kPZoTKrKS1d67+dB6raBcYs7qEEGZutjTiOiwe5TmqDtBBE2kL/QU2zzCUhRc+0Td7nXg8oLy0pCo8HWLhkyviXryjcgK85ZXPYrxPd5FsqFMjnvSODJbrv/2f2Kb1Wl6rELvK+eb2tVGRsmt+2iRVvMuaH+bZvjBYBUzawlkpDD2LGlv1y5vL0Ex8ek+22Lm2LJ1UK0E9OcKqHNz2f+o/elbhiPHl0M+lB8KXuxiKlyANRuxNljozrCEdhjY6Z2knQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0nECMJ4VNEu1kyO0OPq18XcNcvbfBenqeXOAadh6mc=;
 b=g95S0QRAJiGu477hDVCqUklahQLCadGgk4QhRulufzfVlh894k1euCQ228yTNDKqeF4SZlD4UPh4B6PO+u6EbCYCb+pE4R0Xd7mtYSqg5dcvcsF/fRlDIUlZLZWDNzFzaoPX2SI3qeM06dfYbpItVxUMZVi/p+8c9YklpmrkbeATJZ0w+fZ1sn0E/vS0o3B5xn4hu7ucx05xL0SFLeGnn0xafxIsEymcL1Sy9DxXApO18SDubr5KHU8H44fQ07hnUQP4MV0DlZLEwNaLTt92wINxXvXjSa1kZLlZ55js8JlivL9CPhaYmuP18v4b0SDDxlKlCjyB/wjAaFyW4Kbasg==
Received: from BL1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:208:256::31)
 by DM6PR12MB4281.namprd12.prod.outlook.com (2603:10b6:5:21e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:15:34 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::74) by BL1PR13CA0026.outlook.office365.com
 (2603:10b6:208:256::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 10:15:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:34 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:20 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:20 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:19 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 04/14] ASoC: tegra: Add error logging in tegra210_adx driver
Date: Wed, 25 Mar 2026 10:14:27 +0000
Message-ID: <20260325101437.3059693-5-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DM6PR12MB4281:EE_
X-MS-Office365-Filtering-Correlation-Id: 720986e7-a75d-4ac1-db61-08de8a577404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JV5WP2PCNLnZyxA1Ob0R711gng+2WuYVBFWigaYlVOLYVWwEA4GFlkM0nfDOt1hMAkx7AFdgYe+GgGzmqJjZuLm8F8ojMvshpUsrvcf+xI7yJFxYaJEDLPTFkHcwO4ZfeaO3RSfNmqS+PhliwIBi4woyHvZxvDkjSzO0MYNIi6r1KIxl7Uye87a3Zu+btccFYL0nJapJlFyvv1kwL8Nm0QXL1c6Xh72cnjSyYQ3DxIW33Kvy+MmqJyy/E5D56OL02MNbAVj7Tt11ZG9TsAHB8jSQnxIjaUKgQehrBZCmtQI3AWkI+hn/ahGgBd3a2kk4wN23iDknXzJMrmcv/l29i3OV5SyJTuFknY2+q+MYSY5Ct8GFct0m75gRoEGmGwdeeU8IrBL2/VeuV0+XLMQpr63WehyLo3mITKSn4xjmP4n3aesQMusgS4W6r/RMS+tnBqoxGxXApzTTaGXoQIYKGeak0oy02BQRbzDxMZL9fYvSyB6o2/AxAs8aHvMKk0ctlZyNS+RAJjB6AfQv11WNF75ZY82daTXGpnIOFaprNxcix7drTZEk0aNmEMbP2hFEp/be01XZ70tpxCrmttWgyVFDBXtLVBbapzZESKLGJgP59hH+1OyLEKcXIhg4QQAshWIg79X0d7bLP/nYS2nMkLdPDljRWnx8T5cdTu94+HMYyDEPnepsroCKEEg8xDNnZd0QhQvgeOPBJnHfWkiXhJK8WKWn8O7iKzhuYKcGm5RvkezASdMADevQZx3OuoJsSNSLOQ9dDQzt+SThVNclsw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pCE8ZWniloHN1KU7i6rGAhXZSZiL/rlwyzyQzsEHeotRqI9Z1PLAdOVTqshFM/8bXfg5Q4sOlr/u0dZaCqikBYqIQod11grKOKF8iqJz/eWyykS5C0aWggsvLjVO/118UYDVViiiuD31z1kK78TBnJoA2InSD2+t26YmylloUobxARO/OvkCGRcA7yqnMQK65xJ0xiw1hJQTxIhgdy3AcYD246eeMOlVL+J/ie804w1vJW3LcRZrCqzlTTstWVUNAPwX1siCdcULXORGPopBs7tQHsMnzmMc9cabBfuKjGLDfu5OkRxNJ03ufUEPBtayPFhZQfg5ZPYSmKqx9hHa5aK3EHOyaKjdcqkHxtNGtT0NmpWDGE7QaeYLrfQUej8ZAZ21/66oLPAI1vBz0rX+zAFeGw5Knq+RFmBJ83nVVRQs5v23+8O3kNeX2c+kHyBX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:34.4516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 720986e7-a75d-4ac1-db61-08de8a577404
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281

Log errors in the Tegra210 ADX probe and set_audio_cif paths.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_adx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

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
 
-- 
2.17.1

