Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0412741B7;
	Tue, 29 Apr 2025 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906406; cv=fail; b=fMnpjm4OUAFJiBBu/KNGvCYg6cdRhjhsVxnYMzh3HqCkPM2AzloKNZepx5HhEn1p7p8ZA8ZPaMlTFUxloajxI6NCCZHdCZHW5oYKvqSDqdjH0IxsTZqNNu8VLNDBkvmH5agEei6O43EpJ1UsCpCPJ3YfYRPGamKacaT7qXRdGUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906406; c=relaxed/simple;
	bh=VoaeShd5qnYFMoQI7QdF3Gt+GCTEley5gVvCohftv9I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VWE7rCQIuPNAa1hlp/zCY4pZb698OY4V3Zfn4+8GS8GLn8kzKS/JXhtOw7hfSKXa1/NcFuhenInzqyoYVp+b4V4fitrEgkMhLkEO5usVQqUXXMx3FcYbOpGPh+2QxmTtJWOIPHmOiqH1kghKR4ImOG7iikYPjdW4evJa4OfTiJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cWofjm0J; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cWofjm0J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDjCASQZ2d29z1GRghFajc2wMkBaxRjtLZSZtJnqayyBNhS3bRkmwF43NBuxgVGzg6L5VMH+SLWXF3qH+Attc3i/9PupYJrvOoqwffrkcFFD6tfUpiTdR2JHiNnipEItfgwJMJroPwcOtRRYq0RxKkogHXkYfaw/Fc1nDeiL+KWUoA2up+mk5KCHJSAdQ6nTfyQG3Vwc2mqP3/vpaSa4SXEo/0Nktly2Z3d1uNP2YbKvfiPPLSz7EKmvRal0Gtq9p5fkDenk6mJBYFmzuifNWZv+Ncx5j+FsXE4+d13Cjq0Ls5hhu0KhWsBVY+WRRmetxMY8FTNICMXVw7SP2qgYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS+TnySPBdQA7YIM51xt4HxlpqfBy/hpBb1B9mEx+1Q=;
 b=TNonf87oZ6TWToLULYAbRuZIalcldVFOHBQO76x0ywe3d2btWJR9clGTkHNC0mikvQj3EAByl2vOWR3FdxtmyrHCM4YTmp+3DR4Q26QC81KCR6OQq5QgNnUkw/kSra4Spjql+TSOmSm7jXX5YKjit9ii+NeNzAlcjpLs3+RP6BMPw/erPANNhooKU6KC+0ZXIZGaugUAR/yUm8jlZ6zkdrrWU/8k5Sx1WdlkBclsYhvgrrRGiOoK74tumpNV1Ujm8FeVOoCsYoUDklu97IRHyIPomjhHK8XPehP8ifPy8CAEQd9tSkIpPu3rDcr67euTHKX58Sqd1OQz/YS0STcrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dS+TnySPBdQA7YIM51xt4HxlpqfBy/hpBb1B9mEx+1Q=;
 b=cWofjm0JmOEVXO76q/rBoQKBLUw5HaVrOnpGakIBATJ2nOb8LziPapslrr5UkAYvwX9uTBrU+aJVuCCCOdr8/JCEiHiB9CZ9IdVLXH+d7SW4dFmFk7Ong7xw9HyR55FLS3u1psy5GG4FvIMwCH/Oy45ghy+Ly/MabBD4liVUr5Xe2z/w6MABnK2RKuqdLINjJ+jsxkimeEE3wee1+e+2kEUFCX1Xukab/KDdE4wpkE1QYBVUf+MGWF8TzXkuEpm/GXWwBiiENbi4EUSmsowIYLlvHORn7afyRgg7EtW0pT24DdhbveCjYjBsApYSpMbptwPjm2V2BjUw3ohVSvCT8Q==
Received: from CH5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:1f1::25)
 by SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 06:00:01 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::66) by CH5PR03CA0007.outlook.office365.com
 (2603:10b6:610:1f1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 06:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:00:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:43 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:43 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:42 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 00/11] Add Tegra264 support in AHUB drivers
Date: Tue, 29 Apr 2025 05:59:30 +0000
Message-ID: <20250429055941.901511-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SJ2PR12MB9008:EE_
X-MS-Office365-Filtering-Correlation-Id: c81f4a1e-4cfd-4381-93c3-08dd86e31437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWVlbURHVVZ1RUNBaWZBRjJDc1VnbUtVekRsMzVlMllvejNJQ2JUS05xMzlW?=
 =?utf-8?B?cUFXZzdKbnFJUS9oenpObXI5SzI4WXVWblpYTTNxL3ZYeE9pYlh2N1pVaFN1?=
 =?utf-8?B?ZEdkOWxDM2hSZENvS01KNXdaaDRaRzYxZUVIL3BkSDhYTkVKU3o0ck1Gb2Uv?=
 =?utf-8?B?WnQxR25NYVJ5MTU3NEs2U2Y2SEkwZDZHMUhGWXY4cjFkZUV1OUQ2aG40VHJP?=
 =?utf-8?B?NFBaN0tvc3dKSjAvVXpGWGtlKzRsN1I1VUhtOUtydlRQSnR5WUdEaklZb3lR?=
 =?utf-8?B?TDg1aHBSQXRPSGZadldxS0hWbXVId2dZUEU3aitaWmp0TFh0SzAveWlPSkFa?=
 =?utf-8?B?VDJnUTNwN1R2MnpjL0w0N043d2V3U2I0Mk1heG9yVTVwUlRnd2dGUnJLMmpG?=
 =?utf-8?B?eFBjbDN3d1cyZ0ZZRi9SamNrYU5ERW0xRGFTdllzSTFsWE9McmY4K1Izd2dh?=
 =?utf-8?B?bHlQRUVoT2dTL2lpR3VZaGpVcGtUTjJsLzZIUzdMdW8wQS8wb0t4WjMrTzRo?=
 =?utf-8?B?alVZN0w0cGFXcFZZaHkyK0U1MHAyWTJIdWR0MWFGSmhiY1pjdGV5bE9jZytu?=
 =?utf-8?B?MnI3dlFocGFZZVdCNjBFQnU1RjFjVDdNU3BIUHI4bWR4Vkd4K1VSaEVBUVlZ?=
 =?utf-8?B?ODlsUU4yNW93ZXVkVTJqKzJIUG5lZldzdzBOVnhEazhyUVVscGtiYTRkSDFl?=
 =?utf-8?B?MzJzaHVEK3RuNk1ybElLWTZ6U0h5cVhPbUozeXdjbGU0L0ZPelU4UzhsOTV3?=
 =?utf-8?B?aldLWC9tbjhYRW1WcE1RMGVKYXI5RGRHbi9ESVBVcWg0cVZhRkF2cVhSdVl2?=
 =?utf-8?B?UGdZMmR1a25Pall4TGViaVVNS1laczF2Z25EQkN1MGx4UlY5aDZrOTg0U3Jr?=
 =?utf-8?B?QTdsMGJsK2xMVjJRSHBGN3N6M2VrUEpFcXhxYUZicXgvSnRMUGZkQTZQM3B0?=
 =?utf-8?B?RHcvNnhFUTgvN0N5emtCOVIvYmZvVkt1UXZvbENOSTh5ajVxUHNQUGt4T3ow?=
 =?utf-8?B?TGE5aUNCR2JXbVhIV3BtZnVQU2lHSjFrSUVRZGhrNXZEMWhQNEJ2Sm53ZFA1?=
 =?utf-8?B?QUJ6QzMxa3EyL0tsMXdacGV2cmZaQ3ZIODhrb0pnc3hOOTJOMDhoRW5TbFhE?=
 =?utf-8?B?Zmp1cWFueUg3ZTVMcnVmVjUvUUJNeFB1LzZtZjVBbHgwOXd6Rm1PTzZ4S1J1?=
 =?utf-8?B?ODcvS2I0c25uWGx4UGU3b29KTlVxbVcrZVQxOWw3d2V2bEovR3JiQUkvSncv?=
 =?utf-8?B?d1R5MkdFZ1Nwa2RLRjh4M0RyOU8xZFpjSmNJazdkVGE1QmFUUlBRbkVnbmJJ?=
 =?utf-8?B?Ylp5WjdQbEwrTkRTbjdTZ3JXcUxEWjUzZGE1c3d0NDVEa2NpR1FYaE01d2hS?=
 =?utf-8?B?MThKaWZWOU5HYkdoUnpUNnZMd3dLTkhIbVFOZlM2dDd0WTkxZzlZb0t5anRk?=
 =?utf-8?B?dzBlOER1djFkckI4WE9LbnJwRGxPZW1ha3VjUGxqWnZqbkFFVEFURCt3aWly?=
 =?utf-8?B?Z1M5akRnU2FjcnNqVVdwL2ZNOFRuSmhuL3ppQlM3ZFNoUE5Rci9FT2RudDJt?=
 =?utf-8?B?S0dOa28rU0E5REsyUXQvU2dTd252UFB2YWtKYzV1NVIwcjlZY2lsMUVuUS9y?=
 =?utf-8?B?MVRjN0FmYnliUXlqY1FTdmdobE1tV04rcFJVQ0JtYmljdUxCa3FjNFZGRG1j?=
 =?utf-8?B?Y1FlNTkwQzV4NTViWlo3T1F0cEFXVmczTmY0dGw3ME5sTkliMGlHRGFRclRr?=
 =?utf-8?B?Um9icStwTGVMY01VZjVNTm56c3hnWGtuQXVzbXRiTUJiSzFpZENpS2g4RWdX?=
 =?utf-8?B?VEZLQm5uMGViYnVXQktPRTV0ZGhsSGJTWHVkN1VDVHRrdWExTmpJSGdXb0Zv?=
 =?utf-8?B?SURNUjVCcnU2TVBuYXVtVllVN3o0c1RuTVViMWFVeFJ1cS9qUlUvYlBJSnph?=
 =?utf-8?B?U2JCQmwya3JwYzFubEhqcDRuajkrTzNXRHcyQjJQS0l0N3NrUWFtdHFhQlFR?=
 =?utf-8?B?QnZWMWVIV1FYcjZxQWo5WTh6LytNb3VKNjYvbmpoblVlaC9UbDArOVBNUHpN?=
 =?utf-8?Q?m75tmJ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:00.9961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c81f4a1e-4cfd-4381-93c3-08dd86e31437
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9008

From: Sheetal <sheetal@nvidia.com>

The patch series includes the necessary changes to enable
support for the Tegra264 platforms in AHUB drivers.

Changelog
=========

v1 -> v2:
---------
 - Patch 1/11: New patch to resolve the dtbs_check error on base yaml
   file which is modified in Patch2 for Tegra264 support.
 - Patch 2/11: Fix Tegra264 SoC compatible string order.

Sheetal (11):
  dt-bindings: ASoC: admaif: Add missing properties
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
 .../sound/nvidia,tegra210-admaif.yaml         |  14 +
 .../bindings/sound/nvidia,tegra210-adx.yaml   |   4 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml  |   1 +
 .../bindings/sound/nvidia,tegra210-amx.yaml   |   6 +-
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
 sound/soc/tegra/tegra210_ahub.c               | 848 +++++++++++++++++-
 sound/soc/tegra/tegra210_ahub.h               |  52 +-
 sound/soc/tegra/tegra210_amx.c                | 229 ++++-
 sound/soc/tegra/tegra210_amx.h                |  34 +-
 sound/soc/tegra/tegra210_i2s.c                | 231 ++++-
 sound/soc/tegra/tegra210_i2s.h                |  51 +-
 sound/soc/tegra/tegra_audio_graph_card.c      |  14 +-
 sound/soc/tegra/tegra_cif.h                   |  30 +-
 sound/soc/tegra/tegra_isomgr_bw.c             |   7 +-
 31 files changed, 1978 insertions(+), 157 deletions(-)

-- 
2.17.1

