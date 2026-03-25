Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010033.outbound.protection.outlook.com [40.93.198.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC903B0ADD;
	Wed, 25 Mar 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433754; cv=fail; b=s8EVQDSAYbE6+qlBDsb07Uf9kWbhQN/NFvxr7rHi7wyNTwPrwp62jP3eAz1G0qrLZjhaOjCq6wDwKyP0aaNB/jmtUZobaSDZ35wjLvbzCV7o9w/14O0oKnDH0LIGy5//EORwVtmHZ+wxudFT2rVsY6EgRLFkjO7/QkZgJpgWKI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433754; c=relaxed/simple;
	bh=RCf+AN7Da7wBvEwVe98A8XUjukJIyCBwE1N/qbIdGts=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGx2+P6kqdYgqEYFegMnP3EMHTe6CiC1oJB9TQLijj+M/cMjD7b09O02VDBKmJGYelh78uGqiOo9xUecD2QT5AfjsgAPhMC0CV3VaTX2QLVaMhwZiDYxcw0ErQ2PITJg9f2vqtpHKROJRxLatKDwF4yX0zt6ppcwcdgOY28a4fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g42x3ikF; arc=fail smtp.client-ip=40.93.198.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g42x3ikF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrXrTbUACEHo4irDy21WbW6G1UwGDw6G/FNibHU7SybCBIxNTE4a0ZKEjouJSb6ApuJ2yt2ijMicTYDzyJ+9pZlBerhNUj0hOze34KQES7aMIeVhIXiMzNUq/AcTqD8S1dyK8vLzMiXsLoOgTS/4XsZbaarwqZ546OlaBDZbq/rdIpNBuQcvhm0mMY3sfkuENOvxh7oJP7Jj+pZLePfryNsvdtIWV4eDu7wIXYU3T9TPoHXmmlelYUYdtdq+WCf0CGuZk6LCh2NwjYJh1hymHkXPPnr7ueIn6nhqww27TZkju3KRI7J4csXuHu2UEViDiUxuAeqS/czvZN5co3zSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6A4uPPWL+Qq3yC9xKawQOQ+z/7tXUdsF9txGaNcbTA=;
 b=j488nC2GpMweLJxSRJqhS2MsFd6HhiVyzdJ1WKmRbG4ChYvEIra9Xv5BMOlgmxHUB7sJJChJFgXPPZdoSNwNSsTW31Hr9dt7JoKqMXfwoEISS5EBskIUvPrQtjhq4PxEwWHoqsOWkMJgN9m5QBB+TgJlUH3B5usDpHD/Jc2aJt8FCRd7Yaw1z4vNZGpeDxOspC1ynC6e2ah5MlHf+D4lcKd9pjqkHN4u2o0LAkpEGin5+y2qnAw6jWetnoRfz2Cai9RGE7LNvBQa+0uAHhubtbm2BVVXA5/XiJ+878S7bX8gFQe8tXJyGo6rN+CRCrMQmBBYPgtJc7jH46dKwG7z8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6A4uPPWL+Qq3yC9xKawQOQ+z/7tXUdsF9txGaNcbTA=;
 b=g42x3ikFTpQl+2Yq7BdrE3QVLf45AbAwEk/3+FurugCKpyQ5GkvEEEBpPJOc34DBFBessX+pEkgJ07jI4bkwgVe/0lgOvH6qfPfXAY+KhW1Lwy107H5CRdmU7h2kDB2rhAECPCPn+W5ivjeyaRwUZTzagJh+b8ErIow0BvxNGXWXwFstH4VoZyeA7xyLQq/HHTtVpLS9h/fEWkmw8hf0k9A6oaGBxCwHj7M5mvBotuw8cvkt7YfPLHK9PAI2kUZX5kUclVnaM/OYUrUy+TSaUAIWmc5vAV/qOKgtqUewvvxprLD5WHRXe/bErnva1do3RvuwDYui+kKksslCzvdLGQ==
Received: from MN2PR06CA0030.namprd06.prod.outlook.com (2603:10b6:208:23d::35)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:15:43 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::43) by MN2PR06CA0030.outlook.office365.com
 (2603:10b6:208:23d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 10:15:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:43 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:26 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:26 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:25 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 12/14] ASoC: tegra: Use dev_err_probe() in tegra210_sfc probe
Date: Wed, 25 Mar 2026 10:14:35 +0000
Message-ID: <20260325101437.3059693-13-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 782baad1-cf32-4b7e-f30f-08de8a57793e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dZC7JSmmO64u0AXkikvks9qoJLXPbQHIptAQjCXytA9OmBUMW14GrYRRwES2lr4zbOUQl2rvtDXR1LbVOsAuRPhVkj1sXWJrAGUz8Op6sO2qYdV+WV0JFE/Cs6iCoGC/tU9D+x2MhJ/cOejxw/B3P0ScHF1l6mlL8CgckBWlBWkXFQKMF3MRG077C54mg2SVEyF5P2emb9o3vtlbeDqVteMOsrygfqyXVeeGkw2GiJ2sO02Ho0N5p7B0NcKQFIJxxocw/MYCfcH1RJ33sEjV9LFyP+tV6RQC+nhV6VszjAVijq8MND8F9fQO8pUrzVbpwxJ14F8g2qdHJKspq4vLytCo8JEkC+500mShR4An81xT+D7SU1HWtW8cRn7oTTrdWBW1EKGxqjdoohKfsrX8AFdMR3JpZGGiSEtJWq7CWgJEPPEQJoaKacCSFNsszqhGSTl1UnQNsY4b7M9Yq89/As0yJfN5EJESF/HsEfa2+gIrI1uN2N7ivJyxKWhtjcS/KLTeNeAT9unHQ+W5MUJfObUAGOwDnohWfYSBH/TA3/pR5WpD+gbBlkAxixRH0UNqTzOP0/9YmmghQy6zQV1wC+DUuTwprNuM4CbgfV1coXE9EuxDk20p1OQxPb1LIjPA1c/Q3c3qy8KQAhJPYQ0PTWV5eE5nZtzWTtOBK/Gs2nIUZv8Bnz+QeoLKtoRBNq138IA2tg+HfyRbMCvnv7M214okdE0nCYexmV0FS004oUfQX2Eo1ShfKSN0EVmc5Z7pTk9RJsrLw9h/FRYgzNXUDA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+I8j26Wg6OhHqvKsNVfGjHzbfowwIxtdXUS8fH5vKsY/QQXH5Msck8/m7icmZ4RsNNRphoXxcTaYqlgS3QikkOy5BYz9Mhmjy2+JONy7LnANwDvPtUAb64tkASrDpB1747wadHfai/Syd5pNeJPrVBk4+8zSPAWE91i43+2AU0JJa3eluis8urrffXAjroVhVHC+YNII3b3o27jxWn3HJKd+nwVmaHFqVXUtySTmc1tJV2yLPZRN+R8vQPY7dZmY7j0/k0B5a7kOLd1s4Okp2iCBdZlhcgvhogLyYWH6zOEr6vyLeeU11d1RBP/NZKBaS4Q4Ebwc1rBqMbBShQApgTQ9bJe3ukjDPb9BOl5HQC21pgIQQ07O5EJueUAJRG27byQ9SLACqMWNNReci5crDdTiSG2+rgi7UNjHpx5UFVPJb1yyycNf09VVCNRiizy4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:43.2106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 782baad1-cf32-4b7e-f30f-08de8a57793e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6085

Log errors in the Tegra210 SFC probe path using dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_sfc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index b298bf0421b1..0f342fae058f 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3608,10 +3608,9 @@ static int tegra210_sfc_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_sfc_cmpnt,
 					      tegra210_sfc_dais,
 					      ARRAY_SIZE(tegra210_sfc_dais));
-	if (err) {
-		dev_err(dev, "can't register SFC component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register SFC component\n");
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.17.1

