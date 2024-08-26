Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A09F1946B1;
	Mon, 26 Aug 2024 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690886; cv=fail; b=Mn1CZccrCMpYbhKwwAXDcv9ukcZnWTEwAqHhP2hWBteJGyNQmkUqXE/4LOQZxP2EjmDqV8aP4AVQvU5txBTPsGG1Rt47gYdpWPh0BaSroWsrvjjABwfCqNCjezJ7wZ7vuBrvKi+XJYPMSp1/k+rHCWtmuTzXb/bDpMrXdTDz20g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690886; c=relaxed/simple;
	bh=rE/vs7/LDKJnqXIaPdC9FKDbsX5DvD1rOTMGz3x9leU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r6vxjBs4IrV0lFUXcrrHmglKLDPSZPkLcjpD2nfcneJQJmNBkRyn/TxvjQUNnhWDGypIqkYr61jNIOY8W2uAGgKcadseQjuvkz74Plhg9NkvCB6mviUYj9sM/6gc57utRYlqtmNCXIXo1GuiT8Q1pocsKwkm+SwfPQvWyHziFsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ku2DjETH; arc=fail smtp.client-ip=40.107.93.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ku2DjETH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+E+eORhslCmMcXkJ1wZBJp3OIDXFzhwY0eKaVUZCz4Fv6o9BaGOvVF6d44BSWGSuvktJ0eDIx+Mv7IB21EtEgIA7ah/h3V2/8utjzDWEUr5mtoRCDpIpUqN0tcd5eQHXpGiZUhxkfcU5Du5coDA7De/5WGgdFKEc7k9iLEentd9UwWwWXk2yv+zYzknruBCDg8ba4p3ZZgrJLovc/ZpBsD8/54U9FHUmniF1EAfrErbJNnpZvZHvFTGXUDHEZqGC/q23fmgtjmfEuX1nkqGccAXtItLWaiapYjPs1Cg+VqTeU066vrY9Ka9077zR7dYZuOn+/+HqHgRYqkBOWESzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpHWWL6B8/5/mR+Ij94x20BfazCTUThenf5OHUca7vo=;
 b=omD4EAy6fai0Fhvzd0sbeKK466z9ztetJ/YbdE8gBrmFy7edyNb0McbzG1e87nVwiTgS5lZxG7H06u3/Gs9YRSJQ6MwZPhJwUEeq0r8zGvT8aw/FbSSOcXf5XgGzKG6QhUrjYOZZxo1iDntUMgTsj1qR6GwMYkVx9M+ptd1lgnmMpWnCtTLNQ416XeXIP/IEuJfFmFJpZjhqj3C1QKQIkFi/LkfSKbcMepmL24yVeoWhbtg49HZBe/+/cJBs36QtZjZLNa0oE34eh0WrpBOsZiki57sm6NDNOhN4cW6+Jsv/DulBh5vuKTHnGP7uLDqDxQUHwEvyzLbQL2LJMIK4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpHWWL6B8/5/mR+Ij94x20BfazCTUThenf5OHUca7vo=;
 b=ku2DjETHoyJilJZcZZGjC3lgH08mabozp50dDgckSuGxGXVQiufjGlYox5KKl/72hz56Tvn1JIPedR/06pNfQsWRRaIayZL2ILgDlbehUA/+cMwxLaBQD8mkQqoTKoX70n6CDGVrWkiJY/X7CHhciSmWHgcjGzYs6emQEGLbdO50ytMYmWgUN7QBXr5sI/JduOOrhpl0itukNz/pOA28D6nQVg+C/P6ZssEh43xsCwd+zzI5Z5HHNV7ZAptVQkbz1/pc2SXYqdO5+GUjPWW66ngsKLRLjyHAuPis1ycaG32dxf7ONteHHkxd0pM/yE7DHYiVSeyvY+xkpKnkCuE49A==
Received: from BN8PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:d4::17)
 by SN7PR12MB7225.namprd12.prod.outlook.com (2603:10b6:806:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 16:48:02 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::a) by BN8PR04CA0043.outlook.office365.com
 (2603:10b6:408:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 16:48:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 16:48:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 Aug
 2024 09:47:44 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 26 Aug 2024 09:47:44 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 26 Aug 2024 09:47:44 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH v2 2/7] arm64: tegra: Combine AGX Orin board files
Date: Mon, 26 Aug 2024 16:47:20 +0000
Message-ID: <20240826164725.775199-3-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|SN7PR12MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: a971af6f-5a47-403e-3f83-08dcc5eed953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9OH0Z7dOBJ5VKgvRo79rF6f7SAdXJDGMbzZJcu8gQ74VK6VkF7ii8oQP51vR?=
 =?us-ascii?Q?Jy3zLorbqOzrUL5OB06A66ElVHzAC2U/Es12tSlH1Z5py4v3/nqbQXrMlM/F?=
 =?us-ascii?Q?4K9AvDHq9e0opAH9RX6oHNxtO4Kwsg97xS15mNiBpaXFRmpKhbeVuj5x2yI7?=
 =?us-ascii?Q?gXzhn2Ive9FuUs2yU+Ty6nVdbEnUGfHkEp4k70jPucUIJV3iM1FXAvG3W+dw?=
 =?us-ascii?Q?zVJP1hQlYu8ToxXkzgio/w6d81J9lY7sNVumzImFFQJK5dvn79Ken0vLc4B9?=
 =?us-ascii?Q?nOu3QjD+Ko6tNn+Y8ATKVz8j5VYDWgii7IvfvXozxLZtCMMVDbOencVCj/60?=
 =?us-ascii?Q?ri2EAwAud2FcxrEqdPuwloQxG2TnoLoBoCGuNPTgj2jM1FEzVx7lnJWq6H3Q?=
 =?us-ascii?Q?Tzq+qWozDVMSsaiFwInz2KfOh0sQOtUqf0c0LHzOg8cdJMqXbTlBNtx2Mpy4?=
 =?us-ascii?Q?SbocpYz9B+qrqFPyFlE8kfnBiu7wBlKQ6v8V0DrB8qF8p2TNphaLGYwI971u?=
 =?us-ascii?Q?tG0EcEwgjaZ0r7xbR3E2aUHqpUs4NJ9ShngVSzujY9DFbhGBxzzuh3UAjRdc?=
 =?us-ascii?Q?ouhizLdsZBTwmBrTpf075SUuh3ZimhOSKqF64ARoj+wXU/6+WFThboB3R88A?=
 =?us-ascii?Q?TrhWJURS9cSXQCxpe3iI8/mZQziFMzLrV07u6PBJYWhU605sYGgClS/Bo6zP?=
 =?us-ascii?Q?WCKq6AZDbu5qc8KrRqwRO5LtXHK31lOLUlHp523hKZ0Ard3zXrvipyUoxXzY?=
 =?us-ascii?Q?LthSyjdUVPsgJXf8k14mdchhkr4BApIOdGYKtAdRz3DHU8nyv7B1ud9fl0D1?=
 =?us-ascii?Q?3yazVieYW0h6zyX1i02B5RNibQasHoO7uwAonQccsZBHpKvhDmaLpJM0LIUR?=
 =?us-ascii?Q?jkc9UUGGzfZln+mJ4rwN7hiHc5RajSAMlo8/Tu26l28VpopoPYxxf+NOqpF6?=
 =?us-ascii?Q?QZTLnkkQaD9SZFiHJU48oJ4yXCUFrjXdxw/ssEt+hX6RlSwW7LD8dDzkEPNN?=
 =?us-ascii?Q?d461NP1+HGbDhMvAWhGD62GB/8K5krPR6hoWpUBi0xj2AjVTbgJgsx//sE9T?=
 =?us-ascii?Q?QyMT2jvBODzGHb0tOiRhSxzW40ISTtpk7f+CNxyv/FBO39BsJKLpBwFzlLh0?=
 =?us-ascii?Q?T+uP+Vb1EXaYwAQsPjoqXFIwXQhf/9wKu0RLaToj7FC3Ilrhsusrov7TuQgD?=
 =?us-ascii?Q?zFY5RMAv6V/PlFYyuDR5dhQWiqPS7t5col7W+n4lXo4357YJoMws3NaO+JTZ?=
 =?us-ascii?Q?zHcWBq1a0Kzk3OZAi9iigra4uSqtWExnQ2zf0z7Rl4RbisNm+F0oR5Z1naaa?=
 =?us-ascii?Q?L3t9XQd0lHjw7cX+q705zXNAex7zez6zHDXkey8Df85+JDaqKTSBYrSvy0I6?=
 =?us-ascii?Q?yO8KlMJxX7XAH/Oybkv4zsxelBb/5gkr4gaPPJIJHwubgAeHUSyV3432Zjuy?=
 =?us-ascii?Q?XOU4UXT0c3OzQKsfD1o1hzYTWv8x/DAB?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:48:01.6892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a971af6f-5a47-403e-3f83-08dcc5eed953
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7225

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

