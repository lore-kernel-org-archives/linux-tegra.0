Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B01C8247;
	Fri, 23 Aug 2024 21:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449875; cv=fail; b=SgWWj05liHDoP7ZNQNN1VzIgYjr6l6Gv3pB+a3A8encgMvC8VAwR0y6O9wxBzZbcbKTK42gosTY5+9gEnBd91m5dJmrfA4TFGPCIVDmky+Wt0buN6Lb73lfXSkRPfWdqpaCLNU8gLiU3InEmng/DYy8OeLj9YAfWfO3/VPAjFYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449875; c=relaxed/simple;
	bh=g3X+uGGGIalqpHmEAXUPaxKsLYGRnDwFjTbzzUZ2DD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MZR9wZ51htyr8m8ObfCQHLiAu69sd0bHydkhDiyFU0eeCfoRkmQi4w2Lo0FvVzF6AEUyIUilEa3pa2k4lPwpqKTrXLrTFqBX1NHTtwLigVivlsF//tkevEt2kjR9JR6Ns5lLF7ZM+1z96LytOd6wF+qnEiwiRW7S+y2uwZHuN2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K7J9O+8t; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K7J9O+8t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IN1Sr3qPYEa/391HoAxgoOkMijztVtoUKSIojcXkvOM1sjj7NuC2PjsoAJG24NGrcnh/oRCpeC74rEs/s/xHnBWU656TVynTz6BWz/mjDeNdUREKIEqptKWjuWmrjM4iuXzk8dzYvM2AoQKyc3svDqKhQ/lkEwgPdlZGlJQstUxzn//0ZCV3GCfm+yyZS85T8As4Mwu9yyBxsXy8BLbogNGgghi/4kA5KJu1M0UobzGA0TNujt9REtAE4JbdXuBofnabYNy85X2y0Rcy8iQ67JTpIvu6AzGV2nIxuNHnT/A1qSQU0uqix17PYMue5C64LwvN2gy45jq3ALAx5UCcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7e+iFD6hp/wLFqNHZlph0VLUKyN5oJwjVrC4pMszpk=;
 b=B2RPIlZyB82d/OMPJ2GHVzgMC6y1YoypqFV6aeQbmruJMXyUTjYv7Ktkauj8Xtdp4ezeMjLXKdRXU/oQxtWUIV+Wb4kBsNNZs6A49TGfyp0jUDPvIHYsJlj4t5Fu6h2N3kDLsvoaarAW+o74UoM9PqygVBYHeEPXnvbf2oHPQsw7FIlxgSoMRm/Cb/M2KfXPjzh3mvyGPRTDPcx4m6WbGtQQ6tgpNo9ByslZ3KRDEDKsO5eeRt15EUj+mhQOfPhH2wodxdDwR3y1ZhWV1w9ut+cgsqTxeRMS9fgmukaYFReR1lEOdz0Jt86U52CF59lPyTnj6SsUcSyqgooQn3AXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7e+iFD6hp/wLFqNHZlph0VLUKyN5oJwjVrC4pMszpk=;
 b=K7J9O+8tM/nQ6N4kMqetdPFHP2p9895FRsgZY2ScrJ5r6STTxz1fKzumLge01Ikp1Wczl5WfzIT3Ff6u2Et8bPqrOOASa4UAMTV89w+zklN9EaIyeSGxCu2NJn5edJqiPL4A5AE00P5s/NM6KeY/yKQ58SJi6oSRrUcIk8B9cEgg9cCgNCi6j9kX6OQcXHgU1I2iBw0bjCQfJCFbC28OdVJKRNXWSiug31cGeE9I9DRWQDNLQ4jT/rsXh2RgPFEgyQWReTcS6BAT/YeJJ9WPRafUZOQpiuR/mLA4YIWkxt8QOyPohCQBQ+y6OE0CKfgiq37zkx9ZpO3auC/nzLNbXA==
Received: from CY5PR16CA0030.namprd16.prod.outlook.com (2603:10b6:930:10::15)
 by SA1PR12MB6727.namprd12.prod.outlook.com (2603:10b6:806:256::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 21:51:06 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:930:10:cafe::df) by CY5PR16CA0030.outlook.office365.com
 (2603:10b6:930:10::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 21:51:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 21:51:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:52 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:52 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 14:50:52 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 4/7] arm64: tegra: Move padctl supply nodes to AGX Orin module
Date: Fri, 23 Aug 2024 21:49:54 +0000
Message-ID: <20240823214957.771297-5-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SA1PR12MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2ce2e6-7d15-41b3-14ab-08dcc3bdb055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QcRGGeXWwICICtneGd6dtsfbXE0vQ1k50R0ZYXaICYlMuQYWzFKuQKuvpAsV?=
 =?us-ascii?Q?nDaLi4+9LV8aiaSo73i9GdrT70XraV1aKSp9D5bGMpdOngfT5jSWaP5uCRn0?=
 =?us-ascii?Q?3HLkwFSrM3YUGCUvs2r4nFpNVSLP3yHBhf+gIREfJ9oDlAqVcICSyHKlSb19?=
 =?us-ascii?Q?X9lVLLlGyAGL+4t8NLOejVj4SePb/lwp+S8qHB15m6UGC2IxKWwHiq/SZJDP?=
 =?us-ascii?Q?+ZFXZwgSjCl8T4xXqvOcFXtZui7TQToyxTTfY4sBGS9qeaO8leAkNvQpjlLw?=
 =?us-ascii?Q?OJMygExHU8Q9efdJs52UE0Draymvlk1cqfhfRft0pqknKsKHfpqplCA60Q7d?=
 =?us-ascii?Q?zFiLtNHUYj2d0Yqh71foAg1hreYL/TIeRE8MnDDPIoecgAZUmevmn5VwEjWp?=
 =?us-ascii?Q?5IbalBUnD5hCBTCnW9eQ1DRqn2yxDqmuSMM8ahXqiwwuIawSb4hJ2hrV0bv6?=
 =?us-ascii?Q?pgfOsX1MCoHAzaITBzTbt5q+ne2AxF0Cg0VMOnx7OGYeOANPIJyMhHh1TnR/?=
 =?us-ascii?Q?LhckK/JnYG8F97kElLvKXKck6VvpJvEOlsCXiDYGdIj5VYL2bX4APDFqZZ/l?=
 =?us-ascii?Q?+A/kM+HoT/wHPGNta5LlyDMJ8QKODQl3AT10/avgfqKAfQvo3vJjllK8nP4M?=
 =?us-ascii?Q?J2Rj5ZmDICc9+zB0iyJqTmPV55qNYllM05PW+ra6XPoZ15jUe6nDow/nE7Jr?=
 =?us-ascii?Q?nO6GODjKiREYUZywyG4pB1Xg+mi/eHeTyRgM1CLTkj1dWsBHFSFYB5HCf4IS?=
 =?us-ascii?Q?gYHxv+Du07Vc4++i4cxqF9ZMX4BjpdEyZUZMLBe1AJXNQdg3yQ+OT5FN6qpi?=
 =?us-ascii?Q?IogQKa/smtrTZoPy4bC5tJwu+ZdG0veiXWZpyQ3vCzYyWclaC9hhY9Sxsy+4?=
 =?us-ascii?Q?wXUmXpxwBxXe4fonfeWf33CqzfNjNb9UyvB1e1b9zjcyg23iKXofZeY79Y3e?=
 =?us-ascii?Q?rYTvXFcutmPqOS6xhoVLKWk8H+iyUm/jREcGbeejoRwtS6DCF0BMfh+kdo3m?=
 =?us-ascii?Q?go8/sauk0sK5qpGN30vhG5T/tfbU57vjco4Ef137YeLX9w66YHiePLt7HM5r?=
 =?us-ascii?Q?KhmaiIBJjnCKWLj8hQ37JhAs59PH83ZWWcC4yh4WCZv7/Cpn/d+/aht6SYry?=
 =?us-ascii?Q?T/yWJdqwnjy7GIIJkVT3abAE6CbaV0VAs7NU4aUWSLnnVVaWfJeCE738LEsQ?=
 =?us-ascii?Q?ekNrgAqpSCCw7Pvj89fRSjW5HEbY/QoSeZrolqvmHRUnKBz7iPv7qpQLnciO?=
 =?us-ascii?Q?DX64X9t+IHTZSjdwfVE/oa9ickXojtBcv5+9Ovz+DH8PGfhDJjomfKQ7slrG?=
 =?us-ascii?Q?r8lnDBhZ9ChklMsqmLSZChM01+6R+aHjodqgCDRktbkTSAqyPfPVQxw0yx6O?=
 =?us-ascii?Q?22DqH0w+lBDwA/ZFZLoYwGqlEAxcgk0rP0KPemq6IqTBkSD9kl5FvC2WqeUN?=
 =?us-ascii?Q?gQa//0RJu7rTtVaKy9RInSGY6PtFjogA?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 21:51:05.2650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2ce2e6-7d15-41b3-14ab-08dcc3bdb055
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6727

Some padctl supply nodes currently reside in board file, when they
should reside on module level. The nodes are part of module,
not board. Move these nodes to the correct AGX Orin
module file.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 27 -------------------
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 23 ++++++++++++++++
 .../nvidia/tegra234-p3740-0002+p3701-0008.dts |  6 -----
 3 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index 2830eab1b2eb..d977f4901c09 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -6,33 +6,6 @@
 	model = "NVIDIA Jetson AGX Orin";
 	compatible = "nvidia,p3701-0000", "nvidia,tegra234";
 
-	bus@0 {
-
-		padctl@3520000 {
-			vclamp-usb-supply = <&vdd_1v8_ao>;
-			avdd-usb-supply = <&vdd_3v3_ao>;
-
-			ports {
-				usb2-0 {
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-1 {
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-2 {
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-
-				usb2-3 {
-					vbus-supply = <&vdd_5v0_sys>;
-				};
-			};
-		};
-
-	};
-
 	thermal-zones {
 		tj-thermal {
 			polling-delay = <1000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 18bd4ccb6b77..0471cea31b73 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -81,6 +81,29 @@
 			non-removable;
 		};
 
+		padctl@3520000 {
+			vclamp-usb-supply = <&vdd_1v8_ao>;
+			avdd-usb-supply = <&vdd_3v3_ao>;
+
+			ports {
+				usb2-0 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-1 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-2 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+			};
+		};
+
 		i2c@c240000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index 9581b31b459f..36e888053746 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -121,8 +121,6 @@
 		};
 
 		padctl@3520000 {
-			vclamp-usb-supply = <&vdd_1v8_ao>;
-			avdd-usb-supply = <&vdd_3v3_ao>;
 			status = "okay";
 
 			pads {
@@ -175,25 +173,21 @@
 					mode = "otg";
 					usb-role-switch;
 					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
 				};
 
 				usb2-1 {
 					mode = "host";
 					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
 				};
 
 				usb2-2 {
 					mode = "host";
 					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
 				};
 
 				usb2-3 {
 					mode = "host";
 					status = "okay";
-					vbus-supply = <&vdd_5v0_sys>;
 				};
 
 				usb3-0 {
-- 
2.17.1

