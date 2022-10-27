Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5A0ECAAA1
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Oct 2022 11:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235128AbiJ0Lhm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 07:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbiJ0Lhl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 07:37:41 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57316EB743;
        Thu, 27 Oct 2022 04:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJZirIxrNF7dKKCwOMy4od5n9QGm0wR/+xdUBvDw+r2zdxCJhC31HPMo4UhgtEafX1Bci/fHADd+WtEYqMAopzACUoARXgWOxWfu4I5s30jujr4VMkd75RAAR01XyIa54w3cXH/2D0oRVWAgilvWwy8lfPrUtgNj7XkJ7tYvfBfqet9TwR46alzSzBw+pcXHM6n+RkGyMdxDYu+I+X730c2zZX1CC0Hl6KVtHn+B+yg7ZtvuvBEM7yVEsvWBoGrd1uMTf7j1zc2WBZS0JdWpQ6LbqhngPiAeTETh1mrJo7prChKIvK0DchD3GxONZbU+gbkcjK9Yf4oTOclAAnzc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rdsvj4Dp9206ivyVXB7KIjiWm6JxcJOx4KBR3Lb2zyg=;
 b=EhHOgDzQY8aTLUIbERC5BBdN/lagEGI9OhOSWOLOOSeXSIuU7BFos72g9chVv3B6scAaPesC3hLdqcnSOmhw5c02w7w/hiGVzS2KUQ0Z/sq9c7LYoQpLlt3mcQa6xS06hcC3YD76NHrB2Adxs0K8PMu9tjrl8oEnuTNIxYLlP2+tql9Bq4ECCgfYzTe/SwJrRxXQXle5fjozCQYaB4CEKEhmk66eqU+7wfVEIsu/KUiF/JuK8HcdAQ/WaZs45rqxGg4VkEoL9E2h761uOSpjDcm7tpLXR4Q6vPuqnaHjPTATuKjPARycP3Q8MUqcdA5SnUmvgfG10gEuWKrgtDxOSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rdsvj4Dp9206ivyVXB7KIjiWm6JxcJOx4KBR3Lb2zyg=;
 b=IJZJLBA8HKaVFthy7HTiY+rjmSXfE6uJcJdfmb27qW43ncpYQ1gVrK2E0yu+mWLzEbgkHTogxVxJO1fUA7JgVCNT+qqIgDPv0638cOYfUA9C1tJrHxBjRtgseprIz3nYNLBe6AbkOfzIXp168UVsdnS4KLjMxd1zbGf0fBMWciXfqtV2g/ofpypWmjK1/3DS196IFDtsXDQl3n+DXSljEvtGGJsyhriNrHTdFH/DSBBm9uWCETfq49EuEDh8cFuOtrXuXqNHED7eQ6MPYbKht2kpDpa2Tq2V+D/UMQLpW+eWgm46f/51RWLlhJMyAap9sZegFNluzAzhu4GPLafuCA==
Received: from BN7PR02CA0028.namprd02.prod.outlook.com (2603:10b6:408:20::41)
 by SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 11:37:38 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::b4) by BN7PR02CA0028.outlook.office365.com
 (2603:10b6:408:20::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Thu, 27 Oct 2022 11:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 11:37:38 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 27 Oct
 2022 04:37:23 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 27 Oct 2022 04:37:23 -0700
Received: from 44189d9-lcedt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 27 Oct 2022 04:37:22 -0700
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>, <linux-tegra@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v3 2/2] clk: tegra: support BPMP-FW ABI deny flags
Date:   Thu, 27 Oct 2022 14:37:11 +0300
Message-ID: <20221027113711.1445841-2-pdeschrijver@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027113711.1445841-1-pdeschrijver@nvidia.com>
References: <20221027113711.1445841-1-pdeschrijver@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|SJ0PR12MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4962ca-04db-4396-d993-08dab80fa683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eiGNSPs6aM6F7ns1RWwQCYjdlDiWT3c35DPD/b2kgNae9hcRHe2QySvZ/ryHMniqMC2vPLqUGkPfVH2av8l9TnUD/LPI8oWfezgmLxnNIpVhYX4tW08LOimNPjmpSV5XxHqTxWDWrX60++o3Je32h8IFO6dR2lvU6u0FAox7P/5d/01n1VM6aa/+lBN5aD3ipJY7O4ptqdDYN4VV/6XjKF2CaUoG4RE/pOThGtQm7zlurvjpCCk12kORIbu8XK5kYkGT6vUO5XCpUxV/hZBke50lN5sfwNU41i8GCbstINSGmXU01OfbAOP2J2qfHNs51lnZ9cmPZZCyz78/Ft6L9+XMRnqc6bVaL5aEeL2mmaahsHJNyVz/3kQ82+TD7QmPL62w1QwZTj1FQ0rqZzdysYDU0YfadzBhGZMY7SMaK3AHYBSogQ15elX+S7lXoJSUzyn6ihBphQC892EgCWkFy/QyE7/OJPMIXU6jD7Ya0E5nfwNCFU0uyNsmM6k0QZQVV/wftlszUD6aMjAiyCGNIaZo2drcnAoBChqhAZpfPoUjBFbXJB7Iqwei6M6VGhOy8rsJ5DiMDaDVr3gOlvtliG1Cku0IqWlYJscccLbZXcXsP+r+RJfM8y3zcwj0zIqNDvLif8aDTMUViNCFCp8ywUEtQJlP/ew+Mri9sha+NVMDnvn+CUYbN0ac4YX+EhlksGPmw5t8yPEKUX8gDlLd2mOGebPfvyMxmIPAG+/3F80j6t+fm+ht14GbJLVHw+zeZ7ao3LptLq89069Jn45eHg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(5660300002)(478600001)(70206006)(450100002)(41300700001)(70586007)(40460700003)(4326008)(8676002)(86362001)(7636003)(356005)(8936002)(316002)(82740400003)(40480700001)(110136005)(36756003)(54906003)(336012)(2616005)(186003)(1076003)(82310400005)(426003)(47076005)(36860700001)(2906002)(7696005)(6666004)(107886003)(83380400001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 11:37:38.1994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4962ca-04db-4396-d993-08dab80fa683
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support BPMP_CLK_STATE_CHANGE_DENIED by not populating state changing
operations when the flag is set.

Support BPMP_CLK_RATE_PARENT_CHANGE_DENIED by not populating rate or
parent  changing operations when the flag is set.

Changelog:

v1: Initial version

v2: Fix dev_warn() usage

v3: Use dev_WARN() instead of dev_warn() and clarify error message

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 37 +++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index d82a71f10c2c..303ddf591efb 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2016-2020 NVIDIA Corporation
+ * Copyright (C) 2016-2022 NVIDIA Corporation
  */
 
 #include <linux/clk-provider.h>
@@ -310,6 +310,23 @@ static const struct clk_ops tegra_bpmp_clk_mux_rate_ops = {
 	.set_rate = tegra_bpmp_clk_set_rate,
 };
 
+static const struct clk_ops tegra_bpmp_clk_mux_read_only_ops = {
+	.get_parent = tegra_bpmp_clk_get_parent,
+	.recalc_rate = tegra_bpmp_clk_recalc_rate,
+};
+
+static const struct clk_ops tegra_bpmp_clk_read_only_ops = {
+	.recalc_rate = tegra_bpmp_clk_recalc_rate,
+};
+
+static const struct clk_ops tegra_bpmp_clk_gate_mux_read_only_ops = {
+	.prepare = tegra_bpmp_clk_prepare,
+	.unprepare = tegra_bpmp_clk_unprepare,
+	.is_prepared = tegra_bpmp_clk_is_prepared,
+	.recalc_rate = tegra_bpmp_clk_recalc_rate,
+	.get_parent = tegra_bpmp_clk_get_parent,
+};
+
 static int tegra_bpmp_clk_get_max_id(struct tegra_bpmp *bpmp)
 {
 	struct cmd_clk_get_max_clk_id_response response;
@@ -510,8 +527,22 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 	memset(&init, 0, sizeof(init));
 	init.name = info->name;
 	clk->hw.init = &init;
-
-	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
+	if (info->flags & BPMP_CLK_STATE_CHANGE_DENIED) {
+		if ((info->flags & BPMP_CLK_RATE_PARENT_CHANGE_DENIED) == 0) {
+			dev_WARN(bpmp->dev,
+				"Firmware bug! Inconsistent permission bits for clock %s. State and parent/rate changes disabled."
+				 init.name);
+		}
+		if (info->flags & TEGRA_BPMP_CLK_HAS_MUX)
+			init.ops = &tegra_bpmp_clk_mux_read_only_ops;
+		else
+			init.ops = &tegra_bpmp_clk_read_only_ops;
+	} else if (info->flags & BPMP_CLK_RATE_PARENT_CHANGE_DENIED) {
+		if (info->flags & TEGRA_BPMP_CLK_HAS_MUX)
+			init.ops = &tegra_bpmp_clk_gate_mux_read_only_ops;
+		else
+			init.ops = &tegra_bpmp_clk_gate_ops;
+	} else if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
 		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
 			init.ops = &tegra_bpmp_clk_mux_rate_ops;
 		else
-- 
2.34.1

