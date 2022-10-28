Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28A9C38A02
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 13:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiJ1NEP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 09:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiJ1NEN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 09:04:13 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D221CEC09
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 06:04:11 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MzN0f2Gj4z15MFJ;
        Fri, 28 Oct 2022 20:59:14 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 21:04:09 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 21:04:09 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <mperttunen@nvidia.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH RESEND] gpu: host1x: fix memory leak of device names
Date:   Fri, 28 Oct 2022 21:03:00 +0800
Message-ID: <20221028130300.1133520-1-yangyingliang@huawei.com>
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

The device names allocated by dev_set_name() need be freed
before module unloading, but they can not be freed because
the kobject's refcount which was set in device_initialize()
has not be decreased to 0.

Fix the name leak by calling put_device() to give up the refcount,
so the name can be freed in kobejct_cleanup().

Add a release() function to device, it's empty, because the
context devices are freed together in host1x_memory_context_list_free().

Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
The fix tag is in mainline not next, so resend it
for removing -next in title.
---
 drivers/gpu/host1x/context.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index b08cf11f9a66..f49a7bf6afa5 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -13,6 +13,11 @@
 #include "context.h"
 #include "dev.h"
 
+static void host1x_memory_context_release(struct device *dev)
+{
+	/* context device is freed in host1x_memory_context_list_free() */
+}
+
 int host1x_memory_context_list_init(struct host1x *host1x)
 {
 	struct host1x_memory_context_list *cdl = &host1x->context_list;
@@ -53,28 +58,27 @@ int host1x_memory_context_list_init(struct host1x *host1x)
 		dev_set_name(&ctx->dev, "host1x-ctx.%d", i);
 		ctx->dev.bus = &host1x_context_device_bus_type;
 		ctx->dev.parent = host1x->dev;
+		ctx->dev.release = host1x_memory_context_release;
 
 		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
 
 		err = device_add(&ctx->dev);
 		if (err) {
 			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
-			goto del_devices;
+			goto put_dev;
 		}
 
 		err = of_dma_configure_id(&ctx->dev, node, true, &i);
 		if (err) {
 			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
 				i, err);
-			device_del(&ctx->dev);
-			goto del_devices;
+			goto unreg_devices;
 		}
 
 		fwspec = dev_iommu_fwspec_get(&ctx->dev);
 		if (!fwspec || !device_iommu_mapped(&ctx->dev)) {
 			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
-			device_del(&ctx->dev);
-			goto del_devices;
+			goto unreg_devices;
 		}
 
 		ctx->stream_id = fwspec->ids[0] & 0xffff;
@@ -82,9 +86,12 @@ int host1x_memory_context_list_init(struct host1x *host1x)
 
 	return 0;
 
-del_devices:
-	while (i--)
-		device_del(&cdl->devs[i].dev);
+put_dev:
+	put_device(&cdl->devs[i--].dev);
+
+unreg_devices:
+	while (i >= 0)
+		device_unregister(&cdl->devs[i--].dev);
 
 	kfree(cdl->devs);
 	cdl->len = 0;
@@ -97,7 +104,7 @@ void host1x_memory_context_list_free(struct host1x_memory_context_list *cdl)
 	unsigned int i;
 
 	for (i = 0; i < cdl->len; i++)
-		device_del(&cdl->devs[i].dev);
+		device_unregister(&cdl->devs[i].dev);
 
 	kfree(cdl->devs);
 	cdl->len = 0;
-- 
2.25.1

