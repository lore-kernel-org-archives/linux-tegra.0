Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2930379EF6;
	Tue, 17 Mar 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740995; cv=fail; b=BREWp9EO8tocHlTPx+f9L0Xm1g6AEiE91y1LWjAx8wgB1Pu2Z9Owy5XLoSr/W2AkwFLOfKS88ZfqyRAnKY85DRCJ6TutNN8+LRk2skjM/ID84UZq/KzoGIzjntqGy8K8dt/Q/ihBqy0NqTSrwVxQ+J9SRQW8MZiOXEmU/+iTRdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740995; c=relaxed/simple;
	bh=1lmchsYOyvncRDAghZaUlBpnDmfU0e5PUuCy8/Lad0Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwOTpVUL0i+7JievE9V7uQadPOaBsqYKltUGMBGZcaXyCiCKfn3uX3mq+55/RCDZBR5XaXFTBW9EDV8WVa9bjVc8MajldFYfQlm7RmK7OHYt/dOIUJ8sZDkKRANVBtdlaxblTcwqv5IzlDlRgR1Vz5qxINBwJmXp0eceIYCOiZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CzytviQV; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CzytviQV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2KGqvenHP97RTRQL84swCoxcsKIRNAhGcL2Uzlftc41KluuloGpEk0SMDFdgeKxoCqYHUNk++QPCOOaI7IsxlSCBLJVzqrO/+gB61dKW4J7Ny5H1et4HRLrLKV63VIdfyGsgJleoi63fZ/AqjiJWs/Uhb1BAdmOBHJ6Mmx/2zjnACWFcmOGMgLpVnfR57sciNhCBd+O7oqa5mT9fhdOru3yLDwToiGMLSL1lDKCmlP9cPGBFSkYJvk8Hn8jw9KVZANSVcBd0AMR2r84XWjwAfyKSXlv9naThiZaQ/p7bgqCx0tbdaHfYh4JtMCDvZbW/81gNba/HVzsx6GxWY5KLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzFQ9a++YCuLMTrxsF5+snRpjzWw7GGUS8z0klZSlB0=;
 b=UiKxvD+0bQ6Mo4rzgAK2+Z1ksEHmUNKVDbKXmp5KAVbJR5f2pK7ZslNU8WFxszEew/DWM1i5Wft9sbVaW3bBE5Ne5/DfVqtjM4r2ePaPd7jvz3Nlwk4dLKbmS8BMNZTJcPZnYOHeG/8BDLbrCjf/gwEJs655WX+Ze0KuejRGTsD9twMjfIfryl0g78KbShrEUuApK9P3WdSjqgcNUiTUkqayH19hMBuEDkU1s0v1oaU+Opc/p6YMyLS6RCZmpWlOhmpW0pl6L+bIFJ0B2Hhx0hE1danICfYET+/1yYekis8Y/QthppGPeXInfHoH98H/h7svVGXut04GwnMI4A7yMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzFQ9a++YCuLMTrxsF5+snRpjzWw7GGUS8z0klZSlB0=;
 b=CzytviQVEU5D1OycLyJWG608rhNY9mnhnWUVWy0WrttsWsWHXjkh+NU2AxRxsDashljTZqkBHScbG7aSTQamAciPYfti/9HoNddN6uJ7ZmpmIVeFviBJwJXa487JMnnZQa5k/X05TZqubBzrZjOHmINQEsBTJpA5QAABrAno08OpzN5XGLAMSpipPt4k8jWRi1o9u3WyhJSPsN1iMM8aeaDNGwQLOmBoruwoKeGCOEvyP0RqsBKFNnxqVJex4ilAGtZ0YqbjAkSHHher07HEzYo7BS5g59223eZJ945iF9pboqxeUIdvp96xb9F6QSO8GcCFE2I5JUnq4Qn5nFe3XQ==
Received: from BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::27)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 09:49:49 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::e2) by BL1P222CA0022.outlook.office365.com
 (2603:10b6:208:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 09:49:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 09:49:49 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 02:49:38 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 02:49:38 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 17 Mar 2026 02:49:37 -0700
From: Sheetal <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Thierry
 Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
CC: Mohan Kumar <mkumard@nvidia.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH 2/2] ASoC: tegra: enable ignore_zero_sysclk for Tegra
Date: Tue, 17 Mar 2026 09:49:10 +0000
Message-ID: <20260317094910.1582011-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260317094910.1582011-1-sheetal@nvidia.com>
References: <20260317094910.1582011-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 76283916-0738-4eab-0405-08de840a8800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AmbLapJF+FY83FME7atN23BvYEO6eZmFSqmPCMYz+jvi94t3QxC7IYIGL5zZsZGXyKwvROlSGMDg4+40rh8oANOAQEgqoNKq9o8Agwa+wshRy9GDNDyRP2DMc4F76AxSv47sKZaW80EigL3Qzu20N3UvrJuhcCl0eBNBHEDWdNY+a47Pz4Az8vR0kt5xCTXNw33pSYOgs8rFPyo0UotfR0k058an3pHthF3D6806c8Pu3bTsYbs3FvQcZjj4bg9T6949AtLNYuSByOrJ8fOlTZlAH4dM9dZ2TfoHYMPomdu5//ACXIIErZWAycpWmJm7TsmlbcLe9WhJLnY101GAuqNaOelHUCfxJXXK24QOmWpfUxFJwbj+px2TGUuEyejzv42iUqiRoheGw3hmFYGb0ZxWMRfOH9EqrxrAhpUpYCmOqSsSoD3tg8Q0HozxyqQTwzd1TU4jGJ8B85XNNPzx6GuIKItuJ3JXA9+OpfjoOVSyXgu5KcNDIEgJ8mXl7neXVaOFk/oERcqjHmnNW802/u/KClGsV1sxnBbZ7zF+ggi7n+vGLcYJv0rPpk7x34DEY/UE8k9HrbyeBBztY3IDZAZov2idiLG1PzblsRu+k9XUmNz+RtAlAu6D1eGTxBlZmOlHtvnuwMSQ5IHYu+8oAtoNUHi4RzWk3qTPaApLoMk3vs0cj8fTCU56/xxH1Yxug8upu8/+2P6sEOWjEYaJ00FHJmrvGb9zstDcx7iW5dRXaEnHt1lLUU5CiTEvYomGyZi8r4mslebuX3wV5RoHbQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fWO4Oz0OsdV1y5kOOvfN8LGBisRWM0Qa85SSZ6vlNqq7qpUEL9LXPvPXtCNTMza62wRcFVLi3B5l8yzzR6DKXigWOq/EomCisM3Oi+qwEF3ylGlHbJT4qsKLhfd0Veyi/A6gDmdBWlGpdyucJFwmxokJE/ffdM1bDfn8iVTLSdcNPMVwDlE/FMcQxbSnZy4P6UU2UYsOvbvcyJBZ5QfkFp3AIiHgg2p3Jn4g8jGt1HJZsu7eJVCFsU1djqGHDQz/VGvjLwTdJKD6U+nBbhLwJsYMdYKEJANoDKwohHHHI83171jED/3QFRRMn0hvzpG7+fh+TPQLL9llwtuukRKLTVETiNOSQMyr+X+OA8LGELkv1ach3tdDiApAuQNAnTuQTu2qwunoRrkzjikTmN0cMZ90O/C9i68Op4S+imSWBUER0FdVhNQSU8d43lqnoVL/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:49:49.7576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76283916-0738-4eab-0405-08de840a8800
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080

Tegra AUD_MCLK has a minimum allowed clock frequency of 1.5MHz, but
0Hz requests cause the system to set a lower rate than this minimum,
resulting in the following errors from the Tegra Boot and Power
Management Processor (BPMP) that configures the clocks:

 verify_rate_range: FMON_AUD_MCLK: rate 383999 below min 1500000
 fmon_update_config: FMON_AUD_MCLK: detected fault 0x80

Enable the ignore_zero_sysclk flag for Tegra audio graph card to
ignore these 0Hz sysclk requests during stream shutdown.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index ea10e6e8a9fe..3c88c43e1273 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -209,6 +209,7 @@ static int tegra_audio_graph_probe(struct platform_device *pdev)
 	card->component_chaining = 1;
 	priv->simple.ops = &tegra_audio_graph_ops;
 	priv->simple.force_dpcm = 1;
+	priv->simple.ignore_zero_sysclk = 1;
 
 	return audio_graph_parse_of(&priv->simple, dev);
 }
-- 
2.17.1

