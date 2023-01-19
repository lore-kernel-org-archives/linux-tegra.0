Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C38C00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 10:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjASKne (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjASKnJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 05:43:09 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7651BF8;
        Thu, 19 Jan 2023 02:42:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU0zjIm8szGhnyZBDIMt8r4p6ZCOpuuZXOBiCjWHNVaA00d+GWXYAueJV4CAt9jLOn1/+AdH2I/QzFQGUwUNmxpxWtbOC9lwwxFU7dp9TZrLZmISPSquBkf9dGlMHGwJbTws+ImxzWwr6SiiBzQpSUqLA+fhLqiQKdKEtSH5jLBOJ9j6/4LUsQZKt9mAWlAAZKqOGDdS+FPt1fp12pf9NYoPE4cw/ca0AIUXT7SVWsIx8q/WL9AvHqbUEyxafgJMySS7+sBCxzFp6jYWtOWuiHjE+Tg8yTjxJX+kOI2ObljB3ZPR+Pe2WtIf6XY0/WMTDP5t41FBU2UtNbe/eaKzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLE+hrYD/9gAV+MMK7dZnNQ/AraIxHAtouiGwBOCpbY=;
 b=ev0Bj83h0V2LbsVA/sjdqG7znvJqtU19WNgWfSlQhnklZYfnt/Q0UmtPkORKTCUOF12UxqNnFF8o5zd0L3Fku9nRRGFwAQ+ahwnyNwvrdLFUdwv0G8Yn2xqjwKqgKsPV1JANNSWtBz11fbbVvsDluv/UBLOiXo4x+f4CgeubK+3mJrulDxyTlM6/F2VHPDGtVw+acmk3+7aS+GA6Y1pSE9OmO2B3H80w0hydp3WPV+gW4iz5MsueJTzW603pmF2kQ2lreQ5Ts+qsLFyDB8OociEpydqJBUhKI+LPyC9c/vYVFadqmJ7VTq0CQ7bf/XOEqnAi9W3KvlEUz4GwAtgUNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLE+hrYD/9gAV+MMK7dZnNQ/AraIxHAtouiGwBOCpbY=;
 b=OUhZ0OFx5trYzoqThk1DRaKdf/NOwf0ehd6LXnuXpFVuV9Y+62sZtrwQFqHm34sIb9Ecxq+HZl9TDFYhLIoEFZJHZSosnK4FbXcE8oalW/fKhnQGvzD9DUnXqZI4Kg4JJvUaAT670Alcpy9eqkg9bR9DtRTyCO47J7xEetVl/vTPDzzmsUm1wpmD2gx1bPf4maRYfrhj5ZukAsYOaEMRL7PdgUvIwe8H29qPEsg3NTNYuBQ+0tEy0XOs+JVYLn/L+zUY/PpwsrHP5vZBlZzYJ8xaLEDScSmXH8LtaKp+GpwCGwX3MDjmJnmKCS8UFTCS4SITWYW9lVcBeFDfjMy2xQ==
Received: from DM6PR06CA0085.namprd06.prod.outlook.com (2603:10b6:5:336::18)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:42:34 +0000
Received: from DS1PEPF0000E65B.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::bd) by DM6PR06CA0085.outlook.office365.com
 (2603:10b6:5:336::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24 via Frontend
 Transport; Thu, 19 Jan 2023 10:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0000E65B.mail.protection.outlook.com (10.167.18.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 10:42:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:26 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:26 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 02:42:24 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sing-Han Chen <singhanc@nvidia.com>,
        "Wayne Chang" <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 4/5] usb: gadget: tegra-xudc: Add Tegra234 support
Date:   Thu, 19 Jan 2023 10:42:07 +0000
Message-ID: <20230119104208.28726-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119104208.28726-1-jonathanh@nvidia.com>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E65B:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e6f112-cde9-47fd-dcd2-08dafa09e01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VhBS6KDFpqFqQuiXh79kFHQ345gCmSw0qXnag5tPc4e/xvZI9l9HGMymyTLALmFyDtUXX8VwriVQX/CFU5VpN9jcKPIKPAYJ1PEDw5q7o1WsIKbqXz64h46+Y38F+TlkQVXekaHvnYh44HZRCHrU9ZRrejNcDZRA7QarsyaP0ovSVb5LNRkLZwyRS+r9gvrpS9UYeI2/IkJBwPCbC+1SuTy9BjlBteTO6GuimsLzF5qKToPq1fsf/NFMKEO/akiZmkncQvUYIVrPGhi6vly6nRA4OKrZ1JVu5POEDll0rgAaS2BNMFhFIG7F0XQekzQuq2C73uBMdPjvaQY6g6QiJHMCcQUrx6XyKEz8X01IHYWNl+fnUaKrC919UVtsfbsuE3WOL8gLCdPqnjHYC2g43J4iXkE8gobD2HDrnVYUp3Mpvtw65gyv8y9fOJ7wnTa2LcU+f33znBZie9c0KLjyjuxD5Q8axkDZ/fJZAaFGQGyFX3AzSMrgIXsaHhX5N6wUhKAOD+/mFRE9+HxLsdajfEMM6sHgsjnGWj/IFrVNeijUJTN60ILs1VTBTa6P2hOHAQmp/weiCthko2loxNE/4kDPbfEm9MPezXVMPxm19IPweNjHjs6XLE/UFqS8qy7KMzj+tDb/eyf/EegRed5iy6qdJcWjEu/NKXjFLOxK3GmOUiwEkqC3EU9aJ7EYgZ962Ba1pe4fp7zHlX7n/tGwfQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(86362001)(107886003)(6666004)(478600001)(36756003)(7696005)(8936002)(5660300002)(316002)(82740400003)(40480700001)(70206006)(70586007)(4326008)(8676002)(41300700001)(36860700001)(186003)(356005)(26005)(2616005)(82310400005)(2906002)(83380400001)(7636003)(54906003)(47076005)(110136005)(426003)(336012)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:42:34.6199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e6f112-cde9-47fd-dcd2-08dafa09e01b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E65B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sing-Han Chen <singhanc@nvidia.com>

This commit adds support for XUSB device mode controller support on
Tegra234 SoC. This is very similar to the existing Tegra194 XUDC.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V1 -> V5: nothing has changed

 drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 76919d7570d2..ff697190469b 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3660,6 +3660,19 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.has_ipfs = false,
 };
 
+static struct tegra_xudc_soc tegra234_xudc_soc_data = {
+	.clock_names = tegra186_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 4,
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+};
+
 static const struct of_device_id tegra_xudc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra210-xudc",
@@ -3673,6 +3686,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra194-xudc",
 		.data = &tegra194_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra234-xudc",
+		.data = &tegra234_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);
-- 
2.25.1

