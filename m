Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0F4C4167B
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Dec 2022 17:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbiL0ROo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Dec 2022 12:14:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbiL0ROh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Dec 2022 12:14:37 -0500
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86A4BF7F;
        Tue, 27 Dec 2022 09:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1672161267; bh=t7PT2uktgkerHfBW8tbhYinlf/iWYlEafzcWDES++jM=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=PFvbFEkOjToKt4pNFDu81BSQhHuNoyMGKRRB1qLS/ma35bUMEGFGb4WWuIzm+JJs9
         /KBGjbdAWvKBrsl3hbI1VMkzh1m1q+B3NyPN3EnwTckyAp7FEHxf/2DsKzWa0yKogr
         xUhVjDhHGShJfc1i/8vvL0xMSqkEAQYpGRcPYHvE=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Tue, 27 Dec 2022 18:14:27 +0100 (CET)
X-EA-Auth: kTiepSjWpyi9Ji8iWRK5eWeMrKdUoRK+JaiTVgN5jm3nna2m7biYtAmN9vNNkbmNg67H6j5YGy8WqhY1z1C7Uqq/5buDi/8h
Date:   Tue, 27 Dec 2022 22:44:21 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Saurabh Singh Sengar <ssengar@microsoft.com>,
        Praveen Kumar <kumarpraveen@linux.microsoft.com>,
        Deepak R Varma <drv@mailo.com>
Subject: [PATCH] drm/tegra: submit: No need for Null pointer check before
 kfree
Message-ID: <Y6sn7XptKyk5cbrA@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

kfree() & vfree() internally perform NULL check on the pointer handed
to it and take no action if it indeed is NULL. Hence there is no need
for a pre-check of the memory pointer before handing it to
kfree()/vfree().

Issue reported by ifnullfree.cocci Coccinelle semantic patch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/tegra/submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 066f88564169..06f836db99d0 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -680,8 +680,8 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 		kfree(job_data->used_mappings);
 	}

-	if (job_data)
-		kfree(job_data);
+	kfree(job_data);
+
 put_bo:
 	gather_bo_put(&bo->base);
 unlock:
--
2.34.1



