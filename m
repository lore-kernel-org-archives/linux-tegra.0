Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EF019AD51;
	Thu, 27 Jun 2024 21:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719525232; cv=fail; b=amV5qcd8qtUafabDGzOGdWYJKku16rTXkwcOgXXEEgfGOMuND1oh8ISPK6k/35BLIww0ryMNwIytNZTmo+q7Sg7NTHLPQkUCFZ7J/DAwen+1k/SqFqZrhNRDctlaG5RzTGlVuEFXGvsarZqh7L3LVUhAjaLH2yW336V131vS7UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719525232; c=relaxed/simple;
	bh=cY1seEVCkWGtMF3rpyjgskmeWjRWpuI3Z6JlJOJRTYg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DLqgPY9kT7DfgnDqtrYZLwS6/rIFsiHrSnMiLzT33W3SvwUZG6TyP36gfJMNDw41bGDxRrQ3uL5TtsnLGQwwLryHiVSd5ciCzeINQQe0ip3c6rig45aRSrz0Icgfx7gvChZK7bavHrsFuOoH2okVe/BBxMsFnvWMYeDYzDo8Oxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UoehnZ1l; arc=fail smtp.client-ip=40.107.92.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UoehnZ1l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlpeCJ8PSTLku7z6g/fpHD54yKW7sqZwwV6IErm1LxPnz/gNJByJubFaz2C/B7qK4ZjGydSsiBFGIgLwP5OdeRp/xdnPAutxyEFf4YDMTa09HiekCtcH7oK5Q4vbnCtQYjJVGKBXLIn2EfHXomXt+uwOlzRXcnOctuuOaUUw6zWTYKwSxF5eC9Xs1dxkM4B+p+ahxmnRR5rYyhK9PhZITu6QPGMWjJSBOK3AvoCjBTalKm6U+luz877lRp4s1kBGGLGt28OGT3OJ4+5PheOq5Z06os3pcL6ceoEgClcrgtEnd6zsMiAtTRWaLsBy9GphOb8x+SOugiQB0KI/Wwshlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu+GGLgH6gQeYvrKj4nN2ApdjiktemHUcxtPsoVTjwM=;
 b=LvwVUfyvSe2jPXpkow0UE6U52j9GkUwnviI1nohRerRrPufyI4kufwVEeiEpJ13sumAqHcg9C22/5I1LYS/0aT2hX38SG+QYeH8n0xT8ryxdCp1ZA3ADr9h5arvOLGxXci31rUDj7x0lZayfraSB0T5fHQml0gjX5bDhQyrX9gz4Yjkong2oG2POwrA+Ecpc0hJC1upCXMqfC5qLgzi4KpdYeCpzMSwFK/CV8tcPmru2vezEck/kwNgNvexgSW+QZyKuc+8JdVR7RSRt1kxBbQW12AxLw0PXwuhbOATmQGH4gFjInAg7w750Tj7wETVxqK/CKvh+HS6YaJTkF0WzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tu+GGLgH6gQeYvrKj4nN2ApdjiktemHUcxtPsoVTjwM=;
 b=UoehnZ1lQ5Uio3idJ7xIrG3CAUNzeahvvOxE7dcXDB3Wot7/ome+0NDiEgC73jWt+j3p8YmitnmOh0iYxBwOge1+itmSNN5hnAbkAY2VLlugwEwE7o8Y2MMI2o8Vwk8Y3bk7MVx9ELN5WL7E+hrj3l0sKRRNParIa9R1YoTsIKUANOPJnysOh1/EqLIZIDeam3BgufBDG7aCsOQ3RM0ADY8wiYZ+/CJRz7lFkbR0f5+Phw6eCTP2YIDXGoWbJkNgNP4utI2bxNPsJwO6TzTioxnEmldCZZsRbhL+WB8NiKdPwf0o4NetE1SrOqfyyXabAzrUKsSs+0cP+SzAMB13+A==
Received: from BYAPR07CA0076.namprd07.prod.outlook.com (2603:10b6:a03:12b::17)
 by CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 21:53:44 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::f5) by BYAPR07CA0076.outlook.office365.com
 (2603:10b6:a03:12b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25 via Frontend
 Transport; Thu, 27 Jun 2024 21:53:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 21:53:41 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Jun
 2024 14:53:23 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Jun
 2024 14:53:22 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 27 Jun 2024 14:53:22 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH v2] arm64: tegra: Restructure Orin NX/Nano device tree
Date: Thu, 27 Jun 2024 21:53:16 +0000
Message-ID: <20240627215316.1456275-1-vedantd@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: 4133c8c5-35a0-4d6a-a27c-08dc96f39bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xWzzSVeUOTosKRzwgbrsJpY0AfQcimVl6WDiGylFURbKUlhXvZfXlIcYuu2+?=
 =?us-ascii?Q?zrhp14ftPq+0qEw3tummeFVgi+2IPP3rVno2PxKyfqlMyJTJy8Kc87LWcBGo?=
 =?us-ascii?Q?QsmDA6GF5uh7BNVxWO3Ab1KknhK14S0u/gbLm0tV7f3vEVG0q1L1uaiB0A7x?=
 =?us-ascii?Q?HQzNhUBwh1QV6GgyP2OhuVRZe5OJhdzAbvkkaibfX++vxIaLYTzBlUxrzpEd?=
 =?us-ascii?Q?8eEU88bLcD0SdDy3OOBbhLlBxXWyjdZds2JmltSTDiZCDnYpCg/LAeue8zjJ?=
 =?us-ascii?Q?brs4p11ZgudNvW5t7SnJh1f88F2M+lFxYVCJl6P9kRws0mzm7AyYOeNCZiOH?=
 =?us-ascii?Q?tk2taNb5ILbHrwY0l/kC1lo2EXC3XB9GWcuFWvd9TKuWkJifIHHBGK08eXyZ?=
 =?us-ascii?Q?6MuKjFpAVnJJhlwbKiNwM+g4LcQCF66YyBfkl5ZfqCn2mpWcl0AHwW8YHZ2s?=
 =?us-ascii?Q?nKaAWGxnXPYxvDevXrUcosL019DYkhaLdoFPjhxp3VWVcfZrp9CtIPNYXjRl?=
 =?us-ascii?Q?LzrtlIgET8lZ15xd9Y72WVa0/izA4n2ydMDjgoocuiRxNN84Aa88QUbyQ4Gp?=
 =?us-ascii?Q?8BRvmUE7AQ6YQiCFTKOTachLLSwTRAjmWkNorGFfv8oFEJgkE9+BL2TDfDZP?=
 =?us-ascii?Q?9rlZGADxYzwGfUEzC+CYEhzstTsKX9lagRcz3NyREU4sL94KRF9rqcFJd8Du?=
 =?us-ascii?Q?VsAiYOptJhr+kkaofbXA7R7q0gs91yoB14mrIYARCdNeHxifW7+YPtraXQHc?=
 =?us-ascii?Q?Wur4Fn2/WFnQc/mWtBaxvoCdBwcnhhvqqg4TqV69fKRPgcHO10KOeM17brDM?=
 =?us-ascii?Q?FI7eP//3WvzwxHl1qcXmW9TeCx9pVWRs2xNBX6d13Tfwcm3fRyyhnXLggJlh?=
 =?us-ascii?Q?dtm4BbFIlsfvBIpC1SSZUpWah6hgAg28bL/OojPME1JkgwtMw6yP1UiKth97?=
 =?us-ascii?Q?O9stvWRaH1hjDSxH+sBP859K+hgSKOR2NIQrQ3/lgvbagLdtqTwVp+FIo+/c?=
 =?us-ascii?Q?Ah1Mwond2zqFT2bgmESGpfDUKnDe2JGHfZDrXeDF1pi05o6RiWfbRFDaKfJ4?=
 =?us-ascii?Q?LVEBxd0C2LwBv7D8Er+TPFL110rTUOXahTgkVGfKj/WKyQ/z+h+Dv+Zj40Aa?=
 =?us-ascii?Q?zSwl1NnQt2+6uIxKlkH52V1CBkhDBDyz4edfVb/Vv0N0PeRLmcwW/DgV5X0n?=
 =?us-ascii?Q?2XlLm4Tm2yjk2Iw+nInor/RQky4P590Xt+Bpm+TqSvva0gylabl1wWARElWG?=
 =?us-ascii?Q?fWc3DU1kp8M2xpUN3QUIbRvEsBqz320HNosuNybdtThTITdvc/IbxENjOgD3?=
 =?us-ascii?Q?JTBMwEVWSMb0UQrMUTtRAR2sPZ49laIn8a8EikSOIDStsTXpgcpZDvKa7RcV?=
 =?us-ascii?Q?bGA/YKPSwdCvcYrUIM3jyUgCO6BnV1wb5GbBLUA32hCH1R2Dsu5gIUCZdFrn?=
 =?us-ascii?Q?twMKKO2erMt1d3taJZer3IiTydp94Wgn?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 21:53:41.4977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4133c8c5-35a0-4d6a-a27c-08dc96f39bdc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314

The Orin NX and Orin Nano boards share a common carrier board and the
module boards for both platforms are very similar. Therefore,
restructure the Orin NX/Nano device-tree source files to adhere to a
simple hierarchical format. This will help make clear where changes
should go, and eliminates redundancy within the files.

Previously the carrier board file was independent. However, given
that it is so tightly coupled with the module design, it will be
more practical to combine files together for a simpler layout.

Following changes are made to restructure the device tree source files:
1) Change include hierarchy. Top-level dts includes board dtsi.
   Board dtsi includes module dtsi. Module dtsi includes SoC dtsi.
2) Data from the top level dts file that is common to both Orin NX
   and Orin Nano is in tegra234-p3768-0000+p3767.dtsi.
3) Only data that is unique to NX/Nano is present in the top-level dts.

Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
---

Changes in V2 includes removal of Gerrit Change-ID.

 .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 77 +------------------
 .../nvidia/tegra234-p3768-0000+p3767-0005.dts | 32 +-------
 ...00.dtsi => tegra234-p3768-0000+p3767.dtsi} | 28 ++++++-
 3 files changed, 29 insertions(+), 108 deletions(-)
 rename arch/arm64/boot/dts/nvidia/{tegra234-p3768-0000.dtsi => tegra234-p3768-0000+p3767.dtsi} (90%)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 1607ee14216f..82a59e33c46c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -1,11 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-#include <dt-bindings/input/linux-event-codes.h>
-#include <dt-bindings/input/gpio-keys.h>
-
-#include "tegra234-p3767.dtsi"
-#include "tegra234-p3768-0000.dtsi"
+#include "tegra234-p3768-0000+p3767.dtsi"
 
 / {
 	compatible = "nvidia,p3768-0000+p3767-0000", "nvidia,p3767-0000", "nvidia,tegra234";
@@ -29,83 +25,12 @@ serial@3140000 {
 			status = "okay";
 		};
 
-		pwm@32a0000 {
-			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
-			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
-			status = "okay";
-		};
-
 		hda@3510000 {
 			nvidia,model = "NVIDIA Jetson Orin NX HDA";
 		};
-
-		padctl@3520000 {
-			status = "okay";
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		key-force-recovery {
-			label = "Force Recovery";
-			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_KEY>;
-			linux,code = <BTN_1>;
-		};
-
-		key-power {
-			label = "Power";
-			gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_KEY>;
-			linux,code = <KEY_POWER>;
-			wakeup-event-action = <EV_ACT_ASSERTED>;
-			wakeup-source;
-		};
-
-		key-suspend {
-			label = "Suspend";
-			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
-			linux,input-type = <EV_KEY>;
-			linux,code = <KEY_SLEEP>;
-		};
-	};
-
-	pwm-fan {
-		cooling-levels = <0 88 187 255>;
-	};
-
-	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_3V3_PCIE";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio_aon TEGRA234_AON_GPIO(AA, 5) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
 	};
 
 	sound {
 		label = "NVIDIA Jetson Orin NX APE";
 	};
-
-	thermal-zones {
-		tj-thermal {
-			cooling-maps {
-				map-active-0 {
-					cooling-device = <&fan 0 1>;
-					trip = <&tj_trip_active0>;
-				};
-
-				map-active-1 {
-					cooling-device = <&fan 1 2>;
-					trip = <&tj_trip_active1>;
-				};
-
-				map-active-2 {
-					cooling-device = <&fan 2 3>;
-					trip = <&tj_trip_active2>;
-				};
-			};
-		};
-	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
index dc2d4bef1e83..631a4d6c0b98 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
@@ -1,11 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-#include <dt-bindings/input/linux-event-codes.h>
-#include <dt-bindings/input/gpio-keys.h>
-
-#include "tegra234-p3767.dtsi"
-#include "tegra234-p3768-0000.dtsi"
+#include "tegra234-p3768-0000+p3767.dtsi"
 
 / {
 	compatible = "nvidia,p3768-0000+p3767-0005", "nvidia,p3767-0005", "nvidia,tegra234";
@@ -16,33 +12,7 @@ hda@3510000 {
 			nvidia,model = "NVIDIA Jetson Orin Nano HDA";
 		};
 	};
-
-	pwm-fan {
-		cooling-levels = <0 88 187 255>;
-	};
-
 	sound {
 		label = "NVIDIA Jetson Orin Nano APE";
 	};
-
-	thermal-zones {
-		tj-thermal {
-			cooling-maps {
-				map-active-0 {
-					cooling-device = <&fan 0 1>;
-					trip = <&tj_trip_active0>;
-				};
-
-				map-active-1 {
-					cooling-device = <&fan 1 2>;
-					trip = <&tj_trip_active1>;
-				};
-
-				map-active-2 {
-					cooling-device = <&fan 2 3>;
-					trip = <&tj_trip_active2>;
-				};
-			};
-		};
-	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
similarity index 90%
rename from arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
rename to arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
index 5d0298b6c30d..6d64a24fa251 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+#include "tegra234-p3767.dtsi"
+
 / {
-	compatible = "nvidia,p3768-0000";
 
 	aliases {
 		serial0 = &tcu;
@@ -210,6 +214,7 @@ fan: pwm-fan {
 		compatible = "pwm-fan";
 		pwms = <&pwm3 0 45334>;
 		#cooling-cells = <2>;
+		cooling-levels = <0 88 187 255>;
 	};
 
 	vdd_1v8_sys: regulator-vdd-1v8-sys {
@@ -241,4 +246,25 @@ vdd_3v3_pcie: regulator-vdd-3v3-pcie {
 	serial {
 		status = "okay";
 	};
+
+	thermal-zones {
+		tj-thermal {
+			cooling-maps {
+				map-active-0 {
+					cooling-device = <&fan 0 1>;
+					trip = <&tj_trip_active0>;
+				};
+
+				map-active-1 {
+					cooling-device = <&fan 1 2>;
+					trip = <&tj_trip_active1>;
+				};
+
+				map-active-2 {
+					cooling-device = <&fan 2 3>;
+					trip = <&tj_trip_active2>;
+				};
+			};
+		};
+	};
 };
-- 
2.25.1

