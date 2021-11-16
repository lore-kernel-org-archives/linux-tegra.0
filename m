Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413AAC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 12:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2508F61B39
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 12:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbhKPMHr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Nov 2021 07:07:47 -0500
Received: from mail-mw2nam10on2073.outbound.protection.outlook.com ([40.107.94.73]:44556
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236023AbhKPMFk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Nov 2021 07:05:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIeKEjq0r4atICA5Rdwe4FgaJQs9XzUA+wWPZWJthwH5kNCbuYhIkXHotD3iwp53eJ0tEJAmVJV0Wo4cBd8oBDWdDxlumCE9MwX9yXBUurLKYCkw8AZnXpngIN1H1fEKveOeQJTY8XIG+bSjykqGdI/NAjZBXoLFbZXjWAbCt2/wrQGQPxk3XLnWdWKcj7D3ZNEx4TsLTi5UPWP4D7oRuGoApHZfC8afgthUp8B8z7FqjP3OGmVHKvW1SotKxtm6ZJyVj4gNsOlZzezVWl+nSdTpTgnlDP8SnZ1cEkjY6bjMeNfQ6b/OmSMGpUd6D853/Dwz/w763HLCtesWlzrK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3qmuZdiX/kQ73A+DJBP6kvynXZDhrs1p5LiH+Z8w5k=;
 b=mfTTi4kCaxlaOwBclsvsBz2Y3KLjiX34/aDF5KVKg6dcSFOmKvEwlkOsT+Dk2dS9VEwJqGnUMSerfZZ6hVioSwzbXpCD5Ku5RIWjV0DL7l7CCy4USBmExodDCMSv1Dg6lQd2y2ophSKpVq1BzSmOR58yskmOCIJrOQ49CUUoEsLisBi6lmYxKdmarPAQlpolbeQVlZGi/CaxFGpX9DFPDrMf2dxYa+My1KFDPb0YoiTZtaot7FQhgrLKvfNku8Q72wMAIeSTm+dZVxfvuXyh/ATZM98xhVrqkeSR3jJK0o/hOr2wq0KLcsVCSK/XWXc9CvPZQzFUpPa1rYNiVeuGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3qmuZdiX/kQ73A+DJBP6kvynXZDhrs1p5LiH+Z8w5k=;
 b=qqNVNeWGWIkZsYblNM6glmy4KVXCOHoys/g0el3DUEB9+XYpbzd2ltSL+Rj10pfiQ5HcTZjIjFI7DIapGVUGU8kxsr0RcCR8cGkGr48Q/sY7n+v5CgUoQsxB0A87aDLluBSsB1JX0IACV6spxUq9vtwe6Fa0vpFKIrade/vlvJW4Aaq3jWkHMV6/PCaBOCeFE4C+iDzfclJPyqc51cnpHF+hsNNMmfuZ7wHBeiiY6zIdBOAHrBvmygDpMZzjYkNk53n9ksHNcUrQgcaZAKnXdC+jiKu0m45McT8w5AfFDVHRkYxhOFGG86ohJl7HP9I1DLpv23HAZxH1UEvw/k7vFg==
Received: from DM6PR13CA0050.namprd13.prod.outlook.com (2603:10b6:5:134::27)
 by SN1PR12MB2461.namprd12.prod.outlook.com (2603:10b6:802:27::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 12:02:42 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::14) by DM6PR13CA0050.outlook.office365.com
 (2603:10b6:5:134::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17 via Frontend
 Transport; Tue, 16 Nov 2021 12:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 12:02:41 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 16 Nov
 2021 04:02:41 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 16 Nov
 2021 12:02:40 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 16 Nov 2021 04:02:38 -0800
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <pshete@nvidia.com>, <anrao@nvidia.com>, <smangipudi@nvidia.com>
Subject: [PATCH] arm64: tegra: Add support to enumerate SD in UHS mode
Date:   Tue, 16 Nov 2021 17:32:36 +0530
Message-ID: <20211116120236.10648-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99426124-ff60-4e94-101e-08d9a8f8fe08
X-MS-TrafficTypeDiagnostic: SN1PR12MB2461:
X-Microsoft-Antispam-PRVS: <SN1PR12MB24615ABE4B9E449B3DC6BE69B7999@SN1PR12MB2461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FuglJp8L/ThisnDrtYs4Hk8BX2afLrTMDPcQ52l7aVdYpMeOEI5Fokj5CNnkQop/yP/367udLb5OK6LN6ghPMXLRx6hmR/qB09fyfLnnbb/IVdhIMw5/0UpiIirTSP2tmboq79P1LWyJFjw773r+2WJwChZgnPXVAP7GZvPMvxnYIu/IuaJXKKIXhgsvGIm5tlxq1Q3391T8sqhFh762rA6zVLVQChng1ViBfbAw2hvON73yrbv+SR1zEO9zotKb7yfBFsVP5yN5mPHZaDh78Nx1XJINWGyFOmXDI3iMjnyfSzaO+1z8+xpXSKFygcBObhKEvIayG7EM6Clk2ZQUgB4oU5pgZVsM1v9osCU0mn4UfiMPgTFvmxqDqFYVnKjGDurpsfjXGqfJ7f/0SP6pT1++iPdjWM8ZXmlPTMGhh6Df/6r1Ck9/kYOIqB8t66C6mXWYAb8YV4OYKIBO47FwO7Qh6M1uI33kPvr1QflBMcrNRYDo1qBTldzQUxab9++rS9/8JjMsKMDojslB5/oyvcWbs95zn9Tns9bKahl7AXOpLFZ56ubxH6Cm6sc3u181bCTXEQOjkHIdpNGiURZbp3jYnH9q/3mgmLCzrTPoLH4WAwxWlygZd8gI6lU+tFJk52uc4AEex+r8Kinm+FQzcHOAraD8bXaPOAagZYXJ8cEq8hU3TpPaeyab4mieeBwzCZBYKAvrmkuviawDCnet2w==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(86362001)(110136005)(5660300002)(107886003)(83380400001)(2616005)(36756003)(54906003)(82310400003)(1076003)(356005)(7636003)(508600001)(8936002)(2906002)(186003)(316002)(426003)(336012)(26005)(47076005)(7696005)(36860700001)(70206006)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 12:02:41.5723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99426124-ff60-4e94-101e-08d9a8f8fe08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2461
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support to enumerate SD in UHS mode on Tegra194.

Add required device-tree properties in SDMMC1 and SDMMC3
instances to enable dynamic pad voltage switching
and enumerate SD card in UHS-I modes.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index b7d532841390..cc89f42bef38 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/gpio/tegra194-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
+#include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/power/tegra194-powergate.h>
 #include <dt-bindings/reset/tegra194-reset.h>
@@ -735,6 +736,9 @@
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA &emc>;
 			interconnect-names = "dma-mem", "write";
 			iommus = <&smmu TEGRA194_SID_SDMMC1>;
+			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+			pinctrl-0 = <&sdmmc1_3v3>;
+			pinctrl-1 = <&sdmmc1_1v8>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
 			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
@@ -746,6 +750,10 @@
 			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
 			nvidia,default-tap = <0x9>;
 			nvidia,default-trim = <0x5>;
+			sd-uhs-sdr25;
+			sd-uhs-sdr50;
+			sd-uhs-ddr50;
+			sd-uhs-sdr104;
 			status = "disabled";
 		};
 
@@ -762,6 +770,9 @@
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW &emc>;
 			interconnect-names = "dma-mem", "write";
 			iommus = <&smmu TEGRA194_SID_SDMMC3>;
+			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+			pinctrl-0 = <&sdmmc3_3v3>;
+			pinctrl-1 = <&sdmmc3_1v8>;
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x07>;
@@ -774,6 +785,10 @@
 			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
 			nvidia,default-tap = <0x9>;
 			nvidia,default-trim = <0x5>;
+			sd-uhs-sdr25;
+			sd-uhs-sdr50;
+			sd-uhs-ddr50;
+			sd-uhs-sdr104;
 			status = "disabled";
 		};
 
@@ -1303,6 +1318,25 @@
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			sdmmc1_3v3: sdmmc1-3v3 {
+				pins = "sdmmc1-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
+			};
+
+			sdmmc1_1v8: sdmmc1-1v8 {
+				pins = "sdmmc1-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
+			};
+			sdmmc3_3v3: sdmmc3-3v3 {
+				pins = "sdmmc3-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
+			};
+
+			sdmmc3_1v8: sdmmc3-1v8 {
+				pins = "sdmmc3-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
+			};
+
 		};
 
 		smmu: iommu@12000000 {
-- 
2.17.1

