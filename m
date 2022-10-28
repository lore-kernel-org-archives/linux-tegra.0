Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A67AECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 12:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiJ1MgI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiJ1MgH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 08:36:07 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6554E1C208C;
        Fri, 28 Oct 2022 05:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eO7e8JB/AbKBXMQPh2MC/XAN1JmAWMWON+2L8t1tyR9Fgx+qUoE0m9OW87nnLrbsz2+JNRlqdJtdPEj7aOuM3Yvam1gWvRgsdAB+6UGeUrduT6eLv7AZnRRt7SQQ6emMPLjwVtwpwNrsEj9LHfn60cW5fAH4zgj7Jq/xcqh/rARp3pyqq1YwHx+XWDQSyXF8yufwT1VFOsXY6wk89R8UTm5J0WwI/91UAA1AoWgWokBCBf3o/xccvh25VI6VmCOebQss7+m4SDZ+M6x7KYNGFujCmWQL3SBeAiEgAguggpEHzbGP71J6ojK72IHyB58d/5FwA5VYDjfFx8JFqC9D0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7HE5uNq93+pihzhx7Gzm4ic5WC8BTlEzcsEwAjDBDk=;
 b=f4OlAC66wJ2ZlFpr2up/7dQyr5cIb/5MOCcBHjrWhgN2ekhTlT1jywm+lve4pwJeFQUxHTnOo8YlLjxDOQEiiLV8fveNc9rBRHbvAfhpxetf553shKXm+roCqwxCAHv80Fc+iboaVSlPGX0aNJsmRdeZIJselwuDt72sYw7u2gDTIFTXzuuYuWZ0AFeGtGiPv0uwSBetYXGbDNtbJhPp7dZzOxqxWBHnZChBOQxd+x6Ifj/Sz83vskhExsxjpBlL4SO851jepitVeqI7US0Z0GJwdIFZoIsCKUhCP7RO/Sm7fRT8DAqxcde2WP+s7Ikd4UtBLqKImRTQs4Qa2ALFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7HE5uNq93+pihzhx7Gzm4ic5WC8BTlEzcsEwAjDBDk=;
 b=uNkaFy2bCHD4ECd/vfUh/FdzXu5M/+2F9jgkRQ4tx8J8MqVGDfq/dOFxsoskXVvi4vvn5YWQ5aXA57iSMtejbOEAMjKkiABMY/MSVd6yNqUC1FJ3CN/LvYfLx6mN8UkviLJINvE8KAAEa3AitfUuRHoIRYWgS9f7Ok0J1yUnnaSAzOB0KkF0NJ123uC6Ykw8x9BWyfc7Jc9adSt8IcQ/AUtSP8qzTyBpEahUXYWX1J6N2FtPopO8J/V/hQW3dI/aAj4J4oMvrwUsjIEvrxF4r19iaczfb7np2YEPQdQd8x1AB8n2D5HRBPVBI3VHE751TbHWh5P753Lbn6JTMr3PRQ==
Received: from DM6PR07CA0106.namprd07.prod.outlook.com (2603:10b6:5:330::15)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 12:36:02 +0000
Received: from DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::35) by DM6PR07CA0106.outlook.office365.com
 (2603:10b6:5:330::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 12:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT082.mail.protection.outlook.com (10.13.173.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 12:36:02 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 28 Oct
 2022 05:36:00 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 28 Oct 2022 05:35:59 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 28 Oct 2022 05:35:58 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Update console for Jetson Xavier and Orin
Date:   Fri, 28 Oct 2022 13:35:56 +0100
Message-ID: <20221028123556.134435-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT082:EE_|SA0PR12MB4511:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3eea20-df85-4c45-2008-08dab8e0f9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bqf1QG1Hw369vE0Cg21hj97Jg41z+s2bpUSY/Oo7R+QjvYgjFNUXLXZ+uDgunWdxyyYYFFamq4+lm7GKQx1v6lo6zydK5pVB3OVnOoTnBa0Md9EZftRioJfgQtl57BYw2oGeFwOLByjSJ59AwWmWCiTPrmRea0W0k0A/hjaWIXzbqtnk+Fwe1a+Invj2viS5hzW9E4ngyqiRWedaTsMbxHlomEuXRVvFL9g9H/HvKd1ABFPue0BIy1xPW/hbM4DHAgFxhT9B663qT97FWwYtHbo3pQviWwj//3yjh4Yp1QufgC3Mm4JjRrXtoBVKnDwNCC8xtVCORZ7FatADUF/kbaq+iEJ1wRKkMgZrFJPS/u6KGY1AFoUWSEzfxjXxUv8fK2jpQs9cuX1l5i0qltIrWOdkZVMKSTLczF1+nnuKqGjZTnmPbFSsaq4YrzzlefERqBR3t0FEInBLR5kRciWKLaBVOXlXK9Xia/Rh8bY7dg0Z+9k73KJgHLhI8NSMyMZ45hlCbuZNyhUoFOvFnCfH4ao0ArAV8RVFHcNd1H3n+FxO6pC2rUwXO7tGloO4bf43WMbnBNiTwL+YridjK/tVz2Uygybon+Q4BP4pZ8lvD90yzrFy719T2S9EP5mAfiSyxDSrg18ZCmjdt2p/zIydsYU4f1NXSokvccP9mePHmX2RAoMYsZ1T/ehLOc4nUln6zBldireOxNW40MHXhUiF/7CFPPO25kIZLY6KTY6zhxqsZ4hFLero4C6EnoWHUGSR40a7eLJ1D5X1nGPWjEZnzQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(426003)(47076005)(316002)(70586007)(8936002)(356005)(7636003)(54906003)(110136005)(36756003)(82310400005)(40480700001)(82740400003)(70206006)(8676002)(86362001)(26005)(4326008)(83380400001)(2616005)(40460700003)(1076003)(36860700001)(107886003)(336012)(186003)(478600001)(41300700001)(5660300002)(15650500001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 12:36:02.4989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3eea20-df85-4c45-2008-08dab8e0f9a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra Combined UART (TCU) is the default serial interface for Jetson
Xavier and Orin platforms and so update the bootargs for these platforms
to use the TCU.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi                | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi                | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 3837ebc67c8e..ccdb32c67861 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -23,7 +23,7 @@ aliases {
 	};
 
 	chosen {
-		bootargs = "console=ttyS0,115200n8";
+		bootargs = "console=ttyTCU0,115200n8";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
index 916ea3419ee5..f147324d72f3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -20,7 +20,7 @@ aliases {
 	};
 
 	chosen {
-		bootargs = "console=ttyS0,115200n8";
+		bootargs = "console=ttyTCU0,115200n8";
 		stdout-path = "serial0:115200n8";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index df703fb0cfff..96aa2267b06d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2025,7 +2025,7 @@ hda@3510000 {
 	};
 
 	chosen {
-		bootargs = "console=ttyS0,115200n8";
+		bootargs = "console=ttyTCU0,115200n8";
 		stdout-path = "serial0:115200n8";
 	};
 
-- 
2.25.1

