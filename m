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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE43DC4320E
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 997ED60FF2
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245292AbhH0NYI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245407AbhH0NYF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:05 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBC5C061757
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:16 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u9so10364936wrg.8
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZTSlK8m9j6jEUpGDQkFFtC2HGi55bNPj2cNJA6xJ8c=;
        b=Ut2M5UGog9gO8G/Ppn2E520PORW/21cWPF7Lpas1VlsVQjA7cfuHnWSeRLneRjVctu
         sijJ4KhJeez+nb9o3LOTR+hN863b4WG+Q92129i8G89+b2R0w4fFc7j4fmOaT7IudCis
         a/AWCJFsIFvHJ6xu/xzwI+cN1D6wpwMjEEVcsSDP8oRo93AUbcnOe8c2ME4sUoLgLX4q
         eEwZzJJjm1o0VkY9eAgQAweeZA4ixPpNKFGvEwAFGLCc0Mf/JZ+Lp5KffVspv5r4AyZW
         Q+ewpme+vkc14zOPmVpiqAZzRYEpJJ3U4NqenowejWaLYUWn4TCWwAheFGUI3OHT7sUl
         nwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZTSlK8m9j6jEUpGDQkFFtC2HGi55bNPj2cNJA6xJ8c=;
        b=X2X7/swyiyzOQsKR3BU7SsZZsVMl6Nn4rP78MQfzO9Wj8MquzgvRTVorzxeL4GYnv8
         84TWmtnAXvINhqICB/YtADjJZVvNrUYeEDgxUKnZWvEU5VVhNmTKZSyuC+ippKgYD0Ds
         Zn/cCHYraUPjzciOK1EFUZ5Dl75kgH9sj3yT8XU9JxbXnheG6d3rHCJXxNSQCUABTynw
         DM2huwV0//riNJWFASyEYggxNiVog1NSdqZepwe3pWwLBpb3yeNWUdec4THd+P/NJ9s/
         uO3w5d3cOHpGj+8vMzYGa7Xj+eU0s9Iz2d64T32gXtDrF4EGGRp35hfddtvRHrnlmurs
         J3Ig==
X-Gm-Message-State: AOAM531CuC4+qK8LjR54ZdOycrrSzwrITSu2lbwIpy77JkOZPBl+v8qU
        mWV6cDwMeGZwl2P9ubdh2D0=
X-Google-Smtp-Source: ABdhPJxdn+04LLfydGRCS++9ob2AqrmhbAQFRaMa3sSrpUj0QdAcfqWJOtmWb4ZODh7l+h9ajJt7Lg==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr10127268wri.197.1630070595517;
        Fri, 27 Aug 2021 06:23:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o26sm1090196wmc.17.2021.08.27.06.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 02/25] tegra: Remove unused IOCTL implementations
Date:   Fri, 27 Aug 2021 15:22:42 +0200
Message-Id: <20210827132305.3572077-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The DRM_TEGRA_GEM_{GET,SET}_FLAGS and DRM_TEGRA_GEM_{GET,SET}_TILING
IOCTLs were badly designed and have since been obsoleted by framebuffer
modifiers. Remove these implementations to make it clear their usage is
discouraged.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/tegra-symbols.txt |  4 --
 tegra/tegra.c           | 95 -----------------------------------------
 tegra/tegra.h           | 12 ------
 3 files changed, 111 deletions(-)

diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index 5e3e955f2901..9422696c1416 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -1,11 +1,7 @@
-drm_tegra_bo_get_flags
 drm_tegra_bo_get_handle
-drm_tegra_bo_get_tiling
 drm_tegra_bo_map
 drm_tegra_bo_new
 drm_tegra_bo_ref
-drm_tegra_bo_set_flags
-drm_tegra_bo_set_tiling
 drm_tegra_bo_unmap
 drm_tegra_bo_unref
 drm_tegra_bo_wrap
diff --git a/tegra/tegra.c b/tegra/tegra.c
index 3caf0bc4e65e..94840ad42795 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -235,98 +235,3 @@ drm_public int drm_tegra_bo_unmap(struct drm_tegra_bo *bo)
 
     return 0;
 }
-
-drm_public int drm_tegra_bo_get_flags(struct drm_tegra_bo *bo, uint32_t *flags)
-{
-    struct drm_tegra_gem_get_flags args;
-    struct drm_tegra *drm = bo->drm;
-    int err;
-
-    if (!bo)
-        return -EINVAL;
-
-    memset(&args, 0, sizeof(args));
-    args.handle = bo->handle;
-
-    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_GET_FLAGS, &args,
-                              sizeof(args));
-    if (err < 0)
-        return -errno;
-
-    if (flags)
-        *flags = args.flags;
-
-    return 0;
-}
-
-drm_public int drm_tegra_bo_set_flags(struct drm_tegra_bo *bo, uint32_t flags)
-{
-    struct drm_tegra_gem_get_flags args;
-    struct drm_tegra *drm = bo->drm;
-    int err;
-
-    if (!bo)
-        return -EINVAL;
-
-    memset(&args, 0, sizeof(args));
-    args.handle = bo->handle;
-    args.flags = flags;
-
-    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_SET_FLAGS, &args,
-                              sizeof(args));
-    if (err < 0)
-        return -errno;
-
-    return 0;
-}
-
-drm_public int
-drm_tegra_bo_get_tiling(struct drm_tegra_bo *bo,
-                        struct drm_tegra_bo_tiling *tiling)
-{
-    struct drm_tegra_gem_get_tiling args;
-    struct drm_tegra *drm = bo->drm;
-    int err;
-
-    if (!bo)
-        return -EINVAL;
-
-    memset(&args, 0, sizeof(args));
-    args.handle = bo->handle;
-
-    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_GET_TILING, &args,
-                              sizeof(args));
-    if (err < 0)
-        return -errno;
-
-    if (tiling) {
-        tiling->mode = args.mode;
-        tiling->value = args.value;
-    }
-
-    return 0;
-}
-
-drm_public int
-drm_tegra_bo_set_tiling(struct drm_tegra_bo *bo,
-                        const struct drm_tegra_bo_tiling *tiling)
-{
-    struct drm_tegra_gem_set_tiling args;
-    struct drm_tegra *drm = bo->drm;
-    int err;
-
-    if (!bo)
-        return -EINVAL;
-
-    memset(&args, 0, sizeof(args));
-    args.handle = bo->handle;
-    args.mode = tiling->mode;
-    args.value = tiling->value;
-
-    err = drmCommandWriteRead(drm->fd, DRM_TEGRA_GEM_SET_TILING, &args,
-                              sizeof(args));
-    if (err < 0)
-        return -errno;
-
-    return 0;
-}
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 62205a5174b4..c6b4f984de45 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -44,17 +44,5 @@ int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle);
 int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr);
 int drm_tegra_bo_unmap(struct drm_tegra_bo *bo);
 
-int drm_tegra_bo_get_flags(struct drm_tegra_bo *bo, uint32_t *flags);
-int drm_tegra_bo_set_flags(struct drm_tegra_bo *bo, uint32_t flags);
-
-struct drm_tegra_bo_tiling {
-    uint32_t mode;
-    uint32_t value;
-};
-
-int drm_tegra_bo_get_tiling(struct drm_tegra_bo *bo,
-                            struct drm_tegra_bo_tiling *tiling);
-int drm_tegra_bo_set_tiling(struct drm_tegra_bo *bo,
-                            const struct drm_tegra_bo_tiling *tiling);
 
 #endif /* __DRM_TEGRA_H__ */
-- 
2.32.0

