Return-Path: <SRS0=KyIL=EG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31076C388F7
	for <linux-tegra@archiver.kernel.org>; Sat, 31 Oct 2020 10:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE52622202
	for <linux-tegra@archiver.kernel.org>; Sat, 31 Oct 2020 10:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgJaKuK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 31 Oct 2020 06:50:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6717 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgJaKuK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 31 Oct 2020 06:50:10 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CNbYB1KMSzkcrd;
        Sat, 31 Oct 2020 18:50:06 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Sat, 31 Oct 2020
 18:49:58 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <krzk@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <tomeu.vizoso@collabora.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] memory: tegra: add missing put_devcie() call in tegra_emc_probe()
Date:   Sat, 31 Oct 2020 18:53:55 +0800
Message-ID: <20201031105355.2303794-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

if of_find_device_by_node() succeed, tegra_emc_probe() doesn't have a
corresponding put_device(). Thus add jump target to fix the exception
handling for this function implementation.

Fixes: 73a7f0a90641("memory: tegra: Add EMC (external memory controller) driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/memory/tegra/tegra124-emc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 76ace42a688a..831dfca0804c 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1207,8 +1207,10 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return -ENOENT;
 
 	emc->mc = platform_get_drvdata(mc);
-	if (!emc->mc)
-		return -EPROBE_DEFER;
+	if (!emc->mc) {
+		err = -EPROBE_DEFER;
+		goto put_device;
+	}
 
 	ram_code = tegra_read_ram_code();
 
@@ -1217,25 +1219,27 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"no memory timings for RAM code %u found in DT\n",
 			ram_code);
-		return -ENOENT;
+		err = -ENOENT;
+		goto put_device;
 	}
 
 	err = tegra_emc_load_timings_from_dt(emc, np);
 	of_node_put(np);
 	if (err)
-		return err;
+		goto put_device;
 
 	if (emc->num_timings == 0) {
 		dev_err(&pdev->dev,
 			"no memory timings for RAM code %u registered\n",
 			ram_code);
-		return -ENOENT;
+		err = -ENOENT;
+		goto put_device;
 	}
 
 	err = emc_init(emc);
 	if (err) {
 		dev_err(&pdev->dev, "EMC initialization failed: %d\n", err);
-		return err;
+		goto put_device;
 	}
 
 	platform_set_drvdata(pdev, emc);
@@ -1244,6 +1248,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		emc_debugfs_init(&pdev->dev, emc);
 
 	return 0;
+put_device:
+	put_device(&mc->dev);
+	return err;
 };
 
 static struct platform_driver tegra_emc_driver = {
-- 
2.25.4

