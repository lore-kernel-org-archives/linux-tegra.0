Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667BC2DF6F4;
	Tue, 28 Apr 2026 05:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777353185; cv=fail; b=sGw6IqpekRaT7IrGvp1g3el0gdTlU0m8aXmYuwCY2aZhUSA6gQ4Bev3NgGIKY8cSMV+vHtVkKsZGE5rgXmPNQjVy1dMyLFEMzrGevEhSx07Uipn1fvLnxbSDhCOAyU4R7xc8gZlWC48hp0yGyO38s3EmFFMOKvnrDd5rW9HOjhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777353185; c=relaxed/simple;
	bh=JPbTUHrn/KKX+CHDzOzeXbsUWczSHwOhc6FhaHpw7hs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u65iyehAlphgBP0nz5vdUA8xfK7iafI57Jv7zecvo+7zUdsVFncdsVKpj+mNUeTI5xNrQfyvO/UfVBGwYDaKXg1nd78QNILEWF7RrM6kium8ziWcwU6HeDDCyY2aJ/MijYOWgm9zINKSCB5emls308FatEed/i1nzHSrRy2wHW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WL2P/NFh; arc=fail smtp.client-ip=52.101.85.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WL2P/NFh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+37PdsXhcZqF+HX4g/4ZjpxcsWe5GzuNkHapsz6YU/Frq9RMWLjKBoJ82mLRTgrwLVk4G2euB/ZWcsI6lOi8U42Cq/Spg5ZhKRjgVzXCnjLcN62oGW7owyEcx6hK+10yyy+EdPHIiA9zslM1oFBd5Jtzjdo163RXFtgKyQZo2/oNQqd3cJy3MJGrlhu1t6EZBUUBuQJDmpoz7OPLYL9oN/Ix3ApKJsUY4w/wxoAep/sBSR+I9k9VM9XLeKhjEcuuciFaI3QMX7D0iV3dsu+AaH9Xs/k/9tfiR/HycWELeXmnKxxbLDcvktkZxrVfsK5i27ESPizNWi12Kjsi8wI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZalfikKIJwQCUi4YVHaEjl5XxHCG7LKeCudHPzrha4=;
 b=hyyEpJ+0Dkj04Jx+ahbnpRAWovMwvQUjIcbw5Ik6KClNUm4AtkmIp01zvM8m9ol/KqyqRsAUqY6NAIK7uQTCh8QlhryJJ7yepNh423tjfbGHubz8bpILv2NhW1WcUEOnvNdXYkeUplXeX35h5NxJiDOWjQUIup+Z4KHAkO23zCw/VOXgWK36oOnJtgOPtP4gVGshzo3tFu6XArgpNiCR/Ea9dLMdKM7oGpOiVOLZRDUi5jnVc/0Q6sBQ4MOo2BBjMReTAAT1Ney2TEjWv1aIXT795+9mUD+B88eZSwQMYHMN76paYkYS3GkiYwpnpHA/d3w16Ul7t776SzlHntphsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZalfikKIJwQCUi4YVHaEjl5XxHCG7LKeCudHPzrha4=;
 b=WL2P/NFhTCzenq5xv1xUKjH4LH1acJfqBDV1vh/MNIiYK10IcwwfteMCAeZglngdKMRjjqe+3xdDrNWcQdcpsvKkSLBh0IVTIXFl+EbRc1XVDk+47RnVNqlY3pSnl2wXUQlhRjOXKhchKzipv+e6u4X8Rn8E1ZY4Ge3sLiNAjqUV+buV57qifpE9+Weh8rlK74RBIiGehssDqWS/H4HTNyrlMgRI5JiGaOgpbHZi/5rBUbECgiCNzDPDdvBsagWmu/C4/GLHvJCxTV4eN5qM5Ftcin3gHM2XLn6PKRCCclWBYRMrYSlHO34hAJcem61FWQzitKDHuarycW/o2lvO/w==
Received: from CY8PR12CA0067.namprd12.prod.outlook.com (2603:10b6:930:4c::7)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 05:12:58 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:4c:cafe::4) by CY8PR12CA0067.outlook.office365.com
 (2603:10b6:930:4c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 05:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 05:12:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 22:12:38 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 22:12:38 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Apr 2026 22:12:37 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mohan Kumar
	<mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Anupama Kunkulagunta
	<akunkulagunt@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH] ASoC: tegra: Add S8 PCM format support for MVC
Date: Tue, 28 Apr 2026 05:12:16 +0000
Message-ID: <20260428051216.2746030-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|CY8PR12MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 27549537-c7a9-4ea9-a8a2-08dea4e4d045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8tXBZtVEMnorALjj2RJkTM+l5l5emOgD19cyv0jUJFUbUNHPgCB3hti+a4D4P7ZKCrmgc9wEIRruLu5WFxjr9ffH7mI52qUL7o6mfNqBRk+qaY+Q6gkneuTrbM7azJIuH959t+gU/+z6l16wxoN9FMcbUFHxxZo5r6asujXDXVpGQ5PO9ZnGnifOueHmUF6EQxZZKBopd09CNqprkkrTKCzUhC9UoyETkr+ihwEEMuVNT80cvI7/WplZQ07U9V9OSfEQJGqgl59VzjFn3xMh0IHVV2DXD+igT992MinXCO1lOayRIkHQDq3+LAvoqnhk0Y9Vp+4QOP/0f4RhKfjpvo+yZaoLGGV/BtynG/yPEShtRggnOvC4C37ftwh8t4oHeD4+CsXv+BrVULrV3YDy3YcuDgmQX6WiKQgpCdURsM5xnvB4DX8vX2ie0E96rVq0iYLA8TeKJsZqk8BBpPxZU0R4SN9b5UhaYGoUlXP55/lq3rtGqutfK7J03ZeGwK7qmftMKHrV1++n6iRjBJK+sUkm/N+f4y9m4uaIaSW0zs1v2aR5n4TcdmdRr34fJeO64SNV2YXA6/GucckUNzlKjDPWasiH5TiIrBkOc360pUmYo1b5ofsKy0UdIsHdrb1wQlioPP4I/UjBlodWSY9tt7I9meLsMqeMt60slOYOQtlElcdkdKphfCecTExeFMW8R58bifo4byNkc4hM/mqhS7C6zCoUULGwfr1DCvUiIAiAOXywN5upG97sUa+5lJ+S6kdlWXgWjWgP+AjKi3Ftdw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1JwRxHSuOM/1XFtlCGYMEO5qmjNdmE24gZB+b4H5gVUxLWhul+obLF93F6Tlos3et3+l30M7txxR/+tbuAsMKinq1cgN/FRUVV5LUEgr8X2Iqn5DjjQLpFa4AGAEFck2qTje0T4BTwSy8sv7pbbYqv5vcAuV8f51gXDgE2I3A8NWvJoPoEQ02b30Om4+OeynSpIJrHkTVqgAtHhdNEKWqSJjl7lpARIisr6DLLWkXiagd8SfhtesDfFrJSRh+3TIh52BcTwtSZCyaumsgttzSySH28SxCq8ey5nbKY8etP2rROcQxhr8Q2gTaZZVy46nKCKkxzoDGzlJ3VCSaXDHlPRVhhlXJ7y+/B2rMPR7BcbVZ/dwZ5z34dw4Ys5yDG4bI8k2eV8ovxQetXZTFaGhXaWD5JF1YQJEFgUcsance0fyt6fNySCsRQpV4+dNxEZ3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 05:12:58.5511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27549537-c7a9-4ea9-a8a2-08dea4e4d045
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684

From: "Anupama Kunkulagunta" <akunkulagunt@nvidia.com>

Add handling for SNDRV_PCM_FORMAT_S8 in the MVC audio CIF
configuration. This allows 8-bit PCM streams to be processed
by setting the appropriate TEGRA_ACIF_BITS_8 format in the
CIF configuration.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_mvc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 2c299704ef4f..07b88e5f18ae 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -438,6 +438,9 @@ static int tegra210_mvc_set_audio_cif(struct tegra210_mvc *mvc,
 	channels = params_channels(params);
 
 	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		audio_bits = TEGRA_ACIF_BITS_8;
+		break;
 	case SNDRV_PCM_FORMAT_S16_LE:
 		audio_bits = TEGRA_ACIF_BITS_16;
 		break;
-- 
2.17.1

