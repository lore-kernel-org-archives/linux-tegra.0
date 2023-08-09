Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29033C001DB
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Aug 2023 03:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjHIDFT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Aug 2023 23:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjHIDFT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Aug 2023 23:05:19 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0451F1995
        for <linux-tegra@vger.kernel.org>; Tue,  8 Aug 2023 20:05:17 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLFDq6SP3zNnN3;
        Wed,  9 Aug 2023 11:00:59 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 11:04:28 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <thierry.reding@gmail.com>, <mperttunen@nvidia.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <jonathanh@nvidia.com>,
        <tzimmermann@suse.de>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/tegra: Remove two unused function declarations
Date:   Wed, 9 Aug 2023 11:02:26 +0800
Message-ID: <20230809030226.3412-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 776dc3840367 ("drm/tegra: Move subdevice infrastructure to host1x")
removed the implementation but not the declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/tegra/drm.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index f9d18e8cf6ab..ccb5d74fa227 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -120,9 +120,6 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 int host1x_client_iommu_attach(struct host1x_client *client);
 void host1x_client_iommu_detach(struct host1x_client *client);
 
-int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
-int tegra_drm_exit(struct tegra_drm *tegra);
-
 void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size, dma_addr_t *iova);
 void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
 		    dma_addr_t iova);
-- 
2.34.1

