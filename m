Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FACEE49B8
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 16:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344065AbjHYQnx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 12:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344132AbjHYQnp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 12:43:45 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA031A5;
        Fri, 25 Aug 2023 09:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKXKDskUoooIfepIUB+UMx0ZgJTnKua/AjTbT7bWcJTXWEtHMFr4/0qr8rX6HBGW3QnydTZf8nG7m+EiSiLl9lvuS1i1ALaRAtD7gPoEaqsQvwh3IawNW1BSojmlRHB+WoiDsMK9EmfdybqbJRP3+csnzGgHE5x2lQRDIjoFxzEg/asdPK4MU9x4I3dWH7ovsnUhfft8m63KgPblDq+XEyQY1jnckgHPL/YsrAQhuIGUcJO2dmob/KiUCivjGeyuySEFxDJlEl3DF3C+pHw0tPGKpFHm/ZJimKkQN/eTBv/EO8IdFDoXv2lq+oUTHL/AqTdiKZtOMNf4OqKrkYThoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh5mufYmVRXWAODrWKhzz8funJb4a3JxG2HZVEHRGlQ=;
 b=FK1iOMVf7hDdRKOLJ0YeZY1EvDSUBbLzQZz4HZ76tCbNH5j+A1C3LAaTkGq21Z+ECw/Ow7Z0Ucy/bIcKvKdms2iUlMu9f5227lUcDrbhP1uJ73rdep/kZd58QKK07ExJSnl5p0pM4O0OXHrGgHAwowRfn6yQppiYut2oXl34V5tUxedSF2dUGUEKdY5elRDLKLyCYj2AziE9y8MyznS5y5bJY+y40yTLN9H5/n7MpJy6UZ5vKpuBI0oMxpM9nBLJX1haTgGvmdXipZWkHE/i6limB4lbuXHG2n2vkchwNVs+GAdPOYZFy/B+VeXbOylH7ysymbNVeUmxJT2TPoGaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh5mufYmVRXWAODrWKhzz8funJb4a3JxG2HZVEHRGlQ=;
 b=sO0t3L1dIfrOAlBAJARIfkqOQnccaoqz4EBvtyGvzoWWjiyQcXBZX79CjckoF/pHbRXe9Q+qQu3h9jCQvFDzIDwp/f5353ltu3ywfdVKO6KGcN11IZzzxctKUyb2hT9Cg0CYYEbySXKI5nK1qjSQdtwfhNmLlJ3bmvXzMQM2JHdpLX4XFE24VD1u0lM2tm2/edP8CJ9XKaYtyO74MNHYv+ARrOXtfIG73EjdlBvMkX9LvZJOum7kMvo0qCUHc5zag60JuJD/wcOAmHdqmsZWoQrOmFb1XpVdfvDqDO/gBZwkSv03cMY23cV1Cd1BQkE5VwPConWErTy09TF9FXhmlQ==
Received: from DM6PR02CA0121.namprd02.prod.outlook.com (2603:10b6:5:1b4::23)
 by PH8PR12MB6844.namprd12.prod.outlook.com (2603:10b6:510:1cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 16:43:34 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::b3) by DM6PR02CA0121.outlook.office365.com
 (2603:10b6:5:1b4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 16:43:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 16:43:33 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 25 Aug 2023
 09:43:22 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 25 Aug
 2023 09:43:22 -0700
Received: from nmalwade-dt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 25 Aug 2023 09:43:20 -0700
From:   Ninad Malwade <nmalwade@nvidia.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     Ninad Malwade <nmalwade@nvidia.com>
Subject: [PATCH V2 4/4] arm64: tegra: Populate ina3221 for Tegra234 boards
Date:   Sat, 26 Aug 2023 00:42:49 +0800
Message-ID: <20230825164249.22860-5-nmalwade@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825164249.22860-1-nmalwade@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|PH8PR12MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: b665b799-ee50-412d-b666-08dba58a6bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGD8+cX/gKYhgfwvkNbXMJSGiHKyptzfgnAcqZkrp2YXTfJtY9HCe7/avvIIT4Jwbvr2kUx4TRv4kM/iiw16O/QjcqJ+4AcjhoWQQn+K/NInWw/3hOKhEBGk0MQoxWESaHfVw/7CaeuYvhwqeV6v1kHlbwx1Lr06VHar0t9HEJiuqOdIpo+B8Ky1969GnA/n2X5Z1DTr5nzUCVoiXBiZmjkOvEruxgRVP/rtX7AkbWaDb7txyIzI9iIr2KnBe95mbzTKLV9o3C/los1YYRw6AOGUJ2ypSqmUY10O6SmbIX7q+4PSNbFvQrSQy+wHtmL5xOrcS9XgrUGqOmK378PAxImuNziEFyTT7ZO6Prp1nG36k4e84UA2t3UnQ1Q+L6MrYHfK2SCUBc4dcm++tQctXVXuURaBQl5M01AB4bl9bhsjs5bR8pnGKLQakwSkojd7P8mPgqfdojJpUIP0Htt6L2GnF9jhUs22oVolKqcjQ+o1nwXjTNczacGuV0YiOBwDA+kwFnTD9l9+IB3WgJr6aczGOR4RKy/bny/zGY7LPZtnQalXGl2rrHJXnlQSy5/3g/0puvVhMZpTgFYXpjPfs5lUM+iMagtsPSXYECz9GPB/GfPhhEuN5O85t8mWDAyxiYU9dIEhrCe0Iiufg2zbT1MxVzOd2o6BBpvbENw/8swVTYGIrAfc1RJx12oo13ZvHzqCYMqReiPC22OJvihigr6U4Jg66qcPIq2B1fXVyc13zWYBm3HWp/VH//V7cJ9z
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(1800799009)(451199024)(82310400011)(186009)(36840700001)(46966006)(40470700004)(40460700003)(36860700001)(83380400001)(336012)(426003)(107886003)(1076003)(2616005)(47076005)(41300700001)(316002)(70206006)(70586007)(8676002)(2906002)(5660300002)(4326008)(40480700001)(8936002)(110136005)(478600001)(7696005)(6666004)(26005)(82740400003)(86362001)(356005)(7636003)(921005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 16:43:33.7469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b665b799-ee50-412d-b666-08dba58a6bfa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6844
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the ina3221 current/voltage monitor sensors for the various
Tegra234 boards. The ina3221 sensors are located on the Tegra234 module
boards. The sensor configuration for the Jetson AGX Orin and NVIDIA
IGX Orin boards are the same and the sensor configuration for Jetson Orin
NX and Jetson Orin Nano are the same.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 53 +++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 29 ++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 5e7797df50c2..aaab248c8844 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -1987,5 +1987,58 @@
 				status = "okay";
 			};
 		};
+
+		i2c@c240000 {
+			status = "okay";
+
+			ina3221@40 {
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
+					summation-bypass;
+				};
+			};
+
+			ina3221@41 {
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
index fe08e131b7b9..e4ce7da7850c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -55,6 +55,35 @@
 			avdd-usb-supply = <&vdd_3v3_ao>;
 		};
 
+		i2c@c240000 {
+			status = "okay";
+
+			ina3221@40 {
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
2.17.1

