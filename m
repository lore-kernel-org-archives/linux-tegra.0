Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE1BC4320A
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A41960FC4
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245407AbhH0NYJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245212AbhH0NYH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:07 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86177C06179A
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:18 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id g18so2865184wrc.11
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mVo6QL2otSkWlz3BNGQoToVxXIroVXY+I539FhGuJc4=;
        b=VMHuaH6HuSy7nYxCiYjNJIXWyDgMmIEutFTUgYKfoooLBZzoUpo4DTYPC4Vj/vre0u
         9BilEZ4of81AI8C96idLZjoZoU5/b5QPW5jTTODvUbHaOrCyBZ0u4n2P5fc88i88RUcN
         be0pEvsQBoGK214sP2wcXpuJREK0UijC9k/HooSmi130SdFxL4TWpN7lzk85thxQYG2G
         gCvezGNJBW38uomhhNAMpTTPl8p2OPncSeLw+by814f6aAhxwZ8GTFwkPZ3mAQqCJZxX
         91tmgAE3ylthpOjcJfZQb8CfWrnDWMtLqCn0X3tunzGvIR1gA57aL5UKFownu5YoPxCR
         RdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mVo6QL2otSkWlz3BNGQoToVxXIroVXY+I539FhGuJc4=;
        b=CSLAB8wF+gXN/qD/iXwdgdo8rqNXp5pIM5Ogk5zo5yfS0UUpOsO5LH40MFxA/BivQf
         qS+TE0PAaMQHyqafelabqx3g+QIQhkekKfSY8wnPeNrraAYeRT6e5jm/FnA1jMgMRlYt
         dsmJCk5ODZsuL8Y8HE8dVhEpDqt8jfCH1lIK53HjZ7l2f+IBX/KOT1GcEAtM9kCaqCwN
         dDH/XY5qKeL/h9jymycxgp/Yq1148sMvQPG6QXJpiphJ4EQ20ngJ/pIqf6BFmEY5mGmY
         kOps2fpXzvwl3Vbw6EVhxl33ejMvuQzQ4Dgp+2rvgS2aA3qAc1nTrVTe1WUpwFt8x7kw
         f1XA==
X-Gm-Message-State: AOAM531mz/aI2K8syRd64Tt0IVOsUBAXs1o8R45b7LldZLi1PkeHqum3
        1sDBNubZIa8I5+M32eFK/Yo=
X-Google-Smtp-Source: ABdhPJxj9fWPvQT7+wv8J9Cxf6JrAYRu4RsFoZU0mr2BIVBXMeWD8DaRSGY/7wWzNBMgKUBIBPivpA==
X-Received: by 2002:a5d:6301:: with SMTP id i1mr9969579wru.423.1630070597150;
        Fri, 27 Aug 2021 06:23:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 19sm11331098wmo.39.2021.08.27.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 03/25] tegra: Extract common buffer object allocation code
Date:   Fri, 27 Aug 2021 15:22:43 +0200
Message-Id: <20210827132305.3572077-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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
index 94840ad42795..bf8e5c9213ca 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -101,6 +101,26 @@ drm_public void drm_tegra_close(struct drm_tegra *drm)
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
@@ -112,15 +132,10 @@ drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
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
@@ -149,16 +164,10 @@ drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
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
2.32.0

