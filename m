Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66848C4708D
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Jan 2023 16:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjAFQFF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Jan 2023 11:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjAFQFD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Jan 2023 11:05:03 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8828B669AA;
        Fri,  6 Jan 2023 08:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsRbQVUU2HWR8apUonwwnHa21fPRg2WYBUqTJvwwI6i8OwK1/3Op76+MFrwGWGLUiXv2lbxOFgdrXZHtD8nVPcm2Pv6gubkZYSCOvzlkv3Xsg5gMs2rdtbxUBftgoYK8uH8SmsgTPiprSabiPLOCFFovlu7wd+IFc8m+9TVdMLCkDJtXPoEIe3A2VWKUkExvDTOwkU3saMRT0+cviEeqohzYPgVK1ZnqfT1YLjXvkgxSX8HM8w3w2My0uu1JZrwdy2E4hQT5nc46DGOd1iUBuGZd1v1Ikr65s+uD3YTQX3I2Nxv3hk0miogfZaaCmgMAAuROxTo7cVo8aDrLNtNvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzTsr4rniS4pVZK1QFWO0OqfZZoM5hZOhgtWGEptmw0=;
 b=MzRwuYmk0cSLuPYWnVi+0j2u3XlF6sMTb46o5dH/oTE2fuSgh4zJL20ftlAhCRANtjmiWA1J/yKB4vwqGH3eOTdCNbRB+Fo/3bTBoKXljSwoQIAlayPm4WBjNnZ/4FDaTjAXsV3Axe1GHAayIb0ukwyiFPlYdA7LEDGWNZMnaTpr3GMcUfDKXMXQ7/BaEVWRkujgtAaB9scbZeY1sICi9VbnfXkA6em4FKSmXc5jU7Kl2TFMirgq5PfDym18g7OjuPfO+q2KJFGX010iKZ6Aqw0PHW2/9LjeUaLt9rqwJZLPZT3FV7PQtpgDAaHyE4lekHBV1Yp6SX7KbEf11mnYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzTsr4rniS4pVZK1QFWO0OqfZZoM5hZOhgtWGEptmw0=;
 b=Em6gL9n/vuaZ1MlWjGrHbR8Mm5YjndwPWTsFusPxr/8ejsz/fCuvHZJx3a6roZVbjo7MyQUkz+5fNxJMgKFAAVC5ZXRu20JTlwkAnP/VjRz/RnajBJg+pMvGwJTc8k7ctldcFMxr9kEy0K9MNwVIPu2/Ud3u5qxL2yUyvTZWUSOu4Dt1eGLWH1BG7kqvVEDT4rk83DG7EcVJvtRro+KgYWT6mKHQWeNCvlBM6ahJE2lG8hjIOdqe8x7C3+GK3wnyr6IgGd5Uhq2z/WmZINcRdQwzWBD9EXSLSv4ZWkNO0Cry3QSNITFcRSyWqHvbDWlWjTVzBnSvr+73S/9leF7BgA==
Received: from MN2PR01CA0048.prod.exchangelabs.com (2603:10b6:208:23f::17) by
 PH7PR12MB7988.namprd12.prod.outlook.com (2603:10b6:510:26a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 16:05:00 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::ae) by MN2PR01CA0048.outlook.office365.com
 (2603:10b6:208:23f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 16:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.15 via Frontend Transport; Fri, 6 Jan 2023 16:05:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 08:04:02 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 08:04:02 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 6 Jan 2023 08:04:01 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Populate address/size cells for Tegra234 I2C
Date:   Fri, 6 Jan 2023 16:03:57 +0000
Message-ID: <20230106160358.64303-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|PH7PR12MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 8070a59a-c464-4ea1-dd98-08daefffc3d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /+2sUGXWWL8agGjacNp0J1MsJh0Hv8xmzLKZPUjk1eyOaFmn5AjHd8kk43OwBlf0M0scGCupYCJi17cCuLGzXJ/WPOJVYlt+PQq7MYEDBop4ZRp/otEwPcPO1CHuHpbDIDsIRjtvweDdXiEUUP0XJNct3Hofx9k+4x7Jg5KWyhRP6Hs6BLLx0kKUaRDjxDIFYzAdpe1PR+KGb8sTI2rsi4iy5n+Sxu8l/yV8l7fpQ4SizsG/qRPf86o+Z8HVCG30fICVpR2QXETmym0kNj9uXL+dSDoWYW9wvtOeGrxc4fEqFwFikkQTrdc42D7T4AzF3oPwnUFee5kB6ALkm3If3dAhtgsmnSN8kJHbhwbYHaz1yk7lfdWb6f5YYuM09DzeFsxBdSpmPXBJUWoW4YvpyQU/uVffCeGezhqE3HNx6C1ErAR8htacdjFyKrzgsIXJPCh0aGMtP12WLQhdjyWAFYZ8QdE54u0zuUFRk/ZHNH7Hoxkipi346BcwEY0/uNT9ZAjEAmwDwgmfPnhRkb4hAhIsUf+n0XFlyBiYCCuchwUanSSMFmy2ecju1Jma6xo5lnX9D28Y4RAVNRmdC9SCxrK64nPG5VPxT2HGxMsL3yJXcaZM9lwa6TYHOGP0SVo/bEKEP4j2X9iQTlbEZPTw6uLhEq/a6T1Q/KKSm53LylqL7cnoVX82rUjyCqytfTk3tcBtwkEtxGi+P9MXLhEojQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(47076005)(4326008)(70586007)(70206006)(41300700001)(426003)(8676002)(356005)(86362001)(336012)(107886003)(7636003)(83380400001)(54906003)(186003)(2906002)(6666004)(316002)(82310400005)(7696005)(26005)(478600001)(82740400003)(36860700001)(110136005)(36756003)(1076003)(8936002)(40460700003)(5660300002)(40480700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 16:05:00.5718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8070a59a-c464-4ea1-dd98-08daefffc3d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7988
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the address and size cells properties for the I2C devices on
Tegra234.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index e46451dfdb2e..7b45120f9f29 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -787,6 +787,8 @@ gen1_i2c: i2c@3160000 {
 			reg = <0x3160000 0x100>;
 			status = "disabled";
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C1
 				  &bpmp TEGRA234_CLK_PLLP_OUT0>;
@@ -805,6 +807,8 @@ cam_i2c: i2c@3180000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x3180000 0x100>;
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C3
@@ -824,6 +828,8 @@ dp_aux_ch1_i2c: i2c@3190000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x3190000 0x100>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C4
@@ -843,6 +849,8 @@ dp_aux_ch0_i2c: i2c@31b0000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x31b0000 0x100>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C6
@@ -862,6 +870,8 @@ dp_aux_ch2_i2c: i2c@31c0000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x31c0000 0x100>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C7
@@ -888,6 +898,8 @@ dp_aux_ch3_i2c: i2c@31e0000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x31e0000 0x100>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C9
@@ -1918,6 +1930,8 @@ gen8_i2c: i2c@c250000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0xc250000 0x100>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C8
-- 
2.25.1

