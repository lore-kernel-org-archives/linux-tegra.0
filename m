Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F52AE80ABC
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbjI2K2K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbjI2K2G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:28:06 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8001B1;
        Fri, 29 Sep 2023 03:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+F7MyIdsPRr/DVJSntugUvenR/M9DczBxHC4qayN6NYwbv7VHVhL5e9cDKQHPAIXWH3oq3GncOxUzakIj8vy5FXUbQ4vtnrBk4EaLlrZuZSZ+SUnE/fs3UTnj/+JRzxw0DKjsd8NeLweUen3sGqHrzU3oDq2lsjdtBM9NbYmJIUX6QxtVUZEGO+0UUEWw5nikwb9u0xysYmTZBBvhOR/iVVAi+RXZRmVdW5TqHlYmmVlHowUPmF7N1VZR+dT54HPKqd1aGAX3ZPZXb0j3Byuu5ozzPiszlnK6qS4sospB4fQd1rX8uJop045d5LvoC1dJl8UY27zjtBrw/hQBAuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XaPyv2lE5WRYoUdgD23hSpvILDhTeXIhU2mGxCNQbE=;
 b=cYtmnW4STJHYPC9MIedxC+sM8aZGmKfvkXm4N+RPTW6Zico7cd+Tv/F6i7Ben6JYaqfL9htVP21XOYTuJNKo+pX8zW90KbbkS5kCUV2MDROHg9q2LYk3fDgG5XE5ULwyKZ+rN6K2NHojOzUgzwpdKXJvViQI7KdNHalOzVp12zxOitPo8MEDcnHCRedF0GGaGOm3+OKYz6UguFz5hOvnbMHdi7JQ4bCjpoWjCx8b5manQtq/53umJWt3gEllg5uOH1FffwDnnBEET6sl/8rVEAOxLYqT0FksVy5CmBEqxPuS9MC7DykrbFYGMEbfItDbB8KdbXybT7vobkjUx9B6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XaPyv2lE5WRYoUdgD23hSpvILDhTeXIhU2mGxCNQbE=;
 b=nZuWv+7EJgq71aRzmSqXvWRSjaOIs7suZv6qi8SSokKNxxcrf9MkNul+LvA+IlOomiNShPfqex/CjxS5BfFdtOLbVeDQBBGgMOkIIdLTZhP6v6Zda1ROcmfPc840mcqo2DO+cm8plGkxh8IZghjq34pK6XlSmiGfIFbrrNome2DpUfXy9ShVpVmIcRst8cXbUMADxnY/QwkauPIWYS6QuCgA50PuTtVt1PxgqPAy7Z2ZAzi0El8GnoADoY5kquV77tdt5zws6Jk8jIpy6/nGo24QOjyX6aix+6dPPpoxirCxMOJ167RxCljGhZ2RVRpqO4ULQN+NhH8LAb2SgTMDsg==
Received: from CH0P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::18)
 by DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.39; Fri, 29 Sep
 2023 10:28:00 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::56) by CH0P221CA0016.outlook.office365.com
 (2603:10b6:610:11c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 10:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:27:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:27:59 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 29 Sep 2023 03:27:58 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:27:57 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 4/4] arm64: tegra: Add power-sensors for Tegra234 boards
Date:   Fri, 29 Sep 2023 11:27:44 +0100
Message-ID: <20230929102744.84989-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929102744.84989-1-jonathanh@nvidia.com>
References: <20230929102744.84989-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DS0PR12MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 8807f0e7-cf72-4b9b-0e39-08dbc0d6c13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sNQcglWK9yuksT8Zi3/A4NcSTv3TXwE2mkO4DdL7+2iIxlchG44p1kph+WvXB3IjBYzWKNglwjBFPER8U3xQpSiaP2GfvYpO5uvxoCTPtjkfYqplkSofMB8kXFDP13jUeBbVy5WTpqwUHEz4jnk83IiIzBrwJN76zC8l5Hfq+A2z5UsaFRm5doYgHLwtW0AqkYp1zbUDXXUQr4i4Tl8xcGzpnfFzRQrozdlK3+I18vg80hY1ndVkEOiASbYv/9saTh40ewmaA8ENtbbvfPnO9R6zGTuSFYzuh5QB+dfjhrIgKsIKNPyYHBM7JW2qA2TfoWw7D78yXpeS7QfvUJeFHxV4ap9yryiRxzLN49zL5Y2K8tYsEuhCEAWZwzv9a/Lyvgq1tT0yBmR2fnoLDlrZuLSyJ77lM8k6sjVYPMvrYx6Rt96sPo9rhJq3d5m4CxaxC6gfBchoz1sIe2vIawCQM/UPLc6Lw+gT+LkA+jePp2XEN8XJgEac/wW4OHKBLOz4W7b30Jjjm8NNYSUSVRDrOjRHF09GgRxjijWs30FPyM8g38f/O09rr4O0Gh/hlDPRIb6DtogT2ky4zGkfMkHzsLXmj0Kj1qVrtO3xXzjLPMPQfDVT6GjfO1D1d7wsqnOEwIdu/Piy2HziSRU+lahaKTghc4tckcQK78zFRWPfcGygIa9f9w0ZXfNuET52hgJvPH8j7BPnRrOBpcxCo6GEIIR7nqQowfPXKG55nOtYMg=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(54906003)(110136005)(26005)(70586007)(70206006)(1076003)(41300700001)(316002)(6666004)(2906002)(478600001)(5660300002)(2616005)(107886003)(336012)(426003)(83380400001)(36860700001)(4326008)(8676002)(8936002)(47076005)(82740400003)(356005)(7636003)(86362001)(40460700003)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:27:59.9123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8807f0e7-cf72-4b9b-0e39-08dbc0d6c13c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9060
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the ina219 and ina3221 power-sensors for the various Tegra234
boards. These sensors are located on the Tegra234 module boards and the
configuration of some sensors is common across the different Tegra234
modules. Therefore, add any common sensor configurations to appropriate
device tree source file so it can be re-used across modules.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  | 33 ++++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 53 +++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 29 ++++++++++
 3 files changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
index 62c4fdad0b60..553fa4ba1cd4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
@@ -44,6 +44,39 @@ i2c@c240000 {
 			status = "okay";
 		};
 
+		i2c@c250000 {
+			power-sensor@41 {
+				compatible = "ti,ina3221";
+				reg = <0x41>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					label = "CVB_ATX_12V";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@1 {
+					reg = <0x1>;
+					label = "CVB_ATX_3V3";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@2 {
+					reg = <0x2>;
+					label = "CVB_ATX_5V";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina219";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+		};
+
 		rtc@c2a0000 {
 			status = "okay";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 5e7797df50c2..db6ef711674a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -1987,5 +1987,58 @@ interrupt-controller@2a40000 {
 				status = "okay";
 			};
 		};
+
+		i2c@c240000 {
+			status = "okay";
+
+			power-sensor@40 {
+				compatible = "ti,ina3221";
+				reg = <0x40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					label = "VDD_GPU_SOC";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@1 {
+					reg = <0x1>;
+					label = "VDD_CPU_CV";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@2 {
+					reg = <0x2>;
+					label = "VIN_SYS_5V0";
+					shunt-resistor-micro-ohms = <2000>;
+					ti,summation-disable;
+				};
+			};
+
+			power-sensor@41 {
+				compatible = "ti,ina3221";
+				reg = <0x41>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					status = "disabled";
+				};
+
+				input@1 {
+					reg = <0x1>;
+					label = "VDDQ_VDD2_1V8AO";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@2 {
+					reg = <0x2>;
+					status = "disabled";
+				};
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index fe08e131b7b9..59c14ded5e9f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -55,6 +55,35 @@ padctl@3520000 {
 			avdd-usb-supply = <&vdd_3v3_ao>;
 		};
 
+		i2c@c240000 {
+			status = "okay";
+
+			power-sensor@40 {
+				compatible = "ti,ina3221";
+				reg = <0x40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					label = "VDD_IN";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+
+				input@1 {
+					reg = <0x1>;
+					label = "VDD_CPU_GPU_CV";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+
+				input@2 {
+					reg = <0x2>;
+					label = "VDD_SOC";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+			};
+		};
+
 		rtc@c2a0000 {
 			status = "okay";
 		};
-- 
2.34.1

