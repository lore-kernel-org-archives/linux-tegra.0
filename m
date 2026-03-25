Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7083939CE;
	Wed, 25 Mar 2026 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433735; cv=fail; b=lAoNyJjctMP1M4O1FUyDbwx6KjZ0v5mPdRcRRn+pCavmqtrxIeVkSngfdjxy7Cy3yvmEk/FeqwbBmY7KsGK9yYq96iYjJLZePfIEtcjw8VNMYUTcH/z0YlNc8/+Af9Awsd2t9Y2oO/t2YPeLJHf0htBLISLu/51gxTXsHZx+YbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433735; c=relaxed/simple;
	bh=0/ZF8eZsXWks02w9HEzioCPT08I/sLtP8wiSbXcRY1A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CzCusd11ynpMr5xrSaAGF60iEiY/SlnwTIvJqAMEm990X5nvvgqKXp5o2+9GNEvHd4HYIZdsrlOm0ibGtm4SRQfwo4GPVf3+oCjclFBem75XqQJvj2OvloGhCFPOdO40Fw8O0bMHRB+QfepQPfZnZgIf5851GRBByyW1725CW04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JgrH/wAM; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JgrH/wAM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSy4FG8uzjy9Fcel98bCZoZdRe0JY7gCe+XCqoVKrmasfmNPs3Mqg5GdOFQdtpzcykFiIM5shMNaymTcAP9t1h7sjzAa8/q5WlVGClwbBz/dvFnqOkNK126gDe7pwMx/KHPKEnqJtRU3iXHl5LOzabOqBI/q9v7BIZ616mcLcH4Tn6xNZTg5hTPbHr2Vga56Dj6lm1snzePpSzgvwzGRuk1Nhnlpb8xBunsEqHzoevmhCSpaA3igRv7lkJHDP4EFrcjBftJpkJuK5RHwBDrh+KCgTxul4N8QTBanE6PFtu++6KvfHGjVvsc+nXsO7tSVUZ+4Bv5a0TshFVGR6eTxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScR4DOXPgxXwO92hswpkE3MxdWOLa7IBbhRl1AT84BQ=;
 b=h9ZGG0F389Qg+tufRiHrKJCNWsOKoA5BHxe8rTKxMsRRhOjBQQXVaaFzCW/6ZuX4KWOPWSmNQ4pxF8BnZJ4rVqL5YQfWIn/ZCh4qv7DmA6m6JzW8D9RnezZfWfkJa29Vs1fK2JGcc2kTNH85o+PPm6zYQx6kQM7GWEW3/7E12ufNIuwpT6DgEVVBS+lXhTcVYxKn1JQOJzmssVAp6cRmhx5NXisjmoKtvWPBkWf4uNafd7Ce0OEc23uxnwCOs+4EwgG2cdiX8EK/sbAkH3rOT5ik0kzuQAA4sogdOIwXeADcQt20Op1D2qWj9K+oAtUZvrM/bhblqYGFgCrxQ87qEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScR4DOXPgxXwO92hswpkE3MxdWOLa7IBbhRl1AT84BQ=;
 b=JgrH/wAM9H66Lt5k+4WoAJCM6cv98WmWxQ3MS+9+e+fMPcIDoTQZE2fQAhFRnpGRss8xf0SNxOcYxFcjTjilZjRH99/FkXTMb52XSXWlqleic3EqJNIb6Dl7IiDKsmfU1zFPY2TvuL82biTv+yXfpAGIPmBRgExzlszM5skYwtyq1sphDr+j/3SNXNIzEDUXCIZMan5by7l9SoWzce31rl3K6zIqgP30GjOaYEAfQtH/0ASfrnXz0gN0IyOWNoX2WFvDaOFzdBYVwWCDp+QWn/TZrLBYWdoh1nW+eLEDCCbygJxU9EeTemGCRf+u1dPa55hccNTnF00FwJiXzn6quA==
Received: from CH2PR19CA0007.namprd19.prod.outlook.com (2603:10b6:610:4d::17)
 by IA0PR12MB8930.namprd12.prod.outlook.com (2603:10b6:208:481::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:15:29 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::7c) by CH2PR19CA0007.outlook.office365.com
 (2603:10b6:610:4d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 10:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:29 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:17 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:17 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:16 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 00/14] ASoC: tegra: Add error logging for probe and callback failures
Date: Wed, 25 Mar 2026 10:14:23 +0000
Message-ID: <20260325101437.3059693-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|IA0PR12MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: a90846e2-8808-40a3-ac7f-08de8a57711a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6jdHAqPV9gJGkxEW1d3IDGOgmyqgtqeGXhOYnVd1B4Q9k+FQX35NgYUvOLsnwwJKXDLm+G3AOj4ydeYoFKu9WQMDWal/9PKdkeQrLhXGago5tdy+J3QD7Y1lQHfjO9Zs32nsFk/qU1MpAWCoZ+ukrlO+RujOM4LbGACXxJ6WExo3iQQP4z2n0fAb/fzEbfiE7vHJnvD5IRI/Hk610ouRrpW4OY9f8EMFCCtzKkh5Y+2UFZiWeLFpnXwc5kP13MVOSaFVuGflk+ziAEnUDQLUPIv99BojgnGDTp17LY1rrcvWzIdWRZFz3x/HtBEoZviKL5jp98MbvIVPTYM+rC2+sAK/ybSVYbNOPUgmCMsq3F1OvNLIB744iSSm8DUUGVlPqBSUsVhrwjGo57oEtL24Q+g8murwaT/iT05g+oqbdybpzVI9hG1045Qik3gp2m34z5okVCnYpxVQXHhHDOZ12Kt8mzYRFQ14BTEZIkn8dw4Ek2EBoAuWoRjYdmx0vw22DS4SV9weeAEc47EwPO5QMMAhhfHFmSCDpQaYdu5/Nh95Tsi4kVUlXy0ry8Cx9RnV4F/cn9vmpUSk0t/cBLwZf3YWFJ49KVuErXeoxu+83Iyk2ZIsgcgre7EL7UMiwhH62actYHFljv8jxt4Vf7jcSJG+QDloeX+H/AOOGPS6Sf5/Kz/Oyx21xGoYxv0L/AqDNWjRA5orLqgHYBirFK73gJ6/zSe3c8fCPQACRNZnEyBV06ZeDpuUBqQjtfe2v518oPnpXFfe7ltm6NTzDczztg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vx42JR3f3tOCHlmu8tJPRloNxqHGtdnC6aepWEj/MiZJlwHDdUQ2UoWoPoLiOiEQFoAuFC7gjZ/kb4Pqc+DThdpYadqa7/3L6oujCymR1Fjc8InRrZmaXs94mU1ggK8e5vEBTuIrBwu3bnsFLzr+g5KkfNsto2wUYQHynb4aJwUg7W8bfqDKQFfH3awhn7pX6IYOYDwCzqNFCj7fiSYOn896aSF/Xd15Mnt/EDoLblE9irZsYufb3dPdc9BEuNYbgclR4zwrNtAmy6CRD5/ly0/a+0boqEBT5cNMd0v8andRn0GcT3gmMytcKpVR3OVLeo3dzOJP9A6HIu8nJK2a7ZciSoHpwmxcTkQg6rtuKBOTE0biEtnGLqRNd4AptnqWtF6/oVoYEbR01DPggIt47SFsPfzC1npeysRL1lZrl1UtWDfs6kH+IsrpwijS4Onl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:29.6409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a90846e2-8808-40a3-ac7f-08de8a57711a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8930

Log errors in probe and runtime error paths across Tegra audio drivers.
Use dev_err_probe() in probe paths and dev_err() in runtime callbacks.
Skip redundant logging where the underlying API already reports errors.

Changes in v3:
- Split single patch into per-driver patch series for easier review
  and incremental merging.
- Drop dev_err() from tegra_ahub_put_value_enum() since the error path
  is userspace-triggerable and would allow log spamming.
- Drop dev_err() from tegra210_mixer_set_audio_cif() since the driver
  advertises S8 format support but this function doesn't handle it,
  creating a userspace-triggerable log spam path.

Changes in v2:
- Use dev_err_probe() in all probe error paths as a defensive measure,
  instead of only where -EPROBE_DEFER is currently known to be returned.
- Drop redundant error logging for devm_platform_ioremap_resource() and
  devm_ioremap_resource() since these APIs already log errors internally.

Sheetal (14):
  ASoC: tegra: Use dev_err_probe() in tegra186_asrc probe
  ASoC: tegra: Use dev_err_probe() in tegra186_dspk probe
  ASoC: tegra: Add error logging in tegra210_admaif driver
  ASoC: tegra: Add error logging in tegra210_adx driver
  ASoC: tegra: Use dev_err_probe() in tegra210_ahub probe
  ASoC: tegra: Add error logging in tegra210_amx driver
  ASoC: tegra: Use dev_err_probe() in tegra210_dmic probe
  ASoC: tegra: Add error logging in tegra210_i2s driver
  ASoC: tegra: Use dev_err_probe() in OPE, PEQ and MBDRC drivers
  ASoC: tegra: Use dev_err_probe() in tegra210_mixer probe
  ASoC: tegra: Use dev_err_probe() in tegra210_mvc probe
  ASoC: tegra: Use dev_err_probe() in tegra210_sfc probe
  ASoC: tegra: Use dev_err_probe() in tegra_asoc_machine probe
  ASoC: tegra: Use dev_err_probe() in tegra_audio_graph_card probe

 sound/soc/tegra/tegra186_asrc.c          |  7 ++--
 sound/soc/tegra/tegra186_dspk.c          | 15 +++----
 sound/soc/tegra/tegra210_admaif.c        | 18 ++++----
 sound/soc/tegra/tegra210_adx.c           | 13 +++---
 sound/soc/tegra/tegra210_ahub.c          | 18 ++++----
 sound/soc/tegra/tegra210_amx.c           |  9 ++--
 sound/soc/tegra/tegra210_dmic.c          | 14 +++----
 sound/soc/tegra/tegra210_i2s.c           | 18 ++++----
 sound/soc/tegra/tegra210_mbdrc.c         | 10 ++---
 sound/soc/tegra/tegra210_mixer.c         |  7 ++--
 sound/soc/tegra/tegra210_mvc.c           |  7 ++--
 sound/soc/tegra/tegra210_ope.c           | 19 ++++-----
 sound/soc/tegra/tegra210_peq.c           | 10 ++---
 sound/soc/tegra/tegra210_sfc.c           |  7 ++--
 sound/soc/tegra/tegra_asoc_machine.c     | 70 ++++++++++++++++----------------
 sound/soc/tegra/tegra_audio_graph_card.c | 21 ++++++----
 16 files changed, 128 insertions(+), 135 deletions(-)

-- 
2.17.1

