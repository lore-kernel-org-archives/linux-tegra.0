Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCF2C63797
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 12:07:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjAPMHM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 07:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjAPMHH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 07:07:07 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3DE1CAF7;
        Mon, 16 Jan 2023 04:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zvb2pbfmlJklh6lvMG0Niy4ekdzToRAFM2wIb4BIU+WKAHxtQvEgtU0qtsUJlmJVwhkbxi2OHkKBFr7bUosvtnG6/IUMSjI5iwNXHG38JyzlWhRY5oKnXcBBj3XPAzP+4W7JlFQNJPp6FX3+CtMGc9U+SKnleZnrVniwqB0Jn56hhDGRLQrA9uIf2kHS63DypJGEUTqr7fRv4NpK5b6g3VKRxU9irEasI4KydxU86oHSnLVpXvbGrlQ7hN1utMBlLs2FeBpzf96VRVL6gDXq3QVZvHGmWdOBKt0i3Zoi5QW3lR3xPSbVdiy8vEMqzmdg7wbKf+9hylwVpyMEyiYHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=623EM0E9ifBkO6OqAapRYgC/l7D3K0yVEy+I6mV5Cgk=;
 b=L1LGKTyUteY+Xgp2NBQKMtVaB+C0kZq00qNC7JjfUu+4mfhIeIZcHSeiPJb2vlvb2K1UxloPUcpLrWY14C4t+Lvo+76CXGZWmwwRpSYrL9JOTKZ3VKwrP7YGaT/3sePz0UJQ+RAznQgnzFIYGcjOnmAopUUqwcS2pdhKasdZ5N/lENWqMc93NITexGV5Q58MFqamCdqVkfimd0n1lJY/PAmkwsCyjH9NI4dKKoywUJ0MF2/0ANQ3UlKpd3dG5qoQY60e++hg+LyCqR3o+NAx3GWdYXfZUkzU1HElDTVyU92FnURyDs3derIvMyFjRGseLBx9BdUba2buAV9Wb3xTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=623EM0E9ifBkO6OqAapRYgC/l7D3K0yVEy+I6mV5Cgk=;
 b=HcbYHJzzxgQ0QMmg/H8ZJCSopx2Z+dC66BYp8jYkRMgD3qPj9CBu1pMdeV5nRMsNJQdToaodpCvYcLShSZf9bW86ohOMM+zcUbZGTMeeQHUXvBnMfrQArEI1PozUNxFPLYaYu7qrlg0xAxwwQuWLJpiTtkSNrVQNXmjaDe0YusMfbR34IPWHSG1JTrICsL2vZT6bvll2H62y3YXbC4fHDK+uwVHEB/MV+YB07GMEA0LXuqfHpqp0i/+L4/8aXAaCxOSe00SMLVJ5i9a0QLsogY+/g+w8oa9jiIsuKTmtFob5q+m1ej8NvYBcOio+5cuptCDVqZb2crrFAFMjETIBow==
Received: from DS7PR05CA0104.namprd05.prod.outlook.com (2603:10b6:8:56::16) by
 SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 12:07:04 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::41) by DS7PR05CA0104.outlook.office365.com
 (2603:10b6:8:56::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Mon, 16 Jan 2023 12:07:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 12:07:03 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 04:06:52 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 16 Jan 2023 04:06:51 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 04:06:50 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/2] arm64: tegra: Populate Jetson AGX Orin EEPROMs
Date:   Mon, 16 Jan 2023 12:06:26 +0000
Message-ID: <20230116120626.55942-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116120626.55942-1-jonathanh@nvidia.com>
References: <20230116120626.55942-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: bce2c36e-9921-4068-d63a-08daf7ba2e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uMsW705DEfBStKU4YiFTj9M0TYE6yRS1nbs+8n6C8KYAGc5EYOtK4ur3Kem4hZx+qDxkU/8dP2LAaspBJ31Sj+uOXu2IlDgBhITGLmlZONIM712YeErTVErNHD2HXZFe5P+AvyoQ1p9WCE4zMI8Frr9XGEXk6aJxffpIoOsbYZbDVU6+V02xSlfOH/8i3X5ablcDlpX0Kq2S+lB1l6dbC84t8QtyrGvsNjNVvuf31akjCv63PZuZwbCKpKQBrsHJQh2fwD+eaFMoMXjAoEuemSz0gCtK48NMZUJk+BRp7ocgeZQ1Xz0lR9n8lsOgHAs60HBDu29Y6awMn6hcan+WfVYWxGmwjC1lh/U/urjaP7HRGkPh3jpgrLjl10u7cxGGtUwBxaPRQinnovj9r8KyjIQdLTUaFUPDtaDLXpb/DQFg3+cqEi0YAK7Hqatz9DUQJzfoJAEWnQpxwHPzLKDZ2AhslJJyr0d41wy8FnuIM79w7l0D3os/c6yinnyIic8HuL9Mi/ovkMffOHOPZytc6unxHojb+lxvtSTASCuzodcnAPXjej4nZkrFvCT/hodym0G4RuDBvupTMM+vSXbX/5fEEZUHnrt1lzph/C4XSMxIODrwwkAv+dkD4F/3BuQTW/ZHIYAFFmCvsmdkjl4DhjjyBYdmmOh0ynP2bOAS5cIzJR1eFc4kMin86IkTeE6LKxWeWKItIgyY6De1eZJXGg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(478600001)(4326008)(426003)(7636003)(82740400003)(356005)(47076005)(41300700001)(86362001)(40460700003)(110136005)(54906003)(316002)(2616005)(26005)(1076003)(336012)(7696005)(70206006)(70586007)(82310400005)(40480700001)(186003)(8676002)(107886003)(6666004)(36860700001)(2906002)(5660300002)(36756003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 12:07:03.9056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce2c36e-9921-4068-d63a-08daf7ba2e63
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the module and system EEPROMs on the Jetson AGX Orin platform.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes V1->V2: None

 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 24 +++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  | 24 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index 4fae2547e90e..ee8bc57e4ebe 100644
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

