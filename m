Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD328DA5;
	Thu, 27 Jun 2024 21:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719523972; cv=fail; b=VO5A+z8GqE5N/nhAn25q9XJnaOD3kW+VdvuvI7NgXEju+O0KEY/L7UQeCkvazclfMCLIljULhxqsoZmDllHGPk7U0n5e8Ro0OyvaGwiOkc//tbUiNJib6UAmdzd75bBTvt+8yhrNPxwVv6A97b0V8nCw4Co3bRaRWjgBtnrIjHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719523972; c=relaxed/simple;
	bh=fWvLV436+wtDRDVk4WxOS3DalLEl43wCOqD3/4NyQz4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FkOqMZg5C24fyjHAPMvIoU9Iv5rk7cHy1EPTxpxWqzYj3qtz5I0nRGN9snpLFag47KYL5geiPscS1chX1Zqe499ixcDiaRAjH7amn/RP/rAMrm9ADhNxxaZmEPNnFrZHWtdBdT470409bOrX4OfmBAwBS4KW9U4oYvtDm4YL1rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e2TgYtNj; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e2TgYtNj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh4D55q71+OmLsZW//AhHzLfu4oY0Mbhd1SL0FgkTEoSp9HUoM8+77rs4lvfj+JA4wuKXZ1HUsfeCFsTQJ3lqUvqBQbrrCDwtHPSe4tfKpjsC8FNUR3Nzrze6xPl8XKT3cEK0DKAdqyUd8+l26B/bqQosS1KEeIO5X7VQxxqQBlkUfwPA1YTkEppMiHaVkgmD5fReeIG5LsAGz3VpkWS2fllRCgkSSrhMgHjbAZdab+U6mZmakCHJzJj5XGWnYqU+OxB9EFVsC4LkX0Wy3seaBFQBiD1ENF5U6lC8JrixzaIDDOJ1a29YA9kibNYWzZ5oJeM8m2DOpkkooJzVxOCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGohFDFbO5sZ/I9LrXeRK4iYzUUBNf4KBQoQ+rAoB9c=;
 b=J26hfvH86izqPZOBaLxyite8prOARnjJAIsxTEnExc+qnZEJsOBm4/nMlgK+3sTM5QN1Sx8UNqxxtCz1X932P81vcBklrjt0AAt55Y4c/UYZuGx0MxKgJ2UhpTUbAKkJyi1mpuOOLV4RNXKybI3XXLWX8oKN1OZHLAaHkAK9YHVT5YeckPoBW2oHYf10GNmZqOt9cgenF1jQImPwdzDdhFrIEIdNGFPafZrqZIXR9u93MDDJLHQkiOZzViK3rfBltNwR0IrbcH7BP3I+X96H/WPPYkreJewSNXvNOm3PIQBcky+51XjjQAlYImxP+rbBvQ4o3g6Weej7zRQVbWgsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGohFDFbO5sZ/I9LrXeRK4iYzUUBNf4KBQoQ+rAoB9c=;
 b=e2TgYtNjn290IKxB7PCh627nTqTB8NL881epmu6PNEz1z9DfvzjC5OS0lXqW/mh5hnD+U1cj85nTVW+0033t+e0ksPtta3unTZst0YkEwG8QCT3bepKcu0jioErKo7IJ0EZjxqrUUkkUO+FDQG/m5bmmoVZafHcNJ73Lfwhlda5+67ismY+HMNvcndGV/X/NgQrC7Fke/N8/akwfMzHvJyVGrBQcf/UpHph+WkMUtjoy5GZzktVQCiEpfOoD621VrJnlnLq86QyrBKSPVqs+1sezM+L8afM6ZvhCntOS6lnvt0hsj5eqM4QeO1UoaV5FvdVwBXwhSpX1qcZDTmURVw==
Received: from BN0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:408:e6::10)
 by SJ2PR12MB8943.namprd12.prod.outlook.com (2603:10b6:a03:547::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 21:32:47 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::3) by BN0PR03CA0005.outlook.office365.com
 (2603:10b6:408:e6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26 via Frontend
 Transport; Thu, 27 Jun 2024 21:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 21:32:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Jun
 2024 14:32:35 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Jun
 2024 14:32:34 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 27 Jun 2024 14:32:34 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH] arm64: tegra: Restructure Orin NX/Nano device tree
Date: Thu, 27 Jun 2024 21:32:25 +0000
Message-ID: <20240627213225.1455388-1-vedantd@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|SJ2PR12MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: 838315aa-7e7b-47b9-ea2f-08dc96f0afdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ud5QGcvd9ZC0QUM5uK8LR5MZActjvJPN1tXsZGoMnWnU81hG90ZXdn/G8oRE?=
 =?us-ascii?Q?UetI7YCeeIrQPgeFfAdP7UlGKn5hCsAp9P1vtvjRAj77ZjXUN5VrtAiXUkyP?=
 =?us-ascii?Q?E99fYV3B0IWka3rXd6Yfvk7LcAWEbqwUQawgqmbK49o885JxQPpqwSUwdMak?=
 =?us-ascii?Q?i9E8bgBQFYfTfbq53ZtqeYJDQlbwsz9SSmCU+hpWtfkZf4cUoOX2A0800zmb?=
 =?us-ascii?Q?sJRGqVlH9Yn9Vw4mJDtDTDbcCM2dwPBHdSx61akW28KQh7inDDtOas5uF3cn?=
 =?us-ascii?Q?9cv9caEFeWr0h/TJShCIAi4EKc6hOYWFZB7BqhYXpAqaZmiIhvtW+gRAw5Gi?=
 =?us-ascii?Q?1Yz8qxxjYerfRtlX27HNhojCAra1ihFHfRMo8NjoENHP2RA7RDKH7sgBVYlU?=
 =?us-ascii?Q?U5kTgbF1nhsBTWdwPkawXO9wIBLwP9v7oWWH99dWvDD98g0rsdyJwgtlMxyX?=
 =?us-ascii?Q?JEp9Xujv1hCaa+7i6wOiMqcDRi7RqKHF+uaDBXNQsk+8oH299IyByZWL6DvF?=
 =?us-ascii?Q?dGCiUTpGrIZAtrCtZlpfIIb0TsMEYQac498+nSAJpZHLnUuMrCDUyXOHN14d?=
 =?us-ascii?Q?iyVJkYtUQxwtanJUCfhXe8TOC+cweG5gbSRdyRBHrRQWGFyq+A/DcIfE8yOz?=
 =?us-ascii?Q?q101kRfH92fLMmXTJqgtrWHBJgwnAh5eFtx5L6AnZvQY1TOILEzSXpzXR3M/?=
 =?us-ascii?Q?SAU1Xo4KCmuUA0dxUJKVR+xCCRYBOGThxW82oCOGPOt/WAafwRG2bvfkqcRX?=
 =?us-ascii?Q?eXxe2ge6HHKaI29rWmDanHVt2yaJH3LTkDd6mSfYPiLhXjQm0cqErseYkH7b?=
 =?us-ascii?Q?w2dfIdbIbJ8/h6e93Q4kOjrLMnb5f0LPU7rLlfSy1jrXDkxOabQ/kN0p8gnU?=
 =?us-ascii?Q?pASW1OE9BrJejxJsd/B4/Enham06/mxbVCQD35/IDvgc6dnLw1Ow9miRO6S8?=
 =?us-ascii?Q?Pswg9Qs8XNNCSge56vx67rkkg9a2QrPJ2z8ig3Mq9SqRTh9jDkemt6sgyCaF?=
 =?us-ascii?Q?0Jn9AQh6sRfKd5Rm1TW3WeNiwSjNU56Uf2Y4KxJG6CTaDlRztOGyyJOH4mv5?=
 =?us-ascii?Q?zeWnd22IBvxoouU8avvTA3ZdjJV4J4OtoKqIvcV2z8BvK+Lmex2yymeTKj/O?=
 =?us-ascii?Q?G6ts1alrir9npRblxBfbP9O9dOBwouOiNGvMC2u7+vghU+YEmuTb7gyvgcHE?=
 =?us-ascii?Q?joducjq2WWU4ePZHCZdXCQVXJniJM7EbGxkZ0FqRm14G59aR1iCEZHP77cJd?=
 =?us-ascii?Q?dns1Z/n5QUO7jJWNqAFc1r7avkRve9nd2oLg09Vk7LIsUwnPrbekLcn0V3on?=
 =?us-ascii?Q?EwD5epwgYShYluPbsTRxEpTGMf4qiaCkguA9FIRicAh0MdA/Q0COYgCt9F3M?=
 =?us-ascii?Q?XQEqzqmHtyNUwCu0p4Az/dQQVkFBKXGr//3bd+hOHgYJgnB7QzbHp4J9isNe?=
 =?us-ascii?Q?39qN9/mKgvy6SQew54aAhjvznaNNMOqL?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 21:32:46.4766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838315aa-7e7b-47b9-ea2f-08dc96f0afdd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8943

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
   and Orin Nano is in tegra234-p3768-0000+p3767.dtsi
3) Only data that is unique to NX/Nano is present in the top-level dts.

Change-Id: Iaecf766f6b79fc905db00c451a71a93f2c150ef3
Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
---
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

