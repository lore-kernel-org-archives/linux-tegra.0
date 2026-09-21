Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D87397935;
	Mon, 21 Sep 2026 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981054; cv=fail; b=bncpCy/jVXdZXXyZzpLSStoP8PsroOmvahQ/EsoyU1SPgqcsfc4qJO/bkqyC3zfSrDKK8wubh+EXQ7JDkbs98umRHfn9/+jLAAJERbmq2vqcr7LnGnOqpzazDGk+nysA2EuHYxhwtA4/VtEZi69NPhor3j0ph9f7uss0MmZ8/bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981054; c=relaxed/simple;
	bh=pTBZucZXGKFFZd1WXJSscpvAnmZ7+ygW/GgSoye5Mv0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uVVUHzClLnKnuCpvvRerwFeOOBqBysaPeMigAJciIuuStBFr0qevieSxN6A2KrBEKQRE4tVWfX38kGE7p5Rrr7wk/h1QQ/4csMSC9TWrBtdQ1c2ZP78pD90kCV7o0nFeOGpOhJoAys+Rx5P3U+aj93NaL1+lXDJ+fjgU5WJlqDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hDHzCrYk; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hDHzCrYk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E17kzDBzLksMxCByo3vDO6W0itEFqx/XJ8K5Pm1XABXZsn9sk0ey7xbmhmOvEl/OsdIhbdL2WbJVUiLTQ6uc0FnMgrIuVNWWVO6vVqrmGU6BejYwDffCj/u8HeMjrUf04dH7YLSbHsndFGJ0+RKjWODg08El4RhD/vUxRMybvH4V+91KkwP8ZDsPGPmnZRQaW2PG2Jx6betGzrK4Icn1Udha7CIf1QL1AeirqVkyaypdTqbyCLKghribt17+rOgxpDA7xYqUIqZJ/UhK7lUxaMUmi1uXvOyAGThLAWYXaIgdJ8jvZSBVENYWyvlZ0bj7GVvSqHxTALcX5RLnbrd0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNVTJSDG8IRGRP8g396holW4o1pe4r7BSccrgQDq3uI=;
 b=kjSM/S6WLsc4v6SyqTZ9Z32Wg7UFxlYZ5rJiI3X9xCSEZJcz1vGlWsVXFaIrZ7WKZ1BQxBZ0067uBiCBd6oiFUSwkABAWZCcBMgNwLsL4N0Tz+eJxRhoccAiUfrMHYEA9qOqFnRWO2eMn0hydaQHVAgYSLOZHjSwKoXlqtR/1QTHEN7hN1/BlhALebSW3UW1JvyVKyyf3YuNPpRzgHhf8lxPLdYBfV2y0K6Ly+zFBrB6FWIeHVLaVhBvd3HGg46nd9+MDwyKpxEzYByo6Fbs/ROyeRHL62yejo7dtwBOhlMspJzJ/C/dG2K6cjWhM1e6fx3vL47xayRS/riTxTfYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNVTJSDG8IRGRP8g396holW4o1pe4r7BSccrgQDq3uI=;
 b=hDHzCrYkFuVgev7AU6qa/zmXNQMX27JrOrBxJStqSd0yvGcppCu3A6fcWqowwfAhNtw9pdlcTSuw5Dkas+wAYw6Cg3YjrmPqaxiRgW1a36fvPfB/676PGVmaTNqoGQflTln2KTcGobfocHNNc62ZBbIZXOjYe1VdlpNrELpqjaWuTpimLFNznhkFR0QRgriNaws3imxH927NBClIiwUGfqD/z6JLd7MBehz2k/nJ46xzgs9HhtuNA6u5aD2RgZgf78Uv/jYBIDVh2rFvCk1sGUf765ToH//r6KDZZiCNaPGxrjxr7n4zUS5713T1uUTsj5BSPDIqMFUPV0yKPgRPRg==
Received: from CH2PR18CA0015.namprd18.prod.outlook.com (2603:10b6:610:4f::25)
 by SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:57:27 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::24) by CH2PR18CA0015.outlook.office365.com
 (2603:10b6:610:4f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 08:57:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 08:57:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:57:12 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:57:11 -0700
Received: from build-sheetal-noble-20260902.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 21 Sep 2026 01:57:04 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH 0/3] ASoC: tegra: ASRC control fixes and ratio caching
Date: Mon, 21 Sep 2026 08:57:01 +0000
Message-ID: <20260921085704.1248920-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|SJ2PR12MB9161:EE_
X-MS-Office365-Filtering-Correlation-Id: 8816b7b6-ec77-4363-0d47-08df17be5c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0dJWuB+oRugofI8d041Dfz1jNCVR1Be5WgjEhBHJl7P8jbjoJlAZNj4AkY48ynAdYkDE4Codz10XtHcljmOT1zPLjsCfstICYbKdEAJs6WPot3ViQgqvG0X7yCU1uEhW8enlB3CKhWtes7R8xK+7v/C0pvqqq1grgtZiqX+E+YIhBGVDWIKK5XgQKpUYUu+reA2kYJvmiLkJufDh/dhnNCOwz+WjLJ/OZElGaXBqjfvy9jt4rRpKpQDzw2Ia98r9a7dJ+ruzZz+CJASEMn/0fFcg6sgz5hj4En8/mOvyIU/DbZKkCbUz2/5QWm3h/wE5lo49LlXCq9gJPHuEHdFJBBx95HYDscOACiyKTjBQEWyGfo0jKc4CHCU2Ju4rCOvNt5XFahKKafWPs5tDfMfh4GsDfU8uUGrNkPjbp518c6yEwn9PQSYxAyCOXnygFZ4WjgYe9A2mZ699YrHD5yxuwUK2qUrBhoy6T53dQwDQbWrTknAmxUWnXh9AQBsVUkp0rHGDj/Ls5OHwvy4vQSkK/uhmXkUK3M3X1Fq1bXgh7F5YI29kDxiZGM8aXBa9RsfDmEsE5CAThUElCpPqHOFzT8k0fXNxRxK4haw4VlUeM8ykYo1TDmAsCdfoJFm2O0XaWMTblrGO5ItG+QzFxF59EibpybHs3bjhh7cCza7a1S8KhztlhH0whrrBeKuoYrEM7mSM6B4XrAmD8EfWxlfiIQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qNHNbL1OYebM0zGSTrrUa8pGOEvDo6cuyDNnqFMdAWyV/qCuQKrN+zGpBI8gSjvzsZCcmqGSQSOx7Zp6Vi4MpHMYWci6K4CuvqW3NQ0J3NlaqPR4h/YZ0sUEA/AK5D6vrDOnSvvm6NpnSG3lqYDxDMw+MywdgjK/M1oZ6FnZBUDz26Z4TyaQcblMSsN84hn+1qn9HLaybE639xs2shzN6ZQ3TJHIwR9iUnbQPQMBPXdiwNqatoD6GgfKxog/a/em09+0AJXJVacpGtk5dMOw/38VRiFD1Ufxl2T9/qZVLjwGDtKU3gXTkRs33ep4kzpPjf9sH1ynhpUnb9DNm9hamYHiVyhROIFNDqqzWHAHiqxzp/MvbLrwuUHsFJ/1ENfu9Rd+KpEuyt+Cfj+T2wi9XemRKoMVoGR2Xx202Rk5AdQzIH5ofCE6qPHZE5ib75dr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:57:26.4168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8816b7b6-ec77-4363-0d47-08df17be5c15
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9161

This RFC series updates the Tegra186 ASRC driver control handling.

The main RFC point is the userspace-visible ALSA mixer control ABI
change in patch 2. The existing per-stream controls expose the software
ratio as separate integer and fractional mixer controls. This series
replaces each pair with one two-value mixer control so userspace updates
the integer and fractional parts together. That avoids programming a
transient mixed ratio to hardware, but it does require userspace that
sets ASRC software ratios to switch to the new paired controls.

Patch 1 fixes the Stream6 input-threshold control, which was using the
same stream index as Stream5 and therefore addressed the wrong lane.

Patch 2 replaces the separate integer and fractional software ratio
ALSA mixer controls with a paired two-value control per stream. This
keeps the integer/fractional ratio update atomic from userspace,
validates both values before programming hardware, serializes
ratio-source and ratio updates, refreshes the hardware lock for large
ratio jumps, and rolls back partial hardware updates on failure.

ALSA exposes one min and max range for all values in an integer-array
control, so the paired ratio controls advertise the fractional field's
full 32-bit range. The put callback validates the integer part separately
against the hardware field width.

Patch 3 caches software ratio updates while the target stream is not
active or the ASRC device is runtime suspended. Cached ratios are applied
when streams are configured and restored after runtime resume, avoiding
unsafe volatile register accesses while suspended.

Sheetal (3):
  ASoC: tegra: Fix ASRC Stream6 input threshold control
  ASoC: tegra: Update ASRC ratio controls
  ASoC: tegra: Cache ASRC ratios until streams are active

 sound/soc/tegra/tegra186_asrc.c | 513 +++++++++++++++++++++-----------
 sound/soc/tegra/tegra186_asrc.h |   5 +
 2 files changed, 347 insertions(+), 171 deletions(-)

-- 
2.43.0
