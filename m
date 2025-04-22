Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF55C23A9AB;
	Tue, 22 Apr 2025 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306939; cv=fail; b=LJmYcelF62lklUyXlOqbEIQJenN+dtXibwVuLd98XNIAZV2peXqsRQmjGMnU3ns63yyke10Sr6i8BPqilHzniuT+JIjZTVEztICi7pXF52G2eDqFnLcbLAKIZQurYoVPdZPgkPNc+vYnkE0nZqRWIUEUnjw0QpnkOqKYemDcaAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306939; c=relaxed/simple;
	bh=tmu+k33oFKInuGsaHZziim4+xQaxxYbvv9C86Fpx0wk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIJbGBj6KZZEVCbsAmTqmP62GnnrZTKZHy8HBFwzb2bwIaLTrwH6QCHVAAHWdnYpdpq12nCId8YphgBJmU4KVGukHpkPN9ot3BFCClxa2g/ofIZgdURG+rUeNCRzzIW0SvhPIillbAVca20r4DLd6q9UQSMpOgLgnI9TfmnpTFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VA2mw94O; arc=fail smtp.client-ip=40.107.220.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VA2mw94O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaVzR3UEIT+URNT2iIf0sRAz0haop593xBo1c+lOJZRKxyF7Gm3SoM8uR1BmmTKFEmjeiFe0JroBywnnshUnS5ZkxjBc1SX+4DkeEr7es9MOc5oPmod0+r9qVeeDk4srhmD8a/IWOIkhJMMEAPQHUDYb0BVtIO0XyKsOXE8QPQ9FU7MbGJ/ixnxZBtGRo9Ywl/pXkcKd08hRrpDk0KbTlMK6+DADkCOG5MfSdklzpZW2zwYm0DB6oaYjuwOo//2zrPVScQB0IfDPUmKU0lgDp1vjEjsoMPeUZ4FOlZl9ezXECQnAiidnrRRcSmc2mjr1YzaB72dmgAK0a6kYM0AC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ci+5wLBV09gVfBKk810+Ic7d3tWJdU179mt/KAB8hA=;
 b=KP0CMQvLpCO4RlIiPV6KSWwRBHBEiXsQMSvAEUEN3/9KAqLSIZ0TtL3wqb483LA8AeKu1f18M+OPTfCsf3Mzd4x1GVD1g9+1BKBALju0r6vceJWwHf4NqFZkH9OxI6ezPPVnjnmbA5BvNngz5Q/tfg9UmXsShPPakE4j/x2tXAWyQh1eq10uE7xQ6YroC5fluQyDrjhnR+mb37LZvngY+//zTTLMETjqM1mSQ9zoVm/Z9j0pt09utnnAZvnr+FC2nJ54m4nlM3NDDmMz/J4pNCcE+A7Y6bOlK7FOJV4JSCGVVgwoblhf6Yhubl7fn+condedSYZj/qHaXzQs8dYmfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ci+5wLBV09gVfBKk810+Ic7d3tWJdU179mt/KAB8hA=;
 b=VA2mw94Olhcv8Sv9errT8WsLofuVj0TEBv0HiHwHNK03fVFXCNUDlkTDyqSf3a8NV0MjF6Ff3hIyQN+KYHW2ZsgD2gjF2P0qJrg+w93OYDQVq9wgwYLG4nBVW8zCrkRdssCQg6bHY/xBFYy3PlhF5SlwV6ryBBfgIifLou1Y1bhBg2AD3rql5lJag/EsPK1m22qQvKhLmQvLWlblOnPm3xJjZsDr5/kC82Xm0ohTykLb3Ci9nkSILAtCMNPtxEMxxtZ5sWZJ+MPp34hLpdq/ld9ykm9AUk1SQXfiCytzOpML5fl88UWgBSkDvuBb24F/KvqOqgYzcxBcKhi2YwJVRQ==
Received: from SJ0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:a03:333::23)
 by SN7PR12MB7449.namprd12.prod.outlook.com (2603:10b6:806:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 07:28:54 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::e2) by SJ0PR03CA0108.outlook.office365.com
 (2603:10b6:a03:333::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 07:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:54 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:39 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:38 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:38 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 05/10] ASoC: tegra: Update PLL rate for Tegra264
Date: Tue, 22 Apr 2025 07:28:00 +0000
Message-ID: <20250422072805.501152-6-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422072805.501152-1-sheetal@nvidia.com>
References: <20250422072805.501152-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SN7PR12MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7a907b-958d-4ec0-c0a2-08dd816f564e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXE0SVB3NUZDcHdycDd0YktGdExadWNtR2NSZHhGbUNiQWgwQW9IemZBbWNK?=
 =?utf-8?B?U3UxUUVpdlVJUWpOMmZZQk1pN01zZkxsMk03OWtXeFoxVFVYU1dFZ2tyY3dC?=
 =?utf-8?B?UDRpUm51a0lwQjdjd21Yb1JJbDA1M2dzZWJ5cUh0Y0xtR3RzM1p0QmdGd3NE?=
 =?utf-8?B?V3g3NnVWdlNGYkNjdTRIWVpNN04zL1M1S3QvQTNzQ01Sa0g0V1BkYVo5dHcy?=
 =?utf-8?B?U08vTy8rWmF2UlVHN0NVR0dPMlBJMit2MjNaRk54bTV2RHRBc2ZLZXgrM0NF?=
 =?utf-8?B?U1N0aEFTRXBSZm5IcTl6b2QwVjAzZ0JKcXo3YnlPd2VxbmExeUFlMkkrZi9F?=
 =?utf-8?B?bE1GbjZCVGhick0xYzBaeThJSUNxY1BERlNzM1VrcmxMdDVJeXFBdUJaeitx?=
 =?utf-8?B?Q2tRTzUxb2hqUnhGbHFEM1BjRm5mWHRsc2pJOHJRYzJnZ3VQWTZDRDBXTmdx?=
 =?utf-8?B?aDR3aVd5M1pEQ1Y0dU50elFScDNndW1vbm1INlE1bnNQZXRoKzNtMXYyaER0?=
 =?utf-8?B?Y3hRNGRJMC8va2ZzYzZ1b0pZVDVzNThxeEg1am4ySnpjRGQxWGJGM2Myc25x?=
 =?utf-8?B?M0xBZnI5MTZsVnNXbFE1cWNKSGhSZmMvUjY3bXc0Qm8wdXYxb2tWT1lQN0Fo?=
 =?utf-8?B?NkZmSml5dCtKT1hUVXUzSkZIaURwcEFISUVnMEZtb2RFY2dLZDhEN0NwT1da?=
 =?utf-8?B?bWozSzZVUXJjL3lqbmRzejRDNkpBYml3OVc4VUpzL1ZuMHl1VWtyL1BkbGlp?=
 =?utf-8?B?ZER2M3RLVFpIY1BYVlo4a2JabGVmcG02eDdsUGtnRit3UzV2S3o1T3VMOENU?=
 =?utf-8?B?dzNDSEtidnNiaXNTcmNQZmFBVDVuVU1FVkVXdHA1a3dJNmFsbVRVRFlaanJS?=
 =?utf-8?B?NXJ2WUpOOGYxQTVIVG0xSm9KVjFQVk5OdEo2cTZrQ2dlWUpvcWRwVkRJRGpX?=
 =?utf-8?B?SC85ckd4dm5RMFg0cXF3SHhYMlZGMkZNdDRsV25aaWQ2ZmIya0w5OTVkeUpT?=
 =?utf-8?B?cUIwZUh0Z3hjL05Ca2N2QmtTc2JDTWlCTjl3UUxxTkJ3NVN6MTFTWFhqUi9h?=
 =?utf-8?B?MjFUcmpPcjkrYXo1MWw2UzQwV1Rybjk0WWQ2U1ZFYmVZc0RpaldrNlQyU1lo?=
 =?utf-8?B?L012QXNIb0RVRGxnYWF5cWE1dGxrTXJ5TUlEb0E1MlNWMjhCRnMrYmVkUjEy?=
 =?utf-8?B?NFJIbHpJdEVsQWwxOVFkSXlxZDRtTXZoTVd3RUNvRWtJT0NsaDN3L0hhMVFu?=
 =?utf-8?B?aGV1ODhIa0xXZkNxSmFBQ3RJcE5MUFBjeHRkVHpYQUFTYUpWS3lDRHlyNnVo?=
 =?utf-8?B?Z0l3dDNwajViWERKZlFZM1puNjNMNlp0bkhNTTFkMGdaWjVCNzlqTzhpUmp0?=
 =?utf-8?B?MjJiMk1UbWxjbFBzODNUSlVSaG0vR1B4ckNqdEF5ZE01MS9KeS9xTktDVzFD?=
 =?utf-8?B?NmN1SEpvZzU5TWZ2L0ovVVVqZGNrUkl4VWhoZXVOaDE1SEZvYzQvbHZUOWF2?=
 =?utf-8?B?QUFjUE9FemNwSmN3aDlkWEtjaFN0MWFjQ0J4OTUzSWQwbHBubUcwRGVwdDNZ?=
 =?utf-8?B?VlFURSt3dldlaXNDQ0wxdlEwME1QTTFUd3hSdXZxaDJCZWlYZnJjV0FpV1pG?=
 =?utf-8?B?WVJsZFJmS01hNmVENHh2OGZQNUZFTnY1UXY1dldNZzhoV256d1F1QXBoaWpO?=
 =?utf-8?B?U29OV2svZExqUHoybWpwcGFJbzdKZUJnWlA0RkxGMVNjSWhHR0JFZFllbWwr?=
 =?utf-8?B?Vmcwem5BR3d1YmdyWWo1YjJ4Vk01OW5kWno3c0NzWEFySVFhQlFJekRPMWV6?=
 =?utf-8?B?alVrWEhuVEUwSFNGVWRBZXk4OEtOVHVxMm84K3BJU2VFbHc0VjI1V3Fzd09O?=
 =?utf-8?B?dk51TnNtamVRNndsVzJjR3haeW5DRmdWU3BuTHJXWk4wbGVmNkV5elJGaHN5?=
 =?utf-8?B?M0xsUGJOUnRKenAwS3ZFUTVpaVhLcmhQMEh0RVpPUk9mOUlmZ2JKNWJDUXI2?=
 =?utf-8?B?V2k1RU5JQmx1VEIvQm80aVF2NnI1VXJKSWczNVFKR3R1OWRnaGYvY1FGN2hj?=
 =?utf-8?Q?gVPxK1?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:54.4583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7a907b-958d-4ec0-c0a2-08dd816f564e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7449

From: Sheetal <sheetal@nvidia.com>

The PLLs should be set with a VCO frequency in the 900MHz – 1GHz range
to minimize jitter and ppm error for Tegra264. Add the PLLA rate
accordingly.

Therefore, use 983040000 frequency is for multiple of 8K frequencies
and 993484800 frequency is for multiple of 11.025K frequencies.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 8b48813c2c59..94b5ab77649b 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION. All rights reserved.
 //
 // tegra_audio_graph_card.c - Audio Graph based Tegra Machine Driver
-//
-// Copyright (c) 2020-2021 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/math64.h>
 #include <linux/module.h>
@@ -232,11 +231,22 @@ static const struct tegra_audio_cdata tegra186_data = {
 	.plla_out0_rates[x11_RATE] = 45158400,
 };
 
+static const struct tegra_audio_cdata tegra264_data = {
+	/* PLLA1 */
+	.plla_rates[x8_RATE] = 983040000,
+	.plla_rates[x11_RATE] = 993484800,
+	/* PLLA1_OUT1 */
+	.plla_out0_rates[x8_RATE] = 49152000,
+	.plla_out0_rates[x11_RATE] = 45158400,
+};
+
 static const struct of_device_id graph_of_tegra_match[] = {
 	{ .compatible = "nvidia,tegra210-audio-graph-card",
 	  .data = &tegra210_data },
 	{ .compatible = "nvidia,tegra186-audio-graph-card",
 	  .data = &tegra186_data },
+	{ .compatible = "nvidia,tegra264-audio-graph-card",
+	  .data = &tegra264_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, graph_of_tegra_match);
-- 
2.17.1

