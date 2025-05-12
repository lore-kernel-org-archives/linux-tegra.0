Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770751C84CE;
	Mon, 12 May 2025 05:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027106; cv=fail; b=oNmuEFr6T8WA3t/cmIm3cq8KHSk/0EJBepjAM1iceLtjk3ASubmqvMpN4MaOkZ8d30uDfME1SSMzujfEjMnXUJMaim2rEPdZFSSWBF/EutPkrRky/ttXCBmtj+sHf/LhF0ylJd3oTNnZ0kgv2hI/jDYgw+W5u8OpoDfnuuL+3Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027106; c=relaxed/simple;
	bh=+vLnCjAOOD/gZLkdze2+NnHO01+PS0xxwCospN4OCAA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NXBQgXGjr08PHEy/4PpLCiVks7XCm+LovGWK61odNEQFsd9iVQn4Kqlv1F4I1T4+Jbh0W0Bpq8lfeKIBa8b9pu11BGBn1Su3kNT791mV78NcD+nbyu9tFv4iC0cGul1BywJ6LK5xFrHkVFhWJTs69VHMcTZJQSXzdq/f89JdERw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fwGl85j+; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fwGl85j+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+pdN+e3JSoMTFVIfMx5cWgEKWLI456tTdFh+NNo1gsCtXoToSjVeNPJw4ldOczaibbih+ptykNmfRkZtEbmQ8KQQ39RGB6jYSJbmNbZxkzEWiIyl6Qz0byuVqZ79fv1KjaNINunTtQQ4XSOufzZd8pOJknoR5320eoCrywdK05ntaa+uM1PRhZkeVjAW+DgQYZ8B7oN4vXFfojkEci/xFUeevicXTgly+Ybx7Uf0QEIEyaR8q7g/PFPpuI/4ZfvpLrkwb7nL2vXBje58uawK/dEC0l3E5Zn45Xn8W+abUBpykKk2V1hDanq8w1O4q2KzjCcn3hQ951scRRH5RpNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l06MVKnAhsfIT7OUscP4euuPsU5o0NylXDcvtwt37l4=;
 b=pT9InikDRuOgHYtFkCeFa0m/Qza1skfbL/NKGFJAy4onN0+7/CxfaY9sJAd1R2tiPlA1bOLyAbqdPOxT+RPPOeGqu9DFk9rfmcUZdwx+/65SGFprjiMeYDuB/XtuSe9LFyiPaWO5Aa8jYWBsnn7QU5iJ8A0VhNN4Q8mnaKkcUl7YSy70Gfnv/7v89jrpl3kQY9f+tJ8LV149pbKpFQNLWlOl7iJRXo4bMqbHNb1jndkqcTXu5OblggarLy3/MLbtjZ84cfD3II+4aN+Sb+FfzbIY04eQrnek1Nc91UssmdSpVKPY5/q9zh+ZzxTWQWBK2BxM6z9W6+LL9mu7OUQtxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l06MVKnAhsfIT7OUscP4euuPsU5o0NylXDcvtwt37l4=;
 b=fwGl85j+vH/mZ+CgOMJjwu44+z6DxMgJmVKsHiIgy7yQJ6vHLOYr/Xk5/jslyladap6GcEzqIim2WXasdRJ7QTDaiEvnsvFcuRbE0PQTk/cDTpyn1MovH++/4GAdu1+GLpLebwRgYv4dE/WfJVTgLTiCPNBYxGD/ZcFwUjEk9NZ2FIxY8YIPKkEEtbArxJoWBG9wfj45avA/vE6BpxsF5kV7KcqK7co3k2aqhq/xlj/d/vc63X9vJO4HC5T1+RzBVjRXiIy/f4JcmgSQi0lHJ7/jAY8F0MglyKj+5xsOASD+DMsGzkj2AReSXBr2dw/5aAWi8s+e4SgehxfeYN9Bzw==
Received: from CYXPR02CA0083.namprd02.prod.outlook.com (2603:10b6:930:ce::18)
 by SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 05:18:18 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:ce:cafe::21) by CYXPR02CA0083.outlook.office365.com
 (2603:10b6:930:ce::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Mon,
 12 May 2025 05:18:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:17 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 22:18:05 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 22:18:05 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 22:18:05 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 00/11] Add Tegra264 support in AHUB drivers
Date: Mon, 12 May 2025 05:17:36 +0000
Message-ID: <20250512051747.1026770-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|SJ0PR12MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb81371-f5f6-441a-315c-08dd91146759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzhuRUpWNkk3K1EvcjZTOHVyR0Nka0dVV2p4Y2NTc0FnWmxRd2xPYW5vSzFH?=
 =?utf-8?B?RDhSKzhDajJhbHBNaTVoZFdORzVleWlGWGJFOFBFSmJLb1hORS9PTXZUR2Iw?=
 =?utf-8?B?WlgvUXoyOXpIWGZYTWhqSmVjblBoelNPdEh2WlkrVHlTdlpJOUtPWFlwb1JX?=
 =?utf-8?B?QmIzTHJScHVsNEprU0V6MUFiTGZNM21GUXJuQUErRUNGcks5cXdBVlJUQWFC?=
 =?utf-8?B?MHl2bGRZZzdMU3o0bXcxa3ZaTDNFeDRpRStJaUhJSHpIY0I0aWh6ZnAvUndU?=
 =?utf-8?B?cW5zR1pNaG5TZTc2S0k5c3pyVytocTVhM0kxR243MkJJekVicXM0WnExQ052?=
 =?utf-8?B?QklmQXpKVXNzVjB1YlFXK1VuVHU2ZTRCSVBydzJoMU5iMnkvN2RBWlMxQXBW?=
 =?utf-8?B?NFo3UUg1Z3prcVV4WEF4Z25RRjBkdnNxdmU1RTJIamcwenZEQ3FCL1lWdEUv?=
 =?utf-8?B?OXVmdVNUTmxaeExYQjIwejBhdFFpdmJXeXBvVUtJbm90cDZRSGdidW1vZVVj?=
 =?utf-8?B?bEtSSWw0Ri92ZGp0azRHRTg1aEJXZ3BVb1ZPUTVDaGdqa3VLaStiTW9uK1FD?=
 =?utf-8?B?U21GY2c3bGROaE44WGw1bVAwV0dJTlQ4UEJMMG1kLzFseDNVRE9CQnZnM0pn?=
 =?utf-8?B?WjlmU0xQdlV4WU5SN0tQMzA0ZXRCQkV3QlJnZUEwSHQyWU54VkozTjE5RnZQ?=
 =?utf-8?B?NzF0bzBFTjdLZVZoaHdZeG8vbkE2NzRjaUhUM2gwbStHM0lYZVRlbE1IOHRl?=
 =?utf-8?B?NWcyM3pXTVEyN3ljSnB4bHdSSWpwc0owMHcveFRaVUN6WEZuY1FGZnRxWG56?=
 =?utf-8?B?b1piLzYzNjF6WWttZHNxeE5iU3VpTE00UDJPenpEa3QvT3NQNXRDdGtJK1Nr?=
 =?utf-8?B?TjMvS0lpQmZyTjJhMFB6VFRxNU9zcGpQcnVaeXE5bTlQSEdlTndBSVo0Tmcx?=
 =?utf-8?B?RVRwZXhHWDVLZ1Q5K3NVaWYwaXl2YnlrRkpKclEyVUtDRWt1RmFyejRTeWtB?=
 =?utf-8?B?c2VpckFIQkFWRW9jWE5TTTJPRjk2aUlIb2cxbzJmQ3UyUjJFdjY4dTM1eVc3?=
 =?utf-8?B?RitteVdZZzVYdDBJYVBVRnYweWRrWHVHODA3cWVuWVlTWFc4SnZ1N3YxcHFH?=
 =?utf-8?B?Umc3VDV2ZU1TV3o2c2ZhbytOVHFnQWdZeWJpOFN1dVl2WXlkeFp5Um9jQmhh?=
 =?utf-8?B?eFU2M29lc0c0a2hDT3VwRFBYcmlLbU9LMzF4QmJSTm5LQzdJL0NRcEEvR2VC?=
 =?utf-8?B?dER0ZmFqV2NNakxETmNwaUo2azdjYmVHWVZkZkFWbWlGbndBSGFpNXhDS3F6?=
 =?utf-8?B?aUlNeXJZQTZnREJZTDA3M1FGYmJrN2YzUmtRc2J4RnZ5WjFUS0RSTDFvYzRv?=
 =?utf-8?B?Smhic2NXZFFBdjNLbnNuM2tVeWFxS21IYUNOSnZwcmRYNWpDMU85L1Z6WmI5?=
 =?utf-8?B?aGZ2L1M1aDhFRnZhWmxuakx6bzN4VGM2T3Bqck1mdkFpNFVaTXk1Z2hCemlD?=
 =?utf-8?B?VGhWSlJab2lvVDh5SWwwRFpNV3dKc3duU1hZdjdzTzVnUkV3UDVqSkFqSnVC?=
 =?utf-8?B?TW1zTzN2Zi9LLytlM2FJcHlTQXFSTUFMMkF0U0RvdGFJeExGWU9ZcUoyNGIy?=
 =?utf-8?B?VmxVc0VJQ2xURE82SWJ2cmtkSXpQTEtUcTQ5LytZNUZWZGxleTBSbUpTeU15?=
 =?utf-8?B?V1VEWStmZkU0aW5ZdE54V216M255d1lMbDN6blBqdzhOUDFVb0cvQnBEL3N6?=
 =?utf-8?B?a0JObEw0b3VqUHllRjJrdWVxYkFuSEkzSmVqdUpEeHAxYURqVDVTRW9yeElI?=
 =?utf-8?B?SDE0NDgzeHdtNnFKVXdlVG1tZ0gvMDQ3RWhBTFM3U0IzMnRiR3NEczZGeCtB?=
 =?utf-8?B?TDY0d0lzOURZV2IxMU9Nem8xcFFmOW00N0IrWDRnSDlCbklrZ29FeEhieFZy?=
 =?utf-8?B?VW1tTHdtcTQxMmpvRVRNYzJsTDdrL0RocGFnQ3U5ck8yWWs2OC9QbCtMZFFs?=
 =?utf-8?B?OWdmaXZ4R1gvTUo2T1ZldCtaNFl1YUtyMnBGMlpueG9rM3N0V0NkK2xjMndx?=
 =?utf-8?Q?t3zktz?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:17.4723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb81371-f5f6-441a-315c-08dd91146759
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831

From: Sheetal <sheetal@nvidia.com>

The patch series includes the necessary changes to enable
support for the Tegra264 platforms in AHUB drivers.

Changelog
=========
v2 -> v3:
--------
 - Patch 1/11: Update commit message and update binding doc with info
   that the properties are not relevant for Tegra210.

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
 .../sound/nvidia,tegra210-admaif.yaml         |  17 +
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
 31 files changed, 1981 insertions(+), 157 deletions(-)

-- 
2.17.1

