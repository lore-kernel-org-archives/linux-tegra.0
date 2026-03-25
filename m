Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E139DBC0;
	Wed, 25 Mar 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433744; cv=fail; b=UG0U7AZs0InSQtZ+sO/6DameNhih0fb7VjwvTuOwEMWOI/g/fVP5pH5aZGy2QIhaugd6wiuV+1Ap+2/WfeTl0rTgOayJhFh5IKdnvzPD8uR1F1tGxX1WL/XftjP6JxxYoy4sxDj5xYgnMdFjwF6upAcvZDYTPZ30Q8+FAiwpW4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433744; c=relaxed/simple;
	bh=G7AhijhD0q6OOWRO5gWIUDGBTw9NEBjvY9auk6dudSY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ew1AcWoVniShwe6CPcqIbMZs1fqCimwtXuqIHjMLAL++QmJU1ewQ6yO9BGziI6AAB0SPYtgs9fxyIfa4Vz7CiXVAOvfOqDNnWttXeq+5rLJZgNx7cc5SA/OICSBEIN0kv0Efqxn2qfbzsRGRv4H9xHf409F/IKgkwUgZvLb0A+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DKAhz2jF; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DKAhz2jF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZSWP0YHOkVi0z9Gcy3tIPWQ9ikMZerY5vGgMJRJHZFMhaOUTKUSfNZnaYaZKj9REjlh+H7AHP34UX6/vvH70VqibCxs/ES3kvTgeJFp3Te7DpeJeukEkdUn4vpcnBN6VM6/9GvxzreCq2stXWeLRm7sb+NyK0sjfCSay3QkIZKu7uswGTjqVal9bdb1NCCCBVteHH+axltMol9/jmY8k+qOtyKdd9BF3SiZf7GKxE4JbmOfGzgnE5TFG8NNaCH10rcim1i2X2Oj80Xy/iLriEFdy76IINy6uNSH1IhU7PEJfbUisHralS4q+yHZnZvyUJDXWVD9Jegzd8iArYRsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMnGmS0HCMjRP2HhtDMiezX11p9ZCg3sxc+q8fGzVIE=;
 b=VPZaK0siraUNfsbzhu+TNAyH50IhLgXUzEH6ox/ym3w0FfO49AxhjtbtcM83+kBHQOQeYr58xi17com3aB/mf+K8xfd4apMC6E17c/HkdTX+qJRb9WXtn6UrEX7OIokxstXboeD/HXGoQt8nVwOc1BPpeALxfV22a7WzAzDeEwrvxvqCoxPG57orCQ/wS5wRByAQcZALLLDn2pIVpl7gZNfoer7o+pK6qZ64ZxXfzXPEWJG9tHc6jGXrXKQX83djSwPPziiz2ibyDmakWP5eujzwksERhkzOBX8VYAZYT13eCHs3qnd8CqLcqX4CGUGJ9CxpeycJiOrd9lqlr7xOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMnGmS0HCMjRP2HhtDMiezX11p9ZCg3sxc+q8fGzVIE=;
 b=DKAhz2jFfzBMpmzkCN4E9BoQdjQM3Mv1Mxcl5Nwx+VbbSiuJIuPIcZvG8IhO8A7INpzq/qqBhqSxel+yYvS3ycBuW8hhlayLgqLicmr1hZ8L2J1LTgcXX1ipw7HF+ioW0V5p/C6rgpyUtuj1L+QerilftiSnx+V7dgP3m09fFgdE8q1byaSAMq31aQE8K9G06BVHIMc945eBU4dH1LpqjiCApHpkFP7q/n6AijTq/odKBB16DjVi1qOrBMj9UPBNzhTxN/Pyz95btLrRK6wVFjq+y68x8SF7Ntba/ik8WrzgLPNxvCLOnaI8TEBav6H9iw7Y0o6Gn9oSaTl8HH0C0Q==
Received: from MN2PR06CA0017.namprd06.prod.outlook.com (2603:10b6:208:23d::22)
 by CH1PPFC908D89D1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::623) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 25 Mar
 2026 10:15:37 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::a) by MN2PR06CA0017.outlook.office365.com
 (2603:10b6:208:23d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 10:15:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:24 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:24 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:23 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 09/14] ASoC: tegra: Use dev_err_probe() in OPE, PEQ and MBDRC drivers
Date: Wed, 25 Mar 2026 10:14:32 +0000
Message-ID: <20260325101437.3059693-10-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|CH1PPFC908D89D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0130c6-2a7d-4c47-f554-08de8a5775b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LcSDtlPShprDzY2UxDVLVTkmKu1lmOlbzjvoHUzwxr1IWqW/k7U/mX6wH6OUy4pXLLgOvO7vEv8K1Y/yWI12QE9yVodDlcGWU5v2XxXFumrBp1QWxy5JG6700T/o8pAoggW8pvAPX4FMBPdIiJi9x1dNC2oaoyq539pG7v4f8yAnJg/Fbqdg6qPU90fyALpXSwF87YnTUJ+5WtRysh5VJYLw10eNuAlZUiPs09f1I3oVkur9rfQv4PFaQa7QYxCIGOJ4A1dzFTmhF6PNxekZ/ICU8uMPQsIavZznFSWLW2bpftKo1RoG/P5fdSyfYOz+nXxJn0wQfZ1KEP3PeVggt2adVO4fb5tprT4FPcJB0OVaqGYyqaAljob5uEsj6EpDNYm4Tur8B585s2o6r4TKR82xoK9IclmxTPKD8BfGUlwwUcLJRToIt80qYtYjkL4NKht3Goz5dLwnrUZ4lA8GdoXNhk4KznHx8ZohN7dN35p3KLqI5LgCD1FlNRUfZd3TNkpDgFv357aIfaUzJNdOXxW1mb8PjXsjMshtmUDKuYgT+Y/Y7+H6QeIOK3BWqjaCL9MgCuDsBJD9A+JFaYkBcMAuahnuqjl6bRpz0Ax/1AvZ8GCGxHmvT07haHOMIz88h8Oiul43oTf270X4q9KUhMv82NUURVJLXYPoasIQMRUg8DzdfJDMBmYLPWflNIIzx1PpoeTeT4l+VCMntwEI89xJGxqHrZEWjJfbkd6a7m5uu7KbZzxKc+ohtIS2389UtDV89Cej6Aym4iZPk9rEYQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+T4oTBfAeTtQYJ8D5OlfkkBowUfdTPBsoz/DQvxXBJcCzj5/2a5QCC26c1pUFv2rBK3qeGt12TpmgcqCRvq4GrMSaiP8GJ5t9uPq+MnwU6Duw1MyyD5+mfBvVmII9S8ekm6kKwTLaUc95CUqzRWFniz1CV29BL4/5WII8Mf/OhKEQMAp+pgVEQLXtFrdthQ5m4+LrIOD8XUvN6/H4+Y4XjLGi83rCT+y0CQ5nmf1I3G4e3e2YtojU0CDoiRy+tfq6H8pgb1rMkI3wAYWY4W+0E7F1j763LegkHjNnnx6DrBJpTSGcpgu93gNm1018wiBMYGch/gfrRZ+laLkq6A7axZxrGnAZkH/Xb8mnR29AKdXwel/gGJEy4QSClh7hFOz50KM7jNPlQoSh/bkOxLw+8XCMD3Z7wzvTkv/ujkOnYAAHNj2RCbgyZxiw2AOBut+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:37.3029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0130c6-2a7d-4c47-f554-08de8a5775b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC908D89D1

Log errors in the Tegra210 OPE, PEQ and MBDRC probe paths using
dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_mbdrc.c | 10 +++++-----
 sound/soc/tegra/tegra210_ope.c   | 19 ++++++++-----------
 sound/soc/tegra/tegra210_peq.c   | 10 +++++-----
 3 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index 6a268dbb7197..558b7a21b0be 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -987,8 +987,9 @@ int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
 	int err;
 
 	child = of_get_child_by_name(dev->of_node, "dynamic-range-compressor");
 	if (!child)
-		return -ENODEV;
+		return dev_err_probe(dev, -ENODEV,
+				     "missing 'dynamic-range-compressor' DT child node\n");
 
 	err = of_address_to_resource(child, 0, &mem);
 	of_node_put(child);
@@ -1004,7 +1005,6 @@ int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
 	ope->mbdrc_regmap = devm_regmap_init_mmio(dev, regs,
 						  &tegra210_mbdrc_regmap_cfg);
-	if (IS_ERR(ope->mbdrc_regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(ope->mbdrc_regmap);
-	}
+	if (IS_ERR(ope->mbdrc_regmap))
+		return dev_err_probe(dev, PTR_ERR(ope->mbdrc_regmap),
+				     "MBDRC regmap init failed\n");
 
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index a440888dcdbd..e311de41a078 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -329,23 +329,18 @@ static int tegra210_ope_probe(struct platform_device *pdev)
 
 	err = tegra210_peq_regmap_init(pdev);
-	if (err < 0) {
-		dev_err(dev, "PEQ init failed\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "PEQ init failed\n");
 
 	err = tegra210_mbdrc_regmap_init(pdev);
-	if (err < 0) {
-		dev_err(dev, "MBDRC init failed\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "MBDRC init failed\n");
 
 	err = devm_snd_soc_register_component(dev, &tegra210_ope_cmpnt,
 					      tegra210_ope_dais,
 					      ARRAY_SIZE(tegra210_ope_dais));
-	if (err) {
-		dev_err(dev, "can't register OPE component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register OPE component\n");
 
 	pm_runtime_enable(dev);
 
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
index 2f72e9d541dc..4b692c2055bc 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -407,8 +407,9 @@ int tegra210_peq_regmap_init(struct platform_device *pdev)
 	int err;
 
 	child = of_get_child_by_name(dev->of_node, "equalizer");
 	if (!child)
-		return -ENODEV;
+		return dev_err_probe(dev, -ENODEV,
+				     "missing 'equalizer' DT child node\n");
 
 	err = of_address_to_resource(child, 0, &mem);
 	of_node_put(child);
@@ -424,7 +425,6 @@ int tegra210_peq_regmap_init(struct platform_device *pdev)
 	ope->peq_regmap = devm_regmap_init_mmio(dev, regs,
 						&tegra210_peq_regmap_config);
-	if (IS_ERR(ope->peq_regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(ope->peq_regmap);
-	}
+	if (IS_ERR(ope->peq_regmap))
+		return dev_err_probe(dev, PTR_ERR(ope->peq_regmap),
+				     "PEQ regmap init failed\n");
 
-- 
2.17.1

