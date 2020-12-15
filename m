Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DBAC4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 07:01:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2712622286
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 07:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgLOHBg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 02:01:36 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9888 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgLOHBb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 02:01:31 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cw8K52BmKz7Ghc;
        Tue, 15 Dec 2020 15:00:09 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 15:00:43 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <thierry.reding@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <jonathanh@nvidia.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Tue, 15 Dec 2020 15:00:53 +0800
Message-ID: <1608015653-37527-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes coccicheck warning:
drivers/gpu/drm/tegra/drm.c:350:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/tegra/drm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 19ffb06..245b468 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -347,10 +347,7 @@ static int tegra_gem_create(struct drm_device *drm, void *data,
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
 					 &args->handle);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(bo);
 }
 
 static int tegra_gem_mmap(struct drm_device *drm, void *data,
-- 
2.7.4

