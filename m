Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54892FA3742
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Oct 2022 12:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbiJ0MOi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbiJ0MOi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 08:14:38 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2072.outbound.protection.outlook.com [40.107.96.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D102914D26;
        Thu, 27 Oct 2022 05:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWyvGEr2Gsj6tBBIFsZZSNgMMBamYGg0r6CdW/UVQnKHeqZWgNRDRluZoPqA84NghctqiHdGJHIbDT0MKBMNjD8M0EgkSP/XWJkVolbck9MqdWkvanAonKiEwjl4yDtb3QVxHC9ZV7CxeGoc+FcBRUdx/19jXRoQ9R+IzRMqK+0r8mEHlX/B6FnfK4K2BBLttFq5r7yTzAvT1JPkScG8tPw03nuU3dmnVNpXMXOlpvAkCojh5dr+CcBpEsZm3RyIzxVEFcl8SRp8Y9jUQH9hmOHqSM7Enmp7YQKjUnu6tcf9SvbMR8mD4rKJeCEqrcBnSKIpPJ9/yvSA5qkng/7tkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqYyVbynYpK4L9BcL86nEoWSt21KvEq9rUTsO1BEUFI=;
 b=iou9aUrqJjZw5zbuNFS582HxXj95sa8Kkxd3Nhh67Ex+PERfOBiOwt0aKrNhoIApuOlJuSP7rcmmlfO8v1VZl9RdPCtlSXa4RUogUUF6qRupUMpvt8ZFcewUpfmDsEc6txf6KAC0F59SM+xtg78Sp4mmiN4hBCSaEI/q2+3aM514nbJcMA6VqSDLKM5UjOtbNvhqmmimDYHftQqNKLCJD5WayBtdzqC1kLqr7s+Wi/A4gF7M7Nkclgyg80vNuSAhbOIXO1md8o93c43aegTjfPUHAIWHcQvuFmcet2LkqeiaFtd3mFggo4TILgIzZBtcGQyYH83s/z3jP6BIAbXWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqYyVbynYpK4L9BcL86nEoWSt21KvEq9rUTsO1BEUFI=;
 b=dDMhMpPxIZD1SNSny4gd5Hz1euisd/xV+vXEdQoMtLxQEBkGthQLTepcyvo+PSA6Uax/k8XyozRgfJqBwFPzwuB0zV4EllmQ9wetJyCXYVY67xBUscxYGIlFYwZLRptXDmYQDDUJGiI0E4psDFOm0iyvW+aLI8oCpH96LJUmbA9zygzX/+762gQTYB3HRiy7jtp+hKYpXFCDstzgtuek5wizLgHz7LFgpyYBi3juHRYbf3t6eh3BYfWA5enX5QJ6WawrhYFA9pqXAgKQoHBRVGCRCvPMXsFBhqTMKioGaRHJA6DUQ9cskdMKVufxnPRVA9BrX69uuEaN7q2cUyDnHA==
Received: from BN9P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::14)
 by MN0PR12MB5857.namprd12.prod.outlook.com (2603:10b6:208:378::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 12:14:35 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::c7) by BN9P222CA0009.outlook.office365.com
 (2603:10b6:408:10c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14 via Frontend
 Transport; Thu, 27 Oct 2022 12:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 12:14:35 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 27 Oct
 2022 05:14:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 27 Oct
 2022 05:14:24 -0700
Received: from 44189d9-lcedt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 27 Oct 2022 05:14:23 -0700
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>, <linux-tegra@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v4 2/2] clk: tegra: support BPMP-FW ABI deny flags
Date:   Thu, 27 Oct 2022 15:13:55 +0300
Message-ID: <20221027121354.1481945-2-pdeschrijver@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027121354.1481945-1-pdeschrijver@nvidia.com>
References: <20221027121354.1481945-1-pdeschrijver@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|MN0PR12MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a73ca9-2feb-48e4-ec74-08dab814cfe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mPqdipg+DEmxw899gTkDTiQGMNvhRkumEab2tj1rI+rCK38bgC0VqOmNKod+2JzWFKKSvppIozzoCqvQ5tl1PRNR3/2hTC7/VG5De+EDSuu/HJMcFfqXOloc8118nq3H9HnmncOtVDFdVD0D03o67T0HXjglvM5tRPMvt/YNiWIJ2fJvWY9hsTr7jicEBrk0WrSgZXbbszyd65nXyYh5kgYxdmQntS7zG1XNAEiHDG40xbSHTrUe8rG/PVuKyc6dCwGvcOPQnowA5V2eWcjj4X53IuSBKrvu0iCr+Al1AlUm86cirJIKNzDVOx5ElUPVhqA2v8K/0XA/dd4xg7+wgjCuBhqlmMbKyFEPj0fgIUs31LuxmStFXPX7Zy1Rk9cKawmsev9ytqMxtwDAi3iyAn6yJGVDpUDXx4b3Tn/32E4+SCwWgh4g4PR/1O+A3/XYwK4vGi+GRVLHQOK2hoQ4EBrsfbIYZZJGK9QzgYs96WQudd89H/KjWC1YeU9ZJ+EJHjXbLmsbpvu5Vn9XKvOlMXpUGzHzgEPIJMW9PLDYQJI5yykUBfl972rDbXxxcZQDEiIERhHMOovBKa63UjqhoOE3FU+M28bC00XE7AVU0O//HlUczTKemf0xHc7s8jvFBNcd5Jh2vlqczmduKYOUC+7mlKgTQ0QvaED4aI25HXwmBCKZfaqe/r3GT0/+UOjoqtSDtoy0eHLu/Lqy2U0ALfCqCtFzvTWjoXzA3k1Kzgz+sam7LDrzRlbOlCNW7oQtLDolJ8ATcn3rpMnaZrQrsQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(8676002)(2906002)(70586007)(36756003)(70206006)(478600001)(5660300002)(40480700001)(8936002)(54906003)(7636003)(4326008)(356005)(110136005)(83380400001)(6666004)(82740400003)(86362001)(316002)(36860700001)(107886003)(26005)(7696005)(47076005)(426003)(1076003)(40460700003)(2616005)(336012)(186003)(450100002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 12:14:35.0680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a73ca9-2feb-48e4-ec74-08dab814cfe3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5857
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

v4: Fix typo

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 37 +++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index d82a71f10c2c..68b21ff2a737 100644
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
+				"Firmware bug! Inconsistent permission bits for clock %s. State and parent/rate changes disabled.",
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

