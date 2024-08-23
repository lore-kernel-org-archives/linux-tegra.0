Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB381C8247;
	Fri, 23 Aug 2024 21:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449861; cv=fail; b=prqiO0NFkH9de6E5Mugankmvl+vyM1dy/JZnxSx8Kn9D1sz85tzl/2JnchmDQGBto8Dfli3Gwkz3VxtVAow6hmC62TlvrWTN2Dp8bnED/ztjnWrBa50So4BzjKQjShvLRFJ4RoCsCnnuY/d/Q6g6zWrhnWLVLJmJOtTHDAklD3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449861; c=relaxed/simple;
	bh=cyAZ9ieQqe8jrSMUJb/tQB+2oFLIpSM+FNFYrJl4/u4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aPTdolieqk6GHdaCWRJ/fc0Tep02Uk+57y9vD9e2VX/FRKGn6f7E9ZnPAXbCb99D98impe0c3yBp7M4LS5F6rnaNlKSBKKkeV11HN1ap/D+uv+MRCdk1yvmL+wBYmCMKn4tNIDK6awsiZfcgqRQI7dkM7IwJqB5x22SIBHLwmC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bEv8baDY; arc=fail smtp.client-ip=40.107.244.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bEv8baDY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7bWw/rbXosrjXSOgS0NaD210LhQEdhW7cQVyf6qhnPFSUWxD0lTD2dOv7cZvOVZAxVGTrgGQiEkavj9QUIjm0Z5fBAf4kURscHydVseCiCR/KEv7K0IMWeEwHVSC0VFC9kQekuC/NY3FZtuelHDYAwlKU01o+FFdLzspJ59HrsC9inUd13MfNIctMClnmWAwaG8dkMO1yJgXVR9NSSf8ZljlQl+9WAwl2pQCCs63oH1srn2FyZBd6Msp1iz3nmCrQST7Tvk0aQ9ydMKA/Q2aowUbqLXUEOi1SOo3ih/UyzHmpLxecRNZv3P9UEqQ8uHS66LD/LLW+KMMizJ1gRkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU/uZC3fpTRLIw6rgxeA5HvPaX1Khm7rQZspsuand68=;
 b=e4eoCW7T2hiRdApwKcbHSzSIETEnMdqmVXXV6OthQ9RkZc+0etGHrogCJ1BnwPf7dk8815HjARSVoqT0drkzQ2jAwrRuTBjR8BlVQ27ZWi03IcvNAtBWxsx7uGWSLjlKBau0C8JigWTSOvhjBE8pzgjyuJNU7oWZb8qZF1OUxx4Pcn0dvDWARegZvgzaiFdiwtyEi13lLj4jLztQ68Rz943fZ+0BvqYQruxHJ4AWanNVbUkk6HdjUO6w+CoFXJnpIGvyc/GEnUmVYV0FrjU0RF2f2q/0nHV54lMie6Zj/EtPdS/cXaN03SOu2lGI7Hr2Dkii6Q0AZh57wEUqJhMSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU/uZC3fpTRLIw6rgxeA5HvPaX1Khm7rQZspsuand68=;
 b=bEv8baDY/Vh77YeLj3Mm8+tb9s23aS8wG5Vs6IiwOUffQtgZ/0pFcFGmOb3QC3fFeB9uwgn2vUa63EaK72IzX9LGKdMcMR+IRT7BJyyKNj68ZFjwA2QI2CGOfq2cxmGyKiCmCt1tCrZtKGEmPEjCAgYufCT3OYXZIpdfJHGLvPFea32yedXjky6+vuc3qehMzRg7AQORKwM6R7dE3kFw1102QN25oh0aWv5kSaPuhIBUYLkxZ9hvW/j4wIgCwTziRmbE5VIEA4Qym0ucOCUfEKoAFxgt/Itxy83n/zmgNhgnJsxIAvgV3HW6EcRsaKnkc7mBVobeIuOLphuQVGfFIw==
Received: from CH0P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::10)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 21:50:56 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::a7) by CH0P221CA0028.outlook.office365.com
 (2603:10b6:610:11d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Fri, 23 Aug 2024 21:50:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 21:50:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:42 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:41 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 14:50:41 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 3/7] arm64: tegra: Move AGX Orin nodes to correct location
Date: Fri, 23 Aug 2024 21:49:53 +0000
Message-ID: <20240823214957.771297-4-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823214957.771297-1-dstotland@nvidia.com>
References: <20240823214957.771297-1-dstotland@nvidia.com>
X-NVConfidentiality: public
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a1c8d6-d673-473a-c36c-08dcc3bdaa26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VZywxBeKHiLHKoUbxJbJupdDShxs/M3fx0qzf4YC8TVO+VznXRFw/BEn3rOn?=
 =?us-ascii?Q?gI2lwCPsJ+58oxh6ziBk2Ebkf3HieMYXPh2hA/OqIqsT4hSbn8sSQBwnZORm?=
 =?us-ascii?Q?BLDUJinqEKXi15P5FivYhDVjW+AibPq7+U9SaQn5of6Cmd9cMZf196KePGuT?=
 =?us-ascii?Q?4TFLb23vR2Wj2+RNQznHEUltmpN0CSZtBe6j3YSPnrq0EYiXr8gqzRmXUxyY?=
 =?us-ascii?Q?Q+RYXOC/sLMru0xQ3PG8EQ/V07E+wtk/643+bFK90HMM01em+4U9ctCl2X1c?=
 =?us-ascii?Q?7KLOtWEdyiaYU/gowxsIwXpY5YQI/reW+eMJMZw+GiA/5TgM33T/2K64nXS7?=
 =?us-ascii?Q?exF6C+VlKsySSG+HZJ6bAVTueNRN0VEU9yFh94zvghM/C+8lfmj+eJvvZtlf?=
 =?us-ascii?Q?SYbsTkjBH/mL9iIZdtT4S+NRA0QSztJa7S8Ya21ZjB5NFnIzEjICh6EGSFWO?=
 =?us-ascii?Q?T1aRTP/lxEC8ZjcujZNRPL2FFTMSvmMsIkMtF7Ro1JrHVejipxYCokhB45EQ?=
 =?us-ascii?Q?C254RS573f2jKYt7Nt867u7/ps5DUQFRetkX00Cg7CzoM4JX/flpfSmnpqpD?=
 =?us-ascii?Q?Dau9+M+BRaV/PmZj9K0Tp+8mxZDnSB9TQFKaRjyvSSpBujXSjZCadgs/vVYB?=
 =?us-ascii?Q?zd7odUkQ3VM+LoifargnZggn2gfC9Aud3gVCEHzwVO2SUpYPwX2ZPnDma8Lp?=
 =?us-ascii?Q?yQIuw7pVply5WeaB9tJgQM+y7bqloai55/hKH2WSSnH3vFnk9SeLZav/+nDr?=
 =?us-ascii?Q?iALY3lvNaMZB3tUCRyVHw734Og82SGV2T8twC2KtjRZbztzBMEFYn/D5B2Sp?=
 =?us-ascii?Q?74L1+FmH/CuQJt/rOQnz6uW85l04P3FTqu9tY3UZghDceOvRforg8N9qfe07?=
 =?us-ascii?Q?UY+hL9rGdgO8YYfecujy7UwpVTZ0f3inaBLEULgjUcxCrS4eLUFR6sxKFeCn?=
 =?us-ascii?Q?IEIvXIFDtEcx3uDyYAnjVB0wN+vxtHRupjsgQFSsCuOmdRq8q0l7VnwPzE+Q?=
 =?us-ascii?Q?OUrxnlm2gmuZ9zj2g8B4bP023F9zt/sa5IE1zJCxURKPQ6bNwPbwld4IwZkN?=
 =?us-ascii?Q?3S73qm9Vol87AEYhqMK3E8LWckzxSRNhkYZmFK8qW5BdTHhoTbE+nJQIbEXA?=
 =?us-ascii?Q?R4OaBSG4NhQ70adRxbnAJ2iBaIjhV0qxUuUearGtn2H5utZGSaBF0Svy7evI?=
 =?us-ascii?Q?9vSAB/0OVxAg+KsUHnAeq6kIJJ5E5ZREPT+mHRUV9X6nZM8CM0h5nNrGcHl2?=
 =?us-ascii?Q?0CnTPG9Ls4G3/bg9j6VkylmkXvSG5nC3WWKwemUAArkXUfkd6Mbq2kbVYavY?=
 =?us-ascii?Q?kbmoJN3ydZK2CnvjlMFcUOlUpR0BT66wnRRYJr9JJVyowNfkKYCBTbOZSQxa?=
 =?us-ascii?Q?BGv0y8ULiCmkqNUZRtFatt8OJvKpp640CFuR0SnJwewrphJvzvIuqUqkObCB?=
 =?us-ascii?Q?LRwGaWJfdseFRhbOLMs2eF48Rinmd0lC?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 21:50:54.8951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a1c8d6-d673-473a-c36c-08dcc3bdaa26
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168

Some of the nodes inside the AGX Orin module file are in the
wrong location. In particular, the SD card interface and
two of the PCIe regulators in the module file should instead
reside in the board file. These components are not part of the
module. They are part of the carrier board. Move these
nodes to the correct location.

Fixes: cd42b26a527f ("arm64: tegra: Add regulators required for PCIe")
Fixes: d71b893a119d ("arm64: tegra: Add Tegra234 SDMMC1 device tree node")
Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 25 ------------------
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index ea846b879a21..2830eab1b2eb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -7,12 +7,6 @@
 	compatible = "nvidia,p3701-0000", "nvidia,tegra234";
 
 	bus@0 {
-		mmc@3400000 {
-			status = "okay";
-			bus-width = <4>;
-			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
-			disable-wp;
-		};
 
 		padctl@3520000 {
 			vclamp-usb-supply = <&vdd_1v8_ao>;
@@ -39,25 +33,6 @@
 
 	};
 
-	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_3V3_PCIE";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio TEGRA234_MAIN_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
-		regulator-boot-on;
-		enable-active-high;
-	};
-
-	vdd_12v_pcie: regulator-vdd-12v-pcie {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_12V_PCIE";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		gpio = <&gpio TEGRA234_MAIN_GPIO(A, 1) GPIO_ACTIVE_LOW>;
-		regulator-boot-on;
-	};
-
 	thermal-zones {
 		tj-thermal {
 			polling-delay = <1000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 21feaf434439..90f12277aede 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -106,6 +106,13 @@
 			status = "okay";
 		};
 
+		mmc@3400000 {
+			status = "okay";
+			bus-width = <4>;
+			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
+			disable-wp;
+		};
+
 		hda@3510000 {
 			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
 			status = "okay";
@@ -522,4 +529,23 @@
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
 	};
+
+	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_PCIE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA234_MAIN_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
+	vdd_12v_pcie: regulator-vdd-12v-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_12V_PCIE";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&gpio TEGRA234_MAIN_GPIO(A, 1) GPIO_ACTIVE_LOW>;
+		regulator-boot-on;
+	};
 };
-- 
2.17.1

