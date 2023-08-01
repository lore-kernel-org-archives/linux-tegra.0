Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458F3C001E0
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Aug 2023 14:01:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjHAOBw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Aug 2023 10:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbjHAOBt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Aug 2023 10:01:49 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D71E5F
        for <linux-tegra@vger.kernel.org>; Tue,  1 Aug 2023 07:01:48 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFcBz1CP4zNmLw;
        Tue,  1 Aug 2023 21:58:19 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 22:01:44 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <dipenp@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <timestamp@lists.linux.dev>,
        <linux-tegra@vger.kernel.org>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next] hte: tegra-194: remove redundant dev_err_probe()
Date:   Tue, 1 Aug 2023 22:01:14 +0800
Message-ID: <20230801140114.257740-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When platform_get_irq() is called, the error message has been printed,
so it need not to call dev_err_probe() to print error, we remove the
redundant platform_get_irq().

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/hte/hte-tegra194.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 06ef349a2265..01f416c881e6 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -730,7 +730,6 @@ static int tegra_hte_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to get irq\n");
 		return ret;
 	}
 	hte_dev->hte_irq = ret;
-- 
2.17.1

