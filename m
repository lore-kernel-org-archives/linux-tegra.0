Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2AE1F1524;
	Tue, 22 Apr 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314713; cv=fail; b=TuA9UYEeIZ/X/43sT8ZsTibX9SWm0YKHOY2dzWhEHaC26G7RRkwDTYhOy3qbWcoa/0vzq7W5fuF98oRVJyDx4yw4uAvmCxndk//pjFPxhxENGeLDcWcmEuAFYnYX9GBg+xzSxGEkiU1pnYC+P0d7AJMMHcXTXrNrBdt89aunzIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314713; c=relaxed/simple;
	bh=DHjyI2GfTa0+pE00tWLkkfc/U1J4gC8qyXbU4SF4ix0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mnX7n1b/9JZXVcgZHbfLjxEgWT9LWb5cSv2Yz7gd8XGG5swZxJ1oEi7uIdWqoYQFPklIMj4moAFsDy8Uh+rHkSljRLJLS0SyJIYP2Ao9gdVgdIDX5APFQNYTNEJnYTYy8MSHEwAhmwyHzbK96Sy5mwyim+mdpdcmNCpAkMVvq0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tBpvhKng; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tBpvhKng"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iu8DwEtm5yNku1fg0RYZW4ecmJXVuit89xntZHb6b1g7IrLsnK0RUiYMdXvmb47uhJMpB6YMDz+KdT093QdcUJuWKThTcXctm5+UNjJUAC2yXyj2yRu6G2cZex8zdr2S+H4KN1Ke48z0TThZyw1DRETo7HO6gSUPa7pYz2PueReZ4c3zf4Z45T87gmC3z1DNbd0dKULwS+9Af3UzvM6+I09Zl6SzBAJhCk3B3XPeurdAXNopEn8P8bZzSHLouZat9knoqqURHgwiYyKc+nV6X0/C+ertTTTg+UMWyS2bP4JtF8IG2DvvNh3IfQfX+FIKH3tNeu4U5/5jOgZQfv9wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT+CEpuGuI9OlJxeTn71j2B9RdK6TklXkVXjq/sRDMY=;
 b=rHGiIY4jRwuK3jbhZDvNIzBRCs1gIRSHa45igYtll7xQBrQpAgJK83E+9yhQbYFjT2AmAdqzT0jnzUnm6aA4bCTgBA4FNr1SkONdApafeY0DYNwvFlIAy5X15+n9jX8deqIvhVdQALCcjtErA2Z4qSdbumAjDZvPKRnfKDZofvoMywQNtBJ3HcR1PXsrvn5xyooTjZLa1nZk/3j8o/2C+MTR2yzTtoGs6MW73x9+finyJkIvek9iS1kKCDGyBAmQ/HUHM2Mux9nmMEoECsq+FDUV94Y4RVVxemN5vIoP6HHMb5KP5W/G+gu8GZxBWVWrBt4BNoo8ORoww647POWBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT+CEpuGuI9OlJxeTn71j2B9RdK6TklXkVXjq/sRDMY=;
 b=tBpvhKngqDM49ybAikucjxTbowcEjdTGY09HcB3LXph8DPQ6gZc4T3+stZKIyc3y2PEqQ6rU9JKf753ARrvoYnmWRGRzxf53fl11mLnUjrLOvmIGM0T14eqCDJ1HtUustbuIoGPgERd4xtiWXNHPVuhLEnoYeXQcWqZDCEvZxvtozQcVCJLW6RTS8+byut0TcAdGO8pYxlG36hEbOkNcAIoHK3AxPU6xhgXBhjiY1ZKchHt9cdYWoodV8QhmYg5wWMKI7vAsnIM39qUQ8MTCn6uHotQBbzF1Kg2dZ+N6aceYkM6GpJY1zVe3syMSo1ICrNQINYZTrNzAhpqrVeZOzQ==
Received: from BN0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:408:e6::23)
 by CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 22 Apr
 2025 09:38:28 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::df) by BN0PR03CA0018.outlook.office365.com
 (2603:10b6:408:e6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Tue,
 22 Apr 2025 09:38:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:17 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:17 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:17 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 00/10] Add Tegra264 support in AHUB drivers
Date: Tue, 22 Apr 2025 09:38:05 +0000
Message-ID: <20250422093815.506810-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: 0714d0ad-9b40-4483-31f4-08dd8181700c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3drak5NSWN1T3BGc29wbTRDYWRxUExEanpwcyt5SXFKb21zOVBKblpIamEx?=
 =?utf-8?B?Q0VtZytML0ZoWFJhQ3RmNWxvUkdQWkJxMDZsK0EvT2Z6WmEvbXR6dytJc0V5?=
 =?utf-8?B?MXgwWWk5WTRYTDM0NmpnNk5ueEQvbnRFdzlSZHQ4cGNvZXRqYXpEY0UyT1B3?=
 =?utf-8?B?VlJ4a0JxT3d4WGlyMFdCcGsxWWhwbnkwb24rK2JWcDg2UHJ5aWRaQmdVNVlK?=
 =?utf-8?B?K21HTGlNM2EycDdlNXpQUVgzdVlWVGYwOS80TmZzYkhOcU9VRER6U2lzdmht?=
 =?utf-8?B?S09hTWduNjNyd1daVU1Yc0JFUzhub2g2YjB5dEloVWxaNXcyWkwrK2ZJVkdG?=
 =?utf-8?B?WmJXSlg3cTZCMnJTTkw1NC83VHNnNktoUHJwVXZXSHQ4OFF0emtNZW8wT2Y5?=
 =?utf-8?B?TStpeWJlNXRmQVZ1Mmt4SDdiZ1ErcVFpSGVjLytSbTRsWWRDcVBuT2JNTTFL?=
 =?utf-8?B?b1VKTENSVUtrVmgveVhzeTZNTDhZZWdMOExoSDNtUE10YVhSSnJYNjYvUkVa?=
 =?utf-8?B?R1VnU2lGTEJmbE1ZYmViMEw0RkVGbUJCTXVmbzRUdSs0Y1F6Y0w5KzE2cFAz?=
 =?utf-8?B?K0thU3A1SEx3RzVtUzg5UHhNSDZ5UkpBbGU5ZW9GR0JkYmJmRitwOXJESmo5?=
 =?utf-8?B?M0hPK2xuS2N3S25Wa3JGMXdGVldUcGZjRWVESzhTOWk1OVBsZU53UjkvZHJm?=
 =?utf-8?B?TTFsZ1pycytEMFBMU1A2WDF1eHJ5aVRJZ21hZTNla29MQ2wxMUZHcDRSSFlx?=
 =?utf-8?B?aEpYWHJnbDBTcVI1MU5nTUVPT1l4L2VHUzBtMUdJRGE0Y1lKSWJoRk1iSmVU?=
 =?utf-8?B?T3B1aSt6dndiWGpiMVBERXcrbVF3OVV2dyszV1JLZnpHdFhPSnJyQldsd01R?=
 =?utf-8?B?RmJmdTRHUU5hMllZZjVOYWxscDYvbVM2YmtUWGRpWENUS0tDWFI0Y3ZWVmFp?=
 =?utf-8?B?RGVDV0ZwdUtZdmVyT1hhSFVsbGE4VUhjWlQ3YzZDWXUrZzJ5ZG9aY1hBVSs3?=
 =?utf-8?B?VERCYXRJY3U4Z0VNNzgwK0JjOUJJR1Fqd241VGlVcDFiejhkMTU5aXIwUlph?=
 =?utf-8?B?UE81L0t6T0Y3YkFtRFBra2JLTnRuMStQZ20zNnpiSUVSUU9ibTQvcnNtOHM1?=
 =?utf-8?B?cnVGMzN5UHN5cWJrOVdHdFM5ZHlsRWdCUnRqcEFpV0p3SVRIQmIzdkUxeHpM?=
 =?utf-8?B?Y2F3ZkpFdlEyS2FVUkFQakxVdFNodktUQnFiVkYrRG95TFIvUjBJc3RuV1hp?=
 =?utf-8?B?dnQ3dTZLSjgyWE9uSmd0a0tWcHVwNklibElOTnBGODJlMDFNaFlzNXBNQmw0?=
 =?utf-8?B?UDJ4b3NVUXptc2wwMER2MGhNeDRWdldxV0U3eVVabTdzR3dISGVwSjk0cHpR?=
 =?utf-8?B?NitjNytZeHhnTEhncXhmT2FEZmhvWUZHVTJOeWtmVUNTNFpNK2hoc2x0YXdo?=
 =?utf-8?B?YlRTMjI3OE5MVk5qbHhQWkdJVjkxOXc0Q2h3L0FiR1NZbWQyTk5CN1dBY2VS?=
 =?utf-8?B?OFVERnhxWEZ4ZFBaUDhrMktoVjU4ajBUTWFnWnN1Y1BrU2tVcEpxcjE1SjlN?=
 =?utf-8?B?c2RualZJWW5EMjlRWm5saHFoTnVRbmNEd3JQVmQrbFNnQUI0dWlKYzdTZnpm?=
 =?utf-8?B?bHN4dWNYTHE2TnN5Vmc0a3M3RkFzcmZqaUlPSWpyTjZBbHVsTzhuT2VVYmx3?=
 =?utf-8?B?NWtXWjFndVc0bDh3TXJsTmQ1VFlXQnlKbDJhVVFaMFdadThuaythK3ZUOVlH?=
 =?utf-8?B?VGlNZnR2dW1UODY4aUxCaFR3LzlDR0ExNHhEbjRWUFR5YThqNm5DMk9yRUJU?=
 =?utf-8?B?WXB5SlJMWVFTYmw0UFIvYkJ5VWlkbjc2NUNDVS96eTdTeUJjR3JZZmd4YUYw?=
 =?utf-8?B?b3JKVTBhSmIrWVFnY0E2ZTZ0cGZ3UDllbVFWTCsrWFAxSzhYY3Yyalp1SGhp?=
 =?utf-8?B?UFB2cUw3aEdmcDVRVTFjTi9OY0lid0h4TlVuMU8zajBQZkkwUWFmM2Y5V21n?=
 =?utf-8?B?dTIzMUR1dzVDdTlEZ0luVUlnTnlaQWF0WDZ1MGV6aXRQSklJanA3c1VWQ2JK?=
 =?utf-8?Q?x0qDXo?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:28.5098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0714d0ad-9b40-4483-31f4-08dd8181700c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170

From: Sheetal <sheetal@nvidia.com>

Resending to include device tree maintainers and DLs in the series.

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

