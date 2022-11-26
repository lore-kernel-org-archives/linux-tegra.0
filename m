Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98EDC3A59F
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Nov 2022 07:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiKZHfP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Nov 2022 02:35:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiKZHfO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Nov 2022 02:35:14 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00922CCAF
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 23:35:12 -0800 (PST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NK3Qh0MBlz15MtS;
        Sat, 26 Nov 2022 15:34:36 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 15:35:10 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 26 Nov
 2022 15:35:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <mperttunen@nvidia.com>,
        <cyndis@kapsi.fi>
CC:     <yangyingliang@huawei.com>
Subject: [PATCH v2 resend 2/2] gpu: host1x: fix memory leak of device names
Date:   Sat, 26 Nov 2022 15:33:15 +0800
Message-ID: <20221126073315.365567-3-yangyingliang@huawei.com>
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

The device names allocated by dev_set_name() need be freed
before module unloading, but they can not be freed because
the kobject's refcount which was set in device_initialize()
has not be decreased to 0.

As comment of device_add() says, if it fails, use only
put_device() drop the refcount, then the name will be
freed in kobejct_cleanup().

device_del() and put_device() can be replaced with
device_unregister(), so call it to unregister the added
successfully devices, and just call put_device() to the
not added device.

Add a release() function to device to avoid null release()
function WARNING in device_release(), it's empty, because
the context devices are freed together in
host1x_memory_context_list_free().

Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/host1x/context.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index 291f34562e2e..047696432eb2 100644
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
@@ -53,28 +58,30 @@ int host1x_memory_context_list_init(struct host1x *host1x)
 		dev_set_name(&ctx->dev, "host1x-ctx.%d", i);
 		ctx->dev.bus = &host1x_context_device_bus_type;
 		ctx->dev.parent = host1x->dev;
+		ctx->dev.release = host1x_memory_context_release;
 
 		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
 
 		err = device_add(&ctx->dev);
 		if (err) {
 			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
-			goto del_devices;
+			put_device(&ctx->dev);
+			goto unreg_devices;
 		}
 
 		err = of_dma_configure_id(&ctx->dev, node, true, &i);
 		if (err) {
 			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
 				i, err);
-			device_del(&ctx->dev);
-			goto del_devices;
+			device_unregister(&ctx->dev);
+			goto unreg_devices;
 		}
 
 		fwspec = dev_iommu_fwspec_get(&ctx->dev);
 		if (!fwspec || !device_iommu_mapped(&ctx->dev)) {
 			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
-			device_del(&ctx->dev);
-			goto del_devices;
+			device_unregister(&ctx->dev);
+			goto unreg_devices;
 		}
 
 		ctx->stream_id = fwspec->ids[0] & 0xffff;
@@ -82,9 +89,9 @@ int host1x_memory_context_list_init(struct host1x *host1x)
 
 	return 0;
 
-del_devices:
+unreg_devices:
 	while (i--)
-		device_del(&cdl->devs[i].dev);
+		device_unregister(&cdl->devs[i].dev);
 
 	kfree(cdl->devs);
 	cdl->devs = NULL;
@@ -98,7 +105,7 @@ void host1x_memory_context_list_free(struct host1x_memory_context_list *cdl)
 	unsigned int i;
 
 	for (i = 0; i < cdl->len; i++)
-		device_del(&cdl->devs[i].dev);
+		device_unregister(&cdl->devs[i].dev);
 
 	kfree(cdl->devs);
 	cdl->len = 0;
-- 
2.25.1

