Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C62CC4167B
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Dec 2022 09:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiLIJoC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Dec 2022 04:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiLIJoB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Dec 2022 04:44:01 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5B45E9FE;
        Fri,  9 Dec 2022 01:44:00 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NT5fy3nqtzmWYq;
        Fri,  9 Dec 2022 17:43:06 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 9 Dec
 2022 17:43:54 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mperttunen@nvidia.com>, <tomeu.vizoso@collabora.com>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak
Date:   Fri, 9 Dec 2022 09:41:24 +0000
Message-ID: <20221209094124.71043-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra and tegra needs to be freed in the error handling path, otherwise
it will be leaked.

Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 219c80653dbd..2a6db0434281 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -464,6 +464,7 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 		err = load_one_timing_from_dt(tegra, timing, child);
 		if (err) {
 			of_node_put(child);
+			kfree(tegra->timings);
 			return err;
 		}
 
@@ -515,6 +516,7 @@ struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np
 		err = load_timings_from_dt(tegra, node, node_ram_code);
 		if (err) {
 			of_node_put(node);
+			kfree(tegra);
 			return ERR_PTR(err);
 		}
 	}
-- 
2.17.1

