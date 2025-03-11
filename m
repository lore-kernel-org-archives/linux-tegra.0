Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2731684AC;
	Tue, 11 Mar 2025 06:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741674095; cv=fail; b=W+ihAo5XdJCBIxFkXu6XhpX7284Z9EnVfX9wbH19fBufwQoC9K4CbSRBaL72sGEhhZqV9gE6UsuyaHiF8qXSVMAzxbxp2++rMtDT1bNaqPOz4PXCUnnmuYLoGPzFv46SmnA7r6rxA3clGfxv5gCpl2IXVFlXjYxhPB0UR8Hll6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741674095; c=relaxed/simple;
	bh=FByc08cvD0NNhBcORZfi/hq272h2/kQeSpmeVEKP3Qs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ffYJ6+1xkseyJ/ykqVdeWnNoKa0aBI6x1K5Ujk0+YEDYzIcUiqNqQwmzSb6vCCe5hJSWnDuu9lCPNs33rq1SdJPrSnXKAoWRAhXZG5qjuaxSvgOx1XLN5mbz3/KujlRYGIc4sr0hg2Vbgogw4LMPafzU1EGsChRAEmbF1LLj0+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FpvmBb0v; arc=fail smtp.client-ip=40.107.244.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FpvmBb0v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3WL0+OUQve4MbdTPclhpxIvaMX4Y/AFN6rcwpq+ckFk/6WR1NY2QxOy0mlZ4C60/YEO1LbX228np/7h7b+6NR1ESXdUdZR/5vcLQgmqR16kQHtoHC2FZa2jUfejHLtecy/QZwMTFwVF3SFliOBkkDkOsp+RGFSt1rBhW7lV/OrvqwJCkQsrBAsKKli4nmPtURmpgeDr3dm8bmCE0AiVRFwdHU02siJ6toPlKEeSydLMFQ7SIWfohBZNyNg2NnDQrJ3p16YBGttU7vS+tg0y9ihoIspGIfa4ELq/o10t8p64Xf+7IifaZ8S6hVAhKKuYN9s8OXoQb7D6u+UsYr/uAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGJ/YHD7Y0Amb2zrDwYJ4wBFM+f2UpR9zsgGfCLQmXQ=;
 b=ouNY1fvn3YhX7nO2EQChglh3LcLUlHb9FOGjYdW2WnxfQafowEJ02tIo9QErl/JEoZX7XkdP3x//XORXwdhf7x3rtaIjoX+kN03tDdnAgPstBioHETJa8VT212RrJtLPOBM6587YCoa2iKUDHGzOglGI3afJgRFUV+OBAyrl69Vzsf7IOhcra0pSwrkzmJVFK9xt35SoLfNkI+TpY9tg3izfOrh0ZJo/jtlAmiuBhOMY6jdJOq54rJdZR6Tg2Br2zy3g377iAggTRfUfTUG9gFTzvoTmN+NLHuiqZe4e36Z/qf1ggS4M+LFT4plcmsqavn5C372DdqxSL8Fyz1QkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGJ/YHD7Y0Amb2zrDwYJ4wBFM+f2UpR9zsgGfCLQmXQ=;
 b=FpvmBb0vRTB/U0UWu/C4vqLpRBH2Q9EzBJPSsuBc3WVsgtT+LoKCtrFHbQGIlkQjJw4Ybd3yLgvkZMnsPHlo32ZCp2DUuhIfSMxoN7EEVqlGAE+fxz3/sp6mQ72IaUwUe5tv4fKDJSThMH1LzEK63FHvC9PYsxzXDNC+UNuYtKrl+RNX2SR3lpIYHt7GiWV9mGzVllhU0nCrMwUTMpIkWVw5i4qltpDw6lwzZm//uqdQrTs7uHARe3kZP2qOylZWcrM+OhEtoYMoIt2sfCWKa5L5MSndOySAlavLV1b9e50LaB5VnzvkZZblA5z8SaBxnmg+UOKcRCaMRjHgsLNvBg==
Received: from BY3PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:39b::18)
 by CH3PR12MB9281.namprd12.prod.outlook.com (2603:10b6:610:1c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 06:21:30 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::cc) by BY3PR05CA0043.outlook.office365.com
 (2603:10b6:a03:39b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Tue,
 11 Mar 2025 06:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 06:21:29 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Mar
 2025 23:21:22 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 23:21:21 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Mon, 10 Mar 2025 23:21:21 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Ritu Chaudhary <rituc@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH] ASoC: tegra: Use non-atomic timeout for ADX status register
Date: Tue, 11 Mar 2025 06:20:10 +0000
Message-ID: <20250311062010.33412-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|CH3PR12MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da0aa69-1723-4ff4-5cfa-08dd6064f621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UwponhYSN1XXrhTEqi/o61i//w168AY4GtL7S/TvRz6hnJUyQbY7y9Ot5N46?=
 =?us-ascii?Q?351yrT1uLxNqqLZU5y5EcpdlxT13oLjNfzhGDsGcBjZidx3bUa1BDGtFryrQ?=
 =?us-ascii?Q?QSCOpQPGLrilGIo0qv0PHUug4Wz1GHBfkIclsPO+ZDlF+yR0BWAFoXR53b6H?=
 =?us-ascii?Q?+8awdoDX/O79STUoSwYi2k9gs+3Bn3P2d8pCEkFWsYC8jm3PbL+kFplDELmH?=
 =?us-ascii?Q?yRLwwkpp9CvOA/yQP3Huf2M1D4egTQ+nCQsCuThjFvYoR7RyX7RO+v8Q9e0Q?=
 =?us-ascii?Q?yPoXyHsl4lfIWZGqLA/B0JnNfIRqXN2conBGllzdQY0L3WHKmkHyK/KYJbCk?=
 =?us-ascii?Q?7FrZ4smSfjHZNwwLPC6PUgITyTrZmgbke2qRNvtrN1XbrOK6q50tXK9rB9pZ?=
 =?us-ascii?Q?AjuprlVGGQYMdU1SrlVYr2sPikAk5kuwZ1HQPpOLdYl5aNxjVHQJ+seFCM/J?=
 =?us-ascii?Q?7sJn0/UskzZ1e6naXarnqYw/53uc6j2+zMptzfqV8L6xB7AgN8A9eJA3l2SW?=
 =?us-ascii?Q?IcA97Wk4oi0Vejzmnu1slH38X8yqnNdTl/dpjxVfkCetGN4jvtapgFfIUgpY?=
 =?us-ascii?Q?nKBZM36caZXrkkYislOWwcZaon381Ne/aoagWckBt1tSOF0fXjz9qeg3tm67?=
 =?us-ascii?Q?gfjUkds/dFUgtKnPpth/GRaW7aZfruLXYVtVKrSRceEQ4rO0iJ2N8L0dodpc?=
 =?us-ascii?Q?kObf75iZ/tlCLDxm4+AGAu3Y0W8bnrqsvReMIUYZjh2zbxCcReGmIOwMAlh5?=
 =?us-ascii?Q?4k3IRo6IfvCvkNvXR/W1m1bxMjnpRMCJ3o42q9/0e1rliyTcbq9s9TxbFo3p?=
 =?us-ascii?Q?JaLy8pT8izErqG/m3GKwuBww3YKt3kmK9jktnh0zFJGXNOJbaLMbTh3D/pie?=
 =?us-ascii?Q?vVvRm6QHjzmNXQWwGQIiLqGTgJut0WW5QKnKaBAbPsAWQNNlqwjCl42yX3+/?=
 =?us-ascii?Q?Tr1DA6WflTJRiOn3a+gbOEQM5xqPjQKEhBqs60rGxlCM9f5G5gFQb6fxVgTy?=
 =?us-ascii?Q?mnURGYlG0A1kPNsNmhxDVav2Dh69hghXPmxw40bKOTmGJR8vb8jHNloigu9y?=
 =?us-ascii?Q?f1tlXleQew465YepEgkgj4PRgdA4QWp/hIUaEj+1dcYoQ140Ri220LSCNJtd?=
 =?us-ascii?Q?r3AEeL7D0gg0wtVCug+Y3o4Cz1QC1/Ob9yvxuVTkN155VfBQePW/SveHRqEf?=
 =?us-ascii?Q?bAKo4Ez3IEHIwjSeQ2o3R8hGAjibtem3Kg+TNA2/yrZ4RzCMkUP1he+q/JBR?=
 =?us-ascii?Q?Q8YPVNUj6nrKl4r3jv9LWC16dWIw4z5PZ1VpG3gOMlnyaWpoA9c/4WMExp9x?=
 =?us-ascii?Q?ta20PuqOK4qGEGAsGf1u0i9OYAHNQ4jcgguyz/24HpI81XXFyln5ibmt4pM+?=
 =?us-ascii?Q?CtySszpvFvCuZMEUTJpUwBu7EWh5qZPttGyczx3wL1fgaLCha/nuA/Wg0YMy?=
 =?us-ascii?Q?hdSi9KhFuHfrjzCRwfKzJaATiim1QKK2dS9C9xqW2Eg+9tIPs7vfxgi8dvph?=
 =?us-ascii?Q?uv7evUARlxpJSvg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 06:21:29.7918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da0aa69-1723-4ff4-5cfa-08dd6064f621
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9281

From: Ritu Chaudhary <rituc@nvidia.com>

ADX startup() callback uses atomic poll timeout on ADX status register.

This is unnecessary because:

- The startup() callback itself is non-atomic.
- The subsequent timeout call in the same function already uses a
  non-atomic version.

Using atomic version can hog CPU when it is not really needed,
so replace it with non-atomic version.

Fixes: a99ab6f395a9e ("ASoC: tegra: Add Tegra210 based ADX driver")
Signed-off-by: Ritu Chaudhary <rituc@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_adx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 0aa93b948378..3c10e09976ad 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// SPDX-FileCopyrightText: Copyright (c) 2021-2024 NVIDIA CORPORATION & AFFILIATES.
+// SPDX-FileCopyrightText: Copyright (c) 2021-2025 NVIDIA CORPORATION & AFFILIATES.
 // All rights reserved.
 //
 // tegra210_adx.c - Tegra210 ADX driver
@@ -57,8 +57,8 @@ static int tegra210_adx_startup(struct snd_pcm_substream *substream,
 	int err;
 
 	/* Ensure if ADX status is disabled */
-	err = regmap_read_poll_timeout_atomic(adx->regmap, TEGRA210_ADX_STATUS,
-					      val, !(val & 0x1), 10, 10000);
+	err = regmap_read_poll_timeout(adx->regmap, TEGRA210_ADX_STATUS,
+				       val, !(val & 0x1), 10, 10000);
 	if (err < 0) {
 		dev_err(dai->dev, "failed to stop ADX, err = %d\n", err);
 		return err;
-- 
2.17.1

