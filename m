Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66B9C38142
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 10:43:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjASKnQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjASKmw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 05:42:52 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1975619F;
        Thu, 19 Jan 2023 02:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEi0GIajcgB8IB2VnKmTTUQIPbkiM26gYeiTip4Q781Zt0xQnRu/CYz4mo7djayvLfC2qgmltwfD2lbO6WibDvuSMg8WGVvLiuEfXcYc3oyKhKdLVr9qTeUXSn4m1RA2ks5NiheDgQJLngVcytqWZFHX1JZm5N5NDznhK7aT0mR4/nNVj6dt1jpfwrOYJl8a7tv0GXA5GZ3OQnW1vHQREG7lj/6VCnhFiwcO3+FVWHwOHNnKgq7UmTqzR1Q80mCb8kQiFv5b+Yx+Lemx+MzxAyXy3wHvmdMeWYcSmhBTfrgJXjlewhQD0YdwnE4RkJ87zciYHuTtgISw+stMD5D40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQwyYTHKWueLj0JaSuElzhvTxHbVUjkNlObsyx7r1Jo=;
 b=W02yc+Ew6XGs3oLWv1zYeq2SieId6o0JqrTlnf4PCFOERH9yJWIlwHmRnXl4mNVtHejh/v1/bX3RX+R5Pi3o4RcqtPHzLTle4tRIukL27GfEqRA9Qw5awVXbL2KXJSDqUYi+Rx4eIooMWUBKfPxAPhEYmDmZ31p3oDUAcSBge4IHDIaZMpmfHQ0DAdkrJ5vhU0aosEyyhXrXjFhIeZooM4DDnf38LE3GWUgZKJ3Wlaa8WO86UtGJiP2a/IoRJrLiMgaOaQAdZQg4FNlep35NMkdC38j1Sx6Ry0u4UCaq0ghXPHSJwnlCl4NUDCriYT2Gs1cHx4hhm/OImcC7HCPGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQwyYTHKWueLj0JaSuElzhvTxHbVUjkNlObsyx7r1Jo=;
 b=Oxju54Yw7gGIGufTSeYEFnSXFUPl9DunxljZts550BBrvV1KKSQ2YKKEIU/4ExP1cJ10q901jwPYujnS2C6hyK2bHam/Ejh62KsSMEOQ0TgjthhcEMCeTM1YSMEa/KgRJS0dhcFGoRN9kS5Cn+6cQpYegfdrl058gBLKDVbRmU20N66Zzhc8VMPSAAhW1MbQXt58Bx5mg1m4q+XkVIp+79ixIfeJEnUBP7e19lNlt9SNPhbxm91eUsIkoOWHeLjGfsbIntCmRUYP3zwl2Sr7UnrOd4F8zWiJe4Wke44mSP4SMoHjF0t62d+YBnH9NbqNmIqTDz6lxLcpCOD1RHiq1Q==
Received: from CY5P221CA0053.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::23) by
 SA1PR12MB8118.namprd12.prod.outlook.com (2603:10b6:806:333::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 10:42:32 +0000
Received: from CY4PEPF0000C985.namprd02.prod.outlook.com
 (2603:10b6:930:4:cafe::c) by CY5P221CA0053.outlook.office365.com
 (2603:10b6:930:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 10:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000C985.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 10:42:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:21 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:21 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 02:42:19 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 2/5] arm64: tegra: Add dma-coherent property for Tegra194 XUDC
Date:   Thu, 19 Jan 2023 10:42:05 +0000
Message-ID: <20230119104208.28726-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119104208.28726-1-jonathanh@nvidia.com>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C985:EE_|SA1PR12MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e379578-ab40-4948-5faa-08dafa09de66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xQtZrEVhXWBf0LragK8fPkUuNEPJRwFDqM/CLCclQtI7lIbElFYcnHPQjBn0vrQIgHn9wcBMj2IZiI8Mdo1/PmgOKxD7mOFbt0PF9iPjWbq/pXOuUrpTOzmI7yuCqTMfrWZzYeZF3sdxQXBKDsJZIIHHMjSQH8JdiPLY1YS6cqYcHqWEDQkYKAopEecUYBocy8UbBA0M+5jEw0AcCYmkt+ayK5B0UX8Juu6hL4J6CoTCc6NltXvpzs2IovQ8Ei7cyScqBVqSiZi2B6MvsRdO4ieuIcJmZHV2j+yaVy9pyNALDjki8YhuNemw9YPcpy0ha/6vsqlcSy+517HMXQPq9dwcu/M0H+3Wz04JJrpu4j8dmfmxIBFjfU4GkUY2q8bjNl9ofHHWKHK4XoJ+7UpuiEEIBntPp39jm162z9pdLtuHyS1b/DcM6shoDjvaIq9Z8JCbSnbLKUR5utwDw4kpBRl+3wOMtcAHzQXDOGIO/CigQe1oeStQkY8EpYuY85xNy1bgxJQCX1PE1be6s5CYeXdiCsF70sbGnXLVCgiebhI1q8Pkgc7epi3wg4JYXoppsDZK46a/w/+Zp/QqFQ072k28On147DB8m+78tBkWO0m5vzDzZCtBVEbROvNNmyy1yjo4qAd703JoHfu1H+HYLiwsV4BVJeIDduU5c8mUAyva6p3c/4QLHSatg7EYMQnupzP32tIh8MutqAYV6hYXA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(7636003)(82740400003)(4744005)(316002)(8936002)(2906002)(70586007)(5660300002)(70206006)(40480700001)(41300700001)(8676002)(82310400005)(26005)(2616005)(40460700003)(1076003)(186003)(336012)(83380400001)(47076005)(426003)(7696005)(54906003)(107886003)(110136005)(356005)(86362001)(4326008)(36756003)(6666004)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:42:31.8153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e379578-ab40-4948-5faa-08dafa09de66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C985.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8118
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DMA operations for XUSB device controller (XUDC) are coherent for
Tegra194 and so add the 'dma-coherent' property for this device.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V5: Dropped fixes tag
V4: This is new in this version

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4afcbd60e144..99eeba8de6bd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1291,6 +1291,7 @@ usb@3550000 {
 					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
 			power-domain-names = "dev", "ss";
 			nvidia,xusb-padctl = <&xusb_padctl>;
+			dma-coherent;
 			status = "disabled";
 		};
 
-- 
2.25.1

