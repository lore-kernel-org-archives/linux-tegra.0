Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D472BEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 16:12:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbjGUQMA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 12:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbjGUQLp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 12:11:45 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B8A4219;
        Fri, 21 Jul 2023 09:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaO5yzqWYq0jnw6Zc6L8iKgxsdGTQKVXqkkwFtedpEJVGh+x5NfdFOSYX9G1CmZsGy+NTyNtNm+zDQ37ys++fDOf0AGKPCGKxfn0nLZXDkAsBbnZSGVlRrm8QuHgy7teHTQ7bBdhdkE0P1obgudQ7yhSvLi2kqb6m4+EGgutsP1xddbfet6f0Tt/byDrmYtHDYo6eVgs4LHcZuhVLm8Crg4F8OHuxPNMcHR1KL6IIcFCI+DXM0GtEZtKe6jnLysO/bwf8T5vQiQ9k0l6h1Z8XKFtlgnSGuKnPsmbEeECy9KASY+uKQDlcjOe9hWbT1ZfWmOm8CzrwlFT3+RFWcH88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXSAAfD46HgI6bFXeC6kBWY1LTcCW7HHnHsXegNun3E=;
 b=hQq+ecVsk8Q9JtoXV3V2XHhCEKybzCWMRtd511ABwS+n3PZ72D9VTwRJsthwR1Q4nqBKlyMRXC321RsPH7YUFEqWsdI/kbT+/Cc4G4lXOXwYu/u3AxLdL0EYuEa4eCHb66RxdDRFDoTd3u7q475YrTPxgVOKech1rQOpfNIaYGEx6WqEyMsDGoyCZ8jFMwdpkwhkKQdxX8ehc9l91Dm6kJcopAk2p2O7og7pDDlqEvAtsFFA3zbzZszPFPVE3HBAjb4U2L/ofOYG+KYsNTBb6ODf/Y5MfF8SZSkA1KpTHO16aul5LSwVBpldR2/M7QqwobowZXSF/SgHyTLlPKmdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXSAAfD46HgI6bFXeC6kBWY1LTcCW7HHnHsXegNun3E=;
 b=XZ5BBZImm+ay7QpF/SeA7AcqKMYgdvnawyuXHGMnV9XEo+4KJjenOnak7Ffd5+cyWBM06hHpWRPuRaK1YEDdfCgVvE9GxNaS38KXynArWgyZQxbG0BamTsR3qsAz+ET+BgH1hKmL6/l/1dCgR7VpbIRkWromNuN6i+7XM6VM7cZjqPAE1IHXR5NVRR8CJjT5daRycn7M0wxzwPKzYCgxxh9eh45Iz5jYaC25lXqSYw2FgEbsit4jDUSPYkGECY/97KEyYkUlTFOrUAYguKZiNRSzkm3l52c77P/UVgOhhpq1DwF3dG8rPbHmEDQjX0fG5LwmquY+95SA/bstuAeJSA==
Received: from BN9PR03CA0149.namprd03.prod.outlook.com (2603:10b6:408:fe::34)
 by BL1PR12MB5378.namprd12.prod.outlook.com (2603:10b6:208:31d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.26; Fri, 21 Jul
 2023 16:11:10 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::28) by BN9PR03CA0149.outlook.office365.com
 (2603:10b6:408:fe::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 16:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.25 via Frontend Transport; Fri, 21 Jul 2023 16:11:10 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 21 Jul 2023
 09:10:58 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 21 Jul
 2023 09:10:58 -0700
Received: from build-gauthams-20230504T093912783.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Fri, 21 Jul 2023 09:10:58 -0700
From:   Gautham Srinivasan <gauthams@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     Gautham Srinivasan <gauthams@nvidia.com>
Subject: [PATCH] arm64: tegra: Add SPI definition for T234 devices
Date:   Fri, 21 Jul 2023 16:10:50 +0000
Message-ID: <20230721161050.3480492-1-gauthams@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|BL1PR12MB5378:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d40aaa-baca-4d22-95bb-08db8a05194c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qbdE4OPRzX4xoYZYSEqmFZxR2+JdxtODEbeyh2GckTCCft0fL2W8/Q6sj4GPik+rQydo3450QZIeSMoaCxUneCo8dLuhDrvHMk/+YLlYuBT3Xnx8cVfzGXexQqlvSHQiIGQ0yetL8oUBM9ZKMsNXfkND4K9uS1KwijI3ZsOgjG+DpXzuA7DBo7ueeAYgTRROGFJIuKz0xIFg2FYK/tZMgWHhBkGwu1DrDa+K2oXyv6v3Ljn8gaRNc7SqqCTyh4+lUj2fszN5BGmbGM3r2FltOkvgx9tBCRYQ6fGCuiNfhycZGRth577L/4Cusu54OY7dIPHAv9FDSmdt4cAabmq67wxQsmr83nefbCo5GjC66eNUu1GnzFMWUhh4+kocvvfjp9wpNfvPUTz5HanxL40CBvheXYSf+ZFz/plRuL9X7Ggwb/sH89wfPkmREBb7C/QncTNn/zMSqYEaSIcPFdRz4t+JLClTmCE2Q+fvYlKQ00gKHRktLX5N8fvwSZceRzYFisn0TpBMcbWSpdzNzSL2eiCErqNnlvYojZ6pmIqVvmIrASbDQScjBsg6sSuiz5TFtvtP35zDmTrFNoKe51I7znPT3M4Rqv7A0OVIS1jBvPgOjmyAR6cJHR1uTpj0J9/97GGdZhCUqNYTuzrwtEVvBnM0rQtYW327mfdpLicqBczs8h1ZQA1dEcctqnOC3ClafImLHwrhXVhm9qGuDabgmOK+k++9twRJxT1VdCXKACIR/w3ZYJFWdUROELTBPjNI
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(36756003)(40480700001)(2616005)(426003)(336012)(186003)(36860700001)(316002)(47076005)(6666004)(83380400001)(41300700001)(478600001)(70206006)(70586007)(4326008)(1076003)(110136005)(107886003)(26005)(82740400003)(7636003)(356005)(86362001)(2906002)(7696005)(8676002)(8936002)(5660300002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:11:10.5101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d40aaa-baca-4d22-95bb-08db8a05194c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5378
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Create infrastructure to facilitate usage of SPI1, SPI2,
and SPI3 for Tegra234.

Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 64a9d0d0b5a4..5d36f65d4ecf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -809,6 +809,44 @@
 			dma-names = "rx", "tx";
 		};
 
+		spi@3210000 {
+			compatible = "nvidia,tegra210-spi";
+			reg = <0x0 0x03210000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&bpmp TEGRA234_CLK_SPI1>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_SPI1>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			clock-names = "spi";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			resets = <&bpmp TEGRA234_RESET_SPI1>;
+			reset-names = "spi";
+			dmas = <&gpcdma 15>, <&gpcdma 15>;
+			dma-names = "rx", "tx";
+			dma-coherent;
+			status = "disabled";
+		};
+
+		spi@3230000 {
+			compatible = "nvidia,tegra210-spi";
+			reg = <0x0 0x03230000 0x0 0x1000>;
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&bpmp TEGRA234_CLK_SPI3>;
+			clock-names = "spi";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_SPI3>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA234_RESET_SPI3>;
+			reset-names = "spi";
+			dmas = <&gpcdma 17>, <&gpcdma 17>;
+			dma-names = "rx", "tx";
+			dma-coherent;
+			status = "disabled";
+		};
+
 		spi@3270000 {
 			compatible = "nvidia,tegra234-qspi";
 			reg = <0x0 0x3270000 0x0 0x1000>;
@@ -1734,6 +1772,25 @@
 			dma-names = "rx", "tx";
 		};
 
+		spi@c260000 {
+			compatible = "nvidia,tegra210-spi";
+			reg = <0x0 0x0c260000 0x0 0x1000>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&bpmp TEGRA234_CLK_SPI2>;
+			clock-names = "spi";
+			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
+			assigned-clocks = <&bpmp TEGRA234_CLK_SPI2>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
+			resets = <&bpmp TEGRA234_RESET_SPI2>;
+			reset-names = "spi";
+			dmas = <&gpcdma 19>, <&gpcdma 19>;
+			dma-names = "rx", "tx";
+			dma-coherent;
+			status = "disabled";
+		};
+
 		rtc@c2a0000 {
 			compatible = "nvidia,tegra234-rtc", "nvidia,tegra20-rtc";
 			reg = <0x0 0x0c2a0000 0x0 0x10000>;
-- 
2.17.1

