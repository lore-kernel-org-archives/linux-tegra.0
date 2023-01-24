Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6021C25B4E
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234251AbjAXLoD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbjAXLoB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:44:01 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812FE3EFDD;
        Tue, 24 Jan 2023 03:43:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXxeJdnJgFbgmzyylTO9A/i2b7dvL3LUVjNWYsYDmcvqH/QSrkXRoPTpT2g7XYQsCoJ4/t3IZYCwKEaLGfsmI/sHdzMIhE6ctFfDTpT6Lhd9dbRJkRjWgbE4vyN1Xpk5dRVU3LesTnK/BommL85DtoF9itHCEn5FlWJJ2vVuC8AH33pJ4UiVHDNlOQwjoTdPbVuWk6F+adsWeApBP7ZCr8qfBaaed7sS/2t5LVsu66/4TI3RCTRnQMupxXFcBqlzeTtNmzxcanFJqZNR1SOd/simRUR4rTvVZpBlqcSeyTSvKd45qEVbcM3k9MoMHusNt4snkVqb+lIUF32smK70HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NKokIwQ0RhiJFL0rqhF9BBZCVv3Y/NP6T5l4CVSvIY=;
 b=a7csyZsK0ZW0WS2vIqlab8a6aXHLzzizD6IzzhPXITFjuVH11YSYgQbRzxfE+oWWlYJsQYAUZtkL4J5aGAUHgKAyirJd+I6fuNjnHDeSKJY+L+WdzUlMBItDsiUlDedfDGyXS6QYBRsEXey6UFddR5xvpQmF/j5j8E4NIiknrEd6HUa35/J2/dddj5h0z8FF1gcrLhdEsJL7yJcWR4d4qs1ZWN8omhuZIPUQ8fA0vyayXY4u6T2LjL8Iah+HMKak45wgV2xbvMgPW8d/xw6PCFH6s/1z4d1MKNLpF+Zy/IEQpgwiucrKR4/GCxiE3AmfOTTXF501Xuv8O1wtd5lyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NKokIwQ0RhiJFL0rqhF9BBZCVv3Y/NP6T5l4CVSvIY=;
 b=mslLMj/V4YnLgxNlouoipukhXnb//7MofoZH14U7GkhluEGIGKV6OEMx0HwzoKukDSO4OuHqrbNgu6mEuiB0guwN0vXk8YwLPXUHAf0iWun0RnESYn9at7CR3+ocirbamVf3jQRi1NnshATLU7Pm+xPV3IDLyiPBBHQbHfVUM9YQJ8jangm22lacs1gao1MOgnGNcUhgSZU50laj5rWEn537Dqcr3eZnBLEsN0cuVsU4raaUnwI4SH6dJU2wxcXSFlG1SJzdFJ8n0xvsQs3gnaK4yX+9maFArScZa8yr46KHgzUKWqOVEczNa0O7StFyiQC34zRyEn4uzvvROabzrw==
Received: from MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::11)
 by MW4PR12MB6897.namprd12.prod.outlook.com (2603:10b6:303:208::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:43:52 +0000
Received: from CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::5c) by MW4P220CA0006.outlook.office365.com
 (2603:10b6:303:115::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 11:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT092.mail.protection.outlook.com (10.13.175.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 11:43:51 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:36 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:36 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 24 Jan 2023 03:43:34 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V7 5/6] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
Date:   Tue, 24 Jan 2023 11:43:17 +0000
Message-ID: <20230124114318.18345-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230124114318.18345-1-jonathanh@nvidia.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT092:EE_|MW4PR12MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ecab190-5024-4a18-183c-08dafe0043c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yTOB5T6jpX84EI8Atq+amt1J8C8k5oc3WvRUHMkSIky4a7twnK1awU9mce+6j81TK3arnzoJXTSgScmmKgdaYL/GmXlvUd+mxypMUnyQz8C2PgkrOPizi1j56KLu8FV/oSMqkr4VXFtdx511jK9YMPkmXKQO+D7ME1drkT7InZZ9pjIUbCU9tz43+nWkivqmsmj5Sxh9clQMsXyrOEaBRNNgiC6O9zzXZSNZSqrKDS7BZLkb7ZKyxxP8DQNzoFw8oSCi2D5XGBByM+uZOltPPl7LKIsWw9IURWjZbOU0ieD/sopA20tFBKc/pn24GUa4845IuKFuHHbt3KuSSq0WkNIN9NVOvobifzoEH/Xg6inssC0IrYjUPwZlZx/f9cgMj+sL4N0KWPC+fCc/MWciaO4GKQ2+ge+/+jHyIiiyisb1PpbAxDsRoqgjSPKgk4Y5wk4OZqqS9/W+i4/VNR5/hc7rMX5/9YJCswUwu8ey03Gi1ekNUuwmZbSH0Cc71YC5Wbr3IuaIlAd/klbbTvn+48GQ1Y0pOSvS7Xylyid+XIVNHiQjM82/s5Qq9v5xjiTHdfly3WiuPEB7XFPrHiM8gDZbfQpfQeRK3Vwy5GoQmBP80RvYf7MD5XC2pUnMbD9aVcnfyREGxHVO3meEJWmNCeio0PgQ+C+sEtjhwVaWdzpoOoi1gQJ8Kw87f/fhEp9K1a+atMOz1h4Mx40Gw4u7ZA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(110136005)(7696005)(1076003)(4326008)(8676002)(70586007)(2616005)(426003)(70206006)(47076005)(26005)(107886003)(6666004)(186003)(83380400001)(5660300002)(8936002)(41300700001)(2906002)(36860700001)(82740400003)(7636003)(82310400005)(54906003)(316002)(336012)(86362001)(478600001)(40460700003)(36756003)(356005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:43:51.5451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ecab190-5024-4a18-183c-08dafe0043c6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6897
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

