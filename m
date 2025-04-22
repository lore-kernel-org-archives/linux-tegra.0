Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D31F92A;
	Tue, 22 Apr 2025 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306920; cv=fail; b=HIDjP+nn0+XLMGRDsH9lPrGSBgD38Dmce8fNTEtC27onvuisRlgEoXsPb1h1CyiQggAEcBHsRhOeB8MuKMTMJegZ3fIeMRYAiQcOI8QTr873qs4ZewAqS/OsZvcOh/wyrGFemJpDU7yPzjoZdg7lPYpz66gD4qsBH4y/+jxOR/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306920; c=relaxed/simple;
	bh=7zOGmnjgj02voc8jYN8dJ8PDEWVaG+BWiqwoS+0ms7M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JBSZsrwAW4a+XUpio+03cDvBff6AHqlZuyM067rEX5kFyIk0hAg5++97dAeuQNqj5C74SJ9/sIiFploEfZnZvXMOavG0HdqDYgCh1JR+zNhA/1xf03Jkv99NlzfhUKl6i6yIw0eWHFG5bSbApXf4N9Hzu+lmRLtlHmC+a8mZjCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EFr24Pa2; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EFr24Pa2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPb4zbT0O1UvOL+6cKEZJocxS25D9DkBBnqSChrAqGp+qx2choHaldaRE+qMWwAT4bqgP1JUXhieNMHUX0nc8/H2oqg24wsZ6ukAOrN4lTyR47o1Iht4bagaHMh++esjN9upcb4NSgXugkQ/TZ2rTJ6K07EifggnkEE/9VpDO6VMJFFP4/AoGrvWOH+4Ohn75LtuLsMEdWjZKUnFNvw/9NBlgfNxkbfu8eNI1qLDknEtyqjKU+9/RJWb3XoU348AwIkmwk7qt3UWSWR5xQ+Q6Td1HIq9C4UPR56HNy2kYELltrejpJatySk1fuT4j6c+HARz3RLuIlw+9zkU+6XmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xpthzmU8hYS+7LIKePCu6AgQgfo2TpQUaK1m9NhxrI=;
 b=ZgsFWlleToyVYxfxNs9zxcCc+sGv4HZe4KxbqYhwzV4q8cH51njbI7lZujEAeNAjotJ6XT0vcXWHsiAjsYj/wRvZaQntcViWNjlfLTYpwUvlSsm4R/GkveHqU16o2AJZZSDzb28PA/feFBOB03PXBYyX7wkniGT6oTBNsE8rtapsBDIObfEpq4HU7HfHsVfwCZb6Z6W+HtJdbgfB0cRXEkGq4bScgVSp53td1VTIMfO89QVlO8r/8NYPIkdCJn2ickSJkZUqMkaf+FYNwgkSL/axx1XNTIWtHyd2G3lTmx1Sjj4Uk4K/ci+cMJC7qinui5Q3ykJfS5c1a8qZIQWt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xpthzmU8hYS+7LIKePCu6AgQgfo2TpQUaK1m9NhxrI=;
 b=EFr24Pa2G+cQspranORtajCwxV7IaWbrm0NfKJPmIpjFBTkxV8me65sKYcZHo1R6QcZfPB+Tdq2uASY8BmGyY3wjFQr4BKZNown8xmq1vxPI7TTdehcR0Oj1MH+deu8Kan5nh2Q4aqdiBk2wGDn1uTUFoGwQcUZRmg2gvwTw4ZcT5oKZpJdHs21+4sUpX3SzpYr72GJSBcGIkF9ickcqvZwdqB7uucbwszUTjFdicdzhZIHraE5s8rmutQT00ZT0LOdGwfbcKA8NumBPSd5IWOowyAta12Xvb46NBC2tY8IJih2I37dsA+/djIna5oT1b0T8a+A4Je4CXBXTZapvhA==
Received: from DS7PR06CA0046.namprd06.prod.outlook.com (2603:10b6:8:54::13) by
 BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.36; Tue, 22 Apr 2025 07:28:31 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::5f) by DS7PR06CA0046.outlook.office365.com
 (2603:10b6:8:54::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 07:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:30 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:14 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:13 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:13 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 00/10] Add Tegra264 support in AHUB drivers
Date: Tue, 22 Apr 2025 07:27:55 +0000
Message-ID: <20250422072805.501152-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbba68c-63b4-4f8d-77c4-08dd816f4847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVFiOHNacU5QWTFzcHZZemVCYlpPZXRCUllQTnIxdGpRUDJxTG1GVDA5ZzRE?=
 =?utf-8?B?enAzb2s3Mm9sQm1rRkF0MXdzV0ZlYzZQakJsOVpxalJvcHo0aHR5dk9mUmhP?=
 =?utf-8?B?M1FkNEF2MjR3akJHQVhXNy9tbTdaTk5xd1VzQ0RweVN5aVV1a3ZWQWdkZ1Bm?=
 =?utf-8?B?MEQwMWF6UFJ2bXBaV3dKOUlhMitaV0xwVElHZ093TUlHUWJDYmRSbG1jNzhC?=
 =?utf-8?B?NG10Nm05clRqY1QyOFNQMUQ5S2tYMTVMQmdUM015WFFaSzR6TDF0MU8yZTgw?=
 =?utf-8?B?amE0T0hjaEZjZVpxdXBzd09yaXg2YXBtVytFZmxNOGxZdjdlcVVpUGdLbWJq?=
 =?utf-8?B?MURNNDk5am9wYUttejFrUVIvNFY4aEFWY1lUaW56OVVLTmlxNzVWLzVnNTNJ?=
 =?utf-8?B?WXY0Y1RmalFKU1BONmQwVGg0bUE0Mlh3SElwa1djbnRPUFAzV3FqbHNPQTN3?=
 =?utf-8?B?WFhUNExtU1NpR0Z5QlR2VVo3Wk1FRkV6OFZmeFF0ZXdFY0NCSDlzYTBDeStT?=
 =?utf-8?B?NmlPY2N0d3YrU3Mwc1M2TVEybTY3ZmFDbEZaNTdqQ2tRSzlEZ3lDN1c3bWhV?=
 =?utf-8?B?ZXRIaWNDRS8yTmprRysySkhGS055VVoyQVlPQ09NSkZQT1NCUnBUeHRPS1Zz?=
 =?utf-8?B?elhldTZQNTRaODNmS2Rmd25MSzdCeFMzWUFubkNIZk50RzFhaXBHNEkyK2dN?=
 =?utf-8?B?SmFLcDRCSE5uMENnTHFCUUJtOElFV1ROTXIvRHd1THRNNUFyTUJVTUJzcXRx?=
 =?utf-8?B?VnUxVTByb25sM1NjbjA4UGdQSHBBZG1uR045bVl3STdGWjQrZGJLa3E5RmNa?=
 =?utf-8?B?Z1hMVWV4T2tFYkhka2xrQm95eThDL1hBaDJRZktzUEhpNWt0THpUYWdBdkJN?=
 =?utf-8?B?SVNHaE9DbWVDeExYSk9Gd1gvZUxCSDBrMndIeDRsSk9Ha1d2NEhiaWdYVDE1?=
 =?utf-8?B?Zlo3ZVVkMTV4T1Vwb2tsa3NzWFZyT2JWOCtmcFBpb3E5UGEyQlRVRnV4U2t2?=
 =?utf-8?B?QTdVd3hXZ0xkSEVGWkxiZU9zdFBKemZoZ1d1N2NqelR1RWJOek5ZSjc3L29Z?=
 =?utf-8?B?aksxaTRRNlUvV2FaRFlVMis1UWxBYkh6d3M4Tm5mUmFsR0g3Yk55Qm8ydVdu?=
 =?utf-8?B?WDlkMU81QUhlbmllZkYxbUZ5MWpvTXR4K3RnelhzZFg3NzYrTVM1WjltVlE1?=
 =?utf-8?B?MGRvQnRTaG93WW8wZ210M1ZiLy8vTnA3N0U5eWFLc2dIYzRtRTNORTBpd2xj?=
 =?utf-8?B?cXRxSk81L0ZRdnFYQnFCSDN6bkxubGdOMmlNM1RHUlhOd0hmWGt4TmZrejJH?=
 =?utf-8?B?VVU1QzhqYVpTMXAySGJQMTJadmh1MDVaN3pJRlBTc0MrcDhxdkY1aEF2aGZJ?=
 =?utf-8?B?S3BXRnljNm1nbGRQZUFBelN0VkNVOStNLzgzVWFUVFU5WDBGTkhUUEpLMDBu?=
 =?utf-8?B?ZHlrdFhNbCtydjZqT0ltVG9JL1pJb2hSWkZyNm9FMmpkdnF4b1dmK0hUZzBW?=
 =?utf-8?B?K1ZpWU5YWURnUEZiT2IxMW52U0t3Mzk3R29QY0toZ05EV2M5K0REREIxK3Vq?=
 =?utf-8?B?TEJlK2MzWUZ0TEJRVTJMYnlnaHhMWjJGUmwydUU2eDEyejRCVEw3anQ0cE5u?=
 =?utf-8?B?UWt4b003TGJBOWN6d2JEMW5Ma1NLcitUNWdVL3pjVTg0d3lyNEhsbnJQR2pP?=
 =?utf-8?B?V3RKelBROHhKR21ycHVIWi9YeVE3WGtyMEVaTWs1cnBKM3hRZldkY3REaXVt?=
 =?utf-8?B?ODI4bE9DSGR1UG1DNVUxUDJoQXpXRDZPaWVmMHNqQy96cndSNXFTNFE2Q2pL?=
 =?utf-8?B?Q2FnMG5oVWtvRldqRXl1Q1lWR3h0SlNLTzNqU0ttSmFiM21CaTR2dE1RSTJa?=
 =?utf-8?B?R2RKR2dKSzhkN25EYWdlbWVzdUlWQlNoOW80UUZ0TmZja0QrZ2lDZXdRTUlJ?=
 =?utf-8?B?OEJlK0VOREtrdnovQUkyaUxCV1h0TE51WEJZUHVYK2FXZy90V0ZHNEdrZ2xM?=
 =?utf-8?B?NEcrT21BVmxmNzNQRkRHbW1LZzk3WXdZVEV6MEh2ZzlMaXEyTDFCZiszM0NT?=
 =?utf-8?Q?AAIzwB?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:30.8755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbba68c-63b4-4f8d-77c4-08dd816f4847
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425

From: Sheetal <sheetal@nvidia.com>

The patch series includes the necessary changes to enable
support for the Tegra264 platforms in AHUB drivers.

Sheetal (10):
  dt-bindings: ASoC: Document Tegra264 APE support
  ASoC: tegra: CIF: Add Tegra264 support
  ASoC: tegra: ADMAIF: Add Tegra264 support
  ASoC: tegra: ASRC: Update ARAM address
  ASoC: tegra: Update PLL rate for Tegra264
  ASoC: tegra: I2S: Add Tegra264 support
  ASoC: tegra: AMX: Add Tegra264 support
  ASoC: tegra: ADX: Add Tegra264 support
  ASoC: tegra: AHUB: Add Tegra264 support
  ASoC: tegra: Tegra264 support in isomgr_bw

 .../bus/nvidia,tegra210-aconnect.yaml         |   1 +
 .../sound/nvidia,tegra-audio-graph-card.yaml  |   1 +
 .../bindings/sound/nvidia,tegra186-asrc.yaml  |   4 +-
 .../bindings/sound/nvidia,tegra186-dspk.yaml  |   1 +
 .../sound/nvidia,tegra210-admaif.yaml         |   1 +
 .../bindings/sound/nvidia,tegra210-adx.yaml   |   4 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml  |   1 +
 .../bindings/sound/nvidia,tegra210-amx.yaml   |   4 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml  |   1 +
 .../bindings/sound/nvidia,tegra210-i2s.yaml   |   4 +-
 .../bindings/sound/nvidia,tegra210-mbdrc.yaml |   1 +
 .../bindings/sound/nvidia,tegra210-mixer.yaml |   1 +
 .../bindings/sound/nvidia,tegra210-mvc.yaml   |   1 +
 .../bindings/sound/nvidia,tegra210-ope.yaml   |   1 +
 .../bindings/sound/nvidia,tegra210-peq.yaml   |   1 +
 .../bindings/sound/nvidia,tegra210-sfc.yaml   |   1 +
 sound/soc/tegra/tegra186_asrc.c               |  18 +-
 sound/soc/tegra/tegra186_asrc.h               |  12 +-
 sound/soc/tegra/tegra210_admaif.c             | 223 ++++-
 sound/soc/tegra/tegra210_admaif.h             |  78 ++
 sound/soc/tegra/tegra210_adx.c                | 229 ++++-
 sound/soc/tegra/tegra210_adx.h                |  36 +-
 sound/soc/tegra/tegra210_ahub.c               | 849 +++++++++++++++++-
 sound/soc/tegra/tegra210_ahub.h               |  52 +-
 sound/soc/tegra/tegra210_amx.c                | 229 ++++-
 sound/soc/tegra/tegra210_amx.h                |  34 +-
 sound/soc/tegra/tegra210_i2s.c                | 229 ++++-
 sound/soc/tegra/tegra210_i2s.h                |  51 +-
 sound/soc/tegra/tegra_audio_graph_card.c      |  14 +-
 sound/soc/tegra/tegra_cif.h                   |  30 +-
 sound/soc/tegra/tegra_isomgr_bw.c             |   7 +-
 31 files changed, 1963 insertions(+), 156 deletions(-)

-- 
2.17.1

