Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B80C07E95
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jul 2021 04:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F2336100A
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jul 2021 04:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhGMErL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 00:47:11 -0400
Received: from mail-dm6nam10on2069.outbound.protection.outlook.com ([40.107.93.69]:61011
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229470AbhGMErL (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 00:47:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik67Q8k28faSO5hSyQHQCyAtppW+RNywyHz0+gNxkktdtkglHJVpNSBqkunOXEPRXtRseCh8U/GLW+5e1svzVdgVFgRs1+VxMj5DGr/JJXcyHTT2+qB7+4Lvs8nZYIwYILKHNE2M6p1jz3Jl395/VolhGfvRrffxzlHPlHMcqyQMANYCixTVF/kPIpuG7qiJqR4Hq8mWhRxI+SAhpGo6Ok1VwVqtX4KtQ7W8xtJEENi6M+N3yPWWzrZL6u2H1uG2D0ku0H4wEm4qfp/OzbT/RITaCKNJPE3xdr69zINc00HQi+/PfO50NFxdID1YIYW6RthpjizClL//IGgRcKOcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKXJ525CwgeC1c3a+y5zqUHzkf1/AtZMd/rvPQXJrNs=;
 b=UEyAleyw22ytHp/2IZSkfvMN6xD/9QEsUJx20BOQ4US9h2iENqcCv7rDNMEtrUpElgIq6+nAyyQWZTXp73zaXM+QFAh5k/PWk7KZ353zpYflFPkG/wHDkmp6vVFctmpqyyKli7ecVKz9F3Gy72q1mtAcj8deJS19hho0eb7KCHaVhkWVYUPLdQxh8tFyVw2IgW4B2N7TvvDujxoBLsKCzZWzWeMIS9TIYeJf5/xKWa37JRNE+O9hWoxfh5/B2OLKzHgrKQIZbfAB96Ke+ok5CvAA1t7M2Ehxos+LBmdcEQsxhXnDVVjGJrfHp9VskB9YXbsd5Nl6Xm592QkC+gUB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKXJ525CwgeC1c3a+y5zqUHzkf1/AtZMd/rvPQXJrNs=;
 b=Mr553rxOdUqHP1cXHm2G/rkytlC7GIy1iyCCzvQq781islvJiqN23hTQIfpeVdt9DcntrfXhXeEFerFcvR7G9v/FZKwAMkLhF0WrbenyFZXChcU8LbvWzwiWSUWHRgcvBowpsImQDaFZnPB5rlPFX6pFEfcesLGniv28Y4ph5vrBAJ+aNi828HTbWGL4Gx7MiuHj8xhRSWbg/2uwNQmDxjZ2B5G0hahun/bFh+hC5bCXjnwadFlgU+OXlOOKVHcABqQe9LPyLn5ZBNO2ZPIs560zdGEXUq+kx9O1DlmgxF0i1ZMAUU3rTvHN7zMuz2L2PdXibQwsRlHNkY502OGxNw==
Received: from DM5PR19CA0066.namprd19.prod.outlook.com (2603:10b6:3:116::28)
 by DM6PR12MB4988.namprd12.prod.outlook.com (2603:10b6:5:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 04:44:20 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::74) by DM5PR19CA0066.outlook.office365.com
 (2603:10b6:3:116::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 13 Jul 2021 04:44:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 04:44:20 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul
 2021 21:44:19 -0700
Received: from vidyas-desktop.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 21:44:17 -0700
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>, <sagar.tv@gmail.com>
Subject: [PATCH] arm64: tegra: Enable SMMU support for PCIe on Tegra194
Date:   Tue, 13 Jul 2021 10:14:14 +0530
Message-ID: <20210713044414.25536-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c5ebd6d-b54b-47db-1da3-08d945b8e17d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4988:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4988615D4ACF3E1236DFF2B6B8149@DM6PR12MB4988.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yMMjlm+PZ3NB/5naEqc+tgW6kLOoeSJwnHuU/ixZfz7SArqDRjr7W6DykkyAPHEw1ga4nuWrWw0yeDb7JPs9nJx0M5VkSIi0gSv1lGnNlhFv2LnCPBeozG86dAkTE2zjvEUCFYsgmIP/apjVjHJyoLmV4o+L7FkrKv/4+qvcvW7VJLtWzNqYnLFNZT4oFdhcu1wWzTeUncBtar6wQkfXKI5GNiowYKkflN0FpTa9ngPNVV8H2ad3M9tmUuCA6vkgN8YpJKpJ/df0V0WXqj3vk7Wd6qaXJfuOj/o54G66LPc4YELj3YMKT0CQv1AcI9rJlz2qQIJg9mVo9vFjm5j5dzAX0XoW4enG6w4G/eQenIBPcQuxVAMCmQ0FI3bSdIrfpLBaVzIXIx2Oos8X2OFkLWZ0U+FdTgU235zHNGczQnD92SWWthZ6Y3RRPvBSDLZtx+Yu1fYSsGu/s4bmk4CBhl2RaYPlu42JAXKuifhEeu5MOBkYO2IksMbvyDc6GqHS+kfnDmiRrxtkqNzJKpP776V34hgxJ0G/6ZK6IT+kArpngqTNHdN3Cs7dWmOVpp8h2IK9K+o9pgD8/jYbsrjaRmvu7jZosk0I3DB+Nzt5Tbq+kmLfMQCXYeFLSUQ+EnwuuorJZK2HSowqctVR1qHu7RCX4B3B/8W3QT1v+9px0sS8bwDx2Px3qHJfm6O0WhxTbTdYRtGl1S48i644L9R2b5fpdb0iaZUaqenAnRLKYSU=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(36840700001)(70206006)(70586007)(2906002)(186003)(1076003)(86362001)(5660300002)(6666004)(356005)(7696005)(36860700001)(83380400001)(26005)(34020700004)(82310400003)(316002)(82740400003)(36756003)(6636002)(8676002)(426003)(336012)(8936002)(4326008)(47076005)(2616005)(478600001)(110136005)(7636003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 04:44:20.7908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5ebd6d-b54b-47db-1da3-08d945b8e17d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4988
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
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 60 +++++++++++++++++++++---
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 076d5efc4c3d..b55522aacfb0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1840,7 +1840,11 @@
 
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
-		interconnect-names = "read", "write";
+		interconnect-names = "dma-mem", "dma-mem";
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
+		interconnect-names = "dma-mem", "dma-mem";
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
+		interconnect-names = "dma-mem", "dma-mem";
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
+		interconnect-names = "dma-mem", "dma-mem";
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
+		interconnect-names = "dma-mem", "dma-mem";
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
+		interconnect-names = "dma-mem", "dma-mem";
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
+		interconnect-names = "dma-mem", "dma-mem";
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
+		interconnect-names = "dma-mem", "dma-mem";
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
+		interconnect-names = "dma-mem", "dma-mem";
+		iommus = <&smmu TEGRA194_SID_PCIE5>;
+		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
+		iommu-map-mask = <0x0>;
+		dma-coherent;
 	};
 
 	sram@40000000 {
-- 
2.17.1

