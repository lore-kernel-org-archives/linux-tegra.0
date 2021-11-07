Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2EDC433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Nov 2021 21:16:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3963361284
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Nov 2021 21:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhKGVTN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 7 Nov 2021 16:19:13 -0500
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:61398 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbhKGVTN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Nov 2021 16:19:13 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id jpWdmO5RwwQZfjpWdmDtkZ; Sun, 07 Nov 2021 22:16:28 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 07 Nov 2021 22:16:28 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] gpu: host1x: Fix an error handling path in 'host1x_probe()'
Date:   Sun,  7 Nov 2021 22:16:25 +0100
Message-Id: <05c1932b66048ebf6742705e2ab16eea852c46d9.1636319710.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the missing 'host1x_bo_cache_destroy()' call in the error handling
path of the probe, as already done in the remove function.

In order to simplify the error handling, move the 'host1x_bo_cache_init()'
call after all the devm_ function.

Fixes: e3166698a8a0 ("drm/tegra: Implement buffer object cache")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Untested.
I hope that moving host1x_bo_cache_init() is just fine.
---
 drivers/gpu/host1x/dev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3d4cabdbc78d..fa00e31ea2f9 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -404,7 +404,6 @@ static int host1x_probe(struct platform_device *pdev)
 	if (syncpt_irq < 0)
 		return syncpt_irq;
 
-	host1x_bo_cache_init(&host->cache);
 	mutex_init(&host->devices_lock);
 	INIT_LIST_HEAD(&host->devices);
 	INIT_LIST_HEAD(&host->list);
@@ -449,10 +448,12 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	host1x_bo_cache_init(&host->cache);
+
 	err = host1x_iommu_init(host);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to setup IOMMU: %d\n", err);
-		return err;
+		goto destroy_cache;
 	}
 
 	err = host1x_channel_list_init(&host->channel_list,
@@ -516,6 +517,8 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
 	host1x_iommu_exit(host);
+destroy_cache:
+	host1x_bo_cache_destroy(&host->cache);
 
 	return err;
 }
-- 
2.30.2

