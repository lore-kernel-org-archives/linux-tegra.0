Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23754E810D5
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbjI2Khc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233090AbjI2KhV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:37:21 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C121BE;
        Fri, 29 Sep 2023 03:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuKjCSJUJTsEHvvc/DUM+Mr5XaiA6sjFIO7sqmiIUttVdbUCQ1cbZtDrqb3Xl38EhLKUKmUN6ZoGb/CQ+aZhdEaUiAuf2Uc7TEUsVZIWc9lu+7tA5lDg/c+GLF6ggRSNShVu/8U16rfKZWpG2hb+9pc+R65bTJiQ1prCuRmwwwxJm5/0Hg2vlwovPbimtG3Jt8mjyIQWxJ4AtIUpXapOCmatFJbOOv/fA5aioOFCjfcmTQOkeHjhCe9mUuSQixB2LixSkYy7nJltRSqSiXuT+GTLyfD+/tindY5Ypr9NDQYjmB0h1/ejnDyxOcpNBgPaRehYfXGxB25gETAKduUXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XaPyv2lE5WRYoUdgD23hSpvILDhTeXIhU2mGxCNQbE=;
 b=JOEX7g18wEbd4sEmt+2cfU9k4rkXIjKNnG6SRF0+Z0Y425/p+0rcOgD+8hDvzwxcNT4vS02DAQDfdYe+kBC06HXHiocw7IbZ9DDUiKO41Mmi4B9Cv2mFMMsM+MgclH0qM1BCCBnI350pnHRVLhMwonWN56sz+IUAUVK8usxZXGb125Pm3HE6ic+bDm7THkL1eCHpaggqqhH/uZw1VVSbXoI50n8LN6VGysaGuJC5soHxgnr4dXBKSb6sgVo16mTyZ88ZpF8f3hFi0sSRN9ifpHwi35v5+rpG+fYRNRYIyR12xl/zzrUWA1B9eW/aWZrlH9knwi6rfsCpV6iM6Oy7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XaPyv2lE5WRYoUdgD23hSpvILDhTeXIhU2mGxCNQbE=;
 b=Y9M8LHWQlkyLfzgPiYZLbFkZDcwyuflOjbOEw1pj6VgadckV4C4ed6gHtxX4UjJNpIsRb11oj2uMyYZ00T5RLPENCQUzPiaT3nbEGRI73UdXDYVcpaSTpMNkyjeF8VwzdHRzRe5BxqvkcAyzGcjy9tG+SCZmaNxXqMto0yxa/bUAobAAwRIyECG2Zk8aI/0nG6CoSr4xregfhuWfQN1zU7u+DeSqj5klSxZ9f/fZU1V9JD2EHqpQaIzpIRaRk1jSZQCk2BV8ODBCzMvlItHIRDgawuZ0so/pn4PCOO46XdFWZIPpSCArBZQWunkdQDh30Juu7uoBY2PzyTaWjp4O/g==
Received: from CH0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:610:b2::35)
 by CY5PR12MB6549.namprd12.prod.outlook.com (2603:10b6:930:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 29 Sep
 2023 10:37:16 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:610:b2:cafe::8f) by CH0PR13CA0060.outlook.office365.com
 (2603:10b6:610:b2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.14 via Frontend
 Transport; Fri, 29 Sep 2023 10:37:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:37:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:37:06 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:37:06 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:37:04 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 4/4] arm64: tegra: Add power-sensors for Tegra234 boards
Date:   Fri, 29 Sep 2023 11:36:50 +0100
Message-ID: <20230929103650.86074-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929103650.86074-1-jonathanh@nvidia.com>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|CY5PR12MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d905c2e-7a79-4ae2-8d10-08dbc0d80ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hr5WUhgZCW/rOeZDO3/URzYItRjl62Q8U61Z5hRuI1IT0FiIuWMAjmEMGCo6uWbxGAXr1Oq9i1fGkAFPuDRF/euwZ2+joELUZOZcNWC2pzmsAdUo+oVn+s0gYsuvaB7IOjTEMBwQ7fiCAJA3dnZTCifTGfGqjztXP1XHLsEutamoYKmnSOL0OiQYjeCi/w4ZoINvokeziFjxt7vG2MnWh48zxk4oFM6hyIeAhDq5b61DGt5Ro/vclDgrenBvaGxNbNhUS+veLhIKCHAULxJaWV8hDBEsfLA2FwP82YqAw2pqhDVZedbxr+UfvSQpcPMlaCbB2XTH2zZTUANqHRaMhtTe63LTJSRjjQLs3oEA+rATiDZGWo+eDE1AZJrnioJvNytLxxYA4RaXoGhI8pXk+QTnQQUo0/YYF36TCzqOeBIZPsWFHoHEajvJAjOR8JdZM00rIxG+w5+bxkPlEinrgSlwZKFxhoA6X3wY5PHsjW/loQ613NAB7BRzf402idT7NYXfs1RQQT5Dx1Z8G0LsAEgnO0V7CXAk+0S+33AR63Z93YZmd6IQwCkVV1MQf+Pnh+gnF0PGvLN9V9XrGWBJr9+iSPRv+QcmyG8R6ESo8naU10iGzPbuuVzaK+NoxsvGL8x4c8yhXr/mggfd6SmlPPI4kB0mVScaGC6CqXPpic4sNRMWPKmZ0nLt35ITHcVbN1TjUCGGEN8oEFhj7g8/gYmZtkBnKEfAccg859HNH6A=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(2906002)(5660300002)(40480700001)(70586007)(41300700001)(26005)(54906003)(110136005)(478600001)(316002)(70206006)(4326008)(1076003)(8676002)(8936002)(2616005)(6666004)(336012)(40460700003)(426003)(7636003)(47076005)(36860700001)(107886003)(36756003)(86362001)(356005)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:37:16.3868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d905c2e-7a79-4ae2-8d10-08dbc0d80ce6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6549
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

