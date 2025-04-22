Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526B7202F7B;
	Tue, 22 Apr 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314719; cv=fail; b=k732EvgknMq6XbTL9omxDSGbPjI7UhgDoBGZfHstk97ICEtgFIIOer1hVDkem3893SnFzpbTyKXVCCvSlil2LPeTUeAvqwwCyTerftg+A5riELrOSr+kTsa4h3w1wVdjNpkfPROxQNZJkzpOJJZ/7dLHGP5dporvBSMQ17dtUUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314719; c=relaxed/simple;
	bh=tmu+k33oFKInuGsaHZziim4+xQaxxYbvv9C86Fpx0wk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kSK7hD0vv6vzjqlebTmdJeymYUMqtm1jXZL/6hwhrp1F7Ji103YwUxL4eSR0KJ6wFRO9NpwhxGPWQh/oDAbtuHhcNSLxGhmpfcGZX1l6fY1vaANtg4VcnRwJ5oOqNJ4mmv5UeDf8jOzp2rFDoS6gucdxk5NwuPL9eSC0b0Pz12A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q2bOGfAE; arc=fail smtp.client-ip=40.107.94.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q2bOGfAE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSbJZl2rit6X8AZBY+ogg9O6T8OlCDB9rW4X2rSHQuGuL2D0PDiYn8l+ibJFFOXN51wCY1BdPaGWUcbz1uMv7nM/ZWqDbFxW+cgn1W1iI8LVs6tRLgJ+aSJ8D/GCcmJ9FnJ7vvmSMZvMfum01Q5vZ8bM1jnoZu+UYabtJDbv8Pg4N3BGdw+4CVnfgMafk9NqhA5jVUTZzma+Es1GVRhuvgpPE/zSyjaZOe4+8osEFYIL4KzAWZlJnr/o8vN89D5aVCeDM/BZ4/pbEFTYNGFk9Eew8u4FsJ5A7g7yOTtVLKnhHDHWkRUADkVsusxs3ZePF/hnjcFAzI+Jo4QVeAhIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ci+5wLBV09gVfBKk810+Ic7d3tWJdU179mt/KAB8hA=;
 b=XxT1wt3nX2HRQANiWehaTAoZW/YwaNL/qqXE1icPr9Cbf5YE3pT/XZnVn1uDCZZSxy01iwjJl27rcnUhbYVg5cpNw3+G2VWSNohAWwtDfuixwFKxWDrA/DNDKLnlIiMevFD8VmIVc9bSfcFWWumjSeWY6/0uT49PQXnf0fQZ8Vl4UkNpP1EDB/imyW+bebP36Eg4iew3TEEszbEXrbr29V5YbQC8CpRMvpsQ6WUKEgmmc2iibBQstns3jQCqZZ8ke/OejiyoJF0hlmq1NveG7tJCoLegtFTgADZqCIqk2Or2bdQdcuKmBitsrDo1lbUm/W3pllq4lOWe+GiuS44tXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ci+5wLBV09gVfBKk810+Ic7d3tWJdU179mt/KAB8hA=;
 b=q2bOGfAEM8T23C5yYcssiVnRRpsXi18+TTVFxB89ilnmZ4ysLGLqki7doOi7ct/lc5DNL3uAlT6MZ3ip3Y4hLNh3OjXDs3U6GS+DTF/CsRfXncxLv99CfD2bHJYVdzGJldX4EGdKCi20kHDuyuoy3I1QEy98M81zXh2qaVzFJrW8gGLIo+YtvuV3/wIZ95qXa88cnJ9RMIItvQ3WkHxMMcH6OYoPw/0DD/nDNxcGsB3NMLNFeyOvcUpWAj4sAfWTyP8K3ug47u+Ky0rYcDPXaxs6DjkXZTeoW/XdYf+zZLHh4y1KgPoqJi+t7jx6+Woy5eeKkZLlzTZccJ72fmt1Fg==
Received: from BL1PR13CA0346.namprd13.prod.outlook.com (2603:10b6:208:2c6::21)
 by MW4PR12MB7030.namprd12.prod.outlook.com (2603:10b6:303:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 09:38:33 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::c9) by BL1PR13CA0346.outlook.office365.com
 (2603:10b6:208:2c6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Tue,
 22 Apr 2025 09:38:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:21 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:20 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:20 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 05/10] ASoC: tegra: Update PLL rate for Tegra264
Date: Tue, 22 Apr 2025 09:38:10 +0000
Message-ID: <20250422093815.506810-6-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422093815.506810-1-sheetal@nvidia.com>
References: <20250422093815.506810-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|MW4PR12MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: d76b461f-d65f-4b8c-6fd5-08dd818172b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDhldUFYSm9RaWtRYU5BaFVqQkx4N25DSVQ0aThhaGI5bmZjSzhNYThzdjZX?=
 =?utf-8?B?ejMwRTM1QStYYURXK0VzWks5TE55ZU5BUk9mSmVhK01WVi9BTG4vRzFSK3Bw?=
 =?utf-8?B?dks5YnUzeTU0cWpSVmovRlhqVWRYQzlCSVNUN3J3eSs5ZU5kWkZkbDF3N0JS?=
 =?utf-8?B?aklnY3RFNVFyWXJIaDhYckpyZGZkODRscjJIVG43ZUVGdHAyZ1A1bXU1TDV3?=
 =?utf-8?B?eXYzMjJsNU1aeElaOXYzYjhkQ0xnZE5ianFsV0FoTGd6WVN3bEhtaCtydk9v?=
 =?utf-8?B?d3h2eFpKVmlPaU9nVFpsNlR5d09LTEloWDBRRVRJQ2dCY3lqMlZtY1hrc09j?=
 =?utf-8?B?N3NXU2JMenp5aU5NdHR2aDlOZmlwWFA1ODEyb2FPWGxUVWVTQjFXTTMzM1dH?=
 =?utf-8?B?U05VeUI3NEg2L1g0TFVua2djTFY1NDRMRVNiRkIyMVpOUGdjZUZlQXArTTNB?=
 =?utf-8?B?TzN2MWM0YXNJL0NtTkxnZ2VmSkdBU0hkSG92aFBMQWY5TlREanV1eXhyeFVm?=
 =?utf-8?B?eUdOSThXVVEyV05GZ094cDRQT2ZWdUo4WE5hS0VRKzBOaXk5Nk5xL2NNUVdM?=
 =?utf-8?B?UEQ5elJsMTVqVWJaZUFPV2hLNWpIVStPL2ppRldUUHFZa1d3V0hNQmZBcitl?=
 =?utf-8?B?aExSZ25LYnBZZlllc0QvV2ZTRGhFMElCeTkrU1J0QVJSQVhjaWpuUnVqWVRI?=
 =?utf-8?B?RkZBM1p6VitubjdLY3JPaTJsR2JMT3p3QnllVWdacTZ5NVVIT290ck5TMkhT?=
 =?utf-8?B?Z01NMFVJd1lJMFZYL3VSTUZ2d09CTm5nK1ZwcngzUzFVajkvZUlyVXM5bnFC?=
 =?utf-8?B?MXdwbGJkQlpPaStkdTg1VTVRMTVkMEZ2WTcwOUtPNGhKQUZ5VDBBeVNmeldY?=
 =?utf-8?B?QXh1YStzYlNaMVp4WWV4aWw2UTZPOWNWQlkrUVVMZVFORlA0SS92V0gwcGRX?=
 =?utf-8?B?Zk8zN1IrSjFlMmU4Zk56SGF4SlRSOVNPZitCam5jRlJ3Wmk2Mzc4Z3dXNkwr?=
 =?utf-8?B?SVdoT1JSSTU1TTQ0RTJvbWhLTHlSMFBZKzNXRlVUeWwxL0huRGNTQUpEMnJs?=
 =?utf-8?B?c2ErYzNPT1dyOGs2WkxxMXZNbks0VndJUGVtZVdiZ204YmVNNmlWYUExV1lO?=
 =?utf-8?B?cjZtdk05R0J1Q013SUR4TU1mTFdVN09PZmtCb01sVnZWNzJkWW52ZkI3TVp1?=
 =?utf-8?B?Uzkyakl3UXdyQ0xjYnZ1b1BBZGF2OVFoQ1ErbXJmWERWby9RTkgyMm1VUVNj?=
 =?utf-8?B?Zzl1Sy9IRy9XemMzd1BsMWtzOWdPWjBQMC90QXJJMXpsT0d3TEExMkxQendS?=
 =?utf-8?B?TTg3S2tDa29LZ2dEdXFOMzFNNmFqY0JMQkY3N3Y1VUhvSWRvS0F3OEl2cDZh?=
 =?utf-8?B?Z3FoLzZiRlBDNE4rV2N4ajkyeHFQNTdpOUI3T0ZCQ2pWK0ZTcXdWOUp4SmxE?=
 =?utf-8?B?YmxrUDVIM0NOWks2T0F1U1hyTytJb0s3Y1hCOHduZzZoalB6RnR5QkFnZmVs?=
 =?utf-8?B?MGFqQjlDbWU0ZU9tVjBhVFVEcE43RWtEWS9kWDJuOWtEd3pzV3VIYWM4R2hB?=
 =?utf-8?B?dlFuaFdXQlhXVHlHY2ttZVVKRDV0SU55dlR3RDBTVWR4MVVuNzdyZzRRNjdQ?=
 =?utf-8?B?UDdSM1hQcVdleEdTTmMwU1RFSVFYeTlwcHVzY3BEYjAyTDNvRXpEOGVZTWtJ?=
 =?utf-8?B?UUpTSjBEM000RXhOd0JiRmxYYnVUSG41eE5OVFZlMzMrajV2cFo2Zk1RQ0lZ?=
 =?utf-8?B?MnJnT2pkaXVKeld6YkorWlZPMUdBb05uSVhsekcwQmRRcVVEc1Q0bjRCbXU5?=
 =?utf-8?B?L0VSRFh3OGN5TjlselU0RElteWd0U2xOVm4zWDJtcE5lVVVieTd1djJ0SXF6?=
 =?utf-8?B?L25uOFJQUUpUMGtoUjhONkJ5dEFQZElDZVN2bmwyYkgybnd6VnFiV2dDUmlH?=
 =?utf-8?B?UWRBMHBIYkc2UUhkbkFaNWY3S3VtR2h4RXp6dDJiWkFkbks1MW5kaGg3TzBX?=
 =?utf-8?B?aTBrTW1OOEFNeGJ0TjlKU0x3YmI5ZzYzeFN3TnFXQ0NJZlBVZVBzZ0hBc3B5?=
 =?utf-8?Q?yzTev2?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:32.9573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d76b461f-d65f-4b8c-6fd5-08dd818172b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7030

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

