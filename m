Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF52CC07E95
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jul 2021 11:36:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC2C660240
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jul 2021 11:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbhGMLjF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 07:39:05 -0400
Received: from mail-bn1nam07on2084.outbound.protection.outlook.com ([40.107.212.84]:1955
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235623AbhGMLjF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 07:39:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afF2EjfoV/MeHQ0iV0ncELXISld4HpWqx4a7CjN37XnPVLx6VlQ3C9uie7D1zOOJMJoOZt6IYdUBX/OQXRkXT7coPSLIXvCSy2tSyABD5GV8O/UukLL/tScyUzlOIbFCADArZ5TxtNAHXTMao8r1J96chxXxGIPtknBvZfE9Ice1p0Bn2f8VlG36GdPtRiF4G3r12+rlqHY1NvX6xgv6W6e8OHWATHUW7ZXESQDkcWsdrEZWwnmlHGStBoa64bMJ5IyT5/XRB+bWPJVdx785mM7nFl/NGUCKldxU7MFN2Hjhgkvu1aBUDd+hSZl1Oy89wsu0TNeXpctKpbOj9d6RuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR2utq8MAJlrcEid5OvcjSH7enEdtkAh1oZq2vJh4/8=;
 b=PI/r6uYiJnl9BQR5nqv2aHx5vloQzD0BwNEy+OJAIAKCNvx7Mw8rxNUqpPK4t7RUpfI2PdvBrjCtMtEGL+0tHeRMY7FHdnABQ3oA9WC5nYSLlPqrqHUGE8yHquuQrYNRWSOK1sQe/OeLD4cVZN0BK5kkDfvnqOmOmhjl+Lm5WiGmTQWL3qTjgn7koLwAH+vihTaL/tBIZ7ljI5hYFYpVrLqHS6pH3TIEQ9THxEjy/14cedZ2wRNaEjGprEjbfmauQB3tVo3zOJK/bjYNLkhxjQW7F1E35sg4g4vWH4yVVEGAXQelJTkgY8AqTCxe7+NE4EgZJVoKxzh7siiOZnV7gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR2utq8MAJlrcEid5OvcjSH7enEdtkAh1oZq2vJh4/8=;
 b=GDcL+a5s83uc+9jUbqtb+YUJVlEDiPmtFt/JffRc/Ob4MId1bf11LilbHZvh8l2BS8inDSaqZBnX7W9mTflsEOqGbTjlCH8eXzpgwEbsKalEp8CBnbh+caZDEHjpWSARJLjS7TAsaZNTyAAUH8fsqgK927swjdeN70KVyZjWbPhYMRclzFyxK7wW3qONizu5G4USp8FT5X1okI4e11op/CGQiegEzrvnSFZtGKH+2pf5wNXu2XIo7suV3bC8fr40ksuRBkjOWeLbb0LEmpq8mtyI0Ic23CanvskAKcFc9pGJr/7eTtaNe9ZAbxZVa7DehDBri87AKA0dFunGNdpxNg==
Received: from MWHPR1401CA0018.namprd14.prod.outlook.com
 (2603:10b6:301:4b::28) by DM5PR12MB1868.namprd12.prod.outlook.com
 (2603:10b6:3:106::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24; Tue, 13 Jul
 2021 11:36:14 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::29) by MWHPR1401CA0018.outlook.office365.com
 (2603:10b6:301:4b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 11:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 11:36:13 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Jul
 2021 04:36:12 -0700
Received: from vidyas-desktop.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Jul 2021 04:36:10 -0700
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>, <sagar.tv@gmail.com>
Subject: [PATCH V2] arm64: tegra: Enable SMMU support for PCIe on Tegra194
Date:   Tue, 13 Jul 2021 17:05:46 +0530
Message-ID: <20210713113546.20286-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713044414.25536-1-vidyas@nvidia.com>
References: <20210713044414.25536-1-vidyas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b752363-f077-4c32-90a5-08d945f26b9e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1868:
X-Microsoft-Antispam-PRVS: <DM5PR12MB18683EC1ADC1EADB364B990CB8149@DM5PR12MB1868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdhshwBey5Y728c5xJUzXgBlRim8ZF5oKUrQD/YeuN0o98Yab1tYZCbpS+F5uqWOWglWrDfUDTvrqMgeXHbOAbCA94efnQW7p8jR7DpFPsiPKbpECH4+GIOETwXba6TiaHcZh/OAaKFnnSY5EAp5+gp0KMLbyEQrwxRCayXyPrr/iQXJOIZTMUKKqKIK0HAg4lmEbw0mi/OxtiGYGNuWJf6ShwRmI/P7r1F8qxMupCxBP/92RpfmUFpELCXRnFHQkxu//8GdZGjZRI3Kl46gDiDnBQrepFXfwrKc+nvqUEr1I5RZdGeE9iXv8yWdpeBfOhlsof+st+oTsh/fzqWgGhaxQgNQwJUg8iNaNGvehG2AEuguRtkY6GZ55PmeWAgQgzWhp7X/ZGLQ1Ynaz2OsBGHgLc9RR3U18WkuhNBThfQLqpgs7U4D11YVywhsqEDfcs7A1w/FacJsv3G9YWQNeAYLL3E6g9OhkWWMnopEtTDJX8uo101foGdd1YXODNm268J+frcXZyZjH+v7omjGhadmI1Qh4EYIq2Mp0/X/Hwv3Jvipm4ieUCj/tET6hj0HWT36Qkxa+yrU66DBj44WQyR49IB44A/QH8kpZBOaotxFFjaqXHL40Mo9MOOk755lKNM7g3fzVbHRXxafaFTI1ERRoYd1WOlmb8MY7fA7CK1NAbE9NH9kNjIbCan1VVzFAHm0AuaDLmYlv8fjPSgLy1Ygu8G8MkxXuq4JMYDi600=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(36840700001)(110136005)(8936002)(54906003)(336012)(86362001)(70206006)(70586007)(83380400001)(7636003)(356005)(7696005)(186003)(26005)(82740400003)(36756003)(316002)(6636002)(6666004)(5660300002)(47076005)(478600001)(36860700001)(82310400003)(34020700004)(1076003)(4326008)(2616005)(426003)(8676002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 11:36:13.8482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b752363-f077-4c32-90a5-08d945f26b9e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1868
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

As of commit c7289b1c8a4e ("arm64: tegra: Enable SMMU support on
Tegra194"), SMMU support is enabled system-wide on Tegra194. However,
there was a bit of overlap between the SMMU enablement and the PCIe
support addition, so the PCIe device tree nodes are missing the iommus
and interconnects properties. This in turn leads to SMMU faults for
these devices, since by default the ARM SMMU will fault.

Add the iommus and interconnects properties to all the PCIe device
tree nodes to restore their functionality.

Fixes: c7289b1c8a4e ("arm64: tegra: Enable SMMU support on Tegra194")

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
V2:
* Changed interconnect-names from "dma-mem", "dma-mem" -> "dma-mem", "write"
* Added Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 60 +++++++++++++++++++++---
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 076d5efc4c3d..5ba7a4519b95 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1840,7 +1840,11 @@
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
-		interconnect-names = "read", "write";
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE1>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE1 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	pcie@14120000 {
@@ -1890,7 +1894,11 @@
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE2AR &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE2AW &emc>;
-		interconnect-names = "read", "write";
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE2>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE2 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	pcie@14140000 {
@@ -1940,7 +1948,11 @@
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE3R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE3W &emc>;
-		interconnect-names = "read", "write";
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE3>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE3 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	pcie@14160000 {
@@ -1990,7 +2002,11 @@
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
-		interconnect-names = "read", "write";
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE4>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	pcie@14180000 {
@@ -2040,7 +2056,11 @@
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
-		interconnect-names = "read", "write";
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE0>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	pcie@141a0000 {
@@ -2094,7 +2114,11 @@
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
-		interconnect-names = "read", "write";
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE5>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	pcie_ep@14160000 {
@@ -2127,6 +2151,14 @@
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE4>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	pcie_ep@14180000 {
@@ -2159,6 +2191,14 @@
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE0>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	pcie_ep@141a0000 {
@@ -2194,6 +2234,14 @@
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
+		interconnect-names = "dma-mem", "write";
+		iommus = <&smmu TEGRA194_SID_PCIE5>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	sram@40000000 {
-- 
2.17.1

