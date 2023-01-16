Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E512AC678D7
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 12:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjAPMHE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 07:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjAPMG7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 07:06:59 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11AD51CF50;
        Mon, 16 Jan 2023 04:06:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRAgy+3NFscPfq8wt1t1lo/7DMtmuxAvGZoN2vZ0AsTrHCefWcrWEgfLKhvidkG4ENqzSpjjtP7moorcsypgYAeOpn6g3YBj9YFiuihfwsfsvBcey0uYwRRzsrK4LaZeRKwnAWBSuRDIHzDTWFPacGna4yEjTrR+i9f+hMiE23FbdFJAvPtiJ8WAgwUEKQQXwSmoYsBFJdWD3xpll1FT77zYFo+9arBZF1+t2IV5hiUMnr1yS9LFdFxmSqJV8E6Ca7kif/dmS1TBMVoJ0V1oOdOZ8n0lk3NZtNUAvuc036zqSlmsAmnDD5qWFofwE2LiA+A0eRIFnGTBbJROd/cTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=helx0JJTC1swHe0QmgMO2Z6GFjlnyQI9ELJVcuo/v5I=;
 b=VaccIJaxsobBwO0RqSxIEJ/4JLrzn2MrL5ZMMkkrki/payP3/N4sR4uc4y3NGbTjsQzKq0EIuKIxTSrFrDy9B9yMTmHMCJeynvNY4S/UV6Okwr1mFIkgc6v2X40Q/eov2ZpY1fJ+D1yaLGd+I5Or1qpp0kwUnflj68SITxS/DzuJR+8yKOAmyG4ywhutk0j9y/HmIl0PF9HL7ENUCiJ5uYy18BmLnynPCkyLoKHOhyptYiXgf+cKmJImPTXecfOFyOwjFmb0/8I1YrxEHJ9SXUg8y8VKbxCTcVOc2DkLZNw2QKR4IqIibwog3abEfP1s9dtpBYnDxHPFA27O7L2oDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=helx0JJTC1swHe0QmgMO2Z6GFjlnyQI9ELJVcuo/v5I=;
 b=YomcbvSXl/+iTQWnDf0v3fcqTYxl8wf6OpSlugFjPawTgnSxLDB1FrgIHr3NPIroj7d5HXL0RHomilA1IPCt6OPWBaaiKBzjlWpbT8gG60/BRKN73adV/0vJW35hn7gv9OKfvCjnpWlWrnhXjsRe8C3Gc16Tst4w0nA7L/mzWXJCWcLaKsxFlS2muAYsHjhLX806a3HsbzhG+8zkXLf+8mwNYQyVFzT6zLO9HQDmPnx6CHHnJvIUNYAyoC5it4m80CIg1YPpyAtTC/AUcwjkEY10AJiCwvqowOOwhGw14IxMqEdhLiZW3ociiU5WVtf17RH7sHeOMQbpPmCWTeo/GA==
Received: from BN9PR03CA0277.namprd03.prod.outlook.com (2603:10b6:408:f5::12)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 12:06:56 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::c3) by BN9PR03CA0277.outlook.office365.com
 (2603:10b6:408:f5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 12:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 12:06:56 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 04:06:50 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 16 Jan 2023 04:06:49 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 04:06:48 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/2] arm64: tegra: Populate address/size cells for Tegra234 I2C
Date:   Mon, 16 Jan 2023 12:06:25 +0000
Message-ID: <20230116120626.55942-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|PH7PR12MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: a53ce23a-2df5-423a-d17f-08daf7ba29b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7RhbMlaAJEai/Z98oZXXcL2hMgBDuH9A9kJYhrKXC0RTBH6lq3hryHcjNNGdh0OMXb4eV7J0yDam4GShsPfvkf3QW3NxFJrjptWVyXlgu1x+W3XwESjBOhi+VMZib72dM1MS06hYvU0Z9emWsjM1WmUzpWdZ1PNHp6D+Z2IMuTUJoDR0edFxAvmY5cB/y2kTea59LMbCMplR1cvvns44WXT1+B9SjsfFDK1Kx4mj4WYgA2/U5LiFFlZTornHWwzQTJEGIctbUK+4XnYgTZPimO0bhY+jkaWsxY1NdLnHCFxuR60uTl7WQD4K0rBmwRStuIXEJzXfLM2X90CDQ1FeRBJ7dbNGJNmlgT7AMxxrxKLNSYYyoIElmovzDm4SXHU+umCK9LRchZasK1lWHmXTWNCLIOw8GJrCsKOqD1GQPzwR3lGnidL452SmnaIbxmFvFrNJhxNejKbZ3BkX8rECNBijBa+kASxbjlrQTDeejI2HdBD7nsrPfiUonyS71TNkL5qPoX0ZXIexm1KFfNODAS5v6BujjuEL1SaIsWUKTCQNz0D0SsPVAXkpSwGxKWDRPHThiYsZmFtlcWYFFOYzrcFqJZBUEXDHOnmeMkuE94e7scUFVps0Zz4fHjRkj2yW3RprokO20YkWjERyBOHQ8R8ZwpHUvVi/6F7/pmgAi2zPwxKb0K7TYAr1QKXg1gh1g42mS0UFAOwDugwkAMpK3g==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(8936002)(54906003)(41300700001)(70586007)(70206006)(110136005)(8676002)(316002)(2906002)(4326008)(7696005)(7636003)(356005)(478600001)(82740400003)(107886003)(82310400005)(26005)(36756003)(186003)(6666004)(47076005)(1076003)(36860700001)(336012)(426003)(40480700001)(40460700003)(2616005)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 12:06:56.0099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a53ce23a-2df5-423a-d17f-08daf7ba29b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the address and size cells properties for the I2C devices on
Tegra234.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes V1->V2: Added address/size cells for i2c@c240000

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index d71b0b5b931c..242bf59711f8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -785,6 +785,8 @@ gen1_i2c: i2c@3160000 {
 			reg = <0x3160000 0x100>;
 			status = "disabled";
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C1
 				  &bpmp TEGRA234_CLK_PLLP_OUT0>;
@@ -803,6 +805,8 @@ cam_i2c: i2c@3180000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x3180000 0x100>;
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C3
@@ -822,6 +826,8 @@ dp_aux_ch1_i2c: i2c@3190000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x3190000 0x100>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C4
@@ -841,6 +847,8 @@ dp_aux_ch0_i2c: i2c@31b0000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x31b0000 0x100>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C6
@@ -860,6 +868,8 @@ dp_aux_ch2_i2c: i2c@31c0000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x31c0000 0x100>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C7
@@ -886,6 +896,8 @@ dp_aux_ch3_i2c: i2c@31e0000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x31e0000 0x100>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C9
@@ -1872,6 +1884,8 @@ gen2_i2c: i2c@c240000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0xc240000 0x100>;
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 			clock-frequency = <100000>;
 			clocks = <&bpmp TEGRA234_CLK_I2C2
@@ -1891,6 +1905,8 @@ gen8_i2c: i2c@c250000 {
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

