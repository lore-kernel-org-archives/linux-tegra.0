Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD1127466B;
	Tue, 29 Apr 2025 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906409; cv=fail; b=lwFhPzRKDGc3zTHg5f0p993AzIrfpHhc9bjsepdrslWlI3K3wxNQx5XVbYk9IB+9kkEYXz6BRntnpQJ1D/FAyT1/ofGbHVodauv54J4d2q/0yuOTkECmfm0DEa/zt8OC+IowtptjCAEjUYUI346o8zfFgCw1LIg9LX9byxM4Ga4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906409; c=relaxed/simple;
	bh=tmu+k33oFKInuGsaHZziim4+xQaxxYbvv9C86Fpx0wk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYYjlpJwlhTDpIiht4yyG6zUlx47vmIkTwWFLhiuVUNLteRsCbhJ9PkHzKsdt83AkougMYwHHwFpIzdHckz1eNl+jNgDPRy4luauLcNKoGc4zQkAywiUfBDFAd8tpdPrRPvOQnXvR+NokJBIV4NCbLuVUQMZvCeGKnDeObpGoh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t5WRe8y8; arc=fail smtp.client-ip=40.107.220.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t5WRe8y8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1ra0U6xmOUObX5fUkFpCKvR7qNoLdIXJHUsR8LRgGihi11zteNuM/qM1gwgmvhCg/LueyoZPXRBFH0SI4OJKxBK3xN/Hswj9U91gaUEvn8iqq7Aa6eKeXwYgHKwEbCb9NuL+6/MDYfzaMZx8/9OgGTZnAWktUdqcIs+NdkEY/BeC2rrinr0T0YD9yScjuSikmskI82bzYEM9GiPkc8cMyd1VZ6JH+frBzmGbW6PeJHeKsJIijD9iwvGBM3qmI9dj2K/OUTGcsvujgC/KKAdpEtlTrlf3VQNqaLsJU5IdIn1REKYuF85BOsoYL16uhJ3z/sExPphHwFlnDUDaCR1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ci+5wLBV09gVfBKk810+Ic7d3tWJdU179mt/KAB8hA=;
 b=fzFqXPJIoz3XEoNmWNxBBazzI6SqiLP7ie4wDxjiUTGQbFSmG3H3W4kxk5qkDg255otmEM0s9eSZCgM9AnPOfoM3BAJFAOYnCHkKJymllGdv7qt6C5qt74FzG2h4HC1Jp0y/cjwJrsMWW0W/r3f4tT3zRk9B+exudlAUdC3IfDnNF9kk4HRBt7fYstwZoOMfsoQ7f5PiApxYn/IWCpUsv10qlYqmV/dnnwI2SGzUnwsp7ntP2HH916ZUYaqXAL0NVC5xPaniH5KLNeXExN9u1SvS/zq1Z/fVIH+TLaueQm9XioFuY8SP7tTmKj24BrlcmYmwrzGzJVJ21Bt2e7rpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ci+5wLBV09gVfBKk810+Ic7d3tWJdU179mt/KAB8hA=;
 b=t5WRe8y88JuSbV4IvSHg9y2SbS9ViiPheL6fZ4hRHdEy+FnykoZsIWzVQqMVu94Y7yLu1V5F8+Ur8T5gM/jsDiV3xnIva9V8b809newuhrA4bR3eBib3HjMc/HtZsmkhS+QkJQ/MwW+jK2ugXnrooaV9UwAhBcOQ2rZHWLli1SUYt7gwlR8tcrwpW/MJOIyJS7W2sbhy+JLb2fBzLgoXSvXsf14QJ9ud2jrGkRVuFExCezLOQHi/+NyTl+q2ExG1C9KvjPf8bEH3A7iGn3t3oDL39RkbdG387D1GjXbu3p4lpOC4eR7xfKCBJajptsdr5fchejDKWOhphPxyXNnUDg==
Received: from DS7PR06CA0029.namprd06.prod.outlook.com (2603:10b6:8:54::29) by
 DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.27; Tue, 29 Apr 2025 06:00:04 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::a1) by DS7PR06CA0029.outlook.office365.com
 (2603:10b6:8:54::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 06:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:00:03 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:47 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:47 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:47 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 06/11] ASoC: tegra: Update PLL rate for Tegra264
Date: Tue, 29 Apr 2025 05:59:36 +0000
Message-ID: <20250429055941.901511-7-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429055941.901511-1-sheetal@nvidia.com>
References: <20250429055941.901511-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|DM4PR12MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 696fbaac-513a-4a9b-8a3a-08dd86e315ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aE8vT0tlQ0U3bkhTMURHVFh2WWxpOEVkUDE4OVk0MEN3dmczdW9uMVFYK1B6?=
 =?utf-8?B?RlpDR2Rad3p5WS96d05BYWo3VDBDVkhoQjZKZTlvMGp0cUVkS2dwc0tBSG1z?=
 =?utf-8?B?U0g3V0VVNERPRE50bXQwQVp4elhrRldEM0xLdmN4a3Z0NFhxTktpU1lVY2da?=
 =?utf-8?B?dS83TStVRmJlZlNpcWtoUXJNZ3dhWDBtZkgxTkVlcU1QQ0oyKzlYUU9leXBu?=
 =?utf-8?B?VWEvRDRmUXhkUVJRSVlaekF6Mkw0ekxFQVBnWjA3a1dqQjhnTlNCL1JyZ0lq?=
 =?utf-8?B?b1YwY1p3OWtoQnduQjhjZXBsby9vNnJ6dGhHZkN3Z3hUSHRlLzFkRURLdmI2?=
 =?utf-8?B?U01rdXQ4dUdMcHp5Mnd4UklWR0M0eFM2MDh6WDQ4TS9GV1Y5VmozK0RmWUM3?=
 =?utf-8?B?dG5VQ2RzNmcyalBwWkpSUHBiVjRYd21kdWZINGtrayttVitvWjVqVlJ0eU56?=
 =?utf-8?B?ZTJEZEYyaThlK1BnWElVbU1MRjdzSnQrNGlFR0JVTjFxVEVqYjVlamYrVEpv?=
 =?utf-8?B?d1NnOW5EOXlXM2x5QmJWMUZsMEhxRHlHY095RlFKKzI1KzlrYURVUnNEck43?=
 =?utf-8?B?QXNvQlRnNS9XS0IxdzR0b1pIKzVZeWlGczNQQmc3U01PR1ZLQUtrM082UE9P?=
 =?utf-8?B?NTRzWWc2c1JRa3ZPd0dNNDJ5dzFqMG5ZREpXMnRGZWt0eDhvREY1aDR2Y3Q1?=
 =?utf-8?B?QVRjSVRHRjRpNW4wS3EvWG9WUUtNRUsyNkExSnBoUXZ2UXpVREtVMHlnUElC?=
 =?utf-8?B?VHY2VnJtUXFsY3ZXZUlrOHQxUmU3bWVWZE40ZVFld0FsYnhmMDNwOUxsYUNU?=
 =?utf-8?B?NjlXbkhsRzJOM0hQMGplMkkrRU0za2VrRW5mTUdIczI0OCthL1dDeFgwV253?=
 =?utf-8?B?UXRzTlhXVGp2Rm1nQ1MyUzVQVjdxdGJidys1UUNSQ200Qk50QnZ1aTBMTzla?=
 =?utf-8?B?SkQ3cC96NFpsb1VmbGpVZmxRYUxPbENzeVgrd0lJQlJQenpuK2JGSzgwOGhk?=
 =?utf-8?B?VURjNmNWcDRrYW9TcWpyOE1Ud2pGTXFGYXlXOHZyL0J6WVlhSDdweFVxaGVC?=
 =?utf-8?B?bnJRbDF2WEZJZWNNamNtQTBVbDhuaVRLc2JUYjZqQVVQRmVtZFZMZnU1NXVH?=
 =?utf-8?B?QTVmZW1iRUVkeXUwdVdDUmVjeFQ1M0dNZ0FjSHg4LzNSN1JibDVYemppdnNq?=
 =?utf-8?B?MHU5b0hQdkxuY2F6R2pXeEhETm52OW05MFMyaGdnU3UwU0pUL0g1WDRvQ2Vr?=
 =?utf-8?B?VE9WOVNidWRJK1dpVW5ISW9MZmM2ZnZqVGJXcTdvQ012VmliRHFXN3RYVGt4?=
 =?utf-8?B?OXlJejRzQkZVdXpRT2lKY2hIeStINkFTTVJrK3Y4SlJWbHA4VmJ3b05GUHBR?=
 =?utf-8?B?d0hxMHBGS2FLN0xGeGxyeWFBQnFLZHBmUDZ6K21ySW9jZFFvQWNnbThDOEtz?=
 =?utf-8?B?ZlE0enVJSWRUM2gwSlNXTzNKa3ZoalRCTkhTV3A0MXhRU0xtQUowdHhlMGsw?=
 =?utf-8?B?cXlRRGJ4OTFjeGwwcFlQS1FGWGNnQ2c3RExIY2s5SSttWFR1V0dQQlM5dTZu?=
 =?utf-8?B?T3JIU2IvM3FKTXpvSTl4VXVvaEFJMXRSMHZSdUt3ek5PV1kzU0Y3Rnl0K0ZG?=
 =?utf-8?B?elVUcmFOQjU0WjZ2OTVwMW5IeWlkeGFQRGd2MGdLQjdsdjZFRFBCMkF2ckti?=
 =?utf-8?B?N0VINHF1SW4zV2w5UmFFWjRTZzdWKy8wRWs4M1lJcW1vQ1JhT1YvemJ1WGEz?=
 =?utf-8?B?d0I0SCsxaUN3VWZ0S2VZZFUvUkRsTjJuYUQwT1VndXBCV29aR29kQUxwMkdy?=
 =?utf-8?B?NEx6cTBLWjFVcktmNU8rQkdrRW9aZ3EzOEZ5aVpRdElsRnJlQkdMbDYvK0Ey?=
 =?utf-8?B?WWZaNDkxSTNPRmpOZGJXdnhsbG4zTy9OaWwxVTVYZDdPUHZuOUxvVXFlVzlh?=
 =?utf-8?B?ekg0OGZZcWZtVWFsZDVwVzJjcXo2dUdaaVVwb0lhazltVENjUFNacjVhQjVj?=
 =?utf-8?B?L1Brc2hTR0tNMXFSSUJDQ1I0WlI5cXdJN3BTTVFranF0Rit4eDRONFZ5OUFE?=
 =?utf-8?Q?CpoJoO?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:03.9832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696fbaac-513a-4a9b-8a3a-08dd86e315ff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718

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

