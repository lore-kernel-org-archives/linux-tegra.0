Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333BE1922E0;
	Fri, 23 Aug 2024 21:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449833; cv=fail; b=BRdrXGF7MmDc0JiqGZ4P1Hrj17Dt+VpJti/RmCPH8ve9TVKGLjfUCNTgj8jSWI5f9Lh+vUqL5o/y2hWBIEa9twrWs0YIO/dM4Yd9nRWfTZhvpgNhChxh/jG1iawY5zQSmiu7iY1f1um10IUzS5yVmzZVJ1H/mCuCJrFgGE/scwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449833; c=relaxed/simple;
	bh=rE/vs7/LDKJnqXIaPdC9FKDbsX5DvD1rOTMGz3x9leU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RR0dBQ0RaaWCSiGEmN5pMOUFQWiQRfqPesL99A3dmRjlNSjDVndVpooWryeE7hW9UXMxtUX9qSLasJW2yl29J16hE6M60jgobnFjJMxQ3+4ZJlzMxWon+chnZVJ1H64wZEwFvBQsg2S+4ReUEcnpuue+KzyBHpnF9ZLidgU5Gjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mHtbdPL+; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mHtbdPL+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kl2mjjOAD2KjOP/qzGFRE3WG91Z/HA5KVFTrqhnB/PJqEpJPWePZFoGlRIOqbgoIVZtdeg+mNzICfqAHK4jK+Vxz4mSLknGLiyE6PD0kAJzoAKMN4stz2h3FfjFzkYUMW9luVePEiSo4JR6K1paT1beVOdBp9DNVa+z0tfNR4LzVVXFchDYFTrKf5zj8yXn7kD4fNuBs2+hqKzkAlh5rJy8O8gGKaCl1hZbd76C7XEq6LS5Xvdxp57hzfKGzOPvUhIWACKXZlylBlRtUnnwpPC8oZXUT22ZkBJTvWspbra3mt24w6OPqGaGX7GI8aWxgpfOQ1nwzCqvoxAX5PB2RRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpHWWL6B8/5/mR+Ij94x20BfazCTUThenf5OHUca7vo=;
 b=S5SC0aW07hwZ6i9m/qrMUK+kZ5ZuTsixKpW/TX7cABNSxtvCz+is3ho0H0DeLOsGBKLOJjpYde8T1hskVhAfZv0KS8olxRMCXPo93ph0yly8ALwmyaB3ZE6iNSrMetAnoosqHETVitcJlmb3Ap9Jw0JLUqR56I90qKyFgdPHw0+V7bZKkfXgO8Vr0sWDi/iCTu7f/z0rSMsZOGPf8OVRY/hEIGB/95MlviuqoxiQQDvCfTqJLOA/ty8dWSjJ31qzd8YyU6Oeg9mQWjYPmk/jrzF7y2+xvv1ZdOVnR11KzTiQLXKgbfxSdVZkzL+xVmdILf1kOUcgIT/kStJJVRzihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpHWWL6B8/5/mR+Ij94x20BfazCTUThenf5OHUca7vo=;
 b=mHtbdPL+gqdw09cA++gMw15No8+VrZipFtODnvz+RPKnG56b56TLLrX4AmcuexoEk5gtwAKm9MdgooR+oeGuUaVKyP1ktc7Qd9WWLhTlTHcEZIZAGHDk+Gh/ANKXKEWlhDZYr97L+oxq9ZxfnZqAyekO1plDDfYfNoC+Uk9D/d7iUMtFqvMcLOFe6ligNkOwXsys5+mj/1euv5F1wzUFeq/1OfyCqBmNe4m3JET48yqoyTjISGUsANVo4ePxwSEJDMl9KXfCg3kE1BIfmnKIwlemPXlvy+/4UQGkrzAR49/Iu7WNfoCWB9BkpNy3/ogNk5AUsukWwQBUilLS+WbuNQ==
Received: from CH0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:76::20)
 by PH7PR12MB5594.namprd12.prod.outlook.com (2603:10b6:510:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 21:50:29 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::8a) by CH0PR04CA0015.outlook.office365.com
 (2603:10b6:610:76::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 21:50:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 21:50:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:15 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 14:50:14 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 14:50:14 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 1/7] arm64: tegra: Combine AGX Orin board files
Date: Fri, 23 Aug 2024 21:49:51 +0000
Message-ID: <20240823214957.771297-2-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|PH7PR12MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f7546e-0bfe-4249-6f9b-08dcc3bd9a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W5ZoxfRDhSSCVbIUpZa8k7Z2hVy0+m8xnvE9pJKKiS9OSEH30MYZ0A3PKcbD?=
 =?us-ascii?Q?kH942LYPQrb1FtjpcLZnqkNKu9aB3Tc0sdUbXHjmBcNgN0EMwDb52kpFvKbl?=
 =?us-ascii?Q?0NA/E8mK85/N5FrrEY/r2Zy8Psdb2rPxLEEswU6pi+ZskUtbv2yR7gLC2XS/?=
 =?us-ascii?Q?jOJ0YWZfmt8YbabW7yyaO47UEBQTW8QfPtqonBXUk18KXpf7YFw2g1e7JIQ1?=
 =?us-ascii?Q?yGsAjpastY1GZ8WIyPfMvcMBBVVJWmyeNdX/+SfHyqzdNKZP9chNnBz6jOkk?=
 =?us-ascii?Q?ZeiPU1oUs7KmZcoPP6fhQuevgWPblKjm8C2tFyfsnZbP9R4lqgJcDsnvEYp+?=
 =?us-ascii?Q?Yz9W+bbeRZVUZpzXQYuYmULsW6XdrzNYPfhBjOc0rRP+4oRpY/7MbH6aKOEu?=
 =?us-ascii?Q?QT0/+M5K008tNc/ZKGH4D42D12sxItDcBb9Xc11kTo3B/xE1GRKchWHyIXkc?=
 =?us-ascii?Q?1ydVmwjbyh8vzrWYPua8g++JaS0EYReA7WUVb+K3NrdMToCR7Qks8kScPhJK?=
 =?us-ascii?Q?lKO9Jce+vZpW3cZA5hOfYGhYRHCPjlSkDGmy38mLFvt1+Koy8l1I+5JR45g9?=
 =?us-ascii?Q?+POMoZAETf2sLir3+k23pN+dHW49PB8w3e6/+/kN4mo7Mv2D8Zwgmjp7O9Ph?=
 =?us-ascii?Q?jveTBpyT3uSjCvgUL/QWJBme4YwLxcQWrJlstyWOQDP7nabAraibwXeBdPC7?=
 =?us-ascii?Q?LZoPNOvjE9fC669sofc86vu8twLMgZk9eXZyVwrqfLRASiLHxjt2TMDvAjZN?=
 =?us-ascii?Q?uJqmT6HfdtrVoHxgF4TzFwnm7bz7E+ZwYp9YV7y9j0uvNYKN9pOaKjxCkfSg?=
 =?us-ascii?Q?Y1xlxPB0wYNjrPxMdgNkA1Sf84l52McA1SjWIZ0HWEVBdoU7DqKzZzCOqanV?=
 =?us-ascii?Q?8DztK91cKt1FMguzZ/QfoO762nVI38qQYUXgrVhi+vC4rS8aaDfvyKv3iabw?=
 =?us-ascii?Q?NCdJLufnN/Aob9P9JDlEMkegAOMjbh8OO2Z1x5KYdlCyfFIe0/N0M28xiFnW?=
 =?us-ascii?Q?E7mGURuGq+CXQEhlUJsXTbjew3JVEOzD6WLf0sRHSHEOb4818ePI76QQxsth?=
 =?us-ascii?Q?a0k67KhXyElYt9HRwD+gwZgHVznb6FgUnPY5XxiPqiTrwoH9zrAO3muMqcQL?=
 =?us-ascii?Q?nb2+UhiGKqIW85d2r8hqYZKnUgm2wHbVJ3l1mfuIF6kqaV63wyiH4Qw+Q1TN?=
 =?us-ascii?Q?hrGZTtfGh76LFo0HRPtylbRLu70Ech9TB4L8XuI6jdlQRIJdwa7i819Uwqgx?=
 =?us-ascii?Q?dGIvT1epbgMDcFMn4dpvLdgBvvq6jHAqUfy6jOmTBQsQ63mtZ2n0AtduE8g9?=
 =?us-ascii?Q?+SM1jX7uEjJdaHVzFEqAu0Kvit1iFZZfF6YLke5LdnZDW/3b1soYObt5FBhE?=
 =?us-ascii?Q?mvt95brM+B7ZBwUQAhm3NcL3iAfyvb1OhXuUqIeqX6jjbaHhxQLowcSqMXws?=
 =?us-ascii?Q?XoU07XGIGmE6H3yKltaZP/1cBOYFecvD?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 21:50:28.4623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f7546e-0bfe-4249-6f9b-08dcc3bd9a65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5594

The current AGX Orin structure has both a top-level module+board
file as well as a board file. Most of the data in the board-file
is closely related to the module itself. The benefit of this
extra file is outweighed by the additional complexity. Merge
the board file into the module+board file for simplicity.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 82 ++++++++++++++++-
 .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  | 90 -------------------
 2 files changed, 80 insertions(+), 92 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 69db584253da..21feaf434439 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -3,9 +3,9 @@
 
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/sound/rt5640.h>
 
 #include "tegra234-p3701-0000.dtsi"
-#include "tegra234-p3737-0000.dtsi"
 
 / {
 	model = "NVIDIA Jetson AGX Orin Developer Kit";
@@ -22,23 +22,90 @@
 	};
 
 	bus@0 {
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
 		serial@3100000 {
 			compatible = "nvidia,tegra194-hsuart";
 			reset-names = "serial";
 			status = "okay";
 		};
 
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
 		serial@31d0000 {
 			current-speed = <115200>;
 			status = "okay";
 		};
 
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
 		pwm@32a0000 {
 			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			status = "okay";
 		};
 
+		pwm@32c0000 {
+			status = "okay";
+		};
+
+		pwm@32f0000 {
+			status = "okay";
+		};
+
 		hda@3510000 {
 			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
 			status = "okay";
@@ -341,8 +408,11 @@
 		};
 	};
 
-	pwm-fan {
+	fan: pwm-fan {
+		compatible = "pwm-fan";
 		cooling-levels = <66 215 255>;
+		pwms = <&pwm3 0 45334>;
+		#cooling-cells = <2>;
 	};
 
 	serial {
@@ -444,4 +514,12 @@
 			};
 		};
 	};
+
+	vdd_1v8_sys: regulator-vdd-1v8-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_SYS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
deleted file mode 100644
index eb79e80a9852..000000000000
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
+++ /dev/null
@@ -1,90 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <dt-bindings/sound/rt5640.h>
-
-/ {
-	compatible = "nvidia,p3737-0000";
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
-		pwm@32c0000 {
-			status = "okay";
-		};
-
-		pwm@32f0000 {
-			status = "okay";
-		};
-	};
-
-	fan: pwm-fan {
-		compatible = "pwm-fan";
-		pwms = <&pwm3 0 45334>;
-		#cooling-cells = <2>;
-	};
-
-	vdd_1v8_sys: regulator-vdd-1v8-sys {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_SYS";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-};
-- 
2.17.1

