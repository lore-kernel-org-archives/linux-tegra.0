Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E92DC48BE5
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 08:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F619613D5
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 08:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhFQIaQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 04:30:16 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:7463 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbhFQIaP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 04:30:15 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5FVC6sbNzZjCR;
        Thu, 17 Jun 2021 16:25:07 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 16:28:03 +0800
Received: from thunder-town.china.huawei.com (10.174.179.0) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 16:28:03 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] clk: tegra: tegra124-emc: Fix possible memory leak
Date:   Thu, 17 Jun 2021 16:27:59 +0800
Message-ID: <20210617082759.1008-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When krealloc() fails to expand the memory and returns NULL, the original
memory is not released. In this case, the original "timings" scale should
be maintained.

Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 74c1d894cca8..1a329202b543 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -450,11 +450,12 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 
 	size = (tegra->num_timings + child_count) * sizeof(struct emc_timing);
 
-	tegra->timings = krealloc(tegra->timings, size, GFP_KERNEL);
-	if (!tegra->timings)
+	timings_ptr = krealloc(tegra->timings, size, GFP_KERNEL);
+	if (!timings_ptr)
 		return -ENOMEM;
 
-	timings_ptr = tegra->timings + tegra->num_timings;
+	tegra->timings = timings_ptr;
+	timings_ptr += tegra->num_timings;
 	tegra->num_timings += child_count;
 
 	for_each_child_of_node(node, child) {
-- 
2.25.1


