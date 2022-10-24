Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D21FA3741
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Oct 2022 14:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234333AbiJXOGR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237321AbiJXOFX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Oct 2022 10:05:23 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::60a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EF22AC46;
        Mon, 24 Oct 2022 05:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdGDcEJu8EMI0YmGsqztcdU26HDgOGpM1T6c4GpFqGH2iZyaXLtrPKnRVfcnurDgJVjFkFzdfG13s5GeP+DU37m9k32zqBn1cb4zqe2D3thb1fJP5h+XT6b5gCScR3rSddh1OgIDrSspArLawCH+4VdUhWOCjjeH/8y0t+EM84iyVWzs+E/AQZbub9YwnqpfvxNrh4mlm0r5rECi+V8IyT9zvDmTL/AMoEb3LJc8G1718aZ3m71A0OUZvDfLz2Rt6uU3qbTWkcEe5NTJ81aJq7ss1WRs1rLZK9FhZbAI1fAt7ovrdfqJqqEYyZtLB4ar9smt4AkPoGDAt5TlWlrObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhupAtKDrSb2FxWyZQnjTUcjmfwInl9dPwJvJ+ag1x4=;
 b=Zlg5VudUz/tdm8qOhfG8NpKgnBlp90W+DKCmxS2IFGvutDdO1Pvj1cKz8i8l5odqgNfXhb2OcwTUSqzWwpfXrCmncPBHlLY55L/VjkxDVtDPY4FMPY3bskyM2pQEYMMJGxz6EVLfCzpchw+M1AbZpL6lH6A1upOM5r9uUuxiFmXz3Ui4DyRz011hDGVfD3fnjdwlza3sLh5Z6OPei7E/T4W6BncbL0gpYYkdCzlNYI9wxnYAztJe6dep63+9eTmP7vVQo5S6zyANhghaxOw50NPofMYv9PWue32l3ag4gCMgtaM1ZUHOtPJFcIvpWCXjJuUZrpkaax4fGf2a8J6Qig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhupAtKDrSb2FxWyZQnjTUcjmfwInl9dPwJvJ+ag1x4=;
 b=gp4qW/a9Pvp4PzArYmWVnIrYMuahaqker08KCC1O2XFE41Q5pSz7EdEMpJ5Ppok/F9dEAojSKzjyqqDV+AshGTsV2xUHRylDFbV6cupdpXq4S+365F5131oWYX4IoWOUdyz3Dz9OhM32wg+k3C6bXuVv5W2976+DsmeOWDKbMM83PPF15g57sUKvAEk8TpOtHhFgc7h3FA4hQugEPcvTzQGbPejQsw7d1//C5zoQP+4IkvoiqpdFLDjfO5rtvZrZnmOda8NhX4AW4mXeeshjtuCk6cu76CMcpekqj8onyEqYfnX6C1rK+lwbC7MoIJ7x7/YrauctgzE4xlLXzCXCRQ==
Received: from MW4PR04CA0381.namprd04.prod.outlook.com (2603:10b6:303:81::26)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Mon, 24 Oct
 2022 12:14:56 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::97) by MW4PR04CA0381.outlook.office365.com
 (2603:10b6:303:81::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Mon, 24 Oct 2022 12:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 12:14:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 05:14:48 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 24 Oct
 2022 05:14:48 -0700
Received: from 44189d9-lcedt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Mon, 24 Oct 2022 05:14:47 -0700
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>, <linux-tegra@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 2/2] clk: tegra: support BPMP-FW ABI deny flags
Date:   Mon, 24 Oct 2022 15:14:39 +0300
Message-ID: <20221024121439.3381239-2-pdeschrijver@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024121439.3381239-1-pdeschrijver@nvidia.com>
References: <20221024121439.3381239-1-pdeschrijver@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: c123a05d-ea51-4d6d-d4f3-08dab5b95d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQcJuUik0sIdbMD7vtIKwqFKI7tQGj6Xo7dTESoLSO/KSk+9NtTlRB6zBkywQNCSiBfb+CT/HuOitGWunmpLCH+9e4SVVxWH03RQMiNa+ZWK7di7jhvbYk2dFmTQAqRRVPe/KS3qigdinfncH8HoBQ7Ya24vWlbi0QSWCT8HBGHo91Ekq5BW14NLZe8L/w7zlmMRz4CJiS3GPHsPCDd/ye7QdgFZ22BlKVwfWWF/PEDm6O9XOmVwTL7xROo4XkJm3RW0GZfrAiFxm5bAybkSZfgcZMbkjJs5QEMFR026uN3QkKsfOhUTtUPvttZ1fTtqonsXvZdbFGB8UO5oTGXmLpkyYYXQyy5Aamx03GzUFZLTrbzsOsuvfkUV2XGaYUJ9hnk4OFw+l9i9K2RN1h/ePPx2i9PvMqU67J6wa3SN1BBPUGEWnEfgYX0uS+9l3sLgUHDd0sWB82eoZbLLdF1vfK0S6hKXzuanLdwTJU8/AHYo1yxPG57Ii9ynDZ1blO5XJnM5fww4mkHyB7r1qMMndnq+bsyJfGRDdsYX/k7EdBG6CW/g2AU4mlzsj/zcIc70+V7sXK+xRR+GXaoTPSY3T/eHYF6+VtL0Z4gjXakFsLM0964Y8AOfcGUULckJTSq0Vo0HjjrhmSQ6lqhmGcW6YAkKfEWY2b0SLMad1xLm0UXyGSD4TKQMmbI4E6c2Ky9qoXLYeCZEaB4J/8u+t08HFW63EF732wrDW2FbunkKTBqFMWlMrV+XjZCSdZG9iEOBLKEKkZorydWdCx5LXYOyBA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(426003)(450100002)(82740400003)(47076005)(83380400001)(7636003)(356005)(40460700003)(36860700001)(82310400005)(86362001)(40480700001)(6666004)(107886003)(54906003)(110136005)(316002)(5660300002)(336012)(186003)(2616005)(8936002)(2906002)(70206006)(70586007)(1076003)(7696005)(26005)(478600001)(8676002)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 12:14:56.0829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c123a05d-ea51-4d6d-d4f3-08dab5b95d17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support BPMP_CLK_STATE_CHANGE_DENIED by not populating state changing
operations when the flag is set.

Support BPMP_CLK_RATE_PARENT_CHANGE_DENIED by not populating rate or
parent  changing operations when the flag is set.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index d82a71f10c2c..de98416271ea 100644
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
@@ -510,8 +527,19 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 	memset(&init, 0, sizeof(init));
 	init.name = info->name;
 	clk->hw.init = &init;
-
-	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
+	if (info->flags & BPMP_CLK_STATE_CHANGE_DENIED) {
+		dev_warn(bpmp->dev,
+			(info->flags & BPMP_CLK_RATE_PARENT_CHANGE_DENIED) == 0);
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

