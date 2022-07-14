Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187F4C43334
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jul 2022 03:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbiGNDCR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jul 2022 23:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbiGNDCQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jul 2022 23:02:16 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06FB252A9;
        Wed, 13 Jul 2022 20:02:11 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LjzhM0L1vzVfmS;
        Thu, 14 Jul 2022 10:58:27 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 14 Jul 2022 11:02:06 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 14 Jul
 2022 11:02:05 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <thierry.reding@gmail.com>, <mperttunen@nvidia.com>
Subject: [PATCH -next] gpu: host1x: fix error return code in host1x_memory_context_list_init()
Date:   Thu, 14 Jul 2022 11:11:23 +0800
Message-ID: <20220714031123.2154506-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
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

