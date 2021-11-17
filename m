Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F31C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 09:56:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F21B261AED
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 09:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbhKQJ7Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Nov 2021 04:59:24 -0500
Received: from mail-dm6nam11on2087.outbound.protection.outlook.com ([40.107.223.87]:35456
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235719AbhKQJ7X (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kei0xEHvHbfrAHIUnBxTHi+S3kenv2GZS2u5uQU7/JBXqxoYZ/jJX1cdvbm2tx7oKURES4Sh3n2AN+NLrjKidKR6AeYzviRnc0w44IH8zLpEzle7ZMmKmAQn37+caPiFytkfUb0Ykb7jLU68bNHyg/n2FvIOgiyGwR75+m7SBayQElYwUD2yosRUPKuY+QZc9ENpEGdqQGGGaJ9h9/7fu+B5iv8IurvAVNii2y0ywQ+Lpwp5xRPBY5WY5FWnAcMPT5afQSYGQWIf5VRIqO44vDbwEZOkNTMPdo6YbYl9BdHuP1yA/Z7+BoYYj6syACm5h1sGYymCi02RoVTWcd3Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zn5Q8bh8jYStsvRCO/wZ+ql/12lFOmpC5TY/9K6oM/0=;
 b=RypWQkAnOXYX3THKpQ6Wq+G5N7x8zOswPKWKXL2g4EwvOaHmy6aFBVCdSSikheUA+Qu/IqFSxdAi36yK18wYpQIeF+jwQANHaxortr8Gfky9bWRMNtVQ+2tnegGAD3ryvfJuRV+FrJnAx9nAUVaD/guovdc+gUGe/FAn7feLAabi0WL9sJ9KrJKjGlDg+5wp+ImmKfwLe/1S5uTwTHIVo+/J+JEMY9MgH3JUzoWHRAn61vsLk3QKckhpjc0YGb1nmmwpK/Gf1gG4ScZUlXjB7bjbiS7CMpwGI+xVjFyl8Js0R9VcI+ivKCjHzRQGsP0v5biSm//LaoNil9dCZNRZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zn5Q8bh8jYStsvRCO/wZ+ql/12lFOmpC5TY/9K6oM/0=;
 b=iWNSep2jTWvZFxn870/rBnE7Bq3Dggrb9x1Mje9JUqnjXaL5BJOSTu4hizKObM9QJ+OnnMDiMkA5+3GmoiXyE+HeyuhBnrp+6lCw61KezAizN7HC4hL7L7J3di5Ee1w8XR78fbvwHHjV2qTDiqJVHi+wir56ELxO16x3Kw9JLMFplA7EvmohmX4jTLmJqFgBAlgbd+j4gj4LkGo46VjQjj6WA8lJl6v+IxPfYTI+505seGxdGhKlluX49U5X8ln4Js5mn2QdvqSUwMPyLSmksjFGCw33HkttJk9ibhMg2TzZWm51bdMgU2b9JwPnFgugYoNvgCUCNFv6rzD1x3vUUg==
Received: from BN0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:408:e7::14)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 09:56:23 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::7f) by BN0PR03CA0039.outlook.office365.com
 (2603:10b6:408:e7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Wed, 17 Nov 2021 09:56:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Wed, 17 Nov 2021 09:56:23 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 17 Nov
 2021 09:56:22 +0000
Received: from moonraker.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 17 Nov 2021 09:56:20 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 2/2] arm64: tegra: Add NVENC and NVJPG nodes for Tegra186 and Tegra194
Date:   Wed, 17 Nov 2021 09:56:08 +0000
Message-ID: <20211117095608.60415-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117095608.60415-1-jonathanh@nvidia.com>
References: <20211117095608.60415-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a734b90b-6208-4bcf-5834-08d9a9b08360
X-MS-TrafficTypeDiagnostic: BY5PR12MB4115:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4115BEA4905350AD1B685922D99A9@BY5PR12MB4115.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AwAJHm3+SMly8l6s2y4HiuwvjaS5ByFmMoeFuPWz9yJ0s+FQarfg+vNyJRSESBm1RVPk3HhiM7fJ1gys/85FRKlg+LIM7MCRjgEES5lJSynv+uewHsYaWOelHzFVu8qtoh9VUZHIv9OsCN4KXuhFUIFyKTIlyclplOnnX5NeWAeVcTvbfo5nfNi1QhFyjGx3xRA9M1qTF99NJ4To4NsO+JK8Mmzd73XxJGxmEsPKBSD8TgyqQC8w74QcwyMjbsnuF3MSn2MLqnhB5XTN9DMmqq0jlxvK/33g4Y4KTsEohUGOWdM7w4VTkYbd9QEQlFiFc336FT7y4QgFl36rdfHZy2yVZdnPlrLCdk/L8vS7T5J0nS80wtCkwD5ULdfdeKCkpvFLpHXSUttCr2z18ibUK767gdmus0DM4147ZD4Oo8MuNtw1b6Nu+57Fs4fpCA4NIaOC1XYgjqu6E1vXvgNb+fH9bK4MMUCUXesDfb9E9U4bpEjPhaawGoj/24GMa2xKz0Ah3ASJL8UIgs5nh0G+YSUn6pnB977fWa3M+0LBaBOmUZGSBKWLyvpCo+LnZkZ8EMlRXRr6NaWBdFbC3YgjJj3/NMg8BEExtCLFUOdq/jyPr2g5dbBAXxPokgxwEnqj1bVQGlednhxVNJxpfC/Jc9bQ6e0K4X57vAOpv/rm6Toh6Ey0vb+/j8O8RYEwy1fiuXiKlHZ9m9HtVwUSC0Pd1A==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(70586007)(107886003)(36756003)(36906005)(4326008)(316002)(336012)(186003)(426003)(47076005)(8936002)(7696005)(508600001)(36860700001)(2906002)(70206006)(54906003)(110136005)(86362001)(5660300002)(8676002)(2616005)(82310400003)(26005)(1076003)(83380400001)(7636003)(6636002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:56:23.1244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a734b90b-6208-4bcf-5834-08d9a9b08360
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the device-tree nodes for NVENC and NVJPG Host1x engines on
Tegra186 and Tegra194.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- None

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 30 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 54 ++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 9ac4f0140700..f21cfcaab2a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1538,6 +1538,21 @@ vic@15340000 {
 			iommus = <&smmu TEGRA186_SID_VIC>;
 		};
 
+		nvjpg@15380000 {
+			compatible = "nvidia,tegra186-nvjpg";
+			reg = <0x15380000 0x40000>;
+			clocks = <&bpmp TEGRA186_CLK_NVJPG>;
+			clock-names = "nvjpg";
+			resets = <&bpmp TEGRA186_RESET_NVJPG>;
+			reset-names = "nvjpg";
+
+			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVJPG>;
+			interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVJPGSRD &emc>,
+					<&mc TEGRA186_MEMORY_CLIENT_NVJPGSWR &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA186_SID_NVJPG>;
+		};
+
 		dsib: dsi@15400000 {
 			compatible = "nvidia,tegra186-dsi";
 			reg = <0x15400000 0x10000>;
@@ -1569,6 +1584,21 @@ nvdec@15480000 {
 			iommus = <&smmu TEGRA186_SID_NVDEC>;
 		};
 
+		nvenc@154c0000 {
+			compatible = "nvidia,tegra186-nvenc";
+			reg = <0x154c0000 0x40000>;
+			clocks = <&bpmp TEGRA186_CLK_NVENC>;
+			clock-names = "nvenc";
+			resets = <&bpmp TEGRA186_RESET_NVENC>;
+			reset-names = "nvenc";
+
+			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_MPE>;
+			interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVENCSRD &emc>,
+					<&mc TEGRA186_MEMORY_CLIENT_NVENCSWR &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA186_SID_NVENC>;
+		};
+
 		sor0: sor@15540000 {
 			compatible = "nvidia,tegra186-sor";
 			reg = <0x15540000 0x10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 1adf076526c8..9586af9a100b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1782,6 +1782,22 @@ vic@15340000 {
 				dma-coherent;
 			};
 
+			nvjpg@15380000 {
+				compatible = "nvidia,tegra194-nvjpg";
+				reg = <0x15380000 0x40000>;
+				clocks = <&bpmp TEGRA194_CLK_NVJPG>;
+				clock-names = "nvjpg";
+				resets = <&bpmp TEGRA194_RESET_NVJPG>;
+				reset-names = "nvjpg";
+
+				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVJPG>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVJPGSRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVJPGSWR &emc>;
+				interconnect-names = "dma-mem", "write";
+				iommus = <&smmu TEGRA194_SID_NVJPG>;
+				dma-coherent;
+			};
+
 			nvdec@15480000 {
 				compatible = "nvidia,tegra194-nvdec";
 				reg = <0x15480000 0x00040000>;
@@ -1801,6 +1817,25 @@ nvdec@15480000 {
 				nvidia,host1x-class = <0xf0>;
 			};
 
+			nvenc@154c0000 {
+				compatible = "nvidia,tegra194-nvenc";
+				reg = <0x154c0000 0x40000>;
+				clocks = <&bpmp TEGRA194_CLK_NVENC>;
+				clock-names = "nvenc";
+				resets = <&bpmp TEGRA194_RESET_NVENC>;
+				reset-names = "nvenc";
+
+				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVENCA>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVENCSRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVENCSRD1 &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVENCSWR &emc>;
+				interconnect-names = "dma-mem", "read-1", "write";
+				iommus = <&smmu TEGRA194_SID_NVENC>;
+				dma-coherent;
+
+				nvidia,host1x-class = <0x21>;
+			};
+
 			dpaux0: dpaux@155c0000 {
 				compatible = "nvidia,tegra194-dpaux";
 				reg = <0x155c0000 0x10000>;
@@ -1937,6 +1972,25 @@ i2c-bus {
 				};
 			};
 
+			nvenc@15a80000 {
+				compatible = "nvidia,tegra194-nvenc";
+				reg = <0x15a80000 0x00040000>;
+				clocks = <&bpmp TEGRA194_CLK_NVENC1>;
+				clock-names = "nvenc";
+				resets = <&bpmp TEGRA194_RESET_NVENC1>;
+				reset-names = "nvenc";
+
+				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVENCB>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVENC1SRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVENC1SRD1 &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVENC1SWR &emc>;
+				interconnect-names = "dma-mem", "read-1", "write";
+				iommus = <&smmu TEGRA194_SID_NVENC1>;
+				dma-coherent;
+
+				nvidia,host1x-class = <0x22>;
+			};
+
 			sor0: sor@15b00000 {
 				compatible = "nvidia,tegra194-sor";
 				reg = <0x15b00000 0x40000>;
-- 
2.25.1

