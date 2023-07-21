Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0860EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 16:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjGUQG7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 12:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjGUQG5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 12:06:57 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857D72D51;
        Fri, 21 Jul 2023 09:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuYzcPRvGrX5bBQtZOyTcYHUEyuvGIpvX39L5nhy6/kcJw0oMbHbDUVmJsq3fdDWocZEkgMcg7dLoILPpthH0oZYF7U3MIqG47YDGcugwhGDhk5g21ceyOC5LyaSX8ne1FhDOUTKp+SBf3sSGj9a+HnYInUgNcc7jWdKzqRM5keMbkbDgKCkIECpyCVmwQ2Wtx7IDtpc4itKrPLoMBgHNpdVeN8XaPQc7eh5MHL7U6G4QnXzFX8NionW4/WDIzIBXcvBciGguPdXCpghgTt0F5I8hzercq9i8BeuW3B6fp5NXKdpJ46eiZ9vHvak5KzHRD4VzqQCP72Y9EzpBgRp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOZXh1c9q4U3cHbzoe0C1LrSagNHUud4zYazmCTMuU8=;
 b=UbdiLUbwQFFKVTd41s2DhQMVhaqNsBf0nu1nFJKuPUrfBaoAB0X0kz7Jiy3kufTAM4DhyYV58vj2plc+w+8ie8TfOuXEKlG/OcklyCZ9gwZ8qvfY5nCH5FiBmiJyQ4RbS/tHW/CR/QIC0UxKTncZcDnsmwdPNTzHTAf2m749tPCnbJT7IbG2YRP4uUDMrPMUDEjPQSoOFIZTeJFS8/COAchzqrD+mCh544Idg1SZYTaZ/itEsCyC5C7aJDYYS5GQixryILI+CscDExFZlWg/0lNC6ybNClJSPvNEzQKpr6agFy4pIZuxARJ5e1NkE9vsZ5O6H1sSCzDH/O9XtpvyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOZXh1c9q4U3cHbzoe0C1LrSagNHUud4zYazmCTMuU8=;
 b=mkCYONqqyCFHjGKrEcdlThUZHhJ3PnCd9xmW1zC7aZLHwgN67hWp17AWUlO282JA+d/5So6re2UA5aR79fWmQZfe4EyZ37HCTM81cE4NP1Fe0gl52FWJcuVL4GC8YVtniibAmE0YqFVua6emZhE7LrYSe2yziaHspN8xZmxLm7F0RaYCr9Tvt2IRdxwO+jsKd8j4Pzio8vyHpwsohvQeSu3AK/eJycUqTD/4AMcbXloYpOp5M4hW1FYlS7GPtVsXv6Yt/8MPmLDRCaEhQRTFdfrDEHWjI8pDp5hQVHEY3NsYCPWDLQKAiteZ7sf5IAzXAhyYRmRBuRX9ngrIacanYQ==
Received: from DS7PR05CA0057.namprd05.prod.outlook.com (2603:10b6:8:2f::21) by
 SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Fri, 21 Jul
 2023 16:06:51 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::7d) by DS7PR05CA0057.outlook.office365.com
 (2603:10b6:8:2f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.16 via Frontend
 Transport; Fri, 21 Jul 2023 16:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 16:06:51 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 21 Jul 2023
 09:06:42 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Fri, 21 Jul 2023 09:06:41 -0700
Received: from build-gauthams-20230504T093912783.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.986.37
 via Frontend Transport; Fri, 21 Jul 2023 09:06:41 -0700
From:   Gautham Srinivasan <gauthams@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     Gautham Srinivasan <gauthams@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Add UARTE node for Tegra234
Date:   Fri, 21 Jul 2023 16:06:36 +0000
Message-ID: <20230721160637.3479801-1-gauthams@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT068:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 796b8b7f-d56a-4665-42e9-08db8a047e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0h60sKLIdcCrLuf64GukZv+D1O4eBev6mBuPmc1VpyDzRTce4DEUBnR0SLdzUDgCSe0rIbKzFpPPwTkXL0gFw2ucHfcem+dT+gU0RJP6r8SkpmttHZkekGY3cSIwH5DLIK8cakXKUEqL/M8vOiM6KD+gvs2H+M71OWAPfoJAbzxBnAqugfrx0GznQ5oe9coyfuiP6/1EbeXF1uqTm2+/5nlE60JiXu0tW4s5fQyDub1QOM7I3xTCh/sM4Oe9UsvJV/pE/SLfTFVdQ8rP0a3xV9XXDKA0rUuCujEDIG8tcdIuBibY/NEkbPGeVbixsm/rvC4Z0kNH/7Q/1WkEYATgCBmRINb28/XZI5+SZJpPrYkr53jB7UdSvyIRT4oceqJ2SGMBG96hgxQ+OOcVwmTEc1hnF9yrr/YYh+zg637j2nAUAug8/uoPC7CZyFZ5g45L7IgWZkU4wy5LJOqDIfINsZO8+xu2XTBYgsCCIHEFPUkQx/SlaD4JDFwWh0NByMJVxRiptMNGIhCdR5TsFX/StkHtXrPcCd2A7EFA7tk+vkX0dNDNmy62NGyNqqgGsJapJPrl3n1YBYLmRPuFhytgihC5Lbj8AqhRrHYPrOqdC2oSQMKseLQ371tbjkZeILu1pLBfwZdeL/XwPmC0PSRok+kChdv516ns44XRmADnyP7UYz6ltVxD7BLUoR/3QmaQNvphhBm4EmIXrMkBMuJsg674aoQOCTAk+/cG+aUghSKpzbNeKjZBHvyvAF/x32Yi
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(336012)(7696005)(36860700001)(40480700001)(36756003)(86362001)(7636003)(82740400003)(356005)(40460700003)(4744005)(2906002)(107886003)(1076003)(5660300002)(478600001)(8676002)(6666004)(8936002)(26005)(70586007)(41300700001)(70206006)(4326008)(83380400001)(2616005)(316002)(426003)(110136005)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:06:51.0519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 796b8b7f-d56a-4665-42e9-08db8a047e9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit adds UARTE device node for Tegra234 SoC.

Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 64a9d0d0b5a4..f067326739c6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -688,6 +688,15 @@
 			status = "disabled";
 		};
 
+		uarte: serial@3140000 {
+			compatible = "nvidia,tegra234-uart", "nvidia,tegra20-uart";
+			reg = <0x0 0x03140000 0x0 0x10000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA234_CLK_UARTE>;
+			resets = <&bpmp TEGRA234_RESET_UARTE>;
+			status = "disabled";
+		};
+
 		gen1_i2c: i2c@3160000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x0 0x3160000 0x0 0x100>;
-- 
2.17.1

