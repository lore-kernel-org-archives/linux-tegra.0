Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E9A39656F;
	Wed, 25 Mar 2026 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433737; cv=fail; b=lczfZVtiKTHqzgkIioA5lRbeMKkAQkMWLUtrPflu5FnrlACBQjjw/DFhUW5MVVy1jMo40OHIF9RWBXK60Ki+9yE+e8I+5Irf/CwUPrWZNO3m3+8DiYTfsgcMOmQgUuVnzuTgGxzsT6fGI3DmdpsGilYzKxfebOTBnYrE2OtxlBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433737; c=relaxed/simple;
	bh=p8G7Z/Y7b3okOKO2r2VlKuUlq/bFTJCgH4XIJ8Pn4ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unM7V6ycIOyvsnViq+mpKQD1L1WX1sTUZ1nTa2o48O3Dhhkx4toNSm9tOU9pOHl0iPXGJdWSd9Df8JbT9tfijPoIbQHzkJveaXYAUGUffsv7P6BqWh2nfTjrH9CzwM2MYFLQAI+EwKGT+FF59nobp+5Msq7qST5zeOz/ohnDkic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rfl35ShW; arc=fail smtp.client-ip=52.101.48.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rfl35ShW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5ECPuu3FRbmzuADMZnaRDWZIHktidYnOGRh8Gaj7uoZsbpbZecEhPTdHgabO2ktou72I4PDj7cffVGfbB8JBHO0RGQLPJDbYC7H8XkljGVV5VWy/V71FDmQv5sDgxkHybhB2lThprmHcTo+OgFIdshfLthWhpw5BKSUKEi/T9SmAa48h/6833tAwetqlaTixgqxvFXJG/LJJ3M8YRG0x5qTFsCe/aGkJXe9KUW0Zy51jAIGf7aHzMnsWPV0Bf4e4wNTq0SXR4qI+9gaUGM5g9a53ggd9XGlmqQcEPKg5vk1Z+oyfgPdKxzn+x91jK0w2QsD730NOCbsTM1KNvQjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2QAUtnIImJNY1uHeeJcmrEIduHLf7AdiQ51ygxQEEI=;
 b=WbCupp/sOWoBo60/bUzQFtJ1h0gWKpedvEZwzPNLuvA4MhrDv3JmYxYfX/9upXsM6wGHGtWBO0m//Mb0NeVoBOxxesV1Mi8Nfu+tMXUmaJsnoV7XDNDXF4+T7zs2MoQP9cDZFSo+ZX7z1pZ3FUgtauFNSTX6WnFSCMZKiOPCxsOo9NI83lSvFYOId+Fa4qMpUl07dkELX6gJriaM2Xs1qJ2QEhzUrIR34CkQvBbsO3DFJwDvn3ca5QaGJATb+mzPLEmRW+PFTqJKPLIRMn1Wn9AFlkD1Rt9frzVcq+96/Cc4qOpnkABg/JhcLN8WPdNaqMxfr7M8IyUCKPzOzHaqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2QAUtnIImJNY1uHeeJcmrEIduHLf7AdiQ51ygxQEEI=;
 b=rfl35ShWVYCxm0s+F0SXX3J76G1DtCgxWsrRpZ6/Kx9Bhixvr5S+53UiXyaCVWIVkr7MeO0Wi6JF4IqcIJe5G0UfiNobKwD0H3YsQbSDP1jrh6lXqJ1A60cI/VRHw+GZm6EYFCyYmT8dfsJ357D4cFKU3K8Zlf28gHONle8lZhIDhjJR+7WyY8tiMy/D/RtN0zsOvvLQDYYGrYhd1y6Nq3LdQCNVj/L1s855zee5Ot80aDnUgLVTGJcrl7jf35Zgolz63Zr3cOFt1I6dOSk7IKv3+DMDHUZibvquw515GVikMiXuTRhG8zDxwbG29rwxcql7+jclV9Tu8Xmlk+xSBA==
Received: from BL1PR13CA0001.namprd13.prod.outlook.com (2603:10b6:208:256::6)
 by SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:317::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 25 Mar
 2026 10:15:31 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::38) by BL1PR13CA0001.outlook.office365.com
 (2603:10b6:208:256::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 10:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:18 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:18 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:18 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 02/14] ASoC: tegra: Use dev_err_probe() in tegra186_dspk probe
Date: Wed, 25 Mar 2026 10:14:25 +0000
Message-ID: <20260325101437.3059693-3-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfb681b-591f-4bf8-7e14-08de8a577217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ItzzeMCZ8PNe1HhMAlgEz/NOZtziCWW1QxMsumkMh6FCEJJnG5e/X5uVGpVMo7CXGeK1oYyqd9OVOO+LwzlIBevKwswcdjGGsNYpxlsF8F5IrY2HGJJ8cMuW6nsM5vtZjPU63C/6GqcmG46C6r5Q81wXGl+dTIvP5j0iZqiz9vDgZzzeowjGg3d42jOqxqaoq4y6YNd7VArNrTFAgjjECwnnpn9WZp+h2amQ3Uwz3Nk2j2/TQYzPN3rjSeDyiqyNKHjp9N623/+e+OoZdFyvH+xO3Js4GSs48YgOZB9Afbw3q+2I2/TwdTSqPSxApLyQVCfqH/ptm8hQbS+egJ4kI9njN+EuISPgA3nlRnNweJPpDeXXx81RMtTIj+iaQIyBuEEGq1vIBjmqE8KisSItmCjugU+r3PbN8ylsmBUx23dLzrdZejvgPiLDQrp5geMAghLQL/kWUOhW4xevTqYE3zmvIQ7sq3+ykIL3+sM22Fk7e/Cb4Aec1cnRQ596eOqw4GJhcPsjyQjqxNAGJQFLQCxIVUzyXuoUnX3y5tM/H3Br2VT/POb8oHQvQVtQw2DXYDoK65INgIPJBdDqCrA9iWTGWPCwRDkTS1U18JJON8POV4W13TLpV0zGOBLSacwwEryJn+o0tQ0aTv8oN/ON4VheWRS3Uu7knrnFH740W4wEyWimlr/GMa3X8ROZi5Gz9ET6hiqDRhcqhDrNTacVgh4Apd1g1KmeIpJCycl4XJBamXiaD92I8ObPQtQzt5VJU6J2P1luuim36HQgYCledg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f4eOAJbdvH11E7kj8XmxvcjWk5Za30DqBa1s2kMtzewkwhFA0kEBXSWODIqPn06l4h87M7QI5eHJRQnAdlOomfndJm7buTvBGX8bsOCUeG40yLrOHp+PqQVfKIJJPhDQTQRfTq5kylS0lgErdlEJg3Nfr7DGIKG0TgrnAxK34u+vejo2vPz0mUfx4CBwzh5GzDIdM9uLtTUyOSyZppk8Tnh35YF9JOsGphwGYJz1kQzZi4MYFCxMOqEqzkCdWLnNPHHuo4sg+iC4oBvQCvRn9nESFIlyyXo4KdHsN3lp1s+W44X9cdCFUzMWzApmD8mKm378tRhYlcPnirf6XazvOiH4jYxx3zOM51sc2qOsX+wnsrYDkEWBq7NhlGtx0rqhlsJtbnK7hM1CDNOGat1trSPC3JD7pV/f+0D3v+Wq1TIjT6d0577y5ojLXkKr+o0p
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:31.2197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfb681b-591f-4bf8-7e14-08de8a577217
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764

Log errors in the Tegra186 DSPK probe path using dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_dspk.c | 15 ++++++--------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 8816e4967331..1aa94c98294a 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -496,10 +496,9 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dspk);
 
 	dspk->clk_dspk = devm_clk_get(dev, "dspk");
-	if (IS_ERR(dspk->clk_dspk)) {
-		dev_err(dev, "can't retrieve DSPK clock\n");
-		return PTR_ERR(dspk->clk_dspk);
-	}
+	if (IS_ERR(dspk->clk_dspk))
+		return dev_err_probe(dev, PTR_ERR(dspk->clk_dspk),
+				     "can't retrieve DSPK clock\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
@@ -516,11 +515,9 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra186_dspk_cmpnt,
 					      tegra186_dspk_dais,
 					      ARRAY_SIZE(tegra186_dspk_dais));
-	if (err) {
-		dev_err(dev, "can't register DSPK component, err: %d\n",
-			err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register DSPK component\n");
 
 	pm_runtime_enable(dev);
 
-- 
2.17.1

