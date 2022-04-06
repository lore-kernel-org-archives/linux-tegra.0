Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CEEC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Apr 2022 17:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238459AbiDFRUM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Apr 2022 13:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238768AbiDFRUD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Apr 2022 13:20:03 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2079.outbound.protection.outlook.com [40.107.96.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA2A4882DC;
        Wed,  6 Apr 2022 08:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPRfY7tyUuFs7sSeqUWSyUlEsq+1bAGc5mGdWiTnBrfoRxkAP/Zo7T8zBVfki19kj3uuhCFyUn8Nv0OMY5A0SSF7hTxKCGEucGl8Sg56Gx/yse2QlCIV1hexNAOukmg5bcXUUyqDMH2TZys7A8ZLNx0ypLo5vDXCKKy1v2aQTkzQYJhRe79XA46l4CHUkymJnosw1nn2N1U0UXYHDUvQ55H8RrdrD4TFH3N62VkQ7z4sr1ao1s/b54iESovoW340Hk1vvjgQvDvVL1NBnj6KcXoBzUOilcGtWXkKhUq0B8QXZcrmtyaSxODcsKUVMhSSq2sUdDNRJj+r2ju1z+dFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rDetAeciMhROcRyHawzT9aK2XpubFP+V9F0our3jak=;
 b=JxjiN7l724ny8YXjMLAzSe1Yd6I2+TPe5tCFkxoB6Ao1WtFKd3QGTHImpv0bOMtJsvdeHjMlQ5kfN7vXKloZGb5pkxhabaJ/WvUB+Rr8lrl0i3ZJzivXibyNfqRB3UvZNzzcdDHwHbprYfjZvOxiYFfDKP82nPgOurqKrOAAwLLc7IKxRVlk/j6J7+UiKnEqqmeIO+L+MGulPQyLku3RHtM2fHK+6V4les36NeIXW+mYK4nRqEeOlR+N3x2xvUjyMuALhLgfbkUVchGL+kyqTZRJdyhNGEp5br39nSNr051cnoOa8eZG/sU49t2O76jH+DwLA9452JaFIpjmtQ04Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rDetAeciMhROcRyHawzT9aK2XpubFP+V9F0our3jak=;
 b=icTMgYU5CveDmoL37yM2Cy0FnToNQF/LJT4nk85bbIfi26HN+V/sx0tortxsR0rE8EeabKLHKLOoHJH7UXlG9zYZQMs5Dxn5ZiKVK2SigHws+mTMjpcISnFHiNw+9KtJc0VZNRC1NpigfvdEXg8WLUwyzWc3s0clJs/nKRhXsP8e51JcdTcgzouNbdmwS5piqkFUTItmDOmCm1XpzD4wgW9ioGn8ocHV4RnHzgIM2q/x/viLk2e1FtwvqVD+MBUSp33+QqXOHJOuz8hZNmdsZfepJZN41GW2chSu9jM2dlaqZeU+GtdrJK220q9QLRBsvYs+LdCNijK8ps+Bf0+ssA==
Received: from DM6PR08CA0040.namprd08.prod.outlook.com (2603:10b6:5:1e0::14)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 15:17:17 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::fd) by DM6PR08CA0040.outlook.office365.com
 (2603:10b6:5:1e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Wed, 6 Apr 2022 15:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5144.20 via Frontend Transport; Wed, 6 Apr 2022 15:17:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 6 Apr
 2022 15:17:16 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Apr 2022
 08:17:15 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Wed, 6 Apr 2022 08:17:14 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Timo Alho <talho@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] clk: tegra: register clocks from root to leaf
Date:   Wed, 6 Apr 2022 16:17:00 +0100
Message-ID: <20220406151701.262056-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 234cff5e-0043-42a0-8cc6-08da17e089ca
X-MS-TrafficTypeDiagnostic: CH2PR12MB4149:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4149907868F0339EBE86EAA6D9E79@CH2PR12MB4149.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JqykxryV/GkK+NA82cMra0wszPQAt0zXbRYDWG2u55thoJDLojCfFNhYliLMihHfdOSMAV5faFEEBgaNoRY53BvHvdQVr5xPGOieY6ORo7s4rCkqMwN9y7F8TmCjNvVJaFBiiDMIuDW3pdjL6KmXaXxGqRJro2gRrTl+AdrywLYfamULeOsFFN3+qU742CdHdc11rScVV+9/mCUeieeYdu4mg1gCfFMF2Q/D7gpTNT7aMrpAD7ArUXaTbZhzn2rdMWwDuB970JrbOkmMtZkGgD5mH6C3F358QQrYhQ4neHog3S1qPeke7Zrjz48vvDZ+4o/JOv99gmJbwqlyd3C4w7f/3MdIPyoCI+swE/9BZZSsVWuYr3V9KgsiF3EfDnTEw7qKB/VERdubMZ2r8awAyyCYOYF6dbuoK4gHD5VuuOJYe72GSBY2HkyqQDxTpo7nzw8Kvg/SIn8OUPZXYDdTj3C8yHj2r2Yk+gOuHsiJGF/C0cLO+ldHeAw5wuiIolnI3qq2F42430HrMSjQwALGvlZA/+pjwuYd4Kokz4JsurQCFqH1eiNbOAkAjSbXM4fcyDmZZTdL+HzTS8e+agomGjelhbxd1T07iwXCzo5i3wSsb2ID3lPEhzJsiVgcf4qFMg8Dz1EjB7lDShqwbskN5NJOMTQWoh8/UqhKKQ/a5z6s1FDBDNZjwHPahxY7Pfm3NaCVRcJhvR33PyWRAsuQVg==
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82310400005)(110136005)(40460700003)(316002)(508600001)(8936002)(36756003)(6666004)(54906003)(7696005)(5660300002)(81166007)(2906002)(356005)(70206006)(107886003)(47076005)(36860700001)(70586007)(83380400001)(86362001)(186003)(26005)(2616005)(426003)(336012)(8676002)(4326008)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:17:17.6962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 234cff5e-0043-42a0-8cc6-08da17e089ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Timo Alho <talho@nvidia.com>

Current clock initialization causes intermediate registering of orphan
clocks (i.e. a clock without a parent registered). CCF keeps track of
orphan clocks and any time a new clock is registered, it will loop
through the list of orphan and queries if the parent is now
available. This operation triggers a clk operation(s), which is an IPC
with BPMP-FW. Hence, due to the order of which the clock appear
currently, this causes >5000 IPC messages to be sent to BPMP-FW during
clock initialization.

Optimize the clock probing by registering clocks hierarchically from
root clock towards leafs.

Signed-off-by: Timo Alho <talho@nvidia.com>
[ Checkpatch warnings fixed by Jon Hunter <jonathanh@nvidia.com> ]
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 72 ++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 6ecf18f71c32..bacaa468e114 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -448,15 +448,29 @@ static int tegra_bpmp_probe_clocks(struct tegra_bpmp *bpmp,
 	return count;
 }
 
+static unsigned int
+tegra_bpmp_clk_id_to_index(const struct tegra_bpmp_clk_info *clocks,
+			   unsigned int num_clocks, unsigned int id)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_clocks; i++)
+		if (clocks[i].id == id)
+			return i;
+
+	return UINT_MAX;
+}
+
 static const struct tegra_bpmp_clk_info *
 tegra_bpmp_clk_find(const struct tegra_bpmp_clk_info *clocks,
 		    unsigned int num_clocks, unsigned int id)
 {
 	unsigned int i;
 
-	for (i = 0; i < num_clocks; i++)
-		if (clocks[i].id == id)
-			return &clocks[i];
+	i = tegra_bpmp_clk_id_to_index(clocks, num_clocks, id);
+
+	if (i < num_clocks)
+		return &clocks[i];
 
 	return NULL;
 }
@@ -539,31 +553,57 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 	return clk;
 }
 
+static void tegra_bpmp_register_clocks_one(struct tegra_bpmp *bpmp,
+					   struct tegra_bpmp_clk_info *infos,
+					   unsigned int i,
+					   unsigned int count)
+{
+	unsigned int j;
+	struct tegra_bpmp_clk_info *info;
+	struct tegra_bpmp_clk *clk;
+
+	if (bpmp->clocks[i]) {
+		/* already registered */
+		return;
+	}
+
+	info = &infos[i];
+	for (j = 0; j < info->num_parents; ++j) {
+		unsigned int p_id = info->parents[j];
+		unsigned int p_i = tegra_bpmp_clk_id_to_index(infos, count,
+							      p_id);
+		if (p_i < count)
+			tegra_bpmp_register_clocks_one(bpmp, infos, p_i, count);
+	}
+
+	clk = tegra_bpmp_clk_register(bpmp, info, infos, count);
+	if (IS_ERR(clk)) {
+		dev_err(bpmp->dev,
+			"failed to register clock %u (%s): %ld\n",
+			info->id, info->name, PTR_ERR(clk));
+		/* intentionally store the error pointer to
+		 * bpmp->clocks[i] to avoid re-attempting the
+		 * registration later
+		 */
+	}
+
+	bpmp->clocks[i] = clk;
+}
+
 static int tegra_bpmp_register_clocks(struct tegra_bpmp *bpmp,
 				      struct tegra_bpmp_clk_info *infos,
 				      unsigned int count)
 {
-	struct tegra_bpmp_clk *clk;
 	unsigned int i;
 
 	bpmp->num_clocks = count;
 
-	bpmp->clocks = devm_kcalloc(bpmp->dev, count, sizeof(clk), GFP_KERNEL);
+	bpmp->clocks = devm_kcalloc(bpmp->dev, count, sizeof(struct tegra_bpmp_clk), GFP_KERNEL);
 	if (!bpmp->clocks)
 		return -ENOMEM;
 
 	for (i = 0; i < count; i++) {
-		struct tegra_bpmp_clk_info *info = &infos[i];
-
-		clk = tegra_bpmp_clk_register(bpmp, info, infos, count);
-		if (IS_ERR(clk)) {
-			dev_err(bpmp->dev,
-				"failed to register clock %u (%s): %ld\n",
-				info->id, info->name, PTR_ERR(clk));
-			continue;
-		}
-
-		bpmp->clocks[i] = clk;
+		tegra_bpmp_register_clocks_one(bpmp, infos, i, count);
 	}
 
 	return 0;
-- 
2.25.1

