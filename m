Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1FAC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbiBQTQv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:16:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245077AbiBQTQu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:16:50 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8677E6543
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:16:34 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vz16so9713903ejb.0
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bnXF7r460nVXVVViXXt//RK7jf9YuHumDoAui5Tkl/s=;
        b=AkzymwpgC8GZ0SadLVA9e2aA92UBz3MXg5/zDaDmGMjxE9IsTskAZmGCJ7yoaiCkQ4
         zi4kkRc+n5xLSohUT09X7SvVS4Yh+dBvo5YC4ZYd24oKa5enU7MTVfOy3SGnoccfr8bi
         kWEVAFc0lzRdeMr33rFsy5pNi96MdS+Agek09yzfK1DLlkWKPAN3IXZ8N2q1swb+Novl
         8eXKfvanwmaUyea7Ity09OHd6+jO4mHmeXowHGTh6qpy9RISUOh0SLtE1hH56DC8jMnY
         ARRkZkrJgBbuch81iM6lS+RMWw1x588W5iRkplOrOVUOD1btKUJ1SH9xvl4M09dnv6we
         bbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bnXF7r460nVXVVViXXt//RK7jf9YuHumDoAui5Tkl/s=;
        b=pAcXTtTYPx69Sy8ehKtB4x059Yo86jK0T4uOe9gW4/Otzk6TFkSuTO1/XFtX2ASfvI
         uEAFKmyeh8oXX4oZHqYQ0NPQpGnReW6H998Hd3zKhBBxG2WVDquSmf/O3bzEOuNCCIK4
         2RVWrmgmfavDPEhDDhBQ5B9MBpyDx4ol3sL5yQvJKXVITZ0iGa/lUzFcOvM0uc5HgA+C
         dKqG8ZA68DJjtMPBKbnbC/IMAvgpfBWX28UIfzjKcSX0v5YtfqjZyj8H4qz1cKUqL9Wx
         4vWvGkP8mPlqqKWvFf4kigApij9su53fgCMQo4Gzu8/h26jsEfb6V+4FJjDoe8eaRj3R
         xTHw==
X-Gm-Message-State: AOAM533jDKMpoTRo5lrLRglSg5uio6UNJMf0H169wTWBITYlqjvscgCs
        mRD7NlLTsd7HU5iFZkJXq+mInOjrRhY=
X-Google-Smtp-Source: ABdhPJxdlP2cTwiHUTK6g7sNcQD8gB5F60ON3QQUKjSI6QBwSKuyOJJl8qA5mQEKGqno3jWZYcfM5w==
X-Received: by 2002:a17:906:eb0f:b0:6af:738:3380 with SMTP id mb15-20020a170906eb0f00b006af07383380mr3517018ejb.398.1645125393077;
        Thu, 17 Feb 2022 11:16:33 -0800 (PST)
Received: from localhost (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de. [2003:e4:1f0a:6900::43a])
        by smtp.gmail.com with ESMTPSA id n25sm3575806eds.89.2022.02.17.11.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:16:32 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 03/25] tegra: Extract common buffer object allocation code
Date:   Thu, 17 Feb 2022 20:16:03 +0100
Message-Id: <20220217191625.2534521-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191625.2534521-1-thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

All of the buffer object allocation functions use the same boilerplate
code. Move that code into a separate function that can be reused.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/tegra.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/tegra/tegra.c b/tegra/tegra.c
index 630aea45f957..74e1fd33c6e5 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -97,6 +97,26 @@ drm_public void drm_tegra_close(struct drm_tegra *drm)
     free(drm);
 }
 
+static struct drm_tegra_bo *drm_tegra_bo_alloc(struct drm_tegra *drm,
+                                               uint32_t handle,
+                                               uint32_t flags,
+                                               uint32_t size)
+{
+    struct drm_tegra_bo *bo;
+
+    bo = calloc(1, sizeof(*bo));
+    if (!bo)
+        return NULL;
+
+    atomic_set(&bo->ref, 1);
+    bo->handle = handle;
+    bo->flags = flags;
+    bo->size = size;
+    bo->drm = drm;
+
+    return bo;
+}
+
 drm_public int
 drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
                  uint32_t flags, uint32_t size)
@@ -108,15 +128,10 @@ drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
     if (!drm || size == 0 || !bop)
         return -EINVAL;
 
-    bo = calloc(1, sizeof(*bo));
+    bo = drm_tegra_bo_alloc(drm, 0, flags, size);
     if (!bo)
         return -ENOMEM;
 
-    atomic_set(&bo->ref, 1);
-    bo->flags = flags;
-    bo->size = size;
-    bo->drm = drm;
-
     memset(&args, 0, sizeof(args));
     args.flags = flags;
     args.size = size;
@@ -145,16 +160,10 @@ drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
     if (!drm || !bop)
         return -EINVAL;
 
-    bo = calloc(1, sizeof(*bo));
+    bo = drm_tegra_bo_alloc(drm, handle, flags, size);
     if (!bo)
         return -ENOMEM;
 
-    atomic_set(&bo->ref, 1);
-    bo->handle = handle;
-    bo->flags = flags;
-    bo->size = size;
-    bo->drm = drm;
-
     *bop = bo;
 
     return 0;
-- 
2.35.1

