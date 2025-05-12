Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DC255F3D;
	Mon, 12 May 2025 05:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027115; cv=fail; b=H9Mibg72GaafDvgFzhMaMNsh2Ahc+slfPiNE3HCHsaNXNJd346ZC/5aLvOErq/aw6YOV0jscQpz0uVvjHMcUAlHfMtjbOX8vq4+f5a6onQcgQnmoAs8InMALejAap8HUh88/gPSsc5ZeS56H8CCdDRuUNnqlhopqW723ilEVwNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027115; c=relaxed/simple;
	bh=tmu+k33oFKInuGsaHZziim4+xQaxxYbvv9C86Fpx0wk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oGHXNgkT4xgWja1blEbB39ka7pxWBc5aZdvY8G7OEVvX/zkiMK9HYTu4rUAnV+peSCiCBEUo6cv1Pe77BBs0lfmpKncfPGYMG9Q/jRTpvvnsFg/ObH02wxUSruZAgrMlIy0N3gDLMoEtH+tK1+ht5ooTVsZTSbuLYo8s0fyOlDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p9boNBOC; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p9boNBOC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hw8pKUO/L2WKjIUPj0ANDOQOLH+dBNpO3haDFF2aL1DkZBHqufGAuSJ1gMuT+avpegB09KRKofihf3Ki79sSQ/D6iYRAV2tUPCrC4SUz41eLwb6bhYPQIWnpc1wKXfxMd23iR0wAu4kMHL4N0aBG5lBr1pXmjga/x3dkE3xRVks91/MxUBvAwOxgTxBh0mi0vpcmW2TvOo/xg3km9SgFpxMTTRTxhbk8KNgfImjrVg4HkwFf9sl3OK4uOlO/uJFDCmqq9ETn7WlRFVuKbUZIdcy/zs8KTtd8IcAr8H2RxMjy1YXuEIslSRVU20IrfH+NaqIFuBsXEMHBwodDh455fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ci+5wLBV09gVfBKk810+Ic7d3tWJdU179mt/KAB8hA=;
 b=o9az3c/UWqDbGcClegZmtG+6ql8N/D2s9WL1U5aX8KoW47B/iSsNgWbJd/jA2oArLYKQdjJnSCI3MMws6x6hBY6JEPwBoQYBOnM9vi2RLWPgBRO4L8bnwsN3es9qZr7hPYzWDbSma1luSf+ZUCrLOyCpbyJEPmuC2owx4J2BRLJXfXXquUQhPFf4GfyNm2ZArDpnRyMY/XTLzhVoVkI1PeQKkNhgq2OTO4iwlnoUgPQUTq4MnH734RGVpD3NzkgLoHY3MfQQp3XEtplQD+Xkp/I/+fBmFRPVWNOWVyMBlaPipSxo0BFTV3t6NQeajwueCQv3GFcim6hIAEJCHpWFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ci+5wLBV09gVfBKk810+Ic7d3tWJdU179mt/KAB8hA=;
 b=p9boNBOCu53k+S++2pvyVdEIbMhFdcU/s0EiE+LCiE4hcDaJyDEe7WDEGXzqUFGEWZCx2twgSsuY+JK90ut+66HIZRhM18m8mlqKOjckV5OxC8p0aHaxBBtN+meJrL96NXyT6D/V9Y3tFRtNoanWD9Jep9H+7+7fL0IugzJYEM7ejm0kl7YjezXrY2fFU43AYyfxSeJMNI6fbKirwc14GEmZUHOsDcv/SYJH+9ocQkMq3cwKnwsAFcG0PccXrqAdfhIxnG3T9sTPgI+YCpSoXYvhwxUs+kooBEXSRptQ0bwGUkPRrpivwRQmWGpE6A9qy81qNbiic2zFJyHj5PXMPQ==
Received: from DS7PR03CA0092.namprd03.prod.outlook.com (2603:10b6:5:3b7::7) by
 MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.26; Mon, 12 May 2025 05:18:29 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::a3) by DS7PR03CA0092.outlook.office365.com
 (2603:10b6:5:3b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Mon,
 12 May 2025 05:18:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:28 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 22:18:14 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 22:18:13 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 22:18:13 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 06/11] ASoC: tegra: Update PLL rate for Tegra264
Date: Mon, 12 May 2025 05:17:42 +0000
Message-ID: <20250512051747.1026770-7-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250512051747.1026770-1-sheetal@nvidia.com>
References: <20250512051747.1026770-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: cd775aa8-4af5-4680-5fe4-08dd91146e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVVyQ3pOTzJOS2VRSnF4eTVMdzFiYWpyUDNUWHNMWE0zbmJVcGw1TDhhUy9Y?=
 =?utf-8?B?aW5sWUhkTStpTEthY1lkK0Q2U05UT0NyOWpyUkZEYlNDV3pFSFFJU3JlZjM1?=
 =?utf-8?B?ZjFzd2ZZZ3JIeEtsWjVKc2Y0aFlLR3JJVjdyNWgrNFY1bmx1OXhRWkZTTmll?=
 =?utf-8?B?MEUyRjNORUlnT0RoSHNXb0t6dEpsVjh1N2w1Y09KNVFVMnh6L0l3TGFyMDli?=
 =?utf-8?B?M0lEN1hsenI3ODNFc20ySXlJeFFzQUJzVUdKMlZUUTVIVE9leDRSTlgrb1pm?=
 =?utf-8?B?enNzOWd1aktKT2xVMi9vaFEwaXdRMkJnUSt4cEFNLzBWbDhZZUdKUTFsVy9J?=
 =?utf-8?B?bVU2NXFPckwzSDFucmc2VVlja2h3NjRud2JqSWprQTBad1BaSHh0TDdyaWpV?=
 =?utf-8?B?YWpiQXRVWUd6by80L1pBSjFkd0NwK0E2WE1BbGlmaXBwa2ZZaEJpR3E1K2Rw?=
 =?utf-8?B?SXpUdDJHbURtb3ZFOWJNVm1CQlpGMEVlSUdvd0xKQ0R0RERjYkNBZVYrM2t4?=
 =?utf-8?B?WWZzSlJEUUtOMkJmb3d5bnBTemwrN28vRGJLQjIvVVluS3MzbkcySGQyQnRN?=
 =?utf-8?B?NmFKMW5JU1pDeitHRkgvVjl2M1VvZmVuUUhvWlYrbG5DMDhsTXJISXBVckti?=
 =?utf-8?B?SDZQT2tJRmVBN0dzcFh3a1pRVTVBVUk0V1hMNjhqODByeE9rVkkxTWNpQldo?=
 =?utf-8?B?KzlxV29lcmEySjBYcldIZG9Mb2d2UlNSUEpERlpoQkFCWFFUYmVtc0FjZE14?=
 =?utf-8?B?dkJLL3ZWem16SitQMU83aUVBTllXdEtGUU5ybkNBZmpnNndGWDJkMUxvcVNF?=
 =?utf-8?B?TzJsMCtUaTlUSXViVVhHQ1J4ZG94VXNxWllXNEJxUktwVUFjQkl1WFlJWlhN?=
 =?utf-8?B?YlJVN21NOU12OUxweU85T3dJOTJ4S1NncldGMTlHN2pGSkZKQTJNM0Rtb05N?=
 =?utf-8?B?M2hLVEgxSzFBejVnM3BUNTg1bGV3MTJ5N3U5dHJwdmNYQmpRanlDSTdab1ZN?=
 =?utf-8?B?TmRpYmRWTDNQZThXZitRTHJkM0RKMnZyeXRxZFVHQnc5aG85NUpTNmllK2Mx?=
 =?utf-8?B?czlZelE5WmtPNHRVTWgydzdxajE1bnBHNyszNXBCdTRvdk84M2cwZHhVS2M4?=
 =?utf-8?B?SzdkU1hJb3dIK2MwM3NFdTdFNTcvLzlIVWljNTJsZG4vNTZoaWw2L29RclMr?=
 =?utf-8?B?bk4vdEphTlRoS1NTR05KUHZGS1Nibkc3ZW9zVExVeXRmNjFiblVrTW9jaHAw?=
 =?utf-8?B?YkswRWNYd0V3TU12UVFYaS9TYVgwV2s3UzArSXhaOFpndXdoMytJZ0M5VWpm?=
 =?utf-8?B?dnZsMTJtV0ZHZ2F3dkIxUHJWcFg4a0p5Z3l2UHRMZGZGaDFTZkg3MUJGcXlu?=
 =?utf-8?B?TDRSN2c5Mjh0OHhTZTY4MlEwSjJCZkVPUWx3TCtnOFhtcWpNZ1E5OWhTc3Uy?=
 =?utf-8?B?am5NRkZud09xOHJnc2tXWXVENUZoQ0kzUFM3K3o0M1Fmem1zRlZVdmZLeGdN?=
 =?utf-8?B?MmJMbkJKQk42VEhrbjNyZjhzdXdUcGNSNVU0WmM0cHZkSklEMkxDbDJ6eE1X?=
 =?utf-8?B?VG55cmhKc0hjUGhzWWVFK1o1NEtNZm9VM0NJcFRRa1NCbkNKU0NITFp2VDY5?=
 =?utf-8?B?WkFnaTQ1YVkzdjk3WGVvdlZsTUE2K1JUTllncGlXTTNBNU1iS2MzTTZGU2tE?=
 =?utf-8?B?NEptQnRwWnNSSkFGNzB3Tm9FM29oQWVmZHNXSDB6UGxVVWoySm9jVXh0Z3d2?=
 =?utf-8?B?NEJ4ZzFpVzVoNjMrZUdQNExkd1FDUHgwOHo5cWtUR3E3RDMxZWM2VVY4MGg4?=
 =?utf-8?B?TjdRVlZnTGQxbnpna0k1cTljY3JWNWZjb2ZpL05RV0NFaXNXQitPOWRBSkZt?=
 =?utf-8?B?UDJQM1pFaVk3dXF6NkR5RjRWZ0pBMVVIMkF1ampYVTVqZE50QStXTjZLSzFL?=
 =?utf-8?B?SWl1VlVTTVV5RVZpQThQQzJ4eFVObDh1T2xmN0dnb1hEbVJSK3dWVlVaaEZI?=
 =?utf-8?B?NXo4ZyswYzA3VWhTUmV6WmhmR2Y2ZDQ3UVpSSThzWjZSSXdSekh5aXQvK21F?=
 =?utf-8?Q?V2DIIy?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:28.7104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd775aa8-4af5-4680-5fe4-08dd91146e0d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343

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

