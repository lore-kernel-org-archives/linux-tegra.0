Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B84C00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 11:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbjASLSf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjASLSa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 06:18:30 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD9D6778B;
        Thu, 19 Jan 2023 03:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyp0Dq7cqIB1bermjUn+TYmCiImsCPswvMaxCFK4xk2IKPV4IUp5MYkGosdOx/39ZLtJ08atGGgSVra7oSyYi9H1gOMuU/F1gUX64B1dQWmzpzoTRCDIAwJ4PaquXzMwjjYjC8Jxr+ffG/npC0oNNGxtHSow4PYdvNY8OPqW2GQzzR5zf3PSkn2MlZLJ7wAtWtf5xvjBqP3vtlKTjuzKVu+Y0ZUv6ROD6UCKGRVQxVUZ2Tr5IYAi5Mus3USEvdTw6lDGpvLGHNzzysTik2VW5nsb0u7YgoQBJ2nXPDiQkxtIDhBtiBmWSd1qL7BsxlymEE1PLfaJsBK6cT2O3DSVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD8Gel07kVVU3zP+dzdUznrU3NZtgLXGgQUcm7TCDXk=;
 b=Uh1duxrHtRjk0oPx66zC+HmJkau3ppVnx2THNz7f3RE7OH8kDvAdZCbKPoIgnDvVg+gsfQNPEPymqgX5bFT7nvxSvKfHpZWCIIW3ChOYN03/8gHhmnLXCGt++BSN3jPlGN5dx/x+5OepmJPKvK6d5ciTiWqa9CNMkJL+CzAwCkosmM5Qe1/tAS+HgTdVqloHsT4GJeOp48UuZXEBzCwmhPG0K8yxwksI4tdkGsMzqoUHnv+bYtEQoI59Y9D4zMPEUjcWerQ5Jsk/QiXc5u/KmmKRFx/yq1G24GkT4pyPcoP5dewtyr5A4ytnCNLzSN37kB6uyxJq8yVfb/zSoXz5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD8Gel07kVVU3zP+dzdUznrU3NZtgLXGgQUcm7TCDXk=;
 b=qGMBx2Uh1Ng18jdzv7C7P9BpjrAbxmklSTjCVvpxf296VdFzeu95fZwDNCGQzIrY6k/JzN3Yn+Q6IqPImghXEMhg4YKSF8PF/1z1oa94YMxtplRPbdDoOpy1sJ6JVEq1cGCwtuHjvp8Dg1wAW0emF0MrJXzzuJLFRo7ByJ3oOX8GuqSRNcFtU0ZGJHns+VsP3tHEUxTf6thT7D/RoRevWi1+K+uwshDTw6nV9l52D0KyarJQ4ufJ//0q8p90czd6+0d7HNwCHUuIowlyAsaM5dVBbiou00DFdXazH0QyBEodWq+A2f8kmc0J4tPieAtIBwsW4R1gFMwJdijQg0MIsg==
Received: from DM6PR12CA0012.namprd12.prod.outlook.com (2603:10b6:5:1c0::25)
 by DM4PR12MB8560.namprd12.prod.outlook.com (2603:10b6:8:189::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 11:18:17 +0000
Received: from DS1PEPF0000E637.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::a4) by DM6PR12CA0012.outlook.office365.com
 (2603:10b6:5:1c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 11:18:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E637.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 11:18:17 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:18:08 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:18:07 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 03:18:05 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 6/6] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
Date:   Thu, 19 Jan 2023 11:17:41 +0000
Message-ID: <20230119111741.33901-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119111741.33901-1-jonathanh@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E637:EE_|DM4PR12MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c5259c-e0fb-4fb4-042f-08dafa0edd4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdQnLziabeIKGVvp5aNiYu/OkeV8N+xeRXo2qMCrsQs1RoTG0uOYGgM+/XEDtyueaOLTsMAfRZWJSXbMCp6GvJmN1BLZaeSxwhDGntQG5LoVJW+rvAqDANPaM0utzY1AMNWITqSb2xCEtJ3xWC3VpZnunxSp7vVSz2K/hEvQVpGMO4QD4nKla7WujYQfG1YjpHQ/QWx582Z45GmxKgTF4jez+ILhEshon5C6H9TwoS/wv8M/R5qliHwFn+0Fq5xAyU0Caw7C4Yw6w6UIk4b7Sasj6o/x+jIptt2xp0ph0Uzf7jOv8FvntwGmHRQqP6eLZc3Icktsut1lU4zXWqCQ5z6DeqxqzJttxqCxwZd5AKm9bv2ittIvwkotELsMVmdnnjmOFhHv4fzgGgq/vBFa6EWtn+X6DjtidazZqELO4/U2ZFQ1tUkKgap0PVP1qu6XPP66DvTXDSj4WhTR33jvqHIhuhHZrBtQp4Hb10HB9zYrksXAck3Y+ceGC4hitqD+kocTEei0GRRH8NPtyvJASTd8NE0FWnHxxLCA+enn5U1pYnEVI/WSG7LkeucDD1Mn4+ROTqjPEKbje2YeofDDEQkJ4Q4j6asIFQT0AJeT7f1GanlO/zQDknIxA0/VgrQGKOLBugAsYNX/tnQQjbrOuS7eGrNscHcTAUwdc1sf9Nvu1sy8SqLHueOO6lMg1sB3Ms5obaryoZdmZ/4TDZQ3TQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(356005)(86362001)(82740400003)(2906002)(70206006)(8936002)(5660300002)(70586007)(7636003)(36860700001)(426003)(316002)(107886003)(54906003)(110136005)(6666004)(47076005)(7696005)(478600001)(82310400005)(8676002)(40480700001)(4326008)(41300700001)(186003)(1076003)(26005)(40460700003)(336012)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:18:17.4082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c5259c-e0fb-4fb4-042f-08dafa0edd4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E637.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8560
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the USB Type-C controller that is present on the Jetson AGX Orin
board. The ports for the Type-C controller are not populated yet, but
will be added later once the USB host and device support for Jetson AGX
Orin is enabled.

This is based upon a patch from Wayne Chang <waynec@nvidia.com>.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V5: nothing has changed
V4: added in this version

 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 32c58aa00035..05819d8f8038 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2115,6 +2115,20 @@ usb@3610000 {
 			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
 				"usb3-0", "usb3-1", "usb3-2";
 		};
+
+		i2c@c240000 {
+			status = "okay";
+			ucsi_ccg@8 {
+				compatible = "cypress,cypd4226";
+				reg = <0x08>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
+				firmware-name = "nvidia,jetson-agx-xavier";
+				status = "okay";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 
 	chosen {
-- 
2.25.1

