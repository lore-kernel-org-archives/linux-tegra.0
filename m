Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37EEC61D9D
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 20:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236090AbjAYUnJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236044AbjAYUnG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:43:06 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08835D117;
        Wed, 25 Jan 2023 12:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD+vQxo642aNpObtRC57dQ8j6EtAwAuHO4nU2Ro9e2r0MW/TxORvr+7laXZTQSCq2//b2UfLKSOofbUZJEZpAHXUjhmdMaosEzuKiEVdZzNqQdbfzNVZnrMFDSeEbWQaY8/Y84iE5AucCr9p5Ktm+kPG64kz7f+E2o0DBiTopsKvi4nWwdF3lZ6rXz9KsjATHtnRCzLeVhh2UlabFQtGMaFaOm8Gwx82mv2H1nn81L1wJCmCVMXdzk2dXqwWVU0ho7Yqfph4S6QAjcm+esUjIpyKbkZkSFj0Hb1x0gxZeXt/KO1OZyZhCf2Ry9JPFuqCxAGIO1cddW6+s1GVjT3/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hHPMZCvfWrMBXIRCGtHHdiiRP1KOT+p1YNE4Pj19O0=;
 b=gpKTFwRFD1VKlDiDN7BaHaGTIKBKMub2rMc/dO7D7WAbrSrZrNrd0YSO5NzaFqXXqi4z/fx/JK7IY62hW8Xz5jCUIyBUr0SbKUwjMgJ3+KRmIwMrznPsGbOQry1Ks5/ULtgWUOS9ajRQrmX0cIlVesFT6Rr3FO33j7OrDbRScF+HlLcb1e3HcofWSxCL8ZpifySTDeB7acRFPPf9dleu/rcojEtV0/d5FLcnnzjDlmnqS/s907xqcZVMcvX/UclCGDerQDr78a6kphQf8orSF30biKweFgSX0KqBM1po5HUFIk6XMYC6WowbKLCXNCItPPri6FBMW2t+PBjtQigJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hHPMZCvfWrMBXIRCGtHHdiiRP1KOT+p1YNE4Pj19O0=;
 b=hKQAqyClm38bNBDZhAgYT+9iSufAScWIvVnl7GBIc43sHF007WHJ/XNO3u0QYWSz2JNNkIoAFOFEVimIaTu5jD8Ir03muhhdxeo1x+xik97N4YfTOHDOZoNOKIHssVyctFsd8Pm7lUa4W6lH373Rf3A5KTYFLPzEm0Qe3Rdgx3YEpl+/sBp6UEIIwqtO2HeQvuPE1agP/nQ0Ty2cz58Stqy1WkzYBO4NDO1c18UasvyXo/Q0kxEVGO9V72+w3Q30MuvHnlvStbbgApU9DsTiWs8MhkocAwqP8yevbiA/tvT1yOOXzC+ORL8SzA1iJokk7B/R6jJ2523ELfRqJPsxMQ==
Received: from BN0PR02CA0048.namprd02.prod.outlook.com (2603:10b6:408:e5::23)
 by DS0PR12MB7608.namprd12.prod.outlook.com (2603:10b6:8:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 20:42:57 +0000
Received: from BL02EPF0000EE3E.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::ef) by BN0PR02CA0048.outlook.office365.com
 (2603:10b6:408:e5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17 via Frontend
 Transport; Wed, 25 Jan 2023 20:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000EE3E.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 20:42:56 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:37 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:37 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 25 Jan 2023 12:42:35 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V8 5/6] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
Date:   Wed, 25 Jan 2023 20:42:10 +0000
Message-ID: <20230125204211.63680-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125204211.63680-1-jonathanh@nvidia.com>
References: <20230125204211.63680-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3E:EE_|DS0PR12MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1c1f5e-bb49-4ed3-458d-08daff14bd38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTWJqwsqe6Xtd7ZpOQduQorXYPfG6HLF4BvWh2XG6RnUy4M2FSUWFMRoCfzIE2TsDwxEsEG6pU1nrwc34ec0JpKQQp1wSZjm4ea2jhwL7cisJlPOOyKnbQUGxlhEisOYnBjvDwuG/9q9t1zK/SKSdlwzGsseKlrRlVG3I6StNSmbM5hQRdsRjjizutFj/EQsintWpvpZ+ULeROMaMuUHsaBNAzZelxYYbW7j0Ra3aAvphDZQuzx48M6arNGLpoLWVfaLoDrzbvuAFMA0agLUXoUaPIAk89NuJSYhXV0rr/u33M/ppO0Vb5+QWX2jr8eFWjdEiEqMLOHz2P2mkZ5O/LWQux/iRN45saSVi/ldSPaoWH1dBQSnL5rAIJujdGdKO+4PE8PXEAHpdeVz7cQD32rBBadrixKY2zEZivW3/Qwm8+XWjaTKfpJhBvhrAl6Do+PntHL3XeGZY7an1w4qdE6svnVb2AYXQCZZKUzUK43mAAKnZLSq+SJedV60cnA87iQo6Vtj1x+EQ0ab3VOvfSp2dUQkzxGOj84YwvnmWj3LubOz1XqFMfTwi4wxgIYezkqv7IVPRIXDnp7lmzb+fFhxhmyw8fLvmCnbIhUaOssoGWIQh1ll6w0QBOcaQle71pvKUtC2VB3tU15ufZAIoqqhMkTt0ZRBV43iAxLOcvqdx1cqG9G7KzTI9zLid/hWTxlMJRuE76EtNDoNa/o0SQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(36840700001)(46966006)(40470700004)(36756003)(356005)(40460700003)(82740400003)(110136005)(7636003)(86362001)(2906002)(36860700001)(47076005)(5660300002)(83380400001)(8936002)(186003)(107886003)(26005)(6666004)(41300700001)(54906003)(8676002)(316002)(82310400005)(40480700001)(336012)(478600001)(7696005)(2616005)(1076003)(4326008)(426003)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 20:42:56.3324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1c1f5e-bb49-4ed3-458d-08daff14bd38
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7608
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
V8: no changes
V7: updated to use 'typec' for the node name
V6: no changes
V5: no changes
V4: added in this version

 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 8a9747855d6b..3beb510996f4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2190,6 +2190,20 @@ TEGRA234_AON_GPIO(AA, 4)
 			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
 				    "p2u-5", "p2u-6", "p2u-7";
 		};
+
+		i2c@c240000 {
+			status = "okay";
+			typec@8 {
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
 
 	gpio-keys {
-- 
2.25.1

