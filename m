Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47A4C43219
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Oct 2022 14:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbiJSO4T (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Oct 2022 10:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiJSOzn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Oct 2022 10:55:43 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9941BF20F;
        Wed, 19 Oct 2022 07:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSiClzYqtRbXuvq0fktGQzXTNC6kzqV90bMDxC4Jw0CtXtMKYzFkabDCxxgUxiE95Rro+CmNLWn+OhKNpXMafA9damrs2wYEJj070i9bzOLoSjjPHUtQbVWY9LOzoI3Fbzu/Spe2H1pXU6vec6s8cXp9+D9PHI8qg1VjU1GJUsaLds8VMHl2Yryr3RM47sz5Hu2v/123azkIFS9MSciX4CHITQBGxbM0axiUA7lDU9plRBTzkvI2sDJqPQaC+VNW5e4PsoP6d8VfAaUMluBrhl29iI+DLSFNbURRfHD2d4tL+Q5y7hxvR9Bh4I6o3GvL1A2+Ab9oJM07B6+Wcyy0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1l0JJbUclcityNdt1rriC3aKVMXmyWg7pG9SOgqK0w=;
 b=iBaHVa1jtOVf4BakQM69Pa3dAk8gZ/9nyx5iztJf12k3jgOJMrc59+5mwCsb6z0NNGPfnzHrI5w4K27z+MgMBeChopt3PBCOhWWVtivZTl292YjzrnIMZCvy4cXCjHFd5YS8g94zRXMF7/UAqTtuzxFF+IeiElIgsOFzpz4bj6IFohwFUD+gwnEOqOi1p0+zV7fUtJGTQGoCSUQub3Qe16wtx3FbxpITqGc5E6rFJZnD80iE7UwDhvw7q/KfgAK7jGGrQygTDLgBVs9rNenGxIJ0kJw+JpYUDMY7th3BZcWgqBGB/kPAUctBxTbiBi5SvzXyjxrnh+GAh/as7g43OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1l0JJbUclcityNdt1rriC3aKVMXmyWg7pG9SOgqK0w=;
 b=P049xpWKzCKDey9NDbJtpoVgAW1skwpC4RSfS49PMJmabstQGlkrbUuP9xXCmY+U5ASm/eL8lwQ81Unq8q9DmYbF5nGkQ7sHxvusPry/3oKSL2sq1MOMJOTeDVd+S1XSBM1pqW5dEYIwfWUBMzqS7Ng6Y77fKvsIN+DQXA1IA3rzN+Lg3gox83PD88ZRIPALGUbCh7ST7b5hVlTWZxeD1iSPbsKhm8u3CMf6x6I1xI2DoqFJwXm4taUxIimZm7QLPx/OkXDErSF4ge0fq41vAsdGhzf+5sf3aFjrD1SN+tN2twf4JVH4lfc6pd1pPsiZ13ZfXQX6wkdf0nsUikvnOA==
Received: from BN9PR03CA0888.namprd03.prod.outlook.com (2603:10b6:408:13c::23)
 by BL0PR12MB5011.namprd12.prod.outlook.com (2603:10b6:208:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 14:47:16 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::f7) by BN9PR03CA0888.outlook.office365.com
 (2603:10b6:408:13c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 14:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=nvidia.com;
Received-SPF: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 14:47:16 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 19 Oct
 2022 07:47:03 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 19 Oct
 2022 07:47:03 -0700
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Wed, 19 Oct 2022 07:47:02 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Add SBSA UART for Tegra234
Date:   Wed, 19 Oct 2022 15:47:00 +0100
Message-ID: <20221019144700.170361-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT018:EE_|BL0PR12MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2fb255-3c0c-4bd6-12cf-08dab1e0d133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5KmavqHXNbPxiluG6+gcBdi4Cxzwu70UYHvzfyBL7PfBydz/DLL7JyzqueNXU06auS8uLDw/09l0ieIO8ZO9bnGCanNe26gZsWbpJUyhhh2OiQVlzp14JLm0FylEALB2hXfmSmNkG+UEAm6XWUAuZ+XhAcdxfJhVBiOh5FXE2B6cHF63R8tLDJbJAdp4EVwpVaKe/xHHynL0Zflo/2zVdIrnKE+MNOeklVHZjBLWa85E7LFfz6953JEhH541QtxOn8DaUNyY0KfGUCkrd7gS1MIuvVs+hgTIBFt7UDUirlP6RaaPjbpksY6e6ta3hfmeKkp/evE3dEZeJQTfUaaAdHq3a02RkyOcfKisjGQFbFrxBsBmxKPmjIpyybZIhfDt1yqx5N3XA4hucWl7VdeoP3BalEdpWe9QO626pPv8QPJGo+HbPi2xSq22FonoQuFbiJJBsK+5tFPft3u3yaE7R4nmWLYp/rVBn3w1RSyh51XTqu+3eUKi+JgbpxOFfCMbWkrfSrt+Z0bDB6IWal1t3UIrN9r1hxDlBKsQJ7CK6EhOJsWV+ZW1gIquVIerrT2/ysU4CFUzRmTJWxxwDDrKQVuwo0V2j2SVfarhcU5Kgy+Q/4871xOo70O0NTTRle09K7F1T+L9Yizsot+q1t6LlSe386k0jsVT5eV32EOmqS6PwelqD01dsk2F+uHMRok0fj/ftXIzl5toQWNHMyJJLFWjzru47zf+UZy9ODbYn6EN4mgvCHxPUhZGcwgBYKl2KcKsQXYm1lSW1wKMUoCXAw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(336012)(426003)(7636003)(8936002)(356005)(86362001)(36860700001)(82740400003)(5660300002)(4326008)(70206006)(70586007)(41300700001)(2906002)(7696005)(26005)(478600001)(2616005)(1076003)(186003)(110136005)(8676002)(316002)(54906003)(107886003)(82310400005)(40480700001)(40460700003)(47076005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 14:47:16.4578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2fb255-3c0c-4bd6-12cf-08dab1e0d133
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5011
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the SBSA UART for Tegra234 and enable this UART for Jetson AGX
Orin.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts     | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi                   | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index fc7dcd521340..f7a1265cee97 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2007,6 +2007,11 @@ serial@3100000 {
 			status = "okay";
 		};
 
+		serial@31d0000 {
+			current-speed = <115200>;
+			status = "okay";
+		};
+
 		hda@3510000 {
 			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
 			status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index a68be5a0771b..abe8ab35bbcc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1324,6 +1324,13 @@ rce-fabric@be00000 {
 			status = "okay";
 		};
 
+		uarti: serial@31d0000 {
+			compatible = "arm,sbsa-uart";
+			reg = <0x31d0000 0x10000>;
+			interrupts = <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		p2u_hsio_0: phy@3e00000 {
 			compatible = "nvidia,tegra234-p2u";
 			reg = <0x03e00000 0x10000>;
-- 
2.25.1

