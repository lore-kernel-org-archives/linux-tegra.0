Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BE0C678D8
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjAPPvd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjAPPva (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:51:30 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55B01555C;
        Mon, 16 Jan 2023 07:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUBPmVluExrvNRkYoKiWdpr98mtR6DWPOlGP/ff+gGPA3pubcg2Jji3t/4T31ZZ/kq1iSIpkxy53vMoQEujIQ2ZeZZ9nll82CT9abn8ZAsRchqkOWGfXseC44is8O2Av0k4I7TA6Nu1KSbAhSemNEM2lzQsxQTgRYPbfsfXb8Z4OM7KaUm52tkQemYAl9+hZ8abwBV+JNcE4uCO/BuUXS7KF74erIs8nM4xt6T43sviJoo0+Tkkb2GUKS+MwQ47rBsfLUgSfIOkf5QYIWD0wAq7XIbJRdwftK2Lfb2I7M69tuNiTkmBIdsutbh1RPnov+EaYo8AJ2ynHa0XjgkLEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jr0ssxQ/sIq9hEYPd7XFprdMCJPGoblbiEzD7YtfYOw=;
 b=bPApnhz4Ap84UGbSJdSX7Zal0Qhl21VodPH6753Hvi0T3MjEoDo4Y3NXu3trj/rD/WQnK7vGx/yyZvy19ySH6hF6FPWoKZJuruQHLVKkg04wbs/x5EURwawZ6N/4lIY791GKdJn8zmcn+O5a5cZsV0stiGskFxg0imAJjJI6TAnoEv4rpcYf7ZydpePL7zUeAr1tithbwUCU8GJon4bE8gSzZv/r5YVBdCy2qw2Fl3n+s2NipR2p/QwIauG2T3mcJMBmDZhcHHNEcG5f4jpz0RuR+fix5gZAPSNdYDaC6ibtmvqxbwMYQ69qHnSQ9piNkm5hBhj5qpMJYgCZNQCy9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jr0ssxQ/sIq9hEYPd7XFprdMCJPGoblbiEzD7YtfYOw=;
 b=gkeM2aJ1mz9pbwL5SvKcSjeCw9ksVwRDf/f6eOAdbmDErEARPkqKvrspIIYqhpNAl9JttXZHdsUSjwigowTEZf91mngvP68oY3/wExHcGBLUZOCYEerZNGeA6pHDkfT3zdNvGCGgQi3WK7408hx3tWE1tgYEoBDqKqA2StkEqCPNxNkK71HRRIePKt/gJij/SCOHux6Zb9L1xy7J5mXJ2AfvrYXuXW+7dd7Ti3irDOY5zQbG4oRCzqMheF6UdFe+yXxhQcD+Dn8qkLKc/wjBF8qcUMtonnuTjJdCzAmjDWXb9i679SrXQTc9mvyPF6ljFeKRTOnBPBZmMQZvPTebLw==
Received: from BL1PR13CA0173.namprd13.prod.outlook.com (2603:10b6:208:2bd::28)
 by CH0PR12MB5202.namprd12.prod.outlook.com (2603:10b6:610:b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 15:51:25 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:208:2bd:cafe::74) by BL1PR13CA0173.outlook.office365.com
 (2603:10b6:208:2bd::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Mon, 16 Jan 2023 15:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Mon, 16 Jan 2023 15:51:23 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:09 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:09 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:51:06 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Wayne Chang <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 2/5] usb: typec: ucsi_ccg: Add OF support
Date:   Mon, 16 Jan 2023 15:50:42 +0000
Message-ID: <20230116155045.100780-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116155045.100780-1-jonathanh@nvidia.com>
References: <20230116155045.100780-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|CH0PR12MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9cce33-8b34-4748-54b5-08daf7d9852b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVcG3aOTSCmho0I4E22ZrU2by5hrBHknHYm0LIClq/4jlNpHODrQp/h8rumR1UbN21TzMcqmLfoBseAeqbUvQ4MA/iSb7wJJrP8tVdYMOGqjOH1cy6W5PFrtzIoweW6sUr4rN6M91eFKTcxARaxHzA18FphT8ipZLUrPZJ2tx4KWS7gp1irCR1Gt7CUyatSrliaNBCja6tDGPqWWpqTBLYYWMvwfCfWL0tROdUhsFCfJA3DkcNyjeJwrHzGAxe9kLtO5i2VK6bLdnJGJ5dsVcbT8NvPLQ+b4efTRNfLc1GSTNYwkvnXyREfvf89pPzpBZ2+NR6xF42QHq+AS8wJV4a0pon/OIUYTWJuXNQASRD/OZ4jQIgN+U/hqAj62+Y5ZGgGG/xm0+36DdKK3XZQ/bLck14D9nqXpY/mIK1L1DmIZGqwcg0zUyF5MlYYADhMY+pbLM0IXYfEwEWsVHtjF88WbpPN009/wxXiFiquQFTJIDOBSihNYVku2yZ7QnmxLVwwelexvcYk2ck4Y5RDzpcpnfV04P71gwMCP8KNdFkN+DCqlBw2fcbm/abFZQrAQscxdjOd2Zjl8A6Fg+vNcY5KIZB42+WwnvJEArVbWQSLpqEtY48Tf+8TusfutJeDs/duYA9hTFz0IEFeUT0Luy1OSTFZAYbz8Qh2YrKMJtIARLCnLVVUV32JKtzD52z8HQm/FrMm8XK3HuvDNBfYPyA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(8936002)(5660300002)(4326008)(26005)(82310400005)(41300700001)(40460700003)(8676002)(36756003)(70206006)(70586007)(2906002)(40480700001)(316002)(54906003)(110136005)(86362001)(82740400003)(356005)(7696005)(7636003)(478600001)(6666004)(107886003)(1076003)(186003)(36860700001)(47076005)(426003)(336012)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:51:23.8488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9cce33-8b34-4748-54b5-08daf7d9852b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5202
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

The change enables the device tree infrastructure support.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V1 -> V4: nothing has changed

 drivers/usb/typec/ucsi/ucsi_ccg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 46441f1477f2..4bc31ed8e5bc 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
 {
 	unsigned long flags = IRQF_ONESHOT;
 
-	if (!has_acpi_companion(uc->dev))
+	if (!dev_fwnode(uc->dev))
 		flags |= IRQF_TRIGGER_HIGH;
 
 	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
@@ -1426,6 +1426,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 	free_irq(uc->irq, uc);
 }
 
+static const struct of_device_id ucsi_ccg_of_match_table[] = {
+		{ .compatible = "cypress,cypd4226", },
+		{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
+
 static const struct i2c_device_id ucsi_ccg_device_id[] = {
 	{"ccgx-ucsi", 0},
 	{}
@@ -1480,6 +1486,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
 		.acpi_match_table = amd_i2c_ucsi_match,
+		.of_match_table = ucsi_ccg_of_match_table,
 	},
 	.probe_new = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

