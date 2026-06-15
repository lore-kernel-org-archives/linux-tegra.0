Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0683A83B1;
	Mon, 15 Jun 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512690; cv=fail; b=mDHnJWskvdCiaa5HFl5sgbyGNCbsLobKHix2aXq4uXVZQjhpnpfUzx1ZMRyHD8Q6zC4owC0E4NSKIN4TshqMc3+YR96Mvrz6kGL+XmC5Kbj3oTxvVCGJMY9VKp6vXAf7JhoZQrjR6y1oub4Pgn4B5pnfFLnYuauLCAqn5qQz3ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512690; c=relaxed/simple;
	bh=L+eIIKQnavd43VJk8cyQkUNnxTQN4JsXrXvMc1b0PyQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D32sIl6c1iQFQrAP9+3b+FzGA2il5sx6UM91T+mjjyxbXRovqfXNnzg4AWo1CXl68EUo+vnjkKwNJpZVIKZgnitpOdqjUVC3xJ/9S2tSIUkhFLvS7iyt7IFOx9bqc+atL0wJYZZXno4OA9RPSULnJHFczlBCn2fpfm1rVaf0Sas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N2ymMfXz; arc=fail smtp.client-ip=52.101.46.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N2ymMfXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIRVb5XOm/435FDRhmYuSuAHmEnzDJtyrA3XmUNsHh5beYGgQHSF5zAX4qx1k3Z/NNf7NQ0aP4G29fcZqjS7GgZaTRs9Rtf2d+Tu/WPiwiH2djHM+AOnM8QSxfIPKNDpUoIX6k1Wy+PUS6k38NMj2w6oTXrylvvzXeKC5VKMcoA9TZDJPovuwcoELjrWadWl4J6o/LIbifCrJJYtuVO47aMlSdArf0zGzqRIUxAesFI3i5URl/zimv/aCKCmIHU8iHQ6n5TM3sydJPAJPStSi87pxntPL3M7D6wDJmtQZXalGYrkP2sY2yXcAEUfrEiDkQsNU8sDwvMNNo+9HQk+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik2zDcYvWu6ua8K90fVwp1KqyDewhXZpb9KoecqoRC4=;
 b=YE//3P6K2b/4o2/MLmdPy0vtGxXMiCwMgd5D+14GS9ryW7NAvWvSxhP/iiBjF+OrPV/x8nNBwo97zIh80ebogsBiYpVe3Sxkvre1gaxKeRFipaLsKH3EWj3H35m4/lWtRLLtBty9I5OmmjnCD/2Z1QnzXSPyDLyh1zJolH5bSvo+TmsUL+V2aE9cWn5ppLPKblhgZ+x3d1r3xAvE5VmU5IblZHv6DmURLX/kT05+d9DOW1U2w7Bg1eRncwisZYpy33FLQ/Hq3lpFKCJD4cLljcKGUZjreNEhJItigwnKNak3cR9VcVSItbyq1r1apEMqpSHpK9cuQvtwpbgZ2oRFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik2zDcYvWu6ua8K90fVwp1KqyDewhXZpb9KoecqoRC4=;
 b=N2ymMfXzmDbnKwkQvRrcTiKo9EscXOTqgD+h/34hTX72ereSq65o08Hr4YDEOzOdIta5UJo+lPkct+GEThhfgyURINOAhoyZ6fjYBZuqNWZixcT8caBJEjQHYuNgariNRogjfSN7lYAvAqBRxuu0m4Q+BN+Pw+JquV4GznrtoAHOtoHz5fyx+4ITEkzSOEtjcZup9NGdSMfNk9P6fari0HAFNSawiXjAf1oombCJEeTiq7xpFtzlNud1M72Lo0DoEnwDe4+kuqn9TfJHdvASOosbjqT5Ois7T8ipivNKqVZUjgbxMAdAjqTugNi8VHG5cdJX32VYO/JvWAEOH8Va/g==
Received: from SA1P222CA0186.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::18)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:38:04 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::44) by SA1P222CA0186.outlook.office365.com
 (2603:10b6:806:3c4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 08:38:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 08:38:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Jun
 2026 01:37:49 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Jun 2026 01:37:48 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH 1/6] soc/tegra: Add Tegra410 SoC Kconfig symbol
Date: Mon, 15 Jun 2026 08:37:26 +0000
Message-ID: <20260615083731.888055-2-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615083731.888055-1-anrao@nvidia.com>
References: <20260615083731.888055-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 62178005-c53b-4ae3-2683-08decab96ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ThqnduSwF9IWMdxylWPmnbtjBjDpOjizlSTPJLN+pMp09YH8NsLmT8w7qegSYKBFNPPuT0UTMAXD2y3XwUt/cP/rdD0+3Nrj6Ty5D5sJh/pkSSLPiQDaYABBMFxR+ucL4iNHk35vH56/bhx4t5IITUO8wlN9sATzLu/nZV22wrlA+KQ/YiT4UmGOiraKrfsNR/FbCG7xP0Dk9MwsL795l62m8tN2R52m3lZNGjisWxGzACeZNegujSsYHKQRg1PtE5v/tkM42TLXAJoIzrpGpLAbwW4R0F08wcTVK1OoYT75qun38TwibKcb4Jxk4gFrwz00x0E1h8occgsqS5hh5Q7Whl/R8cGANqwTPuVBV6R+YMGtrgU1qPza4CH9afS3zWya2YX4lCz6AfoI4jQ726KVdICIaUS/QJicVymrgYxtgsDzeYw49R2FPG+Y8nQ+m/SuoujUgKHmaacQw2eVYyH8NvtBSFkHLSfUZfM+kDeM5ca7pGfY0awCssLXlaCsRGuCnUjhgqQtgUw+rGcQC9V2RmYgNnm/HDrE+j6BBiApLitWeLOwutUE+35ECrVh8gC6qtXWhwaajAoQgpkZC+MllrSAGVxZH2uYOUx2RZ3EnJ33g+W6+d89IVuH51ddUw9lzeWeE+vGdRCeE/Ii5xsOwLAI0O5TTqY7Pg88oncUTTZb/KKMX65hlFDlVMa2GttI/lnq6Ys/7r76bNAtlKCfbXkBcvjBiKlJybrfVI8=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q8pCyS6ufoFRJDu8KhS5StttRXs3H6tEp9ituijsvr++5m4st5vvKWZ31hcOOPZxcJ17T1iLhyhfO28u+fMxANqQsOHxT3moZTwkmV7kJzDFsFIXv0zRMX/j/p1tSfXzH9h5wd+d7pseUZzSjdzUyjHQ1rfBKiPtJdxWM6BWQxqAVCALvIs5z9JSZAL2zXYlR1/0jjy0jSCaTnOkwP9Ztli5U86xcjLr8pu1U1zApIpIAi4No72Rbny0vPrLqDwh1Dyf+whTGhtOU7AG3+88KrpnpFaQsEkMkDDOB/dvRuGENk1H8cKJPgizIrhZmM77aHwKowDB3cjxhtYpvUab24Vwcxcfd+aBaCFxqzWieJKRA5gs8duZop2IxWFtfMNXFjddVvTjLkY3v+9OXwg5s0Bhz812/Se4Iawxi7FufC+vm7rTB+dxqG+UwzgGfCxc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:38:03.9523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62178005-c53b-4ae3-2683-08decab96ab3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476

Add a dedicated ARCH_TEGRA_410_SOC symbol in the Tegra SoC Kconfig so
Tegra410-specific support can be selected independently.

The Tegra BPMP driver will use this symbol to build Tegra410-specific
BPMP support, including the Tegra410 Memory Bandwidth Throttler helpers,
without enabling that code for other Tegra SoCs.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 073346c1542b..72b7f5db8179 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -149,6 +149,16 @@ config ARCH_TEGRA_241_SOC
 	help
 	  Enable support for the NVIDIA Tegra241 SoC.
 
+config ARCH_TEGRA_410_SOC
+	bool "NVIDIA Tegra410 SoC"
+	help
+	  Enable support for the NVIDIA Tegra410 SoC.
+
+	  This option enables Tegra410-specific platform support in
+	  drivers shared across NVIDIA Tegra SoCs.
+	  It should be selected when building a kernel for Tegra410
+	  systems.
+
 config ARCH_TEGRA_264_SOC
 	bool "NVIDIA Tegra264 SoC"
 	default ARCH_TEGRA
-- 
2.43.0

