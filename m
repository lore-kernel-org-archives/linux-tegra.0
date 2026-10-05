Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A6B3002CF;
	Mon,  5 Oct 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190607; cv=fail; b=k5kxkluHL/njy2BUqcOkNtiPYpvVGuAyDzTO8JJKkCMr0ssiPERkooJkp//sUHN4WJrmmk/tUdwe3QhISD+RPCsgjAy4yaVPjzc26V4ugoI6fVW5b/SIfc8hKxZneaGGejgHj3opblcOrHLHUs9L8V0hiUvcpcZaZDgeV+8CULQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190607; c=relaxed/simple;
	bh=TQAkiO7TAXeXBH4NJl+bYIb3uo5E/VfwpQ/zVnVlX2g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vyx5kAKEqGUzwsV+XJC+S/+QY7tt5DwM9SbZ4Smu2RzqNSmfhiSPUbYWWvWUkRRrT+OYm7NeZyl/VkBshEOrRnOzYiOi81USVurNwKUlqAtZav2YnKVIUeCvUv1dFn1GJbW4NqgnOfsBWQpYrYNXgd5F626YL7GKBEd4mqAbQvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jBxFUhaC; arc=fail smtp.client-ip=40.93.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jBxFUhaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaRZx6bCfnE0ezwqh08JKGCCf9hqsf8t+XV8hEBncnCdEfssfygBvipw92HbH4Dv5hlhaXJfaVQJX7le6yBRoaXKv1QeIDCYKffy5tyjAUGnZlcJwUSaNiyYxhnKT7UQIQCZLFPW41ArHdcnpe8nAT68emsapUDGikQF8RmKX4zYGRFco0j7B95x3q/+9k1nZxLZZBYO7Ga8XueE+bavtaMKiQQhaUG9WlvDeyJZ2DLNKQLClU/s229/eFl/ZZi7NidaszqJ84mBp3qAWriqbMzEx2y/C/3TwBu0/ntiIrVUrsPignboWiK2uEYiP2pfcwdEVUVh8zC3Dk56tf/tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFq+LbiV3q9bIAoN0khtv4SkfbUuAbx+ifLCM+BxygY=;
 b=T1tR/hKdtrQUHtM43n3v+GFfP4tz9M2Htbg+6mmOXi5IdxBGBq4Q3+A6PD7D1NGxOByDkBjXJHM+IRXKforDp7lrv4ZqRfaGy1A7Q1lq+95Mwsys82oG7VC0GKEclseV68YyrTtbiS4YOZp/4Y2sGgOKWaRAni1zHdPJetCY8tVn9/OXwvEDMnbsmDFHX3D1z3cxQbeavzv0mEgVC323xvXcBFRUJAsvh2KHm1+ZGrjJTVndr+sgjHbWKC4V/tQ7EqQSukn62VuXYvCB/fhDpqVeE6kZfgxteOH2CA476jSoslV62pqwjtfNwFt2YW0YjrH0r3cssd1Rj4J8iK+apg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFq+LbiV3q9bIAoN0khtv4SkfbUuAbx+ifLCM+BxygY=;
 b=jBxFUhaC2ojpxIChwoIfR9p29xwfJ2B7Vq2kh2OIjv/wT0JMDX+2NqkAWO09sU0f9/FYYtDNM00sUU/Z3CW8pd39lCuvS7ZiNJmOBCarfc21pBKFHqv3ULguon5qq2WJU68pfqa046iHuHdCjVMFSlB5d1UFOp7TcnjPEodZlLDuc5OgcqsrbjT6AoXTUd1JqAAsiYZTbhJzQRQNylbAvYJIQgm4jYslSpaqJVX39odzOtPxaUnew3AL9km06oahbYMA9izg45hhZR6ff+5RQU0VDiaoXk0Qic4FVzJrtf8u1RV2qP3ZFXJ8gnBxpx/F97fRywfewmwupBq7s0Gf5A==
Received: from CH2PR15CA0019.namprd15.prod.outlook.com (2603:10b6:610:51::29)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 08:56:42 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::25) by CH2PR15CA0019.outlook.office365.com
 (2603:10b6:610:51::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 08:56:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 08:56:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 01:56:26 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 01:56:25 -0700
Received: from build-sheetal-noble-20260902.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 5 Oct 2026 01:56:24 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>, Thierry Reding
	<treding@nvidia.com>
Subject: [PATCH] ASoC: tegra: Fix ASRC Stream6 input threshold control
Date: Mon, 5 Oct 2026 08:55:59 +0000
Message-ID: <20261005085559.2134401-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 704d3846-b924-45f9-74bb-08df22be93c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ue5GhFb2fWEBxUVhWvWMKKgYErct6btsQdMpeRsjdzj9wVXcdIVFrobyL9IZV0WwSZo+pXUoHlGoOvX/yzudehsGdJ8z1nQWmTw1qZ40Ifk5VyI453mIymoH3DegOBrJAU/i2WsykygimOYf1DYcSwqhiedjPix6MCbqrqlyAc27LYCKtRd/6nQxbtH5yVsIPeP8cUPoIa6sK2J9Usx4fTz0QSCwauIyaUmSNgXkcC1I/UdFTolOGQ58D77dBHewvw9E/pQRV7npQhI7/XBtQPoCUMpMSaku2cyp+hJCNfmut2tc7CQbHoOZtavM54XQvsxnruC65u6P1Iea5hdpEqeAODM+rM/72dfRQjSzSb/HEU1FxGa/EL4kN7yLpsuBvGC9bB7sGKTqOhud7cE0I/wOwlHeB3CjR9SIlZjPLIhcAP6ZttLLbRtWa1dt3YVA36KE0Dp+agt26DdO+Iod113NWQE7D73/nmV6eM+ZuGC1Mj8Hl7m/iN9n8bgjOa7T9oqmtp8OXfEgx4jsuZo4wSDZSBBLOXf/NhZwGGLqpvglR/47hoOJZjXtN8zkelvwGkzWea9KM1G89BoB54aq/KIPD9GT2uy/Sy3+gWrTWM/e1Jt/RFdX2NIKSJ+vmJo1DpwFcHrkc3UH+sxKXaPYExdq7vIYlLzEgVMZidqoSglErmCAFl+l6LAmP0R1c8t0r/xVxeIGUXJObqSvLveYcA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	egEXT/TpdDOrCNJW7BxTFdksrlrRpLvo8dV++lem6lT+j35Nka4/nKLgogLx5jeZuCR8SyxAEZDnBiPQJxFBP3P7Rt8iy3Zarw5IA6feiQNsCIa76WZpdC2rerjZ1mj9OT2yqcS+4NocLLlLzom5BtCEOQrY1Y36wXi+bgkf5cS6EWcIpSBEY7gx+FAQoj5NotZIWU4SU55m9Nm+B9reOESDCMZitGKXMNw4naOFitFKNRJaAWF0Avl702aTxBJTyFXjhCy75s4+yPzjxRMB7/av5gubm0JnvJXWbA+lX0OzeTT6y+RJrklNGrVntCDPaPqTNwSloX/YFGD7CflhYw2m9mzk8GZSrwyzcgNx2uo+qE2KWu0Oat1AoP+FFf1atwffIWpfOg1584FcWZhSSgjLrPuaN3k5ky4mVCAm9+9aUDKuWieL8COQ3UG4nikb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:56:42.6669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 704d3846-b924-45f9-74bb-08df22be93c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527

The Stream6 Input Threshold control points at stream index 4, which is
already used by Stream5. The threshold get and put callbacks derive the
lane ID from the register offset, so the duplicate index makes Stream6
operate on lane 4 and leaves lane 5 inaccessible from userspace.

Use stream index 5 for Stream6.

Fixes: a2df8c2d5b36 ("ASoC: tegra: Add Tegra186 based ASRC driver")
Reviewed-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>

---
Changes from RFC v1:
- Split out from the ASRC ratio-control RFC series because this is an
  independent fix and should not be blocked by the ABI discussion.

 sound/soc/tegra/tegra186_asrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 7f360dfaf8b1..d8ae5d997615 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -828,7 +828,7 @@ static const struct snd_kcontrol_new tegra186_asrc_controls[] = {
 		       tegra186_asrc_put_input_threshold),
 
 	SOC_SINGLE_EXT("Stream6 Input Threshold",
-		       ASRC_STREAM_REG(TEGRA186_ASRC_RX_THRESHOLD, 4), 0, 3, 0,
+		       ASRC_STREAM_REG(TEGRA186_ASRC_RX_THRESHOLD, 5), 0, 3, 0,
 		       tegra186_asrc_get_input_threshold,
 		       tegra186_asrc_put_input_threshold),
 
-- 
2.43.0
