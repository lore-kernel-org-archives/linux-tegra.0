Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08E3C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 15:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EDA1630EF
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 15:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238595AbhKPP5t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Nov 2021 10:57:49 -0500
Received: from mail-dm6nam10on2058.outbound.protection.outlook.com ([40.107.93.58]:12896
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238627AbhKPP52 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Nov 2021 10:57:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAuHtcT3azNQlXX6o9DxeXzH9ZIRlr+C2rT1wVSQce5J0K2UjhqbI4wsdJDWPfpTUQNpnJej8O/ufoOCmornlcjWFtwnN/4EUNDb7HVCQp7zmhkrU+BpEudDCWY7lkor4YvlttScenlahFb1yOQ8bYHYJDowazQiX/f5w0RDjqbwWNfR9TKIaKFJME8hs223CH5ghULTNNmNE/parerJvFZzdGtNU7tRk/l0HYJ6uG6n0gLUC+NsWHwVqak8gXtvFP9r1HZhwRlsLsE4Y4KtyeQ8rG0JuR+fLoU/dJipRXAhhMRmr+hlhSIqrB17AiNDSNA7aXGVJgEBRQ1+9Ppanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zn5Q8bh8jYStsvRCO/wZ+ql/12lFOmpC5TY/9K6oM/0=;
 b=Q/MbpDqqApZu2dIvGCZ99e2HL0GLjgLdqaom97hz6ibfwk98ydhwkbK2FC6+mxRx6pf6xK4gnyNAC0OjGVSdWZ4aaCqP4VwPbZ/vx667kSge7h640I01KXnj2OLgM87sEaxMu1oDORZRHXIBQ25BISFgUhqNk6gC/x/IBN/852ObSq8hsm1QxcIYUjcsc+gUFeJZWDbr+iC8tgPR8S/HBkaBaJOHr0bVnusvYwfb5+BENRh0KflmOKgHUccFBUoBk84X7fw+d82A0m+XwtZogkm6tu9MHY/YiAl6jb/v0E4WMEb5+IymawwVhkgNztyVNBVcSGgB4j4mTR1Vrztm4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zn5Q8bh8jYStsvRCO/wZ+ql/12lFOmpC5TY/9K6oM/0=;
 b=X1Tw/EdopPxKxezwdprS8zKO9drTZbX5v5gFO5DFakOHa01ugUodlWqCUjtuHPcXyZC081z8ev4wxqSaX406I3hWVBH/cejHtIhWUBmuIlpuXNBTlM3+FEXwZm11ThALA87uHErfHuDyjaDG95yLyuFo/xPjSvxnJZ6G0VeV/Cl17gkT7vowHfXW5yczIjFu/J2TtUfCVaRuyMTX7anOgCnHoDjuddDHtofvRX4R5914NQMFwvMfu33zsZ5JlI+ggS6FYXzxGIbJ/aJoMq8/WvTN4HyGb4dvfaIIS9pJw/rBts0bqiUdqRLbiNMmyJxvSlkJXe4YumHzch7spfuJNg==
Received: from BN6PR14CA0046.namprd14.prod.outlook.com (2603:10b6:404:13f::32)
 by MW2PR12MB2428.namprd12.prod.outlook.com (2603:10b6:907:6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Tue, 16 Nov
 2021 15:54:28 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::f0) by BN6PR14CA0046.outlook.office365.com
 (2603:10b6:404:13f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 15:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 15:54:27 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 16 Nov
 2021 15:54:26 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 16 Nov
 2021 15:54:26 +0000
Received: from moonraker.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 16 Nov 2021 15:54:24 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/2] arm64: tegra: Add NVENC and NVJPG nodes for Tegra186 and Tegra194
Date:   Tue, 16 Nov 2021 15:54:13 +0000
Message-ID: <20211116155413.164242-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116155413.164242-1-jonathanh@nvidia.com>
References: <20211116155413.164242-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be5393e6-4421-4341-04f7-08d9a9195e91
X-MS-TrafficTypeDiagnostic: MW2PR12MB2428:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2428EEFDA885B29CF2A10491D9999@MW2PR12MB2428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: doEVXBCOc8Fr4Wh9p+X/hh1PbMBKtPZj4fU6L/2f3wEGCULcsLOPRUJknT8focKdx1sJIuLUfDpuv3P6/pyy8xik1r1ZP6UzC0VqkbBgDWeLpRkH7mGEEn1GJUllhBSlHayQtc4n/tLnBBC2VwtRdPFM3qr+tNJLhFZU77b/S17CVnb5q8Fj9zFzrfMziaO7S6z/NUP+d5BJAhcWiolypfANShFywgZ59F4ME+sW7HGCAdgGRLN6O1EFTmQ7bf/O+g5SD/aB553++TxmZAtjf6JOcObWh9hH7xcyBOTMG0j1S+xaxuMQYj7FnsFQ2htJXMTRcTBknuADjhnwXGYVtWTLmTbVvuPcRmsP2ffgSi2q4gDGcy9/tV+UjvaPkqJt48giEo+Ahn6Pbe//80JYqnPvZR1AZdp709U/oD0slC8x0j+Mxknq44S3vOmcfgIJ/Z3Xhcblf0z4/okqw7Ay8hLHpeL+E4+nWJjLiQMhyG8qIzLdG1p9E/6L5gAMZ4unGqJIPqOHkYCOnGY7MV8zkmyf1Si6TgO49dKuFiBS3KpB7WhMDTx9KDGZbKwY9sDl1n3R2SIzOV6Wx3J4pcpXlT3kn2/PUnxuDVs87OBCfPDfQ4i2b56vU096kv6FLv7JY54428rJZRay/K4WFU4S+nbKzSg3RAu7qyeVLh7kEkr/7r3OZ6DcX/yHk4rVa6rls1q+30RXAdwqZLkgyrENdw==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(70206006)(1076003)(36906005)(6666004)(8936002)(110136005)(70586007)(508600001)(47076005)(6636002)(7636003)(2906002)(316002)(36756003)(2616005)(107886003)(186003)(83380400001)(356005)(7696005)(426003)(336012)(82310400003)(4326008)(36860700001)(5660300002)(86362001)(26005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:54:27.3635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be5393e6-4421-4341-04f7-08d9a9195e91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2428
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

