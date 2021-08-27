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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB133C43216
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B450A60FD9
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245395AbhH0NYP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245433AbhH0NYP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:15 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D463C061796
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id g18so2865852wrc.11
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yn/vaVvblRViP19offP84fG/Hd78GVNRXLUkQoP5WOw=;
        b=RqyHU4S34DHrGmacqmi9GKxNCUcxtBdL9iPhT0u6EnpyHp77mCVJ4avkKsrAKn5xXu
         svxdEOdqet1hzm8glB0bN14MpOCnij1ivThdKmuUE7bOWuvDzq0sO9UF9CfzbvrR89cW
         x+6au14fFkmk+KER/vTp0GInDpMWxuhSS8mPxRuGdxWE+s34vpOW35SjBv7hRO0iDuos
         P7cqbhfjHw6S+I/euU4ydg8HnCi5EFR6/+nLg0k9AHb7UqxN/2T6soIvQOdARea1TgR1
         awBG6OqkoPlWBQJ8icifIC+I6WJdA1Dh0SyGNEme1hW8aYv2VskOKfe3PyOK6ev6WYHx
         7YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yn/vaVvblRViP19offP84fG/Hd78GVNRXLUkQoP5WOw=;
        b=HRJB6xwrPkLWNb9dfwCDl/G7orBB+Kj6HodVuVWFTe1zBJ3wbSKRFiE+pogi6tApn4
         e1zBE61wtvcqs/hhN24Dr0Yocmm3hIK57oKHo53pClRKHySpl+seQQ7xr3C4crvDujzx
         1lvunnDIL1/ko4ww6HW/DZmdxbFXV5xxD0S3lb5Ch3tslnJzPzG78GtxuATtgpA7PUBK
         +4gmdIwGE5rPPB05FLzbkGTcjLJuB7i/eaJhkFsc6R7NSSOIzO3QUX/HpJVpyv3/yfLr
         C3EKExY7C1to5moQxFyu7n+eFqhRTkr4PRqsH2/LZ2DzIHnVG2loxik9SGcKdyG/9CoS
         1rNw==
X-Gm-Message-State: AOAM530o/0NoFKg7n4Snf0pYhSoeimnLXWz76D8asURn7srADkL+o40t
        tqazNyzmcGlQT/zBz5dZV2o=
X-Google-Smtp-Source: ABdhPJxQYnWBaZsST6BI+9+tzDBt3og23Ap6OQYyf5Rx76HpdCuqhRg/YKHr9vdeYqjzSHl/olQqDw==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr9971969wro.379.1630070604782;
        Fri, 27 Aug 2021 06:23:24 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t64sm5293301wma.48.2021.08.27.06.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 07/25] tegra: Make API more consistent
Date:   Fri, 27 Aug 2021 15:22:47 +0200
Message-Id: <20210827132305.3572077-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Most functions in libdrm_tegra take as first parameter the object that
they operate on. Make the device and buffer object creation functions
follow the same scheme.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/tegra.c           | 13 +++++++------
 tegra/tegra.h           | 10 +++++-----
 tests/tegra/openclose.c |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tegra/tegra.c b/tegra/tegra.c
index 240600c3c496..0020e9301bf3 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -70,7 +70,7 @@ static int drm_tegra_wrap(struct drm_tegra **drmp, int fd, bool close)
     return 0;
 }
 
-drm_public int drm_tegra_new(struct drm_tegra **drmp, int fd)
+drm_public int drm_tegra_new(int fd, struct drm_tegra **drmp)
 {
     bool supported = false;
     drmVersionPtr version;
@@ -122,8 +122,8 @@ static struct drm_tegra_bo *drm_tegra_bo_alloc(struct drm_tegra *drm,
 }
 
 drm_public int
-drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                 uint32_t flags, uint32_t size)
+drm_tegra_bo_new(struct drm_tegra *drm, uint32_t flags, uint32_t size,
+                 struct drm_tegra_bo **bop)
 {
     struct drm_tegra_gem_create args;
     struct drm_tegra_bo *bo;
@@ -156,8 +156,8 @@ drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
 }
 
 drm_public int
-drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                  uint32_t handle, uint32_t flags, uint32_t size)
+drm_tegra_bo_wrap(struct drm_tegra *drm, uint32_t handle, uint32_t flags,
+                  uint32_t size, struct drm_tegra_bo **bop)
 {
     struct drm_tegra_bo *bo;
 
@@ -187,7 +187,8 @@ drm_public void drm_tegra_bo_unref(struct drm_tegra_bo *bo)
         drm_tegra_bo_free(bo);
 }
 
-drm_public int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle)
+drm_public int
+drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle)
 {
     if (!bo || !handle)
         return -EINVAL;
diff --git a/tegra/tegra.h b/tegra/tegra.h
index aaaf455fbc8e..2bcd596e2d61 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -31,13 +31,13 @@
 struct drm_tegra_bo;
 struct drm_tegra;
 
-int drm_tegra_new(struct drm_tegra **drmp, int fd);
+int drm_tegra_new(int fd, struct drm_tegra **drmp);
 void drm_tegra_close(struct drm_tegra *drm);
 
-int drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                     uint32_t flags, uint32_t size);
-int drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                      uint32_t handle, uint32_t flags, uint32_t size);
+int drm_tegra_bo_new(struct drm_tegra *drm, uint32_t flags, uint32_t size,
+                     struct drm_tegra_bo **bop);
+int drm_tegra_bo_wrap(struct drm_tegra *drm, uint32_t handle, uint32_t flags,
+                      uint32_t size, struct drm_tegra_bo **bop);
 struct drm_tegra_bo *drm_tegra_bo_ref(struct drm_tegra_bo *bo);
 void drm_tegra_bo_unref(struct drm_tegra_bo *bo);
 int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle);
diff --git a/tests/tegra/openclose.c b/tests/tegra/openclose.c
index 104e83806f3a..61dbc2ba4f5f 100644
--- a/tests/tegra/openclose.c
+++ b/tests/tegra/openclose.c
@@ -56,7 +56,7 @@ int main(int argc, char *argv[])
         drmFreeVersion(version);
     }
 
-    err = drm_tegra_new(&tegra, fd);
+    err = drm_tegra_new(fd, &tegra);
     if (err < 0)
         return 1;
 
-- 
2.32.0

