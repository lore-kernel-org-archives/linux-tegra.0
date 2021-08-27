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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58093C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42BAC604AC
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245297AbhH0NYM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245284AbhH0NYL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:11 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95743C0613D9
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:22 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id h13so10451815wrp.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nCYo7FJcxKoQshzkwg/+mjeEX0Thq4lUy2ZqW0h0e+4=;
        b=CqLSDPoTRTt5AxGXzE4OegrS+nbPyEbSUZqXjNJMmWXb60nyV6rYTuNTSo+YwS0DeU
         VOqpsvIqjxsKodYtVyLryYG8x3RZmAwp6WetsVcN/3rHTSum8oJPWXEqrhi/nq80vbSB
         07ThCzHHBmufClWem0nxWIsw2mtD/e+2TjHoqvMwXfShAXIy1E2FlsRLftTkMYQ523bC
         NFGyi8MejlBZ03yr41o2pRSWJq+GkXJzLFGMPsZjYp54kF5+wBjNB+Wqn+DJl3eJQQf4
         beMVlSr/XNDCMa4hVGteb7l5sC9XUQA4AVnADGZgpf8s0XP0pPTtHe4mKLUHJJ+2LhYG
         RbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nCYo7FJcxKoQshzkwg/+mjeEX0Thq4lUy2ZqW0h0e+4=;
        b=s/zDAHIeOntci8QNBnloP8I82wMSSCSX1U4pY5nBOGzn4nQL+L6l+YsEYZEeKlZ2Np
         YER1zwI7TPMlkE/2dDZSS3GsFg7ikq6aN7iA2kl1jEO9Ic6khDQLlumpR/5sH5dbCpFP
         QW76e0E110cWCQEa17ZV6UczkM39O5+RaZPXcVPdHXtAab8ftKTR5d1KyDM2JUpNZ+nm
         a6Td4+5bmDuV6GYjQWCgZQv3AEHtgsMfaGKsa0CxyVm1WinSIV3JPxgjpMOi8TsawzDK
         y0lixXQ15Z2NMWEABfJFKGiG6P2vBuCeGsemLpQmqz4SIei2b8iWvovBJWIk/q9czWku
         TrDQ==
X-Gm-Message-State: AOAM531HmGpNX2WrzXizTYkxt2I0BP69MB3gEAh027wsAkJJNVWNycuM
        vnMjb5VxMtby7iRDHA6AIgs=
X-Google-Smtp-Source: ABdhPJyiFoerR3lESbOmmSFrx2p8NZJJDXo1NdDcQgS3GHKb20MaAuzYeXA/IN8n2avW3Wjq7xIKkw==
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr10494233wrh.108.1630070601201;
        Fri, 27 Aug 2021 06:23:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a129sm3865486wme.14.2021.08.27.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 05/25] tegra: Add flink helpers
Date:   Fri, 27 Aug 2021 15:22:45 +0200
Message-Id: <20210827132305.3572077-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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
index 5225ad052fb3..5eb8518104ef 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -244,3 +244,53 @@ drm_public int drm_tegra_bo_unmap(struct drm_tegra_bo *bo)
 
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
2.32.0

