Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D432DC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Nov 2022 10:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiKYK1D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Nov 2022 05:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiKYK1C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Nov 2022 05:27:02 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6568F429A3
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 02:27:00 -0800 (PST)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJWCT2MYyzbnhY;
        Fri, 25 Nov 2022 18:23:01 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemi500024.china.huawei.com
 (7.221.188.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 25 Nov
 2022 18:26:57 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <jonathanh@nvidia.com>, <daniel@ffwll.ch>,
        <thierry.reding@gmail.com>, <airlied@gmail.com>,
        <mperttunen@nvidia.com>
CC:     <dri-devel@lists.freedesktop.org>, <zengheng4@huawei.com>,
        <linux-tegra@vger.kernel.org>, <liwei391@huawei.com>
Subject: [PATCH] drm/tegra: Add check for dma_alloc_coherent()
Date:   Fri, 25 Nov 2022 18:25:04 +0800
Message-ID: <20221125102504.3063623-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Since the dma_alloc_coherent() may return NULL,
the pointer returned needs to be checked to avoid
null-poineter dereference.

Fixes: 46f226c93d35 ("drm/tegra: Add NVDEC driver")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 276fe0472730..4f667fb502d8 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -216,6 +216,8 @@ static int nvdec_load_firmware(struct nvdec *nvdec)
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
 	}
+	if (IS_ERR_OR_NULL(virt))
+		return -ENOMEM;
 
 	nvdec->falcon.firmware.virt = virt;
 	nvdec->falcon.firmware.iova = iova;
-- 
2.25.1

