Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C349503E;
	Mon, 21 Sep 2026 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992926; cv=fail; b=qfd4wQ6YFYLqyJn1AxFCeLNvuYAH8t0KgjQ6sVAKVikIfAw2mu5stqwkS+kUhjnFgDCQLdH71GsgmGnhkece60kNXQ7JzLpCh6h0EPlZMqRwNqLuQ18C1oIP8plIhzsP+syf+XPKyT7jV3Ni9/+Jrvg9KZ71RL4iU82SJbJIrk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992926; c=relaxed/simple;
	bh=YMpaSJayfdCOJ2LrpXNIDHGHgWN4XQAqZ8/jMuxPIF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BuwtSWeFQEKgVoJzB7MgatwFAH3lmKalZYe+K0oW2Fg30iCs47NzmaEwEFwd92ACn9Q08j3LSqDnDBtyISpfN28mEViJUOnAbjUT5i81ZCh/FqpLJKImTBgFL9HOg9A3r7AHvWF2ssnKbDgC7KgJmZYTUChqk13Zmgkmn9PreWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cfj48EdW; arc=fail smtp.client-ip=40.93.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cfj48EdW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7H3hhpShfzXd1KO+EWiwQ2tUlMfeVs+P3qs6cbSATb64kwqOU5YY4uWc3Ae4y+sglm239cEF7Q72g3BtFq8dEMLxRInzW7YrgzlDH0UBUupqnbWYhil+ciwuRtArrYXRDg05qcdt9xpK0TK9fyUGD+rZfGFnL3xar4Gjh5GqluPRXjJToGtcJam7/4h83KG0c2CkiOm2CaQFSxAiGpnocygVe1Mv23mYmmXClx5pOOZmqOT+6aZroQ3psnlrOkLregglGfWi/RJjWH0omswYJAiZzLbPOEzgX3hvHvpTQRj/KrDh0HOKIxquKv2PZqtEADUTbxNLoWmOCJx9S3mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg/fglgIREtWPkZu99Hfyd63tkQNIa2QDwEfPTi62lg=;
 b=izQu5/GDcupu8JnNeWujf+VV2n/rQC0cM8fIegqmK4bT90HSroMBWdKupUQjQIvECwn8WUF5KHxGet/uhw4ef2L4YeX56fNMM+UBEUFNqmHkt/WNPN9qy/TzEWs6R9KT/4OtHvn/ZquDpcUoNeGRo4/TnxNvG/Hh1HSH7V5S3mBDmLRcxf6dO2c+OdT5UBuP/rsgSoOacbRX+V36xiAZYJQDxGtji7tYS2MtMcO3BCco4969xk7yvBwGkkhQLKCz4jhtpAmwSkw7kidQ5a7RdRdq36/LB0g9WHlXFkInOAI91zpYInxCzHQ2HV/7II0rC/qbJY7mdPVjvWzRAtpONg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg/fglgIREtWPkZu99Hfyd63tkQNIa2QDwEfPTi62lg=;
 b=cfj48EdWiobEDIipuYDsUoNHonvNGkqF8P7OJ5MUBMLVFWVpd1KoI0Ua55+aKh9CoAor0ejb18MgP54ILafUdRRDJkuuUEcNp1v+zwtg4INmtumkI4aG3VilWyEu+pDCBGGVOH+1p+lKtIXpfLbyXZWixaFymlDB8EA5FgjAQlDQ49hvZhJwCzA9N02FKfssr9UUgEeeXczlM06h0fFv8vo1xKSE7wSCRnnmU5+j5xNrNelV90WuZFDngYugW6aLjwupqDLUxgUeREK/YDL2JMpzQV5RidRgIBp1JVRhjK0ljjHaUeAM112c6ZTa317dLGGcJqRvyMaCy5BNSnZWzA==
Received: from BN0PR04CA0145.namprd04.prod.outlook.com (2603:10b6:408:ed::30)
 by DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 12:15:19 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::10) by BN0PR04CA0145.outlook.office365.com
 (2603:10b6:408:ed::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:15:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:15:02 -0700
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:14:59 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:14:47 +0100
Subject: [PATCH 3/3] phy: tegra: Add support for Tegra238 XUSB pad
 controller
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-phy-v1-3-83466bf9a7cd@nvidia.com>
References: <20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com>
In-Reply-To: <20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Wayne Chang
	<waynec@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d824017-a4e4-42d8-91d4-08df17d9ff31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DQTAdyuxBQBYBnyL/IYRmLKJzlGR2bNJqAk4gtnZOWEr8s5jgTuzCzxY+zPWtvYEa8YydPXnsCJPMjVoMHGTGDzEY4Giy6xMrz1IE3L3OFJ9KbfP16Tg2+QpiLVjmS9DzJ5RJHrqyiSqYrAO6QTAtnAU1OjXwxU8Ok9pSuYPDdU8yn/NE/DVlojJ97GnUAmAWBhs/mNT7j8P6gNe8Jx0lakFtd5f3YGpj0D0e2c+9khZ2ps9/cjeOczWBdzNcFsf08BoIe6kKhbgfs852fe/bRcE3/6DHXJ8y1R0RHW4IkkuuSVO9wtqjsvUD5BrNWHyTtEeH/OGfIFbRbUKUZ4j/OksPCG9iZIzczWoNeom8hIkD/G1e0Ic0BrZFvB6N7Szg0MYVi2DfmyNygTLEdyHpxEt79NaAtI8Hw7lt3ItoyXaVn+jcUICclE1nUHovTWdze01DBea6IhMuYjK9tuaPzxcKL0t4f7shcnbWvzISuUKuYI8Z6gzTq80EOb8qim9pPtv2jHxcWetaCJdhrYM20Zs/wSYoyZ6ZU1ijfseQlKEQIYESKz6ZjBERc5oZrHSuQDl+q1587N9MlAKI8xntqBFvMWEVfJIsHWELVMpINQ+g1IdiOQ5K6klPBa633tzklBxcn7Yx+j4NEVeakzFFsbVw/DJ80wDln2k25FlifhgpDh5r2T1ynQKhctisFJN5RZRcWzvoK5h+Us2Y5Bp5w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PxolDDmxSI+pJHCSkVzqJ77KaMCsd9USJ+CTFGN4Wj97BbHOu3eyv2+wMc43ksbC4y3kR/8KmBYPBIDIew2D0vNp+NNl6GLDaSKcbgRVsz0uxlSwPiHbPjD5c5hwr/zk9Dtmij9WQbP/JPNSCTTSSCNdkXTVtjvMq5MKDf+prnLiwgRysL5dtGlnAR7mXGKqOXE22TcSdI3Ypu7uWmofb7iaSzXjxfXmzGS2QRA5AoUBkCpPJxkWOW376v2VW6YUUGiHhTZXxoNfli0bmDHDcBH48y4Sn1OajTUIU5IYm+YslFkRSseeSHlOLz/wCtjTrGNP9dkc8WBlUnvTjX17PwgLuPIIxhGA5SLLigK3Fx6zKNFo4ceXBIwjRE5zmaeBhDRCkRc0LA95ZEfoTYF8As4RGpW/uvMXztmK/HTiQ12KN3+q7AfQRkxFWHvBPYY1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:15:16.4816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d824017-a4e4-42d8-91d4-08df17d9ff31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248

Add support for the Tegra238 XUSB pad controller by populating the
Tegra238 specific SoC data for the controller. The Tegra238 has three
USB2 and USB3 ports, uses the same port ops as Tegra186 and has the
same supplies as Tegra194. Due to the dependencies the Tegra238 device
has on the Tegra186 port ops and Tegra194 supplies, drop the compile
time guards around these structures.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 29 +++++++++++++++++++++++------
 drivers/phy/tegra/xusb.c          |  6 ++++++
 drivers/phy/tegra/xusb.h          |  3 +++
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 322efdea0d80..aa8ab94fad4c 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1599,7 +1599,6 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.utmi_pad_power_down = tegra186_utmi_pad_power_down,
 };
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 static const char * const tegra186_xusb_padctl_supply_names[] = {
 	"avdd-pll-erefeut",
 	"avdd-usb",
@@ -1665,11 +1664,7 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 	.num_supplies = ARRAY_SIZE(tegra186_xusb_padctl_supply_names),
 };
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
-#endif
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
-	IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 static const char * const tegra194_xusb_padctl_supply_names[] = {
 	"avdd-usb",
 	"vclamp-usb",
@@ -1755,6 +1750,29 @@ const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
 };
 EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
 
+const struct tegra_xusb_padctl_soc tegra238_xusb_padctl_soc = {
+	.num_pads = ARRAY_SIZE(tegra186_pads),
+	.pads = tegra186_pads,
+	.ports = {
+		.usb2 = {
+			.ops = &tegra186_usb2_port_ops,
+			.count = 3,
+		},
+		.usb3 = {
+			.ops = &tegra186_usb3_port_ops,
+			.count = 3,
+		},
+	},
+	.ops = &tegra186_xusb_padctl_ops,
+	.supply_names = tegra194_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
+	.supports_gen2 = true,
+	.poll_trk_completed = true,
+	.trk_hw_mode = false,
+	.supports_lp_cfg_en = true,
+};
+EXPORT_SYMBOL_GPL(tegra238_xusb_padctl_soc);
+
 const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc = {
 	.num_pads = ARRAY_SIZE(tegra194_pads),
 	.pads = tegra194_pads,
@@ -1778,7 +1796,6 @@ const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc = {
 	.has_per_pad_term = true,
 };
 EXPORT_SYMBOL_GPL(tegra264_xusb_padctl_soc);
-#endif
 
 MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra186 XUSB Pad Controller driver");
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index f16c81520a60..ea181671395b 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -78,6 +78,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 		.data = &tegra234_xusb_padctl_soc,
 	},
 #endif
+#if defined(CONFIG_ARCH_TEGRA_238_SOC)
+	{
+		.compatible = "nvidia,tegra238-xusb-padctl",
+		.data = &tegra238_xusb_padctl_soc,
+	},
+#endif
 #if defined(CONFIG_ARCH_TEGRA_264_SOC)
 	{
 		.compatible = "nvidia,tegra264-xusb-padctl",
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index d8d799d9e752..b9de4f3b5781 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -514,6 +514,9 @@ extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_238_SOC)
+extern const struct tegra_xusb_padctl_soc tegra238_xusb_padctl_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_264_SOC)
 extern const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc;
 #endif

-- 
2.43.0

