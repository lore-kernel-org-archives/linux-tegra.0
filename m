Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2A195808;
	Mon, 26 Aug 2024 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690899; cv=fail; b=MsvFn8PjTarxT04vISbetxMlsDMfOCOdGUa9reuCCjiKInpcGLqOYiZg45emNwza6xd65wjNl49V6DIOIWSD1/YGoRRfaUbfSMzzT88l9WVCoS7Ux/9ivVyNd/4Gm4utdU72sXDWr5+fGM+lwH05dHGQVzAMKx1taqwj2jJizsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690899; c=relaxed/simple;
	bh=cyAZ9ieQqe8jrSMUJb/tQB+2oFLIpSM+FNFYrJl4/u4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOK65weYbRkGDD4J5t+G6F+4vQ6KCO+dafgrIXe2YNGdtH0sWwA6VMbmkiU6xrhdifGj3Em5ESip1ochdfIPmkxWG4fn6Pe00rusuPauSBoOU+BsYl42Wj08UtJ3Wl/Q+urH/dWriX8XLkGQzHJrHKToJhTZZDXk6yHf2AfO59g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sD5qYRcY; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sD5qYRcY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdJPwceX2UWXoqGn1RmH0AF88h8nT45hT20Q3NgbQqiT6+mCM6Goj/aGlgGYx5pfCkNNua7WdEIh++NVJlIH3otRKA0EbcbgXgH9VAWYAn5NGToB2NpNJfFsFm+qxBHSoktUoCN2UmYvUIMtNqSCymlRDzqf7YEyJkGT3cR6A8OZz0qIOr6Ar2CdEbdK9V8iVDz3+eD/vvouaRnirIi7IbMniKCnFfZLaVRLXBg03Qwl6KW3v27a5Ci+KDV96InVt66JEsWk8cPLQ5gV8R+oh7PYYjwXO6h0kHO9iLv2faGS3Z5x4ny5ELHSeL8Z2fI0T5medn1SV66gdPcyDjI6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU/uZC3fpTRLIw6rgxeA5HvPaX1Khm7rQZspsuand68=;
 b=tMAZSVK3klw2O8c//IwASOPbIGJGTtCPQdux4DiaA2bJ3h1gKL2i182sxiBe38LVDzji5YQwZLQad72tIEH+h8fmm7z7ZLiPx4i7tnIfs6NKt6KPvN9uoO/VPh0b4AkpD1NZfYCaUbdABLr9w4b/6y1LnI9IjyPe2dueHWR5U/DheKb/IG0H9vmF/rQZWzp4iEygpAg4V72vEL+7vef2x9Uj0LAebvfyDQRWC9RTY4o5zHBt6u5zJTLT2vRi1cI6YrtgJRcDW8RBzJBDaxtBpN5hoGRNhW0Lt/DUM8yTJk+SjOS+mEAjLITxVv2gHBG+lAEDxw6t7rRta9knddqQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU/uZC3fpTRLIw6rgxeA5HvPaX1Khm7rQZspsuand68=;
 b=sD5qYRcYZ4Lq2Y4ivMLT7pg/Q6JqCRVHEIerfjVenN/YTnnRT8TXFnjyRAaUWQeEuLSltdAppLcm+tMI6jXwauBgEelAqgvEljOUNX5HcXb25uk2P9jV2uulTQu748zmccZ8ZhaDdPuJSA18D2sdUSQBNR6uEWCO0CxpO3qB/bcshQ3upvtx5YQTaR5NZ/3aSoFH1WV2CuL6wkNWr6lzPF7jtR5Favwh4MoylZ09v1znfCy2WKa9iiZBPKIDJ98OAPs8Bg43GvFwiA6rO5XKtSa/FRG4ERKvJg2Ehw54GgV0fsLb7kC1KeUEVuwGZUd1SgEBYStu+5uSDqZlA2fq3w==
Received: from PH7P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::11)
 by SN7PR12MB6768.namprd12.prod.outlook.com (2603:10b6:806:268::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 16:48:13 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::2f) by PH7P220CA0024.outlook.office365.com
 (2603:10b6:510:326::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 16:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 16:48:12 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 Aug
 2024 09:48:00 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 26 Aug 2024 09:47:59 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 26 Aug 2024 09:47:59 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH v2 4/7] arm64: tegra: Move AGX Orin nodes to correct location
Date: Mon, 26 Aug 2024 16:47:22 +0000
Message-ID: <20240826164725.775199-5-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240826164725.775199-1-dstotland@nvidia.com>
References: <20240826164725.775199-1-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|SN7PR12MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d05e981-8da5-4e96-7fbb-08dcc5eee002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iVLZA5Dh593ZNYn0VOcwp1TTL1LtbAyEaQawBAQG+rkcASWncae6KWNbeET7?=
 =?us-ascii?Q?k2JAaFUljnrOrv0jWbnhosAp/ScRK5sBVaOWrg1Zb2/tJpGCA7MS9gjaGVM+?=
 =?us-ascii?Q?qn3BhZR25nmgVvs/MlhNl8WP20Lz0Q7WkkvlWxJ/6vKBq8SBoNs5F1wkr7qC?=
 =?us-ascii?Q?XWYpi1c979rldu3WCYnGZgbdn1gowK32DKBbIGHRnJoT+EbpRR/4hG+tuw/r?=
 =?us-ascii?Q?yh4HosF92+3EoK8/Pk2thSMOIuJbdpJ0V6ddVRddCrRNVX9NbI8ykDYCo53+?=
 =?us-ascii?Q?oH8pwTK4WBTuz6B/6YTFLAATX6puYIvMkyb2riqKIr53y6wbpksMUvpBtc+Z?=
 =?us-ascii?Q?htLU9474BzqZHB11VUBJ3pNFUUCPKo5PMhzuLrLqoPwLyyun50J/1n9P9KgI?=
 =?us-ascii?Q?znaD4B4skIwUUNkI5I+GOSS5L1IWGgtoeFv5yx8rSWbTlbf65Q2FE//pPNvp?=
 =?us-ascii?Q?54OFh2Be7n6upgFnlB1hicAN5SfkbsP3SlFOC6eaurM5shhGBPak1aPcj5LX?=
 =?us-ascii?Q?t7dEA7udtxcv6DZIuNA/4rCdDljXhpY3mdmvWcN0ZgNr+GoXQCQO99LreqTQ?=
 =?us-ascii?Q?/GTrFGmo0v9DnHtybVvS++zHbw4yiLuz00pR/mXDLLIXaV2KFE6eeobLctB7?=
 =?us-ascii?Q?Cmlad4wo7T+ibX3wVN2kUftD92lcbmnw3zK3KUbBqeNiynYJYzVqQvpyIBH8?=
 =?us-ascii?Q?9alValZyx6x/84yLRGsMscrsHmwaNfWHMdB6NahBJUXo+wID1AZ/FkGmseXX?=
 =?us-ascii?Q?m8Xd6bkozNOhSpvH6IyBd8qqz9a8iazSkp+k8eL66Wwe1y1Qmx0pYXlpmVGi?=
 =?us-ascii?Q?3vs/zRiyiA5dzAIrutt6tyN4VNUMdLWk8xQxKnYn9Bv3vz7paJrNMTU+euzT?=
 =?us-ascii?Q?cJ9t0F4tlmDqy1nfFaptvM+ilFl408ZiMSoPQG3IiL6IqsExNmRJAI9Q7M01?=
 =?us-ascii?Q?SU+PYpcI21U7BJRa20/H1rnnDhjTBJERlFmWMmg1qPMJxAQBmQYNkUpyRWUh?=
 =?us-ascii?Q?gnwaMehHC1FscenDu3rn11N1JQQpOrX9YnqzYjx6hSru1UB9h8txegKhrJZT?=
 =?us-ascii?Q?IlBOZqI9TYa4OWqbfuAPLFV7VmFyrVg1MUwMF95V3Aes0bW4kmDIP+bbRXyd?=
 =?us-ascii?Q?kbWOpBc3uY4r8aQ2cxshz3fOnJuz1w8BMy+Ez5mge98LlcThd+fIifFR558P?=
 =?us-ascii?Q?zGUqjDAvVDQmaQgsGIBDVaso0Qm39Y40hn9AAv/QpV0GftK/eU85m+Oyqy/w?=
 =?us-ascii?Q?ct+/rBmCHhTZ1qPQ9ImRWa75W/4zKY/5S4qjEo3gtHGYww5N5UPJzcMKQsSx?=
 =?us-ascii?Q?9Pl6Kuph+P7gWpL8M3W/5yoSqFtf7mU6Nan9Kz2HEdpjuiVTHdCIN7Rp23tT?=
 =?us-ascii?Q?5sCXVdnhXvy5LL5cDLm7frtHLVmE2ZnF1KCbuXl8GiYgAI0kWCmhvLuvVO4u?=
 =?us-ascii?Q?MjY7ARqh3/TML82/TsW9F62RzSIuhgcu?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:48:12.9978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d05e981-8da5-4e96-7fbb-08dcc5eee002
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6768

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

