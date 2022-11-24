Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51F2C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Nov 2022 08:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiKXIIB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Nov 2022 03:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiKXIIA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Nov 2022 03:08:00 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB2127156
        for <linux-tegra@vger.kernel.org>; Thu, 24 Nov 2022 00:07:56 -0800 (PST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NHrFR3TbbzRnsC;
        Thu, 24 Nov 2022 16:07:23 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 16:07:54 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 24 Nov
 2022 16:07:54 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <mperttunen@nvidia.com>
CC:     <yangyingliang@huawei.com>
Subject: [PATCH resend] gpu: host1x: fix error return code in host1x_memory_context_list_init()
Date:   Thu, 24 Nov 2022 16:05:59 +0800
Message-ID: <20221124080559.3592650-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If context device has no IOMMU, the 'cdl->devs' is freed in error path,
but host1x_memory_context_list_init() doesn't return an error code, so
the module can be loaded successfully, when it's unloading, the
host1x_memory_context_list_free() is called in host1x_remove(), it will
cause double free. Return an error code to fix this.

Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
The previous patch link:
https://lore.kernel.org/lkml/20220714031123.2154506-1-yangyingliang@huawei.com/
---
 drivers/gpu/host1x/context.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index b08cf11f9a66..5cf9b98bedd0 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -74,6 +74,7 @@ int host1x_memory_context_list_init(struct host1x *host1x)
 		if (!fwspec || !device_iommu_mapped(&ctx->dev)) {
 			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
 			device_del(&ctx->dev);
+			err = -EOPNOTSUPP;
 			goto del_devices;
 		}
 
-- 
2.25.1

