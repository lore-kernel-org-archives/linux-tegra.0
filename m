Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A60CC32771
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Sep 2022 08:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbiIZIlh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbiIZIld (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Sep 2022 04:41:33 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D772BC1B
        for <linux-tegra@vger.kernel.org>; Mon, 26 Sep 2022 01:41:29 -0700 (PDT)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MbbjJ4WxMzWhB0;
        Mon, 26 Sep 2022 16:37:24 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 16:41:26 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 16:41:25 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <stefan@agner.ch>, <dev@lynxeye.de>, <miquel.raynal@bootlin.com>,
        <vigneshr@ti.com>
CC:     <richard@nod.at>, <linux-tegra@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
Subject: [PATCH -next] mtd: rawnand: Fix PM disable depth imbalance in tegra_nand_probe
Date:   Mon, 26 Sep 2022 16:44:56 +0800
Message-ID: <20220926084456.98160-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context.

Fixes:d7d9f8ec77fe9 ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index e12f9f580a15..a9b9031ce616 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1181,7 +1181,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	err = pm_runtime_resume_and_get(&pdev->dev);
 	if (err)
-		return err;
+		goto err_dis_pm;
 
 	err = reset_control_reset(rst);
 	if (err) {
@@ -1215,6 +1215,8 @@ static int tegra_nand_probe(struct platform_device *pdev)
 err_put_pm:
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
+err_dis_pm:
+	pm_runtime_disable(&pdev->dev);
 	return err;
 }
 
-- 
2.25.1

