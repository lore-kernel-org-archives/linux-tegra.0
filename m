Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1907FC6FA86
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Sep 2022 09:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbiIWJm2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Sep 2022 05:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbiIWJkw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Sep 2022 05:40:52 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE92997535
        for <linux-tegra@vger.kernel.org>; Fri, 23 Sep 2022 02:40:22 -0700 (PDT)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYnB22mgdzpSvs;
        Fri, 23 Sep 2022 17:37:30 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:40:21 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 17:40:20 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <sumitg@nvidia.com>, <linux-tegra@vger.kernel.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH -next] soc/tegra: cbb: Remove redundant dev_err call
Date:   Fri, 23 Sep 2022 18:14:35 +0800
Message-ID: <20220923101435.18791-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 1ae0bd9a1ac1..1efda569d556 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -2226,10 +2226,8 @@ static int tegra194_cbb_get_bridges(struct tegra194_cbb *cbb, struct device_node
 
 			cbb->bridges[i].base = devm_ioremap_resource(cbb->base.dev,
 								     &cbb->bridges[i].res);
-			if (IS_ERR(cbb->bridges[i].base)) {
-				dev_err(cbb->base.dev, "failed to map AXI2APB range\n");
+			if (IS_ERR(cbb->bridges[i].base))
 				return PTR_ERR(cbb->bridges[i].base);
-			}
 		}
 	}
 
-- 
2.17.1

