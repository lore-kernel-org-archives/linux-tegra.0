Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1EB1A08A9;
	Fri, 23 Aug 2024 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449899; cv=fail; b=rGtFPhchHlAltJIphVEs1UOTGlgENv0qKcR21XmNbM/57uOfZ+zjQK96tDaxh4AHG/ntuQHV7olDzzJwJuOydnO8m4LCbrkmFy0CTtqH4bFG/SO+BaWuHaZHSD8j+s16+YjY3lO4uSBrq1ulTwie6TAXgsyJIpOnrytTHfYMdu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449899; c=relaxed/simple;
	bh=46W1jvBwbip5KndiEv4kB+dmDuuCdCl9nrzkMhYXDtI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvrwMz2j5C0RCbh5dCcJ1kF1egoSKgSwNPGWzOq6nPLlKavAkE6/TJObvWsxF9j4rXz6RaYCjBnkV9KSbbU+8WW4155dRyJP+W6nYBdf8W8SSzpUZX+rK4ER2NpWVS6XnVnYvCXoGwdUpahxkRg5la38QHOuxTytDiX/LWIJaOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aimz11eu; arc=fail smtp.client-ip=40.107.243.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aimz11eu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MffZg8QcpWRRMXS2x0woo3sNCVPX1t7/nXp1kDQX92KCFj8L5qoeGT8KxTsRFFpbf/xtv8bh09U2hMsRJJDK3hRBCvFALTweB2GhF5jYmaYveHvkNeh/0tgyo8ZInMX4nDEA9vl3X+sSaf2i5EdSHYdnfek4G2Gq9s80Yg4jqh/V4+bdmV5ddVP2JOTZANel6E2dy/tzkFgjUu2ByInkSwnsmGbet+DksFgDaoTfHHpdswNN3nzYyhOwXaqLrp8pYbMeoWxleFWuArQS/a4qD0R7gQmGYbYwPfa/0Bk0DOIYG4CvdDZcC4sQAFsQVxu4QSJg3+/ruBaXcFK8hCcLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRga10uTDz5wdqvk5cFdOeF0V2Zr0bsdnQVOdwgpdtM=;
 b=Jq22sMj9JpFcR1PvEWE+Kn5CpeJvoaIYxCgjnhz0LP/wEHooDZabRABaiTDDQeFJIjoU2FctW4SYtZZvQs5Bvrm3wdzDIK9GM+DaS9BBihA45UxMoAeuRuORT6pySyNMr/ZVwq1pw4oizCUN2UuH5dcupdtNsd7vwe/i6t4YR0m0NGHZILRrZP9ZTbc34HphFP7J2GqGTgpWEGK9l89AT6hYM1E16VYMjQNS+RpMZIG6QdJs+vRRWsmfebMiZZRq4+s0Q7T5TEheC5spZJy+C6FzFCECorUe8Vq8tTHHOXmjnGdjmqcSDZeFepisQ3qDvTT1dsJILXvC0gjh9VBeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRga10uTDz5wdqvk5cFdOeF0V2Zr0bsdnQVOdwgpdtM=;
 b=aimz11euKWXgIP5hmQvaP5JE5LXAnOTdcWx5xxyZNwQndqbOdxgJVFI0RM8c1CpNRLrOdNhTPoY9WeajRP3VOEYh66ucaoQ0epMBVm25GtQ3R9cr/Q9joAEKQ2+gffA56yDpNXa+h2h1fd+bjO5yMWYbs9y4WGivZEsQ2nreMT5k3CDV2TuyyYE3lwlPZHusmXqVRMqV26dBXp8rnStJTogUfe73BYe/xNewLrgQemK5XeyHh5hQ8wQ1Ei/LEoe3R3TpHSBYoRTgDKD7CquUTl4PvEuKMmPHvLa55ru4broRtY3c+MWp5uN0aEIohPcXWTZk2PAqhpLo30s9DFpNxg==
Received: from BN9PR03CA0326.namprd03.prod.outlook.com (2603:10b6:408:112::31)
 by PH8PR12MB6722.namprd12.prod.outlook.com (2603:10b6:510:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 21:51:32 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::e4) by BN9PR03CA0326.outlook.office365.com
 (2603:10b6:408:112::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 21:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 21:51:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:51:18 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:51:18 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 14:51:18 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 7/7] arm64: tegra: Create SKU8 AGX Orin board file
Date: Fri, 23 Aug 2024 21:49:57 +0000
Message-ID: <20240823214957.771297-8-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|PH8PR12MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 462fce38-0b7d-47fe-ca71-08dcc3bdc000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bcn7Oxwbv6/UdCiOqNWnKB+eTXrcIGjbkneWXk3gmaSunh1wexDHXkGP/Sbt?=
 =?us-ascii?Q?mmleA+JxdX+LsoYfKH9ErRMK3mu7wYlZI222xdyz3r1GMM0YeL1lTWyzElMf?=
 =?us-ascii?Q?4a7jH5XSorV+mULRYnJCt3I5uxWdxCNnBafCTra8R68rHE64QyGLZyZYLd7R?=
 =?us-ascii?Q?gpq/UDtMqM0R3YBj/rN6Yxd30KPd6w9/EjC6Y46A3x8xseZB2AFr9B7KpYnz?=
 =?us-ascii?Q?4sxcGlUljr4tTtj9mD5W1wL/I9iJfdFz7MCD5qYS5+WdUZTSneN0OdiYE2D4?=
 =?us-ascii?Q?B1A8ahmB4U/v4yHAHk1kmXsGdDL/ys64TuNS/uw6hn2KgWlcz4JHLLLFaOon?=
 =?us-ascii?Q?TIugsuVNkxJolY4h33w80RhADR4bJmVGZEI4fkp5etZqWZxn8ywN+tDJ5fCU?=
 =?us-ascii?Q?+vubGaBGAhneorAiOkVlcf8J+LANv/XxeKauaV7mPsU53KEaXNarEyPrezGW?=
 =?us-ascii?Q?xT9WNbUll3Gd0odtKcDTGCqaRuMazLLclAobvjqrx8TgOrE2GyEdlzhKHRfd?=
 =?us-ascii?Q?zaBdnonp3m/BSKBqQyCMB7j8lxXb3wgY0LfkwIBpfPhqb9g/N1Px0OTghpUp?=
 =?us-ascii?Q?Boxat10COClMJ/KkfLXeGCah/P8GgRkoaRiokGk4s4iei0hmh61ZDcnbPJDC?=
 =?us-ascii?Q?POUUVjoQ42JKrMsaosQ8O712lCpJfhQDiQvRM4K1gsxlQhxVF7WW3hhDmbOT?=
 =?us-ascii?Q?Qrvi1Q254kwMiJr9oeYnt70JIKC4m9uiijss+cqti2HgRVoEIhqRwNec9w4l?=
 =?us-ascii?Q?a4qrbV0dDmOeU6DVX+BdabILaaT/cvnkjUrZMJsIBnaMckWE4Hv9SkTtMfEr?=
 =?us-ascii?Q?CbWAr9nfhkofnP0HNd10VAy9rNxAqlcOW4PuL+bUQOAzsjrmDuoEqdd/und+?=
 =?us-ascii?Q?C02z7Dr+WRUYE/UnUkSR6niBoYopNIZwFl4X7UlYkUJk0a6EM0bHpKqe9k++?=
 =?us-ascii?Q?WZFE81TSDP+mXsZJxsMqSqvKgwqlv6HD99vyBIe9NfAKWWOby7b61+m4YAcy?=
 =?us-ascii?Q?3dnjTRmZxafea3k7vTHYj7UKIeL2d0RNS9N6Kgv34i08Irda1SL6AIWYAFLv?=
 =?us-ascii?Q?6UFEHFYDNGqzf/Ug7ruFuqLoNkGqnZiKFub9s/UUICINvCDsAfCid6d+xx0h?=
 =?us-ascii?Q?5bw9szjrZ+BR9IvP5ULEyxirBxuEzVXN14hfCzxNgHXixC9UTIo4adVrcIi9?=
 =?us-ascii?Q?W5qDLo1groCWumZKDm2qcMVSk70YgOdj703cwVfAY0h+ihYQWbCsyc2NHMUE?=
 =?us-ascii?Q?spiwlFAdS7hxtTCGZzusf/PJJG2xgSJGI6jN/J47ENXY6/iNFXT8BA8fp4YL?=
 =?us-ascii?Q?z6WVr3w2DAFQ36nn5/81jIxCcAL8zxdVBNYqb3ps9n63aef9Uc+zC2BAZ89V?=
 =?us-ascii?Q?lIT6ZnKvXH6lR34NwtgGyy4ci0JIBWkpCRG3TqH5EnLfTqRdRS/5vRU1v0eI?=
 =?us-ascii?Q?h2ZQPg3NADsLfZvH4osVJyz4PrVtpXaB?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 21:51:31.5092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462fce38-0b7d-47fe-ca71-08dcc3bdc000
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6722

The existing tegra234-p3737-0000+p3701-0000.dtb is compatible
with the following modules:

p3701-0000
p3701-0004
p3701-0005

Add support for p3701-0008. Move data that is common to all SKUs
to a new file called tegra234-p3737-0000+p3701.dtsi. Update
Makefile and yaml files.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 544 +----------------
 .../nvidia/tegra234-p3737-0000+p3701-0008.dts |  11 +
 .../dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 ++++++++++++++++++
 5 files changed, 566 insertions(+), 542 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 8fb4923517d0..e108ef0cde86 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -175,6 +175,11 @@ properties:
           - const: nvidia,p3737-0000+p3701-0000
           - const: nvidia,p3701-0000
           - const: nvidia,tegra234
+      - description: Jetson AGX Orin Developer Kit with Industrial Module
+        items:
+          - const: nvidia,p3737-0000+p3701-0008
+          - const: nvidia,p3701-0008
+          - const: nvidia,tegra234
       - description: NVIDIA IGX Orin Development Kit
         items:
           - const: nvidia,p3740-0002+p3701-0008
diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index c38c809fe577..0fbb8a494dba 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0005.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 90f12277aede..4c0e96f9d493 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -1,551 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
-#include <dt-bindings/input/linux-event-codes.h>
-#include <dt-bindings/input/gpio-keys.h>
-#include <dt-bindings/sound/rt5640.h>
-
+// Module files must be included first
 #include "tegra234-p3701-0000.dtsi"
+#include "tegra234-p3737-0000+p3701.dtsi"
 
 / {
 	model = "NVIDIA Jetson AGX Orin Developer Kit";
 	compatible = "nvidia,p3737-0000+p3701-0000", "nvidia,p3701-0000", "nvidia,tegra234";
-
-	aliases {
-		serial0 = &tcu;
-		serial1 = &uarta;
-	};
-
-	chosen {
-		bootargs = "console=ttyTCU0,115200n8";
-		stdout-path = "serial0:115200n8";
-	};
-
-	bus@0 {
-		aconnect@2900000 {
-			ahub@2900800 {
-				i2s@2901000 {
-					ports {
-						port@1 {
-							endpoint {
-								dai-format = "i2s";
-								remote-endpoint = <&rt5640_ep>;
-							};
-						};
-					};
-				};
-			};
-		};
-
-		serial@3100000 {
-			compatible = "nvidia,tegra194-hsuart";
-			reset-names = "serial";
-			status = "okay";
-		};
-
-		i2c@3160000 {
-			status = "okay";
-
-			eeprom@56 {
-				compatible = "atmel,24c02";
-				reg = <0x56>;
-
-				label = "system";
-				vcc-supply = <&vdd_1v8_sys>;
-				address-width = <8>;
-				pagesize = <8>;
-				size = <256>;
-				read-only;
-			};
-		};
-
-		serial@31d0000 {
-			current-speed = <115200>;
-			status = "okay";
-		};
-
-		i2c@31e0000 {
-			status = "okay";
-
-			audio-codec@1c {
-				compatible = "realtek,rt5640";
-				reg = <0x1c>;
-				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
-				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
-				clock-names = "mclk";
-				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
-				realtek,dmic2-data-pin = <RT5640_DMIC2_DATA_PIN_NONE>;
-				realtek,jack-detect-source = <RT5640_JD_SRC_HDA_HEADER>;
-				sound-name-prefix = "CVB-RT";
-
-				port {
-					rt5640_ep: endpoint {
-						remote-endpoint = <&i2s1_dap>;
-						mclk-fs = <256>;
-					};
-				};
-			};
-		};
-
-		pwm@3280000 {
-			status = "okay";
-		};
-
-		pwm@32a0000 {
-			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
-			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
-			status = "okay";
-		};
-
-		pwm@32c0000 {
-			status = "okay";
-		};
-
-		pwm@32f0000 {
-			status = "okay";
-		};
-
-		mmc@3400000 {
-			status = "okay";
-			bus-width = <4>;
-			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
-			disable-wp;
-		};
-
-		hda@3510000 {
-			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
-			status = "okay";
-		};
-
-		padctl@3520000 {
-			status = "okay";
-
-			pads {
-				usb2 {
-					lanes {
-						usb2-0 {
-							status = "okay";
-						};
-
-						usb2-1 {
-							status = "okay";
-						};
-
-						usb2-2 {
-							status = "okay";
-						};
-
-						usb2-3 {
-							status = "okay";
-						};
-					};
-				};
-
-				usb3 {
-					lanes {
-						usb3-0 {
-							status = "okay";
-						};
-
-						usb3-1 {
-							status = "okay";
-						};
-
-						usb3-2 {
-							status = "okay";
-						};
-					};
-				};
-			};
-
-			ports {
-				usb2-0 {
-					mode = "otg";
-					usb-role-switch;
-					status = "okay";
-
-					port {
-						hs_typec_p1: endpoint {
-							remote-endpoint = <&hs_ucsi_ccg_p1>;
-						};
-					};
-				};
-
-				usb2-1 {
-					mode = "host";
-					status = "okay";
-
-					port {
-						hs_typec_p0: endpoint {
-							remote-endpoint = <&hs_ucsi_ccg_p0>;
-						};
-					};
-				};
-
-				usb2-2 {
-					mode = "host";
-					status = "okay";
-				};
-
-				usb2-3 {
-					mode = "host";
-					status = "okay";
-				};
-
-				usb3-0 {
-					nvidia,usb2-companion = <1>;
-					status = "okay";
-
-					port {
-						ss_typec_p0: endpoint {
-							remote-endpoint = <&ss_ucsi_ccg_p0>;
-						};
-					};
-				};
-
-				usb3-1 {
-					nvidia,usb2-companion = <0>;
-					status = "okay";
-
-					port {
-						ss_typec_p1: endpoint {
-							remote-endpoint = <&ss_ucsi_ccg_p1>;
-						};
-					};
-				};
-
-				usb3-2 {
-					nvidia,usb2-companion = <3>;
-					status = "okay";
-				};
-			};
-		};
-
-		usb@3550000 {
-			status = "okay";
-
-			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
-			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
-			phy-names = "usb2-0", "usb3-0";
-		};
-
-		usb@3610000 {
-			status = "okay";
-
-			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
-			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
-			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
-			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
-			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
-			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
-			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
-				    "usb3-0", "usb3-1", "usb3-2";
-		};
-
-		ethernet@6800000 {
-			status = "okay";
-
-			phy-handle = <&mgbe0_phy>;
-			phy-mode = "10gbase-r";
-
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				mgbe0_phy: phy@0 {
-					compatible = "ethernet-phy-ieee802.3-c45";
-					reg = <0x0>;
-
-					#phy-cells = <0>;
-				};
-			};
-		};
-
-		i2c@c240000 {
-			status = "okay";
-
-			typec@8 {
-				compatible = "cypress,cypd4226";
-				reg = <0x08>;
-				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
-				firmware-name = "nvidia,jetson-agx-xavier";
-				status = "okay";
-
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				ccg_typec_con0: connector@0 {
-					compatible = "usb-c-connector";
-					reg = <0>;
-					label = "USB-C";
-					data-role = "host";
-
-					ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port@0 {
-							reg = <0>;
-
-							hs_ucsi_ccg_p0: endpoint {
-								remote-endpoint = <&hs_typec_p0>;
-							};
-						};
-
-						port@1 {
-							reg = <1>;
-
-							ss_ucsi_ccg_p0: endpoint {
-								remote-endpoint = <&ss_typec_p0>;
-							};
-						};
-					};
-				};
-
-				ccg_typec_con1: connector@1 {
-					compatible = "usb-c-connector";
-					reg = <1>;
-					label = "USB-C";
-					data-role = "dual";
-
-					ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port@0 {
-							reg = <0>;
-
-							hs_ucsi_ccg_p1: endpoint {
-								remote-endpoint = <&hs_typec_p1>;
-							};
-						};
-
-						port@1 {
-							reg = <1>;
-
-							ss_ucsi_ccg_p1: endpoint {
-								remote-endpoint = <&ss_typec_p1>;
-							};
-						};
-					};
-				};
-			};
-		};
-
-		pcie@14100000 {
-			status = "okay";
-
-			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
-
-			phys = <&p2u_hsio_3>;
-			phy-names = "p2u-0";
-		};
-
-		pcie@14160000 {
-			status = "okay";
-
-			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
-
-			phys = <&p2u_hsio_4>, <&p2u_hsio_5>, <&p2u_hsio_6>,
-			       <&p2u_hsio_7>;
-			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
-		};
-
-		pcie@141a0000 {
-			status = "okay";
-
-			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
-			vpcie3v3-supply = <&vdd_3v3_pcie>;
-			vpcie12v-supply = <&vdd_12v_pcie>;
-
-			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
-			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-				    "p2u-5", "p2u-6", "p2u-7";
-		};
-
-		pcie-ep@141a0000 {
-			status = "disabled";
-
-			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
-
-			reset-gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
-
-			nvidia,refclk-select-gpios = <&gpio_aon
-						      TEGRA234_AON_GPIO(AA, 4)
-						      GPIO_ACTIVE_HIGH>;
-
-			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
-			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-				    "p2u-5", "p2u-6", "p2u-7";
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		status = "okay";
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
-	fan: pwm-fan {
-		compatible = "pwm-fan";
-		cooling-levels = <66 215 255>;
-		pwms = <&pwm3 0 45334>;
-		#cooling-cells = <2>;
-	};
-
-	serial {
-		status = "okay";
-	};
-
-	sound {
-		compatible = "nvidia,tegra186-audio-graph-card";
-		status = "okay";
-
-		dais = /* ADMAIF (FE) Ports */
-		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
-		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>, <&admaif7_port>,
-		       <&admaif8_port>, <&admaif9_port>, <&admaif10_port>, <&admaif11_port>,
-		       <&admaif12_port>, <&admaif13_port>, <&admaif14_port>, <&admaif15_port>,
-		       <&admaif16_port>, <&admaif17_port>, <&admaif18_port>, <&admaif19_port>,
-		       /* XBAR Ports */
-		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s4_port>,
-		       <&xbar_i2s6_port>, <&xbar_dmic3_port>,
-		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
-		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
-		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
-		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
-		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
-		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
-		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
-		       <&xbar_amx3_in1_port>, <&xbar_amx3_in2_port>,
-		       <&xbar_amx3_in3_port>, <&xbar_amx3_in4_port>,
-		       <&xbar_amx4_in1_port>, <&xbar_amx4_in2_port>,
-		       <&xbar_amx4_in3_port>, <&xbar_amx4_in4_port>,
-		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
-		       <&xbar_adx3_in_port>, <&xbar_adx4_in_port>,
-		       <&xbar_mix_in1_port>, <&xbar_mix_in2_port>,
-		       <&xbar_mix_in3_port>, <&xbar_mix_in4_port>,
-		       <&xbar_mix_in5_port>, <&xbar_mix_in6_port>,
-		       <&xbar_mix_in7_port>, <&xbar_mix_in8_port>,
-		       <&xbar_mix_in9_port>, <&xbar_mix_in10_port>,
-		       <&xbar_asrc_in1_port>, <&xbar_asrc_in2_port>,
-		       <&xbar_asrc_in3_port>, <&xbar_asrc_in4_port>,
-		       <&xbar_asrc_in5_port>, <&xbar_asrc_in6_port>,
-		       <&xbar_asrc_in7_port>,
-		       <&xbar_ope1_in_port>,
-		       /* HW accelerators */
-		       <&sfc1_out_port>, <&sfc2_out_port>,
-		       <&sfc3_out_port>, <&sfc4_out_port>,
-		       <&mvc1_out_port>, <&mvc2_out_port>,
-		       <&amx1_out_port>, <&amx2_out_port>,
-		       <&amx3_out_port>, <&amx4_out_port>,
-		       <&adx1_out1_port>, <&adx1_out2_port>,
-		       <&adx1_out3_port>, <&adx1_out4_port>,
-		       <&adx2_out1_port>, <&adx2_out2_port>,
-		       <&adx2_out3_port>, <&adx2_out4_port>,
-		       <&adx3_out1_port>, <&adx3_out2_port>,
-		       <&adx3_out3_port>, <&adx3_out4_port>,
-		       <&adx4_out1_port>, <&adx4_out2_port>,
-		       <&adx4_out3_port>, <&adx4_out4_port>,
-		       <&mix_out1_port>, <&mix_out2_port>, <&mix_out3_port>,
-		       <&mix_out4_port>, <&mix_out5_port>,
-		       <&asrc_out1_port>, <&asrc_out2_port>, <&asrc_out3_port>,
-		       <&asrc_out4_port>, <&asrc_out5_port>, <&asrc_out6_port>,
-		       <&ope1_out_port>,
-		       /* BE I/O Ports */
-		       <&i2s1_port>, <&i2s2_port>, <&i2s4_port>, <&i2s6_port>,
-		       <&dmic3_port>;
-
-		label = "NVIDIA Jetson AGX Orin APE";
-
-		widgets = "Microphone",	"CVB-RT MIC Jack",
-			  "Microphone",	"CVB-RT MIC",
-			  "Headphone",	"CVB-RT HP Jack",
-			  "Speaker",	"CVB-RT SPK";
-
-		routing = /* I2S1 <-> RT5640 */
-			  "CVB-RT AIF1 Playback",	"I2S1 DAP-Playback",
-			  "I2S1 DAP-Capture",		"CVB-RT AIF1 Capture",
-			  /* RT5640 codec controls */
-			  "CVB-RT HP Jack",		"CVB-RT HPOL",
-			  "CVB-RT HP Jack",		"CVB-RT HPOR",
-			  "CVB-RT IN1P",		"CVB-RT MIC Jack",
-			  "CVB-RT IN2P",		"CVB-RT MIC Jack",
-			  "CVB-RT SPK",			"CVB-RT SPOLP",
-			  "CVB-RT SPK",			"CVB-RT SPORP",
-			  "CVB-RT DMIC1",		"CVB-RT MIC",
-			  "CVB-RT DMIC2",		"CVB-RT MIC";
-	};
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
-			};
-		};
-	};
-
-	vdd_1v8_sys: regulator-vdd-1v8-sys {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_SYS";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
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
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
new file mode 100644
index 000000000000..979f085691a1
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+// Module files must be included first
+#include "tegra234-p3701-0008.dtsi"
+#include "tegra234-p3737-0000+p3701.dtsi"
+
+/ {
+	model = "NVIDIA Jetson AGX Orin Developer Kit";
+	compatible = "nvidia,p3737-0000+p3701-0008", "nvidia,p3701-0008", "nvidia,tegra234";
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
new file mode 100644
index 000000000000..f6cad29355e6
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
@@ -0,0 +1,547 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/clock/tegra234-clock.h>
+#include <dt-bindings/gpio/tegra234-gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/sound/rt5640.h>
+
+/ {
+	aliases {
+		serial0 = &tcu;
+		serial1 = &uarta;
+	};
+
+	chosen {
+		bootargs = "console=ttyTCU0,115200n8";
+		stdout-path = "serial0:115200n8";
+	};
+
+	bus@0 {
+		aconnect@2900000 {
+			ahub@2900800 {
+				i2s@2901000 {
+					ports {
+						port@1 {
+							endpoint {
+								dai-format = "i2s";
+								remote-endpoint = <&rt5640_ep>;
+							};
+						};
+					};
+				};
+			};
+		};
+
+		serial@3100000 {
+			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
+			status = "okay";
+		};
+
+		i2c@3160000 {
+			status = "okay";
+
+			eeprom@56 {
+				compatible = "atmel,24c02";
+				reg = <0x56>;
+
+				label = "system";
+				vcc-supply = <&vdd_1v8_sys>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
+		serial@31d0000 {
+			current-speed = <115200>;
+			status = "okay";
+		};
+
+		i2c@31e0000 {
+			status = "okay";
+
+			audio-codec@1c {
+				compatible = "realtek,rt5640";
+				reg = <0x1c>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
+				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
+				clock-names = "mclk";
+				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
+				realtek,dmic2-data-pin = <RT5640_DMIC2_DATA_PIN_NONE>;
+				realtek,jack-detect-source = <RT5640_JD_SRC_HDA_HEADER>;
+				sound-name-prefix = "CVB-RT";
+
+				port {
+					rt5640_ep: endpoint {
+						remote-endpoint = <&i2s1_dap>;
+						mclk-fs = <256>;
+					};
+				};
+			};
+		};
+
+		pwm@3280000 {
+			status = "okay";
+		};
+
+		pwm@32a0000 {
+			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			status = "okay";
+		};
+
+		pwm@32c0000 {
+			status = "okay";
+		};
+
+		pwm@32f0000 {
+			status = "okay";
+		};
+
+		mmc@3400000 {
+			status = "okay";
+			bus-width = <4>;
+			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
+			disable-wp;
+		};
+
+		hda@3510000 {
+			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
+			status = "okay";
+		};
+
+		padctl@3520000 {
+			status = "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-0 {
+							status = "okay";
+						};
+
+						usb2-1 {
+							status = "okay";
+						};
+
+						usb2-2 {
+							status = "okay";
+						};
+
+						usb2-3 {
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							status = "okay";
+						};
+
+						usb3-1 {
+							status = "okay";
+						};
+
+						usb3-2 {
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-0 {
+					mode = "otg";
+					usb-role-switch;
+					status = "okay";
+
+					port {
+						hs_typec_p1: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p1>;
+						};
+					};
+				};
+
+				usb2-1 {
+					mode = "host";
+					status = "okay";
+
+					port {
+						hs_typec_p0: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p0>;
+						};
+					};
+				};
+
+				usb2-2 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-3 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb3-0 {
+					nvidia,usb2-companion = <1>;
+					status = "okay";
+
+					port {
+						ss_typec_p0: endpoint {
+							remote-endpoint = <&ss_ucsi_ccg_p0>;
+						};
+					};
+				};
+
+				usb3-1 {
+					nvidia,usb2-companion = <0>;
+					status = "okay";
+
+					port {
+						ss_typec_p1: endpoint {
+							remote-endpoint = <&ss_ucsi_ccg_p1>;
+						};
+					};
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion = <3>;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@3550000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
+			phy-names = "usb2-0", "usb3-0";
+		};
+
+		usb@3610000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+			       <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
+			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
+				    "usb3-0", "usb3-1", "usb3-2";
+		};
+
+		ethernet@6800000 {
+			status = "okay";
+
+			phy-handle = <&mgbe0_phy>;
+			phy-mode = "10gbase-r";
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mgbe0_phy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <0x0>;
+
+					#phy-cells = <0>;
+				};
+			};
+		};
+
+		i2c@c240000 {
+			status = "okay";
+
+			typec@8 {
+				compatible = "cypress,cypd4226";
+				reg = <0x08>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
+				firmware-name = "nvidia,jetson-agx-xavier";
+				status = "okay";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ccg_typec_con0: connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB-C";
+					data-role = "host";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							hs_ucsi_ccg_p0: endpoint {
+								remote-endpoint = <&hs_typec_p0>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+
+							ss_ucsi_ccg_p0: endpoint {
+								remote-endpoint = <&ss_typec_p0>;
+							};
+						};
+					};
+				};
+
+				ccg_typec_con1: connector@1 {
+					compatible = "usb-c-connector";
+					reg = <1>;
+					label = "USB-C";
+					data-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							hs_ucsi_ccg_p1: endpoint {
+								remote-endpoint = <&hs_typec_p1>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+
+							ss_ucsi_ccg_p1: endpoint {
+								remote-endpoint = <&ss_typec_p1>;
+							};
+						};
+					};
+				};
+			};
+		};
+
+		pcie@14100000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+
+			phys = <&p2u_hsio_3>;
+			phy-names = "p2u-0";
+		};
+
+		pcie@14160000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+
+			phys = <&p2u_hsio_4>, <&p2u_hsio_5>, <&p2u_hsio_6>,
+			       <&p2u_hsio_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
+		};
+
+		pcie@141a0000 {
+			status = "okay";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
+			vpcie3v3-supply = <&vdd_3v3_pcie>;
+			vpcie12v-supply = <&vdd_12v_pcie>;
+
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
+
+		pcie-ep@141a0000 {
+			status = "disabled";
+
+			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
+
+			reset-gpios = <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
+
+			nvidia,refclk-select-gpios = <&gpio_aon
+						      TEGRA234_AON_GPIO(AA, 4)
+						      GPIO_ACTIVE_HIGH>;
+
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		status = "okay";
+
+		key-force-recovery {
+			label = "Force Recovery";
+			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_1>;
+		};
+
+		key-power {
+			label = "Power";
+			gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_POWER>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		key-suspend {
+			label = "Suspend";
+			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_SLEEP>;
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <66 215 255>;
+		pwms = <&pwm3 0 45334>;
+		#cooling-cells = <2>;
+	};
+
+	serial {
+		status = "okay";
+	};
+
+	sound {
+		compatible = "nvidia,tegra186-audio-graph-card";
+		status = "okay";
+
+		dais = /* ADMAIF (FE) Ports */
+		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>, <&admaif7_port>,
+		       <&admaif8_port>, <&admaif9_port>, <&admaif10_port>, <&admaif11_port>,
+		       <&admaif12_port>, <&admaif13_port>, <&admaif14_port>, <&admaif15_port>,
+		       <&admaif16_port>, <&admaif17_port>, <&admaif18_port>, <&admaif19_port>,
+		       /* XBAR Ports */
+		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s4_port>,
+		       <&xbar_i2s6_port>, <&xbar_dmic3_port>,
+		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
+		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
+		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
+		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
+		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
+		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
+		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
+		       <&xbar_amx3_in1_port>, <&xbar_amx3_in2_port>,
+		       <&xbar_amx3_in3_port>, <&xbar_amx3_in4_port>,
+		       <&xbar_amx4_in1_port>, <&xbar_amx4_in2_port>,
+		       <&xbar_amx4_in3_port>, <&xbar_amx4_in4_port>,
+		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
+		       <&xbar_adx3_in_port>, <&xbar_adx4_in_port>,
+		       <&xbar_mix_in1_port>, <&xbar_mix_in2_port>,
+		       <&xbar_mix_in3_port>, <&xbar_mix_in4_port>,
+		       <&xbar_mix_in5_port>, <&xbar_mix_in6_port>,
+		       <&xbar_mix_in7_port>, <&xbar_mix_in8_port>,
+		       <&xbar_mix_in9_port>, <&xbar_mix_in10_port>,
+		       <&xbar_asrc_in1_port>, <&xbar_asrc_in2_port>,
+		       <&xbar_asrc_in3_port>, <&xbar_asrc_in4_port>,
+		       <&xbar_asrc_in5_port>, <&xbar_asrc_in6_port>,
+		       <&xbar_asrc_in7_port>,
+		       <&xbar_ope1_in_port>,
+		       /* HW accelerators */
+		       <&sfc1_out_port>, <&sfc2_out_port>,
+		       <&sfc3_out_port>, <&sfc4_out_port>,
+		       <&mvc1_out_port>, <&mvc2_out_port>,
+		       <&amx1_out_port>, <&amx2_out_port>,
+		       <&amx3_out_port>, <&amx4_out_port>,
+		       <&adx1_out1_port>, <&adx1_out2_port>,
+		       <&adx1_out3_port>, <&adx1_out4_port>,
+		       <&adx2_out1_port>, <&adx2_out2_port>,
+		       <&adx2_out3_port>, <&adx2_out4_port>,
+		       <&adx3_out1_port>, <&adx3_out2_port>,
+		       <&adx3_out3_port>, <&adx3_out4_port>,
+		       <&adx4_out1_port>, <&adx4_out2_port>,
+		       <&adx4_out3_port>, <&adx4_out4_port>,
+		       <&mix_out1_port>, <&mix_out2_port>, <&mix_out3_port>,
+		       <&mix_out4_port>, <&mix_out5_port>,
+		       <&asrc_out1_port>, <&asrc_out2_port>, <&asrc_out3_port>,
+		       <&asrc_out4_port>, <&asrc_out5_port>, <&asrc_out6_port>,
+		       <&ope1_out_port>,
+		       /* BE I/O Ports */
+		       <&i2s1_port>, <&i2s2_port>, <&i2s4_port>, <&i2s6_port>,
+		       <&dmic3_port>;
+
+		label = "NVIDIA Jetson AGX Orin APE";
+
+		widgets = "Microphone",	"CVB-RT MIC Jack",
+			  "Microphone",	"CVB-RT MIC",
+			  "Headphone",	"CVB-RT HP Jack",
+			  "Speaker",	"CVB-RT SPK";
+
+		routing = /* I2S1 <-> RT5640 */
+			  "CVB-RT AIF1 Playback",	"I2S1 DAP-Playback",
+			  "I2S1 DAP-Capture",		"CVB-RT AIF1 Capture",
+			  /* RT5640 codec controls */
+			  "CVB-RT HP Jack",		"CVB-RT HPOL",
+			  "CVB-RT HP Jack",		"CVB-RT HPOR",
+			  "CVB-RT IN1P",		"CVB-RT MIC Jack",
+			  "CVB-RT IN2P",		"CVB-RT MIC Jack",
+			  "CVB-RT SPK",			"CVB-RT SPOLP",
+			  "CVB-RT SPK",			"CVB-RT SPORP",
+			  "CVB-RT DMIC1",		"CVB-RT MIC",
+			  "CVB-RT DMIC2",		"CVB-RT MIC";
+	};
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
+			};
+		};
+	};
+
+	vdd_1v8_sys: regulator-vdd-1v8-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_SYS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
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
+};
-- 
2.17.1

