Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA64C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243342AbiBQTQy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:16:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245089AbiBQTQx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:16:53 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB53166204
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:16:37 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id q17so11482402edd.4
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eaLIGaAa+RQaFC/Np/JD2E7mN4OYFfTrDEb0AxNo6TY=;
        b=ECtjhYHxkvjlwXQmKE1B2uvGVHqoemnYr0dPxuKRyvDsfAFQUXo5YOBJWPw0JAoH/5
         /xKxdlewSV8ZpgNPUrNQBtSYnUuzerhgsp+BjkZiytxq98t/EUgwsz4K/5ljW7byRVgp
         iwUu3dU/QgVW5ff2u4KTE+OTk1+pjlPYhs3BTmvfIRIVXsn2gk9WG5eOgobQu9oJToTL
         Lh6nvr4pJiEUKhy31NDSa/vPXsS6tP7z4gZITUWkshxUw9PJiqivaOw4gjUmoiE8HgV7
         WnlULagG1DT4+Xom02tjBdAc5YdmV98lTHXaqUJesO4QzpInVykmxN1YDUA8gyGMOqsv
         PUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eaLIGaAa+RQaFC/Np/JD2E7mN4OYFfTrDEb0AxNo6TY=;
        b=QZhiEC2WuAmIzhlomOxO6yDfzhYdFrAY9oOwN5F4UhtXbUd2pn426VIIb3V3J7581A
         mKhjTj2lD8aeqW1QresHJac3+gsdcrt8wJcsx1WYYHs4iUkjI5hA36JldtYPxHGG4SRW
         Bnt6UK8UGU5Ku5azuQ8JWqo5YDqyYzVtcl75rHNuG14WLNOG/4f49yK+SkHhUBEHdvOD
         VSjXVq9rQF8kMk+I84tvGRl+efBHe1frec30RgPyZFgcQYIqjCw0ELKUuzN3oXgs0OIB
         z/xfnQOzYdL2GUdM+TqhZ/ScNnut7RuXDzeLR0SjYkG/i/pCRI+QwkjsQ/y+aVOWmAqe
         EHXQ==
X-Gm-Message-State: AOAM531AH2Hz2ZyYOSAD6vSD1yJ4Ds30d8FLccNadaM95ABssiDG9yuw
        lksvG8F3ql8Ll6aeKQaL1wTWQ7yVE4o=
X-Google-Smtp-Source: ABdhPJyYcoEEqfVM4jYelKCvCk89VrXVUEtGRyOEuA1axTAW6TKe+xark4Ot3vVj3ioYexGREt0oHQ==
X-Received: by 2002:a05:6402:144b:b0:410:b990:a68a with SMTP id d11-20020a056402144b00b00410b990a68amr4288389edx.25.1645125396403;
        Thu, 17 Feb 2022 11:16:36 -0800 (PST)
Received: from localhost (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de. [2003:e4:1f0a:6900::43a])
        by smtp.gmail.com with ESMTPSA id r3sm1488439ejd.129.2022.02.17.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:16:35 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 05/25] tegra: Add flink helpers
Date:   Thu, 17 Feb 2022 20:16:05 +0100
Message-Id: <20220217191625.2534521-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191625.2534521-1-thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add helpers to export and import buffer objects via flink names.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- add drm_public annotations
---
 tegra/tegra-symbols.txt |  2 ++
 tegra/tegra.c           | 50 +++++++++++++++++++++++++++++++++++++++++
 tegra/tegra.h           |  3 +++
 3 files changed, 55 insertions(+)

diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index 9422696c1416..630e075fa5d7 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -1,6 +1,8 @@
 drm_tegra_bo_get_handle
+drm_tegra_bo_get_name
 drm_tegra_bo_map
 drm_tegra_bo_new
+drm_tegra_bo_open
 drm_tegra_bo_ref
 drm_tegra_bo_unmap
 drm_tegra_bo_unref
diff --git a/tegra/tegra.c b/tegra/tegra.c
index a9087e956f94..3d645d87dd3d 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -240,3 +240,53 @@ drm_public int drm_tegra_bo_unmap(struct drm_tegra_bo *bo)
 
     return 0;
 }
+
+drm_public int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name)
+{
+    struct drm_tegra *drm = bo->drm;
+    struct drm_gem_flink args;
+    int err;
+
+    memset(&args, 0, sizeof(args));
+    args.handle = bo->handle;
+
+    err = drmIoctl(drm->fd, DRM_IOCTL_GEM_FLINK, &args);
+    if (err < 0)
+        return err;
+
+    if (name)
+        *name = args.name;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
+                  struct drm_tegra_bo **bop)
+{
+    struct drm_gem_open args;
+    struct drm_tegra_bo *bo;
+    int err;
+
+    bo = drm_tegra_bo_alloc(drm, 0, flags, 0);
+    if (!bo)
+        return -ENOMEM;
+
+    memset(&args, 0, sizeof(args));
+    args.name = name;
+
+    err = drmIoctl(drm->fd, DRM_IOCTL_GEM_OPEN, &args);
+    if (err < 0)
+        goto free;
+
+    bo->handle = args.handle;
+    bo->size = args.size;
+
+    *bop = bo;
+
+    return 0;
+
+free:
+    free(bo);
+    return err;
+}
diff --git a/tegra/tegra.h b/tegra/tegra.h
index c6b4f984de45..333690f23118 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -44,5 +44,8 @@ int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle);
 int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr);
 int drm_tegra_bo_unmap(struct drm_tegra_bo *bo);
 
+int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name);
+int drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
+                      struct drm_tegra_bo **bop);
 
 #endif /* __DRM_TEGRA_H__ */
-- 
2.35.1

