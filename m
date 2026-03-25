Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0E3AE717;
	Wed, 25 Mar 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433754; cv=fail; b=sLBaUW5K8+QgyckhvFRiaEt1crA/3Pjo5zGzyow0dHuJGUcIwW31ovURDtyxEGumVthO0pxHM0m1Yk9jGYSJLLEg0v/DPdrDx5hDSNNhspoN9xzPRRlp3ylcQ9l8HsCR2mzGUKGXoQaW9tdiGaTshZ9/ZRjzENtZPzjHZ6QKclE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433754; c=relaxed/simple;
	bh=3Dnfxik7z4WjPVYqyn3d4hLbRKINIpPjrrjQo5hq9Ds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkpmahJlOijw34pS5RaEg2HdRf2mHF7Fo8tEIXp1QrpRPb5aWxyahkg+lxdNB34zOZ/D9s35JQLZzEXIl76cZWJcRvl6/+o0AjxWV9WvHUWpNXsFLGOvH+LP2CPR0DRuzcxOUH/URDCUM9iDK5j28YJbpcQRHpIFu8b7iipf95o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VHTTQCUh; arc=fail smtp.client-ip=52.101.56.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VHTTQCUh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To8D5hktvytPtQdK9tNxb+raqRXZuZf2k8fcZX/35yj2r8fZ4g4LYe3i1iBxEG8norE4ophZDhnRm7ABIV4lAlFkdFrEEdnaX/6Z/GBEtOHzlCu026YuOrLHACo7IxuYRIOgezHPF4pI3THJ4fKoptxMJylRxiOliLb4kXPp5A2vNOKqFvd/YdRn0TZXxRaKRioxa2A2Lj+zpVe+gUAPDwSz1Kmy6zMbiTPxzWjZKbkpnVY0wDtSgMoiVFbmGrQs6Xq+xwWkx0EHKBeUFt8x8wgrI0QEFjuxeq5AN941JpchfSDjkh7+NzexCiw+XTJmkhbPImxZfKlrYNBXTiuXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP/mJYA8La5dazSOB0xQ5PYp3mW8PWoOK38ah01BkTI=;
 b=xCWE0RO6wItJPvsrEOy6TnTZIx+xRLN96yUNesvYShnx02s6mSBwFzfZ76gf3HiXyaF014bfB6mxZW0tGtHO3mUgwnh8FrWfVlgXui4KMkeINzCjYq821D46Qm3I9nJhSaUPcKQfBUqrxayl8HIdCB/OVRaWrKe5daYqEPevntUtNaaXRHuC8heyiQQDM6c9FX/640BxlvEWmeENj7dXQxQI9wIe5/hrawGdwqEthnJOs8KhfZ66kDjfiQfQSsTXyzNOCoK23VNSsGu3waRyNhvahyUxnMbHgUr0hrSMrcB8/AghWtwht/F4O9Zp2NkYhdq+177qeeRZqK4ZKXS9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP/mJYA8La5dazSOB0xQ5PYp3mW8PWoOK38ah01BkTI=;
 b=VHTTQCUhoKXMJjto5r1EFJtlCcJV6BiLzrlwtUbuLnvTKw0v7tZfbecSE+dO1xBS7mryQjjtcGQseQNHhzq1Yze9hRxPuLYH6ja2B2IWVMqOaYg1kjTHM5gF/1KyN0pG1ajlaWdVZ8yizLlxN0K+4hlJxyomSfkP+WvcT22rsHsl6DgmYptrFwayqL9WdTkVNG4zkED2addPfTsm/FCLagCTBwqB2BQt1dExdRIHbUoQwQpw/6ZLXO9PNJ5J9HW19D4zdGL3o1cMDAAS67ke8KvksVAujUePWtpI9UnO4PdhwWE/J0OHgdPM1AF/RYYZWli4dLlCMPVkdX0PH35WWA==
Received: from MN2PR06CA0003.namprd06.prod.outlook.com (2603:10b6:208:23d::8)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Wed, 25 Mar
 2026 10:15:44 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::fd) by MN2PR06CA0003.outlook.office365.com
 (2603:10b6:208:23d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 10:15:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:44 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:27 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:27 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:26 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 13/14] ASoC: tegra: Use dev_err_probe() in tegra_asoc_machine probe
Date: Wed, 25 Mar 2026 10:14:36 +0000
Message-ID: <20260325101437.3059693-14-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|DM6PR12MB4058:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ae3a8c-0d30-449d-6b4c-08de8a577a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vqgHPKiO3WSj+tRHUFC3HkMesvYkKbQTciLz/9vqZhqBjcetW+jOZfKJ53me4aiGqEbfga73wBthBHvWv/K4gx2lSsFGCYYf+gz7IIxW+0OPcqWeorjHDzFM9a/bCw/R2zxYsSJWA487qieb4JYA7XKzvXICUYubSKIsEYP1MTUPjBYb3UFt2ATNkFz19Xs+R86C0IsdO29UOGxeOqUEjoghA54ArGrO2xhlSP7qOXCli5CZx1PUHSvKi0mwpeh/OCOXw7Zc6nflw92Nkdz1SBkm0hKRNnPornO1CkrtUQMHH7faKgUqYebHKWH4IEbi9FspiPJv7j/YqyGmeMh4OS6leM1bpdPHCnoLAaKliX/CzX5gE6hnqchxv4UDFLrrErKzbUk4yn3uMiMfTGvtPIql7R0gFLWXjEAl71YMXOSTfozZ8OBD5MjZWUeqqlS+eNCyqkQsmfD4r1LggttHfFTcfkrFcHFiKL7u3ODC30dWDOiT0IAwgpmM2QTXoXjZHBf+kEfkDOZzzO175wXqiUsXcR5fLj3gB5DUMKeCMYWb06ufF7EXLLgf4XU+rte7S77p4pk11t94itM7dWgNPA8u+dYNWK1tnbrQe7MURXu7Id7ySMlrqYTvoecVX1k88BkloRhWqY1TT0Y3Vprv7S5tz/SzNvE5i1LGEdjoL5NmjrnFibTpcheoan5zFTczsP+Mkp9YvIghITl6ugOPB15lhqaf5kcOuJAtRyGZk16kkoDp0nSNk13wK8OFspQBmLEMQHi7SxIFT1t3xub3Ow==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d4C66G+eXRSaCfKI5zcKPod0eUqKkCPqU7AKSaPpf75UIPnogxwfuhLOTE1Y9SUbg14wmwU8bkCvGtGEquCEUD2GtpPf+QSjuq6wJjeR+EBKU/7Dtk5mtKnsPlto61bt6f3ro6tU5kAP9bTa1yz4LDbaTt4xokrqE1IMHSG70ROa/Rd98yYmLFszLE2IlVOP5CfB8bRb2pSTf+/wztnbEhKxpEia4V7ZSTT42VA6HvUL0Ki7KeFuaCtpxxUiookhaCOSALjqDxbNITvXtGTPGE4ozJSo1qxhnvK6ZqbNEjI00VcvlOydq4M2Itb+Xtn245afwL+vZYxNUjHoPHNN8hmeXXrwI/pnrUBYSZ0xLRIGSHCMaeKmkwdvThiYtIiF7c7faZJkSodlCP7zAwkYkXgqUxT/6Mqv13gS/GGvOkdh3gpYJICeawqvAYnS2wkA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:44.5605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ae3a8c-0d30-449d-6b4c-08de8a577a0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058

Log errors in the Tegra ASoC machine driver probe path using
dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 70 +++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 10834f9c3422..d7245a10bba1 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -431,8 +431,9 @@ static int tegra_machine_register_codec(struct device *dev, const char *name)
 		return 0;
 
 	pdev = platform_device_register_simple(name, -1, NULL, 0);
 	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+		return dev_err_probe(dev, PTR_ERR(pdev),
+				     "failed to register codec %s\n", name);
 
 	err = devm_add_action_or_reset(dev, tegra_machine_unregister_codec,
 				       pdev);
@@ -468,32 +469,38 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,hp-mute", GPIOD_OUT_HIGH);
 	machine->gpiod_hp_mute = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get hp-mute GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,hp-det", GPIOD_IN);
 	machine->gpiod_hp_det = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get hp-det GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,mic-det", GPIOD_IN);
 	machine->gpiod_mic_det = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get mic-det GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,spkr-en", GPIOD_OUT_LOW);
 	machine->gpiod_spkr_en = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get spkr-en GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,int-mic-en", GPIOD_OUT_LOW);
 	machine->gpiod_int_mic_en = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get int-mic-en GPIO\n");
 
 	gpiod = devm_gpiod_get_optional(dev, "nvidia,ext-mic-en", GPIOD_OUT_LOW);
 	machine->gpiod_ext_mic_en = gpiod;
 	if (IS_ERR(gpiod))
-		return PTR_ERR(gpiod);
+		return dev_err_probe(dev, PTR_ERR(gpiod),
+				     "failed to get ext-mic-en GPIO\n");
 
 	err = snd_soc_of_parse_card_name(card, "nvidia,model");
 	if (err)
@@ -549,22 +556,19 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 		card->driver_name = "tegra";
 
 	machine->clk_pll_a = devm_clk_get(dev, "pll_a");
-	if (IS_ERR(machine->clk_pll_a)) {
-		dev_err(dev, "Can't retrieve clk pll_a\n");
-		return PTR_ERR(machine->clk_pll_a);
-	}
+	if (IS_ERR(machine->clk_pll_a))
+		return dev_err_probe(dev, PTR_ERR(machine->clk_pll_a),
+				     "can't retrieve clk pll_a\n");
 
 	machine->clk_pll_a_out0 = devm_clk_get(dev, "pll_a_out0");
-	if (IS_ERR(machine->clk_pll_a_out0)) {
-		dev_err(dev, "Can't retrieve clk pll_a_out0\n");
-		return PTR_ERR(machine->clk_pll_a_out0);
-	}
+	if (IS_ERR(machine->clk_pll_a_out0))
+		return dev_err_probe(dev, PTR_ERR(machine->clk_pll_a_out0),
+				     "can't retrieve clk pll_a_out0\n");
 
 	machine->clk_cdev1 = devm_clk_get(dev, "mclk");
-	if (IS_ERR(machine->clk_cdev1)) {
-		dev_err(dev, "Can't retrieve clk cdev1\n");
-		return PTR_ERR(machine->clk_cdev1);
-	}
+	if (IS_ERR(machine->clk_cdev1))
+		return dev_err_probe(dev, PTR_ERR(machine->clk_cdev1),
+				     "can't retrieve clk cdev1\n");
 
 	/*
 	 * If clock parents are not set in DT, configure here to use clk_out_1
@@ -578,26 +582,22 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 		dev_warn(dev, "Please update DT to use assigned-clock-parents\n");
 
 		clk_extern1 = devm_clk_get(dev, "extern1");
-		if (IS_ERR(clk_extern1)) {
-			dev_err(dev, "Can't retrieve clk extern1\n");
-			return PTR_ERR(clk_extern1);
-		}
+		if (IS_ERR(clk_extern1))
+			return dev_err_probe(dev, PTR_ERR(clk_extern1),
+					     "can't retrieve clk extern1\n");
 
 		err = clk_set_parent(clk_extern1, machine->clk_pll_a_out0);
-		if (err < 0) {
-			dev_err(dev, "Set parent failed for clk extern1\n");
-			return err;
-		}
+		if (err < 0)
+			return dev_err_probe(dev, err,
+					     "set parent failed for clk extern1\n");
 
 		clk_out_1 = devm_clk_get(dev, "pmc_clk_out_1");
-		if (IS_ERR(clk_out_1)) {
-			dev_err(dev, "Can't retrieve pmc_clk_out_1\n");
-			return PTR_ERR(clk_out_1);
-		}
+		if (IS_ERR(clk_out_1))
+			return dev_err_probe(dev, PTR_ERR(clk_out_1),
+					     "can't retrieve pmc_clk_out_1\n");
 
 		err = clk_set_parent(clk_out_1, clk_extern1);
-		if (err < 0) {
-			dev_err(dev, "Set parent failed for pmc_clk_out_1\n");
-			return err;
-		}
+		if (err < 0)
+			return dev_err_probe(dev, err,
+					     "set parent failed for pmc_clk_out_1\n");
 
-- 
2.17.1

