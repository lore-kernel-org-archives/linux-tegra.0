Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDCFC678D4
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Mar 2023 15:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjCFPCR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Mar 2023 10:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbjCFPCP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Mar 2023 10:02:15 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7452F78D;
        Mon,  6 Mar 2023 07:02:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyRZrHkNJQ9Ck4pL3ZWYQELBfkR90SmOp6kVKQipXxkw+3qn2wnKtBjFFEyeoTnTeoL8JqsnXCTxp40ERrMCkf4Qxv0JgjJK9aXKD4fH+PtxM6bQXDFt2Mf3IJMdfdKiL1sRv23i6x34MlW3RAXHtkkTq4IPUweyWYkBYR4ksS9JjdyfXQvMq7LfVmHZ9n9qwvn6IdRvgOe10/g3jweviFv2vKGJ2UBHAqM7tHws3xQXv7yxOo4QMk2AjVjTVpo9rWCp1f9qedA3dyGvv2WR986o3TBLwFFVjoYkY6AYg1h85BMlTx22Z9E2AnVFSwUk+PXvwH01BK/UGbzWiMW4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuQCwiQe031/u16kZSIH7Byb+KxEb+EQQuH9x6ahdXw=;
 b=LuJWiyVmtcE2fVCBSv10LLS2wjgOhL8knkGBvoU1Ey8a50copJhVrclPQejPJTrMSDujcFa53DRFc6EsjiGqBUbIDw79ETqFZlB28kRCTYbDTw4x1Dh+lefG8JtIsibz1JJDxckLg309nXYe45W1IQjLbCExNro0GU6gZ87rEHPQOQOYScvkh4lbZASK94PqsU6E3wq1JvSiLZmyTg1a7X0aVZxwgXU6fTBLOL84eXjARXD1L5AOkfu13yPy2TMGrTZ5PPtCYNJMEujeAAmWo+g7HjHEfc5Q2QPP7tn/YYxblV7X7QGyQg5lI81iC1tfPGK4BgxN2NO5lZAZ0fhvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuQCwiQe031/u16kZSIH7Byb+KxEb+EQQuH9x6ahdXw=;
 b=ZQlfaGS2t4vcJ1yWkvMQBGBJR2ggRSJHZlAz2dOdJcy0ky56kh8hnx81CLYVHDnDoOI7b22+i2wVxJT8ecVlPzY3vp8DvyBNNZ08rK3wCRYSN6KhFWuxE11jQgbKVLNrMJXopi7CID3DsMj9Zj9J1FYhqRwFnvthxcP3ay0+YcAPo/4Lro3Dwn12HNdJ+Uyeyj+XJhOyGiuIucjZuj5G6M/+DcVqMnO9biGMi71qw9jEh2zXbVMRmQ/sb7r1gO6Cb9r31qJpsX3TRlYzdfEG74/l4QAOb03sddFIFBVtkMyeytFbUZslTMcgtXMEAAQRcLjSH5gx3JDQeVpm6s8KZQ==
Received: from DS7PR05CA0049.namprd05.prod.outlook.com (2603:10b6:8:2f::27) by
 PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 15:02:12 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::8a) by DS7PR05CA0049.outlook.office365.com
 (2603:10b6:8:2f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15 via Frontend
 Transport; Mon, 6 Mar 2023 15:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.21 via Frontend Transport; Mon, 6 Mar 2023 15:02:11 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 6 Mar 2023
 07:02:02 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 6 Mar 2023 07:02:02 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.5 via Frontend
 Transport; Mon, 6 Mar 2023 07:02:01 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Add DSU PMUs for Tegra234
Date:   Mon, 6 Mar 2023 15:01:57 +0000
Message-ID: <20230306150157.122897-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT048:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: bedbc0af-c487-458b-c1df-08db1e53c3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUMiD9m+/an2A5ZQH/dit4/jQCPQjD+dke6bvO/Qhny0RKb90kEABy9uiUICqgvlRIAB2ampdGjWV5k5PMeTe8NUEYqX2QoJG0W0Y+ZHZvekj7h7KCLEi9iwo1RbnJesiUR3NlUz/NsxvKzKFZLT2Vj3RpSenCke1F6ONLa8ECz4ctryvYcViV9i8jdZ6SyxwfRQRvAuLpUAvzF2inb4X2B7mzE/EsSvsTfhfOiD5KBhBwali3G7FXZfY/2jWnWV8do3JiN0C1mnJc1hpRXu9hIZrJ5cV+rdSOTK5LcDC1xcNpq+tyPzzas5jmk3NkFuwYX0OVzNNUFgdDundqXDs3Wdn1w5Bnc57Sdiil38tXE1sHBFTA4vSLDkvCk7f5+IrH+d0CuIwH/n8IQ2OnwW9VuvqmI4h1hbdSzYxjdxr3qQz43Hh2uxUoOKD3xIqASzIGo+sIr2xdsLd5JTB0xQqJe+i6Eh0+88js4fMGZFxw92/lWMRXZmPgKIWPrvDVORuvjIA1K3ePvFq4t7eh2G5dLaLBKDbeU/N80OtxhAWudk5O26lGomvqUxja/W8kkA+Kigx3eamQcLpsomyoWPWiXB00s5RkjvMbZebXhszoeoi6Bls31exWzsq7l7pFRIOecx6F+pX1v/EMIhnoMLvWo1fdpj8I36b1FnREQSlOc4cjtvNB/jwW2Gkm+qtaAQi++PQWXcsjxY/+IIWovtJQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(40470700004)(36840700001)(46966006)(54906003)(316002)(2616005)(82310400005)(426003)(40480700001)(47076005)(336012)(86362001)(356005)(36860700001)(7636003)(82740400003)(36756003)(478600001)(110136005)(26005)(1076003)(6666004)(107886003)(186003)(40460700003)(5660300002)(41300700001)(8936002)(2906002)(70586007)(70206006)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 15:02:11.5779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bedbc0af-c487-458b-c1df-08db1e53c3ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the DynamIQ Shared Unit (DSU) Performance Monitor Unit (PMU)
devices for Tegra234 which has one DSU PMU per CPU cluster.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index f1748cff8a33..649afbbc2d7f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -3402,6 +3402,24 @@ l3c2: l3-cache2 {
 		};
 	};
 
+	dsu-pmu0 {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH>;
+		cpus = <&cpu0_0>, <&cpu0_1>, <&cpu0_2>, <&cpu0_3>;
+	};
+
+	dsu-pmu1 {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>;
+		cpus = <&cpu1_0>, <&cpu1_1>, <&cpu1_2>, <&cpu1_3>;
+	};
+
+	dsu-pmu2 {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH>;
+		cpus = <&cpu2_0>, <&cpu2_1>, <&cpu2_2>, <&cpu2_3>;
+	};
+
 	pmu {
 		compatible = "arm,cortex-a78-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

