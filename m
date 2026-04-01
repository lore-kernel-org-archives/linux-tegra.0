Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013033.outbound.protection.outlook.com [40.93.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E283FD13E;
	Wed,  1 Apr 2026 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042740; cv=fail; b=fcHBeTkqCBllRIvx2nx9gudXoFK0uTh+rlow6He8h50uhgXJuMTNCDRgEqZOrkw1Yc1r8q7DO4/kL827UrJb/noAfPkY6UdlsnG0s8DlTvb8rnIFq2T3wqNoGYxuNnIni04KNAxQrQ6ocLo/+JaBdD+XNajENxzqDtP5QUu5Ufc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042740; c=relaxed/simple;
	bh=BMDcs7Pu1wLHjZM3BW8wehRyLLp72mKaYO10isS+0Pw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LZT0Vl1KQ4Qv8U3d+JNShyZLqCxHtOacKQnN/QQBjFPqVjkZvdmb/qgwmHv1+Eus57celqKxWBSlgvt2OHGrISp2BCUSX8yI34QU6reC8jZ1aqNMOYxZSiW/JhhnNZXN+q6jALMgb+M7l8hA9IpuX8XVJ2LE954S7E1n+CY9TSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mHU91Lrz; arc=fail smtp.client-ip=40.93.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mHU91Lrz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJW7jK7tNRkbgBgkZfIVSPTJ+mfpt1zcYRffHf0DV/0EYDp7+VQUhUMlD8qgzLAQvM4Swmjyep/czxjzhT38nRUFsM7xsqxcxc3L+pVhtCKQfy5P9WXDrYvI3qFB2c2c87QvDP2R2wM9rCNyQuWI267weDPQVkm1qeqmP5mDXNcAZR595ChPmUc+6gfWGSgL40iWcuLn2wRSd/YbZBBsFaseLoyI9endXXpYgVCyCsTSQxjZMgnQjVbA13FM8v+LK4MhPlQug8ptnHjYsS2WuYAkW02MTCT9CRBzpJpK9J2FQo8jO2nbQ+05tbxvBNABrFplACrEPUH/BFm4PJZh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPPRHzfX7EuviDPwg0RTz9Lt5NXB+BCkGTi17Nqd3oU=;
 b=ViEqYpio93gxOELT8PPmMf7NB8PEHCXLQUpShQYKXAFZPiGEoQTGOkNSXoNhoxXMW7KsKEyEsimlIN2WpfrIjpTnsKM4xUTPf87wW5I2mEv6iirbUIA8HihaTIh0O/ADgTKws4hLJq4yuMoqg+lDgAa4c9GYf8jfhcIIlLQjcFdU5v0aHiwn4jdkovrWFPehAUcHoaygA8Q6peIYB385aB0o6/+jP7HSpB0ktPifjxk3qFUts2AbFvjpKj5oNkJ1Ew6eJXXg6g6huXeXrAXGDxTGHAo/bcxzf5NTpt9SIq/r1S8S0O9XKAin9x0m4nG/QirU+2/D7NnxtyDhEY0tWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPPRHzfX7EuviDPwg0RTz9Lt5NXB+BCkGTi17Nqd3oU=;
 b=mHU91LrzAv8Tm8YZ5eOau4qqnxyBBDnxJh009wJT4qmUZI37ZF5NkkLuTZnRR/TXw1mWzshrx1e9dRY8QDzmG+ZDbfzQsz2+R+L5xE3wIXjJ70sD8673dbcTIFsc5Sr2d53YwCRxJd7h7/dfMNY2+r58EzLt9YNiUGkPD3b9+HPeoFeI050VIkHSrLOq0sBDlOGrm3KmydgTsFRdsTxOm33zOjuPIRI6PICi3RhO8ufPhpAp+my/38VTiVtYQ4RcXC/XR45pd7ngkFhEErEL2vdeQWQAMmCXJvYY2aiBoZOFQZCd7YxBOOfTPAI5oLTf5YgxKRXp1uu5vY1GbWv3xQ==
Received: from BN9PR03CA0178.namprd03.prod.outlook.com (2603:10b6:408:f4::33)
 by CY1PR12MB9699.namprd12.prod.outlook.com (2603:10b6:930:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 11:25:32 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::2c) by BN9PR03CA0178.outlook.office365.com
 (2603:10b6:408:f4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 11:25:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 11:25:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:15 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 04:25:14 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 1 Apr 2026 04:25:14 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v4 0/4] ASoC: tegra: Add error logging for probe and callback failures
Date: Wed, 1 Apr 2026 11:24:56 +0000
Message-ID: <20260401112500.4076861-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|CY1PR12MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a5fa44-61c5-4335-009a-08de8fe162f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	y+MvRfDpX8+4QlghhlW/HgucPA0sfrC1R/G7dPdOV2b8C2kjcx7j4S9jBvJWdJYbEhjkh+RxcywQsph00EwLV4GhbUHpIIaqjVVJSi4sVFtb+1BuQEWrS7eI4uKnxsi0s+LSIVeLiS9/EGZYmdNeBpVn/1U0BBD38Tf+0/ZIgn7s2AITz1xeEOdaEoJaswgXSstboKWzd3LntlGMwYOm0ATqB399zyn4YUQ21iF7/P5vqWlwoJ5Cp81qu/cPC1CfZCaZ8u9dl+IY3tpGCiqWe//H1EcIUQfLqbzAmfC/V1dEmySOIXjZTu2iEi001JB62pBl4ZYvZ86nZiOadLi8xRnKtdvQqVbaGN9jN5V3YUGhCHu/CBYhxOmTQLt+9iIhtRf5xzNKIq9j3HBwMh3M+MXofr3D7cvz08dxqXW9aFJEmum4bXsxlFXMBNN1S9C7dD5VzR1VrsE77+RjeueTo2hGiLzyhEUwyJDAPpnDIx0DZH9z5cNNbALvNs5pPB+AgEFlpETaPHPfvrgE2J5dhdE4b0uGRglg0HsFetlo9HRzqfG2RHP1ts5QWKb5woStSfdES8NNQZA5cDqRVON/cD9pEtkaiwSSJOzgQ8pURRDfo/E5QvmfKtRg2sLiMOGUYzq6/+RM3vjlTukLlR9NtPP5MO6Qjp7khwJvuu6wykpfR310odI37M8irDRhyktQDPzh7kwehBISJX2NYKjjB7t178cB2lkBWbM5qe7FVy/0wsOmvWhjE9rJfBQsFee55rJJRw3hovnJKhs55Or7tg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dsVoqpz7Fjcnrp4a6ib9Tu/xF5/7qQS5r+0OKW8n4VIpECUJtONI8t5lvKPP8fLMH7mINswZMApqtVtey2ZFfErcezCByx1PD6Ybx0Ti7o9Kl7hxzAKdRZkrJqM5IAx/f9TpQeKUitVYYtMbxkrJDZEqpaSbGYjdM5EFhbr0es8AX54K86t/bRmbmOgpz20Kb3K4JbmcqUuVOz+cMS9D8uDTCXK/QJSXcNXShMOV5rZPdBjwz+eSb5ln7sxv8vGd6LHqd6ximrIzo3e1+cpdM/kb0L0g4E/aOhXlXkLpavKDBOxNWwRFbwrD6i9YpY5B9vRvsfeiAPjStaWFjbfm/RxcJCr7BzHaZRuonv4S7f2AuJqjZYhY1dcuT8oqYcivzStk3WnydmD/T7iXm6m7+7Hu1WiOC46K9IKSQrfmjit/zDXV8ZwB//2dTNAvdQgf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 11:25:32.1738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a5fa44-61c5-4335-009a-08de8fe162f6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9699

Resend pending  v3 patches with fixes and add remaining
dev_err_probe() conversions.

Patch 1 replaces v3 patch 03/14 (ADMAIF).
Patch 2 replaces v3 patch 09/14 (OPE/PEQ/MBDRC).
Patch 3 is new - adds regmap init conversions across 10 drivers.
Patch 4 is new - adds clock error conversions in tegra_asoc_machine.

Changes since v3:
- [patch 1] Drop redundant dev_err_probe() on
  tegra_isomgr_adma_register() since it already logs internally.
  Drop redundant dev_err() at its call site. Add regmap init
  dev_err_probe() conversion.
- [patch 2] Drop redundant dev_err_probe() wrapping at PEQ/MBDRC
  init call sites since the called functions already log. Drop
  redundant dev_err() at those call sites in ope_probe(). Add
  regmap init, of_get_child_by_name and of_address_to_resource
  dev_err_probe() conversions.
- [patch 3] New. Use dev_err_probe() for regmap init failures in
  ASRC, DSPK, ADX, AHUB, AMX, DMIC, I2S, Mixer, MVC and SFC.
- [patch 4] New. Use dev_err_probe() for clk_set_rate and
  clk_prepare_enable failures in tegra_asoc_machine probe.

Sheetal (4):
  ASoC: tegra: Add error logging in tegra210_admaif driver
  ASoC: tegra: Use dev_err_probe() in OPE, PEQ and MBDRC drivers
  ASoC: tegra: Use dev_err_probe() for regmap init failures
  ASoC: tegra: Use dev_err_probe() in tegra_asoc_machine probe

 sound/soc/tegra/tegra186_asrc.c         |  7 +++----
 sound/soc/tegra/tegra186_dspk.c         |  7 +++----
 sound/soc/tegra/tegra210_admaif.c       | 24 +++++++++++-------------
 sound/soc/tegra/tegra210_adx.c          |  7 +++----
 sound/soc/tegra/tegra210_ahub.c         |  7 +++----
 sound/soc/tegra/tegra210_amx.c          |  7 +++----
 sound/soc/tegra/tegra210_dmic.c         |  7 +++----
 sound/soc/tegra/tegra210_i2s.c          |  7 +++----
 sound/soc/tegra/tegra210_mbdrc.c        | 19 ++++++++++---------
 sound/soc/tegra/tegra210_mixer.c        |  7 +++----
 sound/soc/tegra/tegra210_mvc.c          |  7 +++----
 sound/soc/tegra/tegra210_ope.c          | 26 ++++++++++----------------
 sound/soc/tegra/tegra210_peq.c          | 19 ++++++++++---------
 sound/soc/tegra/tegra210_sfc.c          |  7 +++----
 sound/soc/tegra/tegra_asoc_machine.c    | 21 ++++++++++-----------
 15 files changed, 82 insertions(+), 99 deletions(-)

-- 
2.17.1

