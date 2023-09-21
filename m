Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1BAE7D0AF
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Sep 2023 22:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbjIUW1P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Sep 2023 18:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233030AbjIUW1B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Sep 2023 18:27:01 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D249E1BEC;
        Thu, 21 Sep 2023 10:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgj/yq2BkTv8b8fzCRtk2yY7ijbLoRndSaGEpymxecUOA1+M6Mq55NdpczIT3g7ysFJzNyaAptWpeDxbKr9HCD5Ubr0tdDZ3/Y/duU8xLn/jMWsWqEpK12D0H2u3eyjEKGtsnkmALd2lolPRxw1Rmt4AzIJqmg8t/xqZRuEixyo4hPW1i9C9HDN0fDNen754QErCBtppCzncM6d4fndl3PQMqYDK8v+hCMqif6OOlFcsxhpwcPPPQruasvGDeX2pQHK9MmQ4cTASljK10hL58KisnH5wQaG0+UuEW3X5wUCr1+f4MK2JnNZtMauN+Rwwq7Ealy+cxiSAZQIIbHzV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XaPyv2lE5WRYoUdgD23hSpvILDhTeXIhU2mGxCNQbE=;
 b=iXSvBADS4EnH4Ujj/OSerpOCufuhtC19CvGfbMINvg9kpj8xbWdXPG90tRy2I5iaQOing3cpbLOEQgGDdPPYJHFkjRFpAhnZPH0dwh0H4NZ0D83RG+B7fRxSNjH3XmNX3RpMWydQg3lQNWH5PRn2yVHqvq4HWVmV0Q7n3Lah7HmRDiWaIDs9MlJWlv61UOfRNp68OFwHL4CHdXPOf//D3wLg6j9JRY2rO5d57u8kuPP7/5LrVfg9Yj2O52AF05x/6FmUME9DU8wLja6Nn2s/ZyIcsYXURnoX78ACXfUiVq7LtHzrItQPIbSR9cT1ZeMhOwADOoZdlP6/LRRBXKp/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XaPyv2lE5WRYoUdgD23hSpvILDhTeXIhU2mGxCNQbE=;
 b=e/EIzvq3rZNZAjg0ZcdovOquM1SSoXG/Q/oC2FlQVptd5wgZI3TTmHO6+6o76ouPqgDCgR/cgV+FFo/NA5JJzqOV+yLSkeVgKMGXmRpcYipCa8dtqCwVsFI509LxzBqXrFCEOTtjLGJmLgmd9TBikPDd2nOQsbhfoMM5Lq4FBH4GiqdKBT7IkM9aejnL914heodR3uSNqWHUfq6eOMn9d/KNvthhYaglAba69ElmaG3w9vbDUsiyfhtbgotPWlRtp+DgDe0RqWKPPYgif9lWpWSQ7dVciEuaba166ujdiKvF3EUh2fnk13royb2pGX8EI4kxR6OiXAp/iRvJzXgW0Q==
Received: from CH5P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::12)
 by MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Thu, 21 Sep
 2023 13:12:02 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::6f) by CH5P221CA0016.outlook.office365.com
 (2603:10b6:610:1f2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31 via Frontend
 Transport; Thu, 21 Sep 2023 13:12:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20 via Frontend Transport; Thu, 21 Sep 2023 13:12:02 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:43 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:42 -0700
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Thu, 21 Sep 2023 06:11:41 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 4/4] arm64: tegra: Add power-sensors for Tegra234 boards
Date:   Thu, 21 Sep 2023 14:08:18 +0100
Message-ID: <20230921130818.21247-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921130818.21247-1-jonathanh@nvidia.com>
References: <20230921130818.21247-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: d008099b-94d9-4653-3597-08dbbaa45887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZ+Aib8XkJ3dOzlMtuWqXVKlcRn942bY2dpd+gOY6bmxY9xTKfWegt3+FKGBQvtp+bxjC7VQFDaFq+5OmHzzT1G8sUM8EZJo6qgxwQJiUbRUcYfHOFKDmAaBBfYlgLiT//WKSsoLvz8qorTQo2Iq8kq5TTpTG6QErVvyp9RlhMjS3kXmWexs9VGcdjWy9FrNvJZ6IV3W/Ao+Qz8XwsOun/u/jCSHZ4uOGkp5x9EKG5EEOE/iP1RSzAVyuW80tlmnVPh2nwUCQvgAfDXLDQwoa1Nfw6UcWjpOIcl6Z5bl/+4rM5SVCHlc82pQN1kbWwqxebiLBfBzTr+P5jvvPzy9NUwQn8u2bT0d+l5dPSAQ/cEMSJ8Abo3wdTUVzQtOMHEqccqqhfBMpPXiOeHWgBlBUQESDf3HisgrojMtwFlkGOhbv3uhpLp64taBtjEauVtlJiKZai8q4AKe+KQ3wRNoMCLSgnYlbJx+nsSoTNgJYqyO7rUwUQ/UxhRl2N9g1iS2czX3daMPMvuQSPBSdCZo+ij6N7gpKDv3iu3+dSQ5cKi8MCZUd3jBlhaCIW4z5XEMkJXr+8vcTVu0YCJ9HAwMGKG2wa3M8YMZtskN4+qRU3nmS/+xaj+lhvCGVi7Mi+1zAbkvUPCFu3zQAp6q6o2GEZvvHYfye1kmTjAc25e2eqwbm4oBPZpW/klonp2w5+ZbCipRmbk66he0aT/y3bamvTCyk8H13WBdROhZi/xjOiU=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(186009)(82310400011)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(83380400001)(26005)(70586007)(316002)(70206006)(107886003)(110136005)(2616005)(426003)(336012)(6666004)(36756003)(7696005)(47076005)(1076003)(82740400003)(36860700001)(86362001)(40480700001)(356005)(7636003)(40460700003)(54906003)(478600001)(2906002)(5660300002)(41300700001)(8936002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 13:12:02.4152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d008099b-94d9-4653-3597-08dbbaa45887
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285
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

