Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4383939DF;
	Wed, 25 Mar 2026 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433736; cv=fail; b=ODaaV1C24O052hAoGqFwDwbCUyNEfGlaT3Pb/tP/JncaWkQXubzprlQDyneNybCKYw+bXAPZcw55hW9hACxRpPeKHx/WkRwiDpDMmCGEwRyGsQ8f2FxdR2DmNyjUVQF7QYpyud/Q5TLPS3vLdefgdEBcP8Ib8M/90HNyClMpHTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433736; c=relaxed/simple;
	bh=BVcu4XeS2adqAYC+TkK5obcyShwq3MYrHkZvJ9hqTy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=myPSj4H0CcsCPsXrxjDRWK81E+IUlugsWWplxlUUBPQ7BCwq/46O/JCJ9JcX5kn8056JJoRSvGF+ShSTofx1N0xlvOJGIooVl0LHp9P5vhyqMoVC+XXoNSJErcoptLR4nNcHOJJiDnGJNF/JiOOO5E4GH2lQJjR+ff9o3RQ6KeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XdyWOOjO; arc=fail smtp.client-ip=40.93.196.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XdyWOOjO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdjfnpjYzSWCL75IBEAxm7f3Nmt29RSKAFciWr99cL2FHoaoN/siL0gwv6VZnvag3W8wvDoCuud8S5QtTWK5va57xd5h5WCrcT8J00WAWFQ6MzDpH5cSu4aa+YCg9mIA/gq1k+76cTE8QP63qmpk16FABFOcqnlI07koF1ZAmdJ6ePHxITmVcPQyKQiI/T8R0s9uDgoO2tPNXBGn6zPQ36ZWbnFGsKUu/WUa07/iVyneT45wz4tTQszFhloR8zeOLXAlrbOP8Zmv9nTZfkhCSExn5FUQ+UvUrrTHMU63jH5B9yK1xxSFdGMZUgda/biblGL6tBsuLppgc/QhCin8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9neJbdjG4q2jXrRYpmayht7I2Ldg06z6XulOtaFF6oM=;
 b=eOHSqQ/9xtBuz48+Q+fyhvZzatwcYR0fsKGDpAUotsKKAJtvCYsTEpcOTtvnXKzkyH7sC9c/hBrg4z7BYSSqihZItWWChADjsNgv2v0da4/6oFq8aCuxoi1yqWAohaLw1F1Zf0p37TOEWcGS2YGMR8HVttK6Aq642T4XO371PES6vDKDtxZa3drG2k+VOMs3u5coPhkYzWJ9vwpxcYU2WC0y4EZPL2htTEEb4cIVPQNbfoUCfgX5w9YVD+4mbZJSWnsfHXlJ/WdWxEd03Xp5FgSMY23IDNRxk2ejW0RuFdS2RjPe/hOhEF7qxWa9MqXrGwCBzCDnzw0GsuYIgyu4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9neJbdjG4q2jXrRYpmayht7I2Ldg06z6XulOtaFF6oM=;
 b=XdyWOOjOfJpMZy4E75Eh+h7S7Uc7zXXPngE/DDNr/SDIL6E+5dlaGKc3QmsYSy331YjvknQePO91HZN0TAuhb2lWpLKWRFeAaEQLzU4+UCYi6BAFFSlFiVwW+sI3GykXAaMR49mLIokO9HM4e1K12cJnKMvPQn6htzD60YBvA1jmtip4WkqVkXuW+SNpRCw0DgY8CaMJLri8WFVNoI65LKo5q9rpIaoEMP30JR7NlZpMrOH99+3vTyyD3jfLbY40vUPnSvuw2XoIrZpIhrHIAOBmD3qP7o0JeoYzeDwmXuzLyk6jZgcNnAbaLu2LhzsiV81dNNPw6aW0OTrALDn/BA==
Received: from CH5P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::23)
 by PH7PR12MB6396.namprd12.prod.outlook.com (2603:10b6:510:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 25 Mar
 2026 10:15:30 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::76) by CH5P222CA0016.outlook.office365.com
 (2603:10b6:610:1ee::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 10:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:18 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:17 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:17 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 01/14] ASoC: tegra: Use dev_err_probe() in tegra186_asrc probe
Date: Wed, 25 Mar 2026 10:14:24 +0000
Message-ID: <20260325101437.3059693-2-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH7PR12MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 800feaaa-e5a2-4c94-a3df-08de8a57715f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	F3uXZNDWd0dntjA5i3CZ1lYuoMEnfOVEvtRjw8TPhSYx5xohis+WDqRzEQ319aS+zu27b5cIkns3Q4vq+sEbT31zcnTRla03zyeKGhh6HxG1AnOZKPDVKA2G+4PTTOCV6KJ5AmP4kqFSz5dRLSr73cz53CJiT6VDQOWuMo5jdPyHFHPDB0u1vLVaq4bE+8hkRd49R2Y5FZxPVxwF5lGD/JMVitginBatU7JIC58ITT1ZEbCv/9+C7WlYJj0043CZooTYU1EsiBfQfkB26UkBGF8fF9LlQJtcDydeJZKQpIxNfeVbXxyexepZhyPFqjUE0Z9NKKH1dK6u+k5nbTDdbW6fCrwLJ1xp47RrBqKYjfj6oxRkTeP2ZNEQIjeZqKjbNZOoDaxU/Qp1PMC5ChzI/mdoJ27Skios5DMVqTEMgfh8MsQDlwnwpgS0W5HzhwW8+qbTUnuM5qRXDI+9JbechhXIXQNtr45mqnJsHo2rjbGmsEO3OE4pDgjefjZcRedRhpbbPqfA2I9pERQI0aqv+BpcGQ2uk2dt1LkSLe2RL+LjoPoSiIqyY2FT+sE2qeWsXoJMsn80lKtQqL46gYeuO5TTUkKlhXLlhVUn6Ld8tOyajy98MqEd4xaCXYcEk+jHTXR1pXIXGbNoV/fLkNsYMAn+2ICAaX6KyRUb7I7CDzYrcC9Hpw8G1VmQ7VA0jWMNKwZsc4ISUUXhUg8EtneoSk4jujTduoi5YYYpZxCj+IdTaVjM8PqKHZeK7qFBBRBPLpVE4glYe+yhW6jfZg+P/Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	POKzURpvPUHsenQ7WxY8YGWPBXB32LIEOg+oc2huAi5544Lor0BHz0Y67HcSL1swflczJM0OcmKUo6IUtEGsVqnpywO7NSraDa4wmkvtN7GNY9YkIh3qmFnBr6zqPrJUZcy/erwNhUoydAIxjHLX9lj+/XFwM6Lyal/ctr/vY8SM/TChvaAOF/TLHlpcSmMkZu2DZTJxtC94QcjrSFOz1vUqN5wxqgvsnRYlF8LUSy987E9w2e0kwahEdbdRis8Vd/wVUyXEdpZ0PYb1JfwD64Znf1UGqRPsVpWMb0eYD+QFrHWNBf1+IhUMJmcxGtGBuGGJeNpPUL4FnhC6gaGZY4HdYP6RnYTWjKenQ/g+2S/+YfML6Lt8L3Q9xajDFne/MzHfBy7hDhmFCCDCgDUwySdDsQS1IphI2mUvts2pMrn49nqqWoWuEHZFRLKc9I4x
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:30.0504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 800feaaa-e5a2-4c94-a3df-08de8a57715f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6396

Log errors in the Tegra186 ASRC probe path using dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index d2a5ec7c54cc..98e911e2ed74 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -1016,10 +1016,9 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra186_asrc_cmpnt,
 					      tegra186_asrc_dais,
 					      ARRAY_SIZE(tegra186_asrc_dais));
-	if (err) {
-		dev_err(dev, "can't register ASRC component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register ASRC component\n");
 
 	pm_runtime_enable(dev);
 
-- 
2.17.1

