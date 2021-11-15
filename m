Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA85C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 15:17:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C625F61104
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 15:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbhKOPUZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Nov 2021 10:20:25 -0500
Received: from mail-sn1anam02on2082.outbound.protection.outlook.com ([40.107.96.82]:64710
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232269AbhKOPUW (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Nov 2021 10:20:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+n5ZpWblIsxM7nwhBIbAGoUo/HSVW4ExWzTdgybWGnZmfDMo4mZVC23T4ImtL4p4jDJcmhb7x+BYubEI6m2ObM1wynaylWdynW2UV0GeOSTm4htk3k5ImlAH96fxMKgkC7iFHpb1BKSIogrr8G4zCY8Y7dSAoygKwRYtYTh9oTWWX+2GdM6JtmA6uQIFR1Q+2GXO1CzsCZogrs764uQMOTnn3JtYAeJsDpTatwejp5mmVU/adNKdPceVQdyT0mm0ajc/K7ErXWmAxZv11aY9T2s5iI3DBCXNVGUaFzuEdXlSGvrQCm5R7ulgoBWOaKsg8L2cxEVO+uQPznXbsb6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrJ0f9kE1B7dRKXUiCGXOt3ZDGBAqOYAP6oQxPJz694=;
 b=k54EVVv3pc4Qr4AbpekrFdquqGNv+alBlewbMVJmUmyMowWiavN4WIM0uK8PFpvJiuJg6LeQt3eLIsjblPlc70QnVoZMYRx1yqak4Wz9hno6+ViTuipafkgHI6hUV1o11B9a4a0TY+xmez6w8MuogFRZjNv8PhFP8PpJQgCjw5uFd90Xu7/a3c8Sfz1hGZmrZkGe/ff02dh3aYgz9/RIORf1w2vy+oiy4x3lONjmPuhVENb09pnJZWJpIVeW+jkJnm+Vn/RCUR4aKF3fx99ttApnM4+VfRvHNAPK9NKBo7T8sPVSfjRXO6cJNhWCdzDkLX3ewpQ6Nz9Xb0nfZcoZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrJ0f9kE1B7dRKXUiCGXOt3ZDGBAqOYAP6oQxPJz694=;
 b=EPPJAD1Kv62rVPmcV6WyS+vNrLifq7OWuNAPMMvMAbEanm7fdC98H+tPrs4NqhSYrfGl6ov0i3o46mPAVHdO9eWa/SaRRhtZ8cegnVdxDBipFaKOSh+VpCwdUiCrSWE5DQI2bcf5f0Arp8W4F0rIspFq53WhLfwTJZPMFKtTcL0sjlAhAWs/weAaFLAuENg+ITP1TQRW9BbgaMN9EYOqTKbVr7slzGRIRXFeVNVpV57ZOR86+zPYFFpVGw6ycFhsRcB9otuG2SOcIxj3WWRT/hUyJ+0+rm95XKs8LW3HV/dOfiQK4M37Jq31+lCEEjusipx/KsZ6VKBQSpJWSu4O2Q==
Received: from DM6PR17CA0033.namprd17.prod.outlook.com (2603:10b6:5:1b3::46)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Mon, 15 Nov
 2021 15:17:25 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::3e) by DM6PR17CA0033.outlook.office365.com
 (2603:10b6:5:1b3::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Mon, 15 Nov 2021 15:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 15:17:22 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 15 Nov
 2021 15:17:22 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 15 Nov
 2021 15:17:21 +0000
Received: from moonraker.home (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 15 Nov 2021 15:17:20 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Add NVENC and NVJPG nodes for Tegra186 and Tegra194
Date:   Mon, 15 Nov 2021 15:17:07 +0000
Message-ID: <20211115151707.287764-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115151707.287764-1-jonathanh@nvidia.com>
References: <20211115151707.287764-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63f42599-6fc8-4e57-4cd2-08d9a84b062a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-Microsoft-Antispam-PRVS: <BL1PR12MB52077267239E390589A8BF30D9989@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Xn6fe/jG5C1oloq8XMosFwlhFKpBJnKMhRhLCCtl44mBIHhNHFCIppXD+9m9esizcdtg+Pu99hr2qTWQeWMWnNhWehgAS3TK4JotZH+g5edDkXEcXfSxfHfjEuuZnLrSZPqr6TlBVigjDGJMBUkrC+m+5ALUtkbSfFWVUh83tx/HlvfGsugxrQTmZLPY2OYt0W/P3yMfmtPIuCeiErHrYe9jBzd6eoPSrUeXCG5bG5+sr92NbrPE1B0MaSBr7JYn002ldf+oWjhE1phOTKvbsoGiLiEiJMTq+svxmiYfyaTh5mGaAtVX8zTH3H60tK68wSxTqAYpzxj0tX6b9pI3nu2lm94R1+m0qCfviJauESW2Kgwp0DYrE3OOh/Lai7+i+UXCYnTfmAwDtRuI47lxfxqOnA8YwxtPtER6HHheuUq5tM1M9LZXFoC3OIcTpduSlJ4zjga6oNT4m0mRs4JA9+uOFoq2rLS6sGitTB0o5z8jbDf/aeXSaY/ivjXXlntA0sVjAI/vuoOmqjsahkzpriMERHWC/1N3ve6U71Vlb6Q0mFfS8jey4Dgp6A/+rKu/VavqmgmLADKGt+/jsOF8+ysDw3Gz77ZzM5ld+0qDrc86g3hnKUPDwevgwO8dqvXOILOJgIK22lOooIuDtTrcoUbWjSBvFIgcDwENTOlWxoUoEmMSwxDCFlGdBD83N7gJRXTWDUhgOcEwfQVA21olA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(47076005)(4326008)(508600001)(6636002)(70586007)(7636003)(36756003)(2906002)(426003)(86362001)(2616005)(1076003)(6666004)(316002)(5660300002)(8936002)(26005)(356005)(36860700001)(70206006)(186003)(110136005)(107886003)(8676002)(54906003)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 15:17:22.7136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f42599-6fc8-4e57-4cd2-08d9a84b062a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the device-tree nodes for NVENC and NVJPG Host1x engines on
Tegra186 and Tegra194.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
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

