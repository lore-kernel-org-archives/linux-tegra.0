Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3939C4332F
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Nov 2022 07:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiKZHfO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Nov 2022 02:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiKZHfN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Nov 2022 02:35:13 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8172BB23
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 23:35:11 -0800 (PST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NK3Qf6DGfzmW2y;
        Sat, 26 Nov 2022 15:34:34 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 15:35:10 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 26 Nov
 2022 15:35:09 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <mperttunen@nvidia.com>,
        <cyndis@kapsi.fi>
CC:     <yangyingliang@huawei.com>
Subject: [PATCH v2 resend 1/2] gpu: host1x: fix potential double free if IOMMU is disabled
Date:   Sat, 26 Nov 2022 15:33:14 +0800
Message-ID: <20221126073315.365567-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221126073315.365567-1-yangyingliang@huawei.com>
References: <20221126073315.365567-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If context device has no IOMMU, the 'cdl->devs' is freed in
error path, but host1x_memory_context_list_init() doesn't
return an error code, so the module can be loaded successfully,
when it's unloading, the host1x_memory_context_list_free() is
called in host1x_remove(), it will cause double free. Set the
'cdl->devs' to NULL after freeing it to avoid double free.

Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/host1x/context.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index b08cf11f9a66..291f34562e2e 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -87,6 +87,7 @@ int host1x_memory_context_list_init(struct host1x *host1x)
 		device_del(&cdl->devs[i].dev);
 
 	kfree(cdl->devs);
+	cdl->devs = NULL;
 	cdl->len = 0;
 
 	return err;
-- 
2.25.1

