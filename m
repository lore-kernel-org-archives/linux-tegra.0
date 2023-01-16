Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA57C678D8
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbjAPPIB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjAPPHg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:07:36 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F932FCD8;
        Mon, 16 Jan 2023 06:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/m+Ck1L1mBxeZHANXY/NZ04uOBYJqToHZMd0Qi7n9h3FXazuaqSaOEpekTfw1qCPW17g+g834JtwTqPZO/yJcAZNef8QKSCoku6vSHBJhEQN7VcmA5l5QX79oP+DyH47MvNrJCXAZ6PTAYh+Xxw9aM6xnweP4XORPtquw6/SElkX7mhsoQ5Z/XCzsMprO8Io57YNzjfoFGCR2vGBKacDiw1SSVwA0hMm2Z5RF7oxmX/ArZmKe+xLEXVpetlDE8I3+37YIxKXHtqKJitYFpjUby/smLdgmuVpNlbb3CjWd0AeKEvzYKTW1rioTIc5pOW2iT9KzX7fgrgniJGijqEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmefAIhrteff9c3Bo+vulsVniD52WdYw8g7cuioIiWQ=;
 b=NnriUioshPIIwxocGMAWgP+FeiJRXoWHhtrDMJcvC3TCT33U2Y3okFuXDLelNnqh8Pwy+exXfIOA8mIqKLiGmoISfnn2r+AFV8MbG73FXK+n28HbUYESvBaCSG0B8j48GTUI5IEdDd9giXi0ce9ekwWh6woCy5MbuarWcj4szo1kSY5IIfMdiO41cYm0UwqjNhQRNtKKm9F/tGlEDAUlkUY9pDV6yF2LVr+ThPEIn1vRXuJBWfpbfRwMnNzqQmF/Z0LKzwioU8xYCKs6OKxjFc6cFNGNfNcqLNsqllKy+GPx6oBvTELaYIg6+MiqTzdMknqWgmHMqhwaRMz/aoyKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmefAIhrteff9c3Bo+vulsVniD52WdYw8g7cuioIiWQ=;
 b=IY3si4tDhNTsCg9rGLMG2abZL0Y3AN3acclMpxHAROWmgi6Hre7qR5mqosTKaryc2p5rMB617AJ2207cYuEDQ0k0dxnt80NZXBnJEw/bviparbgYAzlEdrRGq64gTBDx1Atm3b3CfyaBGJMPoRrUvWcUIGKodf8E2KHUz6TqFVbIJMyOzDsUVHmR519gpjMmkwuLwBmx2zS9ZlTHRR6e4yICEpnA8JZNzS65+ZOusqSOKRYZINdUIAKFmkjgMnk01k6OQQxN8FiJ0VfxXHbkU/y+AXJgLL9JH1tkow46r/SjAAz1HWPvFCc1biLm4MPWRhaAZNitBqJdnHNLyDNOFA==
Received: from DM6PR06CA0012.namprd06.prod.outlook.com (2603:10b6:5:120::25)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:55:21 +0000
Received: from DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::1f) by DM6PR06CA0012.outlook.office365.com
 (2603:10b6:5:120::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT077.mail.protection.outlook.com (10.13.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:55:20 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:13 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:13 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 06:55:11 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sing-Han Chen <singhanc@nvidia.com>,
        "Wayne Chang" <waynec@nvidia.com>
Subject: [PATCH V4 4/5] usb: gadget: tegra-xudc: Add Tegra234 support
Date:   Mon, 16 Jan 2023 14:54:51 +0000
Message-ID: <20230116145452.91442-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116145452.91442-1-jonathanh@nvidia.com>
References: <20230116145452.91442-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT077:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: d051ad68-4736-41c5-74b9-08daf7d1b0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gt05LoxoujlmicQz0+dTc1LaMZvYjEloA/gGRDSSrRe0BWxbNW9mDZkGL3EZO8WQxVRA1budx97vJYHXh3k/tf2uDZ4jC0dBMlf4RduAmrsMKfm/RP3jX8G9gna0N48qk9CcQbZn9U/SjTtdIoyWljcCGqbXwkMdKDTQRv7JaoYf+Yu3g3q4WfTsa1FalOzVe5RGlrdOGo/putYhus9rIVPZlSmGdyxXhChp3ZuUg5rf+13mkqSV8NAHuOJlYlImfwJVyzCKH1IoR7U45UuyXxX28fs/jyDw8tttl2kS/JHuySx7HE2B9Oe8b45dKACKiwaQhz48NcfJDSVKFLnVbiL2T0RO3XqzGQUnqmGTSrbixihZL8GcjvFOsQGo8sdxITEtkzsOZq0acIg7vxY1/P2rK/HId0wnk/ua3gcpKTDXlYRV3sMvIb84/NeAeSoC3tZ2aqhx+1QPzjM+Ec4857+iwyp10DY5BHiKlGSQY0CVD1eXfLm16lBhyi9t3/0bQlfFTkPhAscsKRr46bZ1beORoYXdDD2+ONjXoWildW3L0rUeVyeUYL6U84M9Pue0qUytTtmOHfx/tgeMvT6akEwDq9BCDZTgPD5hthv5h88C13fqAfC0P+egwtp6B/aqj9pLiOsfhI9vqCt6IjuUTtX8QspnL3C2z0SwLz5TjpJBvC64R1B4NuFOMF/VexeN6i+pAv/I73JOE93I9nY84A==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(478600001)(8936002)(5660300002)(4326008)(26005)(82310400005)(41300700001)(40460700003)(8676002)(36756003)(70206006)(70586007)(2906002)(40480700001)(316002)(54906003)(110136005)(86362001)(7636003)(356005)(7696005)(6666004)(107886003)(186003)(36860700001)(1076003)(47076005)(426003)(336012)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:55:20.9494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d051ad68-4736-41c5-74b9-08daf7d1b0b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sing-Han Chen <singhanc@nvidia.com>

This commit adds support for XUSB device mode controller support on
Tegra234 SoC. This is very similar to the existing Tegra194 XUDC.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
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

