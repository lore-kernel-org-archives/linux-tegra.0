Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3985CC3DA7A
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Jan 2023 16:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233486AbjAFQFI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Jan 2023 11:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbjAFQFH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Jan 2023 11:05:07 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2180687A9;
        Fri,  6 Jan 2023 08:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwYeUOc3OMWgpF1N0FrtziSCnX7Rb/Gi+CwS3YtcSk95bLt+DYZ1nKP7VyEqJ8xszRG6RqMgtf7ZMXP1Q7rrM//Q/VnHEC4t/CW0MSuHxChWhjbvg2fsGaorZuJTNtKn7llDyBeipph+d6Owm7nBTfjX7txzS0TrrWI5PfvOUbJzpmpZWSqGf5Mt/jZdPTEBIWbhbGf1ZjzxO0VFK9Ahi0eVN7qxkXVwwxz4hYDo+KxQ8IEgX0fdbfHB4b8Ndo6/uIXM8Y70/YqrCPvbH+1NoVypNpmL2JiXJvRr+Dp1wx0Uo+rsvhnV1gWPi/tG4Yhi1og5S5JTSnQKY1nIYHqF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRFiQKQaS1syMoahod0vUJI5szjILoGlxgjmCYjUE5Q=;
 b=RVO1E4NCGIaLLog/cq5ldqb+yjQ4mLQhrFv+UqFjjpVibTQp47tkkP6A+AFnSDofYqnk6X7qYpQo6X+7lp8OHVE3s8cLnGT4ng+AC8XheV8HOvxtLRqiBdChkk7CQ13hTE3KCvr3mJhriYdrhmajC1RpviYRabmvviuY2RORmaf2AANOPpCtGpE7UzzxwUz1kTfaJh46jADKEELbNPEyTVw8l/ybTVXmwnxbFAKNqeuN5JmXuVjNqnV64Wh8YAl6E6DU5PPCOd/MeKRvF2+jsM2bDiGffPvvMCw9fd82vCicqQJRK6JqfGjhWO8lm/HjVsX55Dzk1Og9qKg5grE3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRFiQKQaS1syMoahod0vUJI5szjILoGlxgjmCYjUE5Q=;
 b=elABxzTWF8IgGO/vw7LIJ62/W3rxMLgYDU8+BednSNS7gUEB+8VORHT2iVsrYkmSz1PPflSDbhKE9uXb9cK518/u8lW8s6j9fIl6N23qfpVNvULo6JnE1tCzg7PsVJ9eGVw/VbekiQLgacEelwxkJ85IadpWZmXejtlfNZaotAuE9oa6pDqOWZEYXXqidf817AXCx1teuP+mF23jtvcZuw1ec/i/t5geF1N9ylXHwO/KN9ZGmbZYG8VuvQkSZXBuhIne5zSZgcMUFPPB12D5JIZHr4ynqjzF+mM/2GdEPAmqgp1gQ8KEUWxiwOdtqNraNC//CcQbbvPcEq4WZfbrMw==
Received: from MN2PR01CA0046.prod.exchangelabs.com (2603:10b6:208:23f::15) by
 DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 16:05:02 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::af) by MN2PR01CA0046.outlook.office365.com
 (2603:10b6:208:23f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 16:05:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.15 via Frontend Transport; Fri, 6 Jan 2023 16:05:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 08:04:04 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 08:04:04 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 6 Jan 2023 08:04:03 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Populate Jetson AGX Orin EEPROMs
Date:   Fri, 6 Jan 2023 16:03:58 +0000
Message-ID: <20230106160358.64303-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106160358.64303-1-jonathanh@nvidia.com>
References: <20230106160358.64303-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c800fe0-a67f-4792-2368-08daefffc4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LxnNRfyl1G18W3+T5YRZYB1wMpEKmPThvgXVM+wnw8ZkIhxZiPnYCMlLEgZNysEKB3AdCrQCkmN4CEFXS3P4FlFhuieoHvWWwYTYTCrSwgrOr3CLq5GMMMWUJ9C5sgCmzPLPPIDaELRYBmI9lCrg8FxDoAY6j0Ga6tYZ3exCmy8OubHRcTpQNVa7riNzbqwBm1lSPDeNmD+9NlNRfyO1hJ17LyFYfIk41yCMalBNAouwbc0mbSypEGnj7NXYUleyGI6pYb9KD+Nthlru5XyMOeDwFuAN4tKZCtsVUGHMyFkSgdDVPlZ0SY//XLfTyAJ/I7Z2K8sKPDdZS0i66b/MmUYplXJzQZw5NzR2uznqY2OU2KqVLw0GyCQAHMZRLJXl3VdkYfc2LkGOpsHlaOQM/xagRt41Mvlvme6OqYpYpXtM5dj6vM3lgtahbzj2Gv7ffgP991fkZIHL0Y1XNZp72UAwBdQV6R8q6lmAp0t5a3NeHWr9lqQ5F9ipl6zPp41hv3nW3izMH0v/HSpU4Q15iX8T0PRcSfhrovttCfbgvL3YuOgqKlW6aTaiulaA6YtHMXZvv1T+IAV5DxYQqx8vKBqxRK/wDBMBCzxfKvbFgVJ5X7e8IUqWpuob+yhPdWmEhja9KcD8v20zL5Ks2MnwtIM0WXqjn/rwksUwtkEp9wiTJuOOQOcUKe/6axXlKX4zRvkm1UUOaQ8sNkqJ7WHbg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(36860700001)(36756003)(2616005)(40460700003)(40480700001)(2906002)(8676002)(316002)(70586007)(110136005)(82310400005)(356005)(54906003)(86362001)(7636003)(426003)(41300700001)(1076003)(47076005)(5660300002)(4326008)(70206006)(336012)(7696005)(186003)(478600001)(8936002)(26005)(107886003)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 16:05:01.8843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c800fe0-a67f-4792-2368-08daefffc4a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the module and system EEPROMs on the Jetson AGX Orin platform.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 24 +++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  | 24 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index 61b7ce40f898..e78905e23b8f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -6,6 +6,14 @@ / {
 	model = "NVIDIA Jetson AGX Orin";
 	compatible = "nvidia,p3701-0000", "nvidia,tegra234";
 
+	vdd_1v8_hs: regulator-vdd-1v8-hs {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_HS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	vdd_1v8_ls: regulator-vdd-1v8-ls {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_1V8_LS";
@@ -42,6 +50,22 @@ vdd_12v_pcie: regulator-vdd-12v-pcie {
 	};
 
 	bus@0 {
+		i2c@3160000 {
+			status = "okay";
+
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+
+				label = "module";
+				vcc-supply = <&vdd_1v8_hs>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
 		spi@3270000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
index e76894574d32..dc6667191bd2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
@@ -3,7 +3,31 @@
 / {
 	compatible = "nvidia,p3737-0000";
 
+	vdd_1v8_sys: regulator-vdd-1v8-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_SYS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	bus@0 {
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
 		pwm@3280000 {
 			status = "okay";
 		};
-- 
2.25.1

