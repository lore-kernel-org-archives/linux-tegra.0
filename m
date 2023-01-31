Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E2DC64ED6
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Jan 2023 17:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjAaR7P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Jan 2023 12:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbjAaR7N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 12:59:13 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D314A4900E;
        Tue, 31 Jan 2023 09:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSKNrE+z1ADcyFCCKtLclFw09PivMsOpU5ImD60O5UaEuV8FwbsQnXVO0/MJKNNlrNwD3eFfZ/fd772q+RmLx2Oszaagp+k2doO0KNHfM4qgPxLWPDGFjuo9uFgff+h/LsbyxzLjnXPLCI5Pe5nSchRQ0gGadUJlGtEFUZPocIC63tNa1o82rMrn6bzUk1ZiBGthpm3KsVM+E0gFJ0u/0/0Syz7jfqvLEwMpQOrQnrtqJ1uNSknSaoAi+BoBY4WTJ6S0HtSbwTRFoZ8v1EFJLcAmZWTHfCnjrEfGHXbU0neKhYB0jB7p2w2Ff0GSkzysD9Oy0gv0KJUk4XofISRzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBXshQTJI2cqEhrRnFsqGNGlKErb7yK6vxxhU00D4oA=;
 b=RQhJGOlEI6FxYEHQUE8XMb0oybvyerfg3n9MtWC9QQPRw8CgHY7PimYy8kEcBhvLfzzP1lOjl1sxOKAHexcHqxEvDznA5MAfMysvf21GzYQUB7L51owPfyY4WrNmoDZ62KjDwEMcJx2s2wgOJGH3xfmC5DbNN9KYmZxWlSoTKsESlH1TH2PIeN8eq89/4ZWsveS/GUtT+nrxpAttOQyhYrSTDbdzKm3u2V6j7kH4cNSCrtfPANUkuRrxaSCG9E+vDqJqKlUKdiYFWfO+YYIaMHSW/KRJnVRkh4vBBdpw/D2m/iPPpWdKof/ypqsNVMVNLx/FFFIj0mazfejElqTBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBXshQTJI2cqEhrRnFsqGNGlKErb7yK6vxxhU00D4oA=;
 b=YeJ+ch9edWNWNT08Yj/f8hW/4xiEUR4g6WiTMBSPBcisEBzeqUK+FWG/LpoQNXCM/m4ZpijR/eGUdw/gH9ylE8NJvuR1+5QZbo5RxWnT6lP6yrQM1Ws4k8Lgh88su7i+REhSAfkHnDJWspvcuBQvReWV9kDRqN43qBSKU5trwd7yYGLxV4tVu2Hzrn4cXeyaDePFB76PSIc0He8tLvLrar0jLQo/xR8A5BuAhXRwOVQjDpAGhXzKm076V/pHCquRijoCG7G8FBp26wNYydrbjnf9Pk4Ek+VPKENlv2vaFnSE49xPgn5L9zgSgc/pbwYZZ7uD39gjYKPXgZuJbCt6Aw==
Received: from MW4PR04CA0091.namprd04.prod.outlook.com (2603:10b6:303:83::6)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 17:59:09 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::8d) by MW4PR04CA0091.outlook.office365.com
 (2603:10b6:303:83::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 17:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Tue, 31 Jan 2023 17:59:08 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:59:02 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:59:02 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 31 Jan 2023 09:59:00 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V10 5/6] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
Date:   Tue, 31 Jan 2023 17:57:47 +0000
Message-ID: <20230131175748.256423-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131175748.256423-1-jonathanh@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3f214b-5952-4354-9ae8-08db03b4d9ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kRS4Ta6VFW2xOcssAdl7fCuIho5ATymyRXivKVhtuf2mJjOiJUiist9GcuY6SpKemeQYs0j95q2AEFtsTEVZeaO7aKyS+jMeNFxa0KwMfkSSht39opKR9r2JNw7toizIPbtbNngtxpw5n65PLlGhWRikT/VInD4iqI32dGs+TlASdlsn8k4GmuWiR8z4AJ7OuBCVwG4UPH5fZb3g5TPXv0OndbPkv2WxrxFLIk4OReNkD2HVs7CUPDDyXRml2dc90VT2ujEjDxjNAD9pla/L8P0Oo9Umx2129IDojxZ58q07udTxmrPpa1a3CQ47gjK2Yn9dEiPRC4GmolJrQmyOnIwJw6E3rO49pBowjNeEUYjb/v0tmFNE+Au79uERDOi0qGzXiLOAnsMSeLTzyqZ9BOpHqynslvKhE53ieBFvQQ3IkyA5XIuXNqErGtK69XSYOZWV1bBmBg9o7d33WnxKhYqPqDYcx3cazwvh/gWkP7yBGfgSkv8sYwhfH9yKPPYcROHk6VmzFBcgDVxjDdYrCiVLgHieHyJ2QnhkkhXWUPrEnNjQqtg+ZseACq6Yiuucnjhd46Bi/4D6K5Q13SvBPttUmaH4gzm7bck5Pp1sy2YKP2hyDUZC3UkQESGYRjNhfTqUJR1UwzDVybXN5uIR4hvuMJF5mLTApuLIjp5doqDc+WFej163UGgMzX3W2oJ18zV/A7qJRTuYWorB7i/RxA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(2906002)(86362001)(336012)(426003)(47076005)(83380400001)(8936002)(41300700001)(40460700003)(356005)(7696005)(26005)(36756003)(36860700001)(478600001)(186003)(6666004)(1076003)(107886003)(5660300002)(82740400003)(7636003)(54906003)(110136005)(2616005)(4326008)(70586007)(70206006)(316002)(40480700001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:59:08.6991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3f214b-5952-4354-9ae8-08db03b4d9ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678
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
V10: Populated connectors for type-c controller
V9: no changes
V8: no changes
V7: updated to use 'typec' for the node name
V6: no changes
V5: no changes
V4: added in this version

 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 8a9747855d6b..33ef939fa3bf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2073,11 +2073,21 @@ ports {
 				usb2-0 {
 					mode = "host";
 					status = "okay";
+					port {
+						hs_typec_p1: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p1>;
+						};
+					};
 				};
 
 				usb2-1 {
 					mode = "host";
 					status = "okay";
+					port {
+						hs_typec_p0: endpoint {
+							remote-endpoint = <&hs_ucsi_ccg_p0>;
+						};
+					};
 				};
 
 				usb2-2 {
@@ -2093,11 +2103,21 @@ usb2-3 {
 				usb3-0 {
 					nvidia,usb2-companion = <1>;
 					status = "okay";
+					port {
+						ss_typec_p0: endpoint {
+							remote-endpoint = <&ss_ucsi_ccg_p0>;
+						};
+					};
 				};
 
 				usb3-1 {
 					nvidia,usb2-companion = <0>;
 					status = "okay";
+					port {
+						ss_typec_p1: endpoint {
+							remote-endpoint = <&ss_ucsi_ccg_p1>;
+						};
+					};
 				};
 
 				usb3-2 {
@@ -2190,6 +2210,64 @@ TEGRA234_AON_GPIO(AA, 4)
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
+				ccg_typec_con0: connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB-C";
+					data-role = "host";
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						port@0 {
+							reg = <0>;
+							hs_ucsi_ccg_p0: endpoint {
+								remote-endpoint = <&hs_typec_p0>;
+							};
+						};
+						port@1 {
+							reg = <1>;
+							ss_ucsi_ccg_p0: endpoint {
+								remote-endpoint = <&ss_typec_p0>;
+							};
+						};
+					};
+				};
+				ccg_typec_con1: connector@1 {
+					compatible = "usb-c-connector";
+					reg = <1>;
+					label = "USB-C";
+					data-role = "dual";
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						port@0 {
+							reg = <0>;
+							hs_ucsi_ccg_p1: endpoint {
+								remote-endpoint = <&hs_typec_p1>;
+							};
+						};
+						port@1 {
+							reg = <1>;
+							ss_ucsi_ccg_p1: endpoint {
+								remote-endpoint = <&ss_typec_p1>;
+							};
+						};
+					};
+				};
+			};
+		};
 	};
 
 	gpio-keys {
-- 
2.34.1

