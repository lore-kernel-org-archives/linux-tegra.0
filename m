Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA80C433FE
	for <linux-tegra@archiver.kernel.org>; Sat, 29 Oct 2022 11:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJ2Lcb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 29 Oct 2022 07:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiJ2Lcb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 29 Oct 2022 07:32:31 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811F06AA21
        for <linux-tegra@vger.kernel.org>; Sat, 29 Oct 2022 04:32:30 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mzxyq1DX1zFq8J;
        Sat, 29 Oct 2022 19:29:39 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 19:32:28 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 19:32:28 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-tegra@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <yangyingliang@huawei.com>
Subject: [PATCH RESEND] soc/tegra: fuse: fix possible null-ptr-deref in tegra_fuse_probe()
Date:   Sat, 29 Oct 2022 19:31:21 +0800
Message-ID: <20221029113121.511888-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

platform_get_resource() may return NULL pointer, we need check its
return value to avoid null-ptr-deref while using it.

Fixes: 55a042b3f68f ("soc/tegra: fuse: Fix reading registers using DMA on Tegra20")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
The previous patch link:
https://lore.kernel.org/lkml/20220505093720.1283942-1-yangyingliang@huawei.com/
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 6542267a224d..bd2b00f2d617 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -219,12 +219,12 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 
 	/* take over the memory region from the early initialization */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	fuse->phys = res->start;
 	fuse->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(fuse->base)) {
 		err = PTR_ERR(fuse->base);
 		return err;
 	}
+	fuse->phys = res->start;
 
 	fuse->clk = devm_clk_get(&pdev->dev, "fuse");
 	if (IS_ERR(fuse->clk)) {
-- 
2.25.1

