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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E052C4320E
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AF5160FC4
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245409AbhH0NYN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245369AbhH0NYN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:13 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645B7C061757
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id h13so10451994wrp.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GsjiOIONlFkeiKb/INebhBc5lywdJIjsSRJt4IKPGns=;
        b=fH3b05GKveYwAkc9duGadR6u+z356FlLTrepePBf3ShmZSe0Ibqa7RsSYNAvYrr9J1
         xh4LahdAXtGh6PXIhSzO1cGUXzOTJQbcgU4qPgAgg+SWQiGZZUN9YiAlbbqJoRtHgqwE
         Zv+TZ/NE8Qkjc/aORO7lho0I2FhwvafgdZFscKwgRj50vk50s7lgQMAzFadby9BthoOJ
         OUII0D2NUhOlm4/dJAZw4RD95lw/bZqiOXnwAL+nYCo+CXJI6sFb6wVX73z7kG5HSWq4
         wuJ5iyWC1xUbKP3vmTjRK0ic7oMiuoWJVnZGw8hdU46pVzaCLf1TFD2LcrPgc6l7zEE/
         vmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GsjiOIONlFkeiKb/INebhBc5lywdJIjsSRJt4IKPGns=;
        b=bsE2bx6D/pOl33F+JRT9qXbVNqjt2tIJ2R4GG00Hfyp2JMCSCCdKnNxZsQ/AAKirWa
         yEW57mByjla6SL8RtYr6dvaHM+M0kK1dkJNuOtQ4vgUcqO4RYg+Lkaw7PnjQ3JXQwiNf
         pkUdTB2lPpCQPwEStUn0Gm7jSpwJN2uDYM1x7bxFWlXUeHsLlniWevD9Urdj4U+jElPK
         z3WW7reTgwEmVfDPLEceB9DokhjEO+wrg9OYJYZTgjO/CTRLENNf0xm3q7brVJGIXqJv
         +xowOeKBOy3RTE8s7Mew/1sVKWEB13dn73i98w96dixK4cn9xRv//VF23JMnZSLgr3en
         k+mw==
X-Gm-Message-State: AOAM532oJgNFVHQAx01mH9ZO4/y+vqsCPdHvhwoLRTRu0K7wh1bVNZER
        YdDS7RqPgLa+uKBiFAgLE5M=
X-Google-Smtp-Source: ABdhPJwhhfJtbCEb8K/twv+oQ/ZOildS44AZcI+udm9RqxwT2SOpQOx34YgejuF0McTq4BDdaa9Q3A==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr9962476wrj.371.1630070603040;
        Fri, 27 Aug 2021 06:23:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m24sm8530823wrb.18.2021.08.27.06.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 06/25] tegra: Add PRIME support helpers
Date:   Fri, 27 Aug 2021 15:22:46 +0200
Message-Id: <20210827132305.3572077-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These helpers facilitate exporting and importing buffer objects to and
from PRIME file descriptors.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- add drm_public annotations
---
 tegra/tegra-symbols.txt |  2 ++
 tegra/tegra.c           | 61 +++++++++++++++++++++++++++++++++++++++++
 tegra/tegra.h           |  4 +++
 3 files changed, 67 insertions(+)

diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index 630e075fa5d7..f8811bcd26f4 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -1,5 +1,7 @@
+drm_tegra_bo_export
 drm_tegra_bo_get_handle
 drm_tegra_bo_get_name
+drm_tegra_bo_import
 drm_tegra_bo_map
 drm_tegra_bo_new
 drm_tegra_bo_open
diff --git a/tegra/tegra.c b/tegra/tegra.c
index 5eb8518104ef..240600c3c496 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -294,3 +294,64 @@ free:
     free(bo);
     return err;
 }
+
+drm_public int drm_tegra_bo_export(struct drm_tegra_bo *bo, uint32_t flags)
+{
+    int fd, err;
+
+    flags |= DRM_CLOEXEC;
+
+    err = drmPrimeHandleToFD(bo->drm->fd, bo->handle, flags, &fd);
+    if (err < 0)
+        return err;
+
+    return fd;
+}
+
+static ssize_t fd_get_size(int fd)
+{
+    ssize_t size, offset;
+    int err;
+
+    offset = lseek(fd, 0, SEEK_CUR);
+    if (offset < 0)
+        return -errno;
+
+    size = lseek(fd, 0, SEEK_END);
+    if (size < 0)
+        return -errno;
+
+    err = lseek(fd, offset, SEEK_SET);
+    if (err < 0)
+        return -errno;
+
+    return size;
+}
+
+drm_public int
+drm_tegra_bo_import(struct drm_tegra *drm, int fd, struct drm_tegra_bo **bop)
+{
+    struct drm_tegra_bo *bo;
+    ssize_t size;
+    int err;
+
+    size = fd_get_size(fd);
+    if (size < 0)
+        return size;
+
+    bo = drm_tegra_bo_alloc(drm, 0, 0, size);
+    if (!bo)
+        return -ENOMEM;
+
+    err = drmPrimeFDToHandle(drm->fd, fd, &bo->handle);
+    if (err < 0)
+        goto free;
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
index 333690f23118..aaaf455fbc8e 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -48,4 +48,8 @@ int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name);
 int drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
                       struct drm_tegra_bo **bop);
 
+int drm_tegra_bo_export(struct drm_tegra_bo *bo, uint32_t flags);
+int drm_tegra_bo_import(struct drm_tegra *drm, int fd,
+                        struct drm_tegra_bo **bop);
+
 #endif /* __DRM_TEGRA_H__ */
-- 
2.32.0

