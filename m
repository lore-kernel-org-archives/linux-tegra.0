Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79623B3BF2;
	Wed, 25 Mar 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433756; cv=fail; b=JKuHs4LbEUPrb44xxBq7XtKqImAfSGCn6OMFityonT4nV5TiOcIe0G7l8Y+Kx0CT1gnGPXG6S+DMMW5T6e3u/CNmzYltw/JZtXMqocSl1Lc0fOkGt7onx2IbE0j1s9+RB4yGkeDNBn7IaoLZYWcaXYLD0f3x1iZCeFt7zNkF1+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433756; c=relaxed/simple;
	bh=vS6Y7vQPoladsFUZElm/IexBq8bbE9XaJweBcQ2SBj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJDi75vC9IozZFSWUmQQP/ORFoVxQT6PpKieMGcHaFnzRe6qL3Y3TeB+mrG5lZBy1Y7Wt1nIxDVjaQiv5BnRwDobSz3aZ3QKpbriGTF0TqH3aJUcO2NWsE7Fd2uMDYIj9S3Cz9ssw62dsbxW7WTJ9FSBqCc4u3h8bfJY+4WS3G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i/rumNY7; arc=fail smtp.client-ip=40.107.208.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i/rumNY7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bx38b3nplDRxERyvpf8pSIs4d9wH1OZtx8oILsF+C3a4uP+JndalE2LgKtoBSukVzxxonYzbDrywvwmcADEZcWTy7RkRjXwvi96wyXfaM8dsXcdg5A6Q9qGVfteFci6lm/bl8Curxg7v74FuMMblfRNA/fJnkxw9nQktuIwCGpmdQT6H/R19wJK5/unpoWkfnHU5IAH/2DfDUxk1PQLh+OQ/WEYIHTprv7TSPvFInLJOi/PXZZ7C5vwmC9gTQqPyb4Jk9m1q8R3hLVtCRvs5Z6EoB8gAznN7puB7RN+/6W9Ukd5yW98zJ2iaUIASTFGfLhWJVuEABccAUPEJvtt+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcKmorGDiu1PyIyeq630492Vx6l2sQxtmfcJ1QQkw0I=;
 b=YWE8Us23TEfbo/ycIcKT2LknsVrMIMwOpLgGKmlfm6HsgoTBqANlEmJkcXgb50u4+k9khG6Y/orHAARqXR0kuuVHRcsovFnCYdYR6Twj0EZ+91NzCiSaydes3ekaE+kWSvAlp1wPJTLqk0fmpfSBlQyHxCbr2qzV5b9b3HK3wFkt7uy4vru0erO/Vt2ENd4VEbR+z2AW4RbQR1QBzimm0rMt+HL0u2hTVC+b2tAupqFXNA8Mn5jU02PbMcYpLcU8L4nrv2jyOxLh3n6TExGUJCFPh2/f65uojmmqNTsueyBA4tsEZB5Eluv5TZFSBGJvBN1kcU4dmY0R1kCenWGWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcKmorGDiu1PyIyeq630492Vx6l2sQxtmfcJ1QQkw0I=;
 b=i/rumNY7cnoUiC7fYp7o64bbdPqmj+G7Yes2Ts4K8dFckNOvxY3p8yrM431vnMlXoutMtao5yx6Ao9WBR6O/k2EfbyfCiNNZAgK4L7SKs1xFCe3vZLV13SLtrxyW7t+A8VTGObuHGo2Y+vYU8THAkQ0SkboB5EXOupEDGK6m8I6H2BV7IsHF3jmKSdCenCRu0f/dkkL+MH4xaWQfG8KiBxRRO3dxKvtgZvsJYRi+sBWAcbbREurCn3hMLgb52em8BNrzmqVBmKboBGj6M/DhZzay/irxa30RRpESxFOR8BnM7+1aVOg96KKYxmM2oR7ljH/HWoq1laTgM8+HOcCBHw==
Received: from CH5P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::18)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 10:15:35 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::4f) by CH5P222CA0022.outlook.office365.com
 (2603:10b6:610:1ee::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 10:15:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:35 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:22 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:21 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:21 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 06/14] ASoC: tegra: Add error logging in tegra210_amx driver
Date: Wed, 25 Mar 2026 10:14:29 +0000
Message-ID: <20260325101437.3059693-7-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260325101437.3059693-1-sheetal@nvidia.com>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e594538-e7e5-4b64-523b-08de8a577464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CE+Y2VdOLN4ubp6G2d26B4qrAKOx93ZCv+B+YN3sOhhTI8JROfzpUACvtyrpJcwomR54JXzkaFup2RbmHli6Bw3oEtNEnUWSOuhju3JGLkGfcHVx0H+SqgRhlg/Y77QGwaR+7T5StyTguFcQRbehSldqlwgSkGROQohS1jjL7qsokIKUpHQRM1SOUki3oMHsxoct+RgFBPiK+FsUKuwm3jDj8e379TtAz2grdty2QbS3zNyqrrjUN/aKCIT46R072DBn80R47ngcU2+Ug7WGcYf4l2iaCQIjfvDLU46EMrHZYcD5MWKYY1/jKZc2HixFN+qsTWuEorQ3qb1FyqUnDhQ3YLymsS3bofrQeDSDXjAe14uueE8KCdK3ctg3/pOtkVBKNSlXTHL7YiwTAA1/1ay7H8e8MInGCeKLZOHnY2YvRVaETxqIUZdmWE0dF3Du5lIHO4DuEDZoWy2084639+ualU1GKLRrJzJdaKRp9LKXpkHUKFHRsXmGFpWrqkC8mRMg9n2P1swvtJOBhXpMXWNpuabmMCGSBeUygbVQdnbdlGHFadswzFHbDpABu4MLFNBeEqpGA+KOnSBc6uW3iF619YXv21L0WftACdiXA+zxFswSi1rcrp+qrWfQfQAyTHOpLtcKE29dOlCnsuoLbmOyMMDGuSxDtmmYc0Mha85NCK8xImPgZy0JKyfPqfkq0wVZf2E3ABhJ7Y3hT3RkS3bvqnpL/ABel9xZ/XQn2jGl/pnNeAYlBVT+2+/E3iO8ZDGY/WzbARaKjHzc/Mccng==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	25fTmEUN7aEtT7ZQ5prMeuM3fYv2kmRzI+pERRKFzuZxleTQwSk0WG07vZ2cpsLpDtULR9ubLBzxj4ZRf6BZWnrgwTYNAzQg7NSZDn7J8fSR7ZqHVlsb2qzyPEe0dZYEauGS4eNz5LnLuR5iOCY8OrqffLSEHcipWehJfAKr2jH4sLpA5fEPzgj4inIlwVbyil2AUCzXrv+2T/55xrEFJLxVL/dtnz2YwGKHNHytouuTxkkN3m6HDhE+ZNDbRMKFnGl1kGOLRgix88oChKlKnQNUjA/x3DnF//GUWfgL8PUHLo0qQZjIKLevHunCg1YorsuvxfN5n18SFczeN9ZX3975LWioGmrSk2SE7yxQwVsj/8LZdKmRA30Lh9+DzV+mVgzs573QXjVuI5IUFyoNK5oVtbasKMbb8Yasm6IoMmta5v3dJXQ7vl4ZjfHGpp6O
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:35.1250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e594538-e7e5-4b64-523b-08de8a577464
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863

Log errors in the Tegra210 AMX probe and set_audio_cif paths.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_amx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index bfda82505298..1b7fb84a0f34 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -163,6 +163,8 @@ static int tegra210_amx_set_audio_cif(struct snd_soc_dai *dai,
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
 	default:
+		dev_err(dai->dev, "unsupported format: %d\n",
+			params_format(params));
 		return -EINVAL;
 	}
 
@@ -767,10 +769,9 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_amx_cmpnt,
 					      tegra210_amx_dais,
 					      ARRAY_SIZE(tegra210_amx_dais));
-	if (err) {
-		dev_err(dev, "can't register AMX component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register AMX component\n");
 
 	pm_runtime_enable(dev);
 
-- 
2.17.1

