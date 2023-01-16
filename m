Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FABC67871
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjAPPvk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjAPPvi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:51:38 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA16D1E2A1;
        Mon, 16 Jan 2023 07:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ3ViLoJvUalX8tnrOl44h+leCq6hVkgGWidW382aCgwsgFrFTA+syVrEiDRBoIUBjURpPQIW2N/WfDVX7C14AsUsFbCj3sAnujS81knpmPb9T+IGH0bupoZSUxpejQWscYg6S9pLWlVqr40VaCNBGsvb/MuXqPvOL+AVaufS3ci0VZ/gnpydLNU1yn1zxs4+6GvNnFzFh1nz4wVdriP9wSF7J6l152yUFDlcJwbCbOKhCrKYcqSsUvXM4XXhAqA35qk7waW5oefi7EFgmAO/R9e9cVWmOSlIbWa3MqNdzGj203VmD0clMel8G2p8fezZqvcz/x7F+DEYmy+uC02OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjnA7qkGVQm7l6rnA0O6TuQ+17H5k/FgfH6AM63aH98=;
 b=kDvIPngHGNDZ0i8rXIm204D42TVDvJeIyjx9SC/udIQMgNJlWKe1sF1LvUFFkH5qX5owz72xuKqzibHDhfrjXACu4GeW0qNGKhe/Mm8zHvpMSMKaqpbX0hhfCrglE8kHxkNInle8SOlhL9nh6coR3V3hRqfxr0AP5uQskOW9LMg8pkxQTysomW8+4DQizypPSJNxX9HniodcyniHsYhvQUhkLlUQd/y6awnRdvDU4fLVnMt5dg9zWNVPVCwarxACHOcfWN6hTaIRqzEFqhJL5UZpt52RPY1g0MS5Tq2bGMTR3V4NlR1x0tmx5RmwB3E1Vye2ZPktEuGyBAruSVYbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjnA7qkGVQm7l6rnA0O6TuQ+17H5k/FgfH6AM63aH98=;
 b=G9ca0AgPgPfFHMwZ+aEKgfZBODfQQUdMaavlmWM+MAokKRlOUkIQQNMpWO0O9ishUnpfTVlL0Lw2GbRiAXCteGS5RStugyOuUtwQ68bnU4GWG2hFwB/aplUP5ehfidQHaV+jBTo3/j6DA1wfUusfswXptI2OQZ932CdaidDZDNpudme9FGuAMK+D22+hRf54BWjzal4V70yvLwjDn2jKNtcMZ2fn2MbewW+3SPA1ZKO3lOfN9nTWn1vK6kW4tweCehofxYIAPx6FeyfgAY5kJ8vJaXWn6csez21XSaftQowULJVQaizMQB0D1IZKkcdWOmxwiDxmga4yF9HV/MqWpw==
Received: from MN2PR16CA0001.namprd16.prod.outlook.com (2603:10b6:208:134::14)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 15:51:34 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::39) by MN2PR16CA0001.outlook.office365.com
 (2603:10b6:208:134::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Mon, 16 Jan 2023 15:51:32 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:18 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:18 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:51:15 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Wayne Chang <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 5/5] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
Date:   Mon, 16 Jan 2023 15:50:45 +0000
Message-ID: <20230116155045.100780-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116155045.100780-1-jonathanh@nvidia.com>
References: <20230116155045.100780-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|PH7PR12MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 935803a0-5b54-413c-b69a-08daf7d98a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RgeNFLKYUv40w13BV5RJt23pKjX4pIS+i6/Fseb48HsGTtbgk7n+rLVunDYWF+9gAFRbhyTribOVOEytGA89VbQxKRJRUevL7I5UzmLDrvLMmDA6nOqnyjEK3O6UAhobDGD8HBbXYE+QLbZnOi4ZZixlYROxvjjdrBFmd4vONpXVIDet06+eSKRGDgX08BO4UIhyGo5wHFHaUZSY1tZc65LNSanE1PQqATnuJh3yPg+JqFCF6T5UIwDcdQPlqFAV3pc4jGvLhAZNb6s8ooHV88v9fKvPpFOJKh3Og9bpyBltwBMJbbjzuUrwZYUWuQSC/zqEBOf2hgzaY3yGjair6DZf31exb2zcargMKKXMVyCyu19NxBqn/xKm3oOVCZVMNOopr7MLr++cnSLyDiiznVCdBTgYj2ZwO5h4u3AOuysE5a98zVa5+cyUPEpb8JfrpudOeOOxagWNepW3hgtDFUD5fqbt1plLiw65qjuh4Oga5aQ9k225EtD0B0bGRCLZkqvDJ5RMqkgjXZW/LiPc97ALppSFfx+HFDdAOTLdjdyOg7W95VZqfg5CmtigqU59JQn7Dz58qpD5JTvxXgKsLEPCLJgMQeW2tTwECpNquQHZlwHqnNdrifo6x+Eyyo0yFD/J5p3VUpz4+sxMK1zMENN/NqckSBtSTIaKHZJkh2Q56C18+ktXOlKjTehDj2RWk0cHkqxvWlZwzOmisnr62g==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(8936002)(41300700001)(54906003)(70586007)(316002)(70206006)(4326008)(110136005)(8676002)(2906002)(7696005)(7636003)(356005)(478600001)(82740400003)(6666004)(82310400005)(26005)(107886003)(186003)(36756003)(47076005)(1076003)(36860700001)(336012)(426003)(40480700001)(40460700003)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:51:32.5873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935803a0-5b54-413c-b69a-08daf7d98a60
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693
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
V4: This is effectively a new patch that has been added, but based upon
    a patch from Wayne Change that added USB host, device and type-C
    support in a single patch.

 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 32c58aa00035..059a23ce810b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2115,6 +2115,20 @@ usb@3610000 {
 			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
 				"usb3-0", "usb3-1", "usb3-2";
 		};
+
+		i2c@c240000 {
+			status = "okay";
+			ucsi_ccg: ucsi_ccg@8 {
+				compatible = "cypress,cypd4226";
+				cypress,firmware-build = "gn";
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
+				reg = <0x08>;
+				status = "okay";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 
 	chosen {
-- 
2.25.1

