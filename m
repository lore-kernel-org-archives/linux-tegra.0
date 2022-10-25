Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E310C04A95
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Oct 2022 09:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiJYJiR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Oct 2022 05:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbiJYJhs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Oct 2022 05:37:48 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02061156255;
        Tue, 25 Oct 2022 02:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhfJZ5e7kdpEYpZMAFUU/93bAJCPOC6PGoGLJlUU6Vd60c5wk74jkWMvXpOZ7eK/Ylokm0lkB85ibLCr88+MR91NIpxrOs+J4M0bTcW7Ty7xfK9Rx1N4dlv3YWxYUCxdyCtCVoHHnpVPQ0uHnxrjWwg1lcXXjdApSxrofSXlLf9R9MCs/s1e61hjcSS1I/fOwIGdFQtPFKs6v+VLe6YycW56PRPGFH1csNYEVWNDb5EY34zgECXEOOBfo2xluvBZ0o38gLUkvf6bHo7U2Fl5UYJ4iAOgMQyOLtaE++QqeB5WKNlQZjSFBf3wJmp68VnhUc4Fclm/7+N9I5Z//vS3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Adm7U0CfFgr31gW3Wc3kq0OEC3B0NpIVmIH8LihxQA=;
 b=OGk07ngXLgmjif+AIKg2nqhrV6BVwVxD0MuGo/aCdeXlobtdjFhnDRtsOUC405kKwMzXh4t5T8a+xM+glPtReO5yI0DYBleJFUEJCRx82pvNF8fzxqV8JLAELyGuVbyM993OlLZBTAvEou4CjMXxoFeYy7fGGJGB+1/KnHx1Ix9RtHlSBScqVViNJDziy+wKM82zaa1g9T6yKXhhfbGVAsO+KQDHxXL1oAORpCJXOyCMvTLJ8RaGGEC7jWK204c6wZ+S2/LCT+7XGssK+pOYYrAIOEdPS/1/nsR0OoYAxhUICrIwpcbOVdK9S60w2BH90lKgdMv1QWqmYqn9gDtWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Adm7U0CfFgr31gW3Wc3kq0OEC3B0NpIVmIH8LihxQA=;
 b=BiaXw/JHJHON34qcq51PMshJa9r/ouy/KOLE6WRBI9dEvk92TUdGtzs2G8UUL3zHV/0Naxf4GpxJRaDHeiIE2C/urPOQQqtz7JDTrScqeEl4FHvMYh3Sa/jKhWCxt/ob/c2G1OBGzCSHHhNh3n3NfKCUZIMGhbo+lQhf5AwyK8/BeGdm3tY7ZW0Jai9MbpETthyIQb1Ut5vQlNTNf1wjUDZartKZRM6DXb6rGmsPeR3AQTOlVwi4SGnDo34crtpqgrAET4aKBWsdo2y0Ld/Qlc9nhz858O6PeBEOhbDwIhSJ7H6q+BnGXsvdmS3GOLQ7QEJeT2Q2IKQiVgU+jbRlTw==
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 25 Oct
 2022 09:35:57 +0000
Received: from BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::37) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 09:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT087.mail.protection.outlook.com (10.13.177.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 09:35:56 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 25 Oct
 2022 02:35:44 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 25 Oct
 2022 02:35:44 -0700
Received: from 44189d9-lcedt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Tue, 25 Oct 2022 02:35:43 -0700
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>, <linux-tegra@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 2/2] clk: tegra: support BPMP-FW ABI deny flags
Date:   Tue, 25 Oct 2022 12:35:36 +0300
Message-ID: <20221025093536.4143397-2-pdeschrijver@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025093536.4143397-1-pdeschrijver@nvidia.com>
References: <20221025093536.4143397-1-pdeschrijver@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT087:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: e77f53f2-202e-46b2-20f2-08dab66c51b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pku7rMzlhAV9KvCSDZ548y+1XcVnzJnyTvKoKm4KexacIIvSQYpluPWDC1/V+uueSa3B4UAVXBG7L/gvgg4TZ6tWSn9Z58OAR9jaTBO7LNCmxYDydrXlUdwkhQvNtaTqiYYIjRbkOjmWzIhIjCrGJs7S1Be0PliAzczscV13M4Z8o99A2F8LwqK1QQqhBtx2JJE14+9towRwTPz+OLKjGy7CsTRnxceVlhB0CIFM7KuWX2QcZGqq9WJhLOths15iyA6ReUdWRqoumLU0ltPS7PUQ5ZSbD6y0+WSpncd3sYTkpwq6NzWw9uBTPyWh5Jh22EGZf9ugIFD0GTblB8+UGJoSEkhWfQMKbczf4K3QVnhvn3TMTx+l0YWSAgSfHz4wO/besfFU4epvoKMQ7yNPmHLoDXpDfWLJNntq7Nk0XC62WOsdy2pj7Ttj2rA4kjWhfvaOfAyOT9U9h3WfnQCwq7BjSxxTKa0Z9uPlRUh7yRV+TbQvcugWbwNSdWsGYid+eIMtQbOH6EUw0ax7DsGOw3SwppjNs3Di8Yr/9JPzigMkWMj6C6UXc3eF3fMs3a8qcX4vz14yFyrdIYWuOOqSHRv+yq1Hj3I/euifTCPZg9gfMq2re6voSOZYjbCOkm8NykFK3ZPCV7mfDswkAG62wVvEhhRr5ouAd1Rrqx4ZTNdTuTB3bmEwAzsyICeZrKnGRps44Vk8FOm+QJXRq7i7QdrCXETd7S3QV4vXPXiz7LIg7ndCG6I01SGW4FVuLmet8EX/LYS2FnEkKLVb0bG2Ew==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(107886003)(6666004)(2616005)(36756003)(110136005)(426003)(47076005)(41300700001)(70206006)(4326008)(70586007)(54906003)(8936002)(36860700001)(86362001)(40480700001)(336012)(356005)(8676002)(82310400005)(7636003)(186003)(26005)(1076003)(83380400001)(478600001)(316002)(7696005)(82740400003)(40460700003)(2906002)(450100002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 09:35:56.7863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e77f53f2-202e-46b2-20f2-08dab66c51b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support BPMP_CLK_STATE_CHANGE_DENIED by not populating state changing
operations when the flag is set.

Support BPMP_CLK_RATE_PARENT_CHANGE_DENIED by not populating rate or
parent  changing operations when the flag is set.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 37 +++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index d82a71f10c2c..c912c5f0d1eb 100644
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
+			dev_warn(bpmp->dev,
+				"clock %s does not allow state change but does allow rate/parent change",
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

