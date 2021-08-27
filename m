Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68962C43214
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52DB960FE6
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245212AbhH0NYK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245387AbhH0NYJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:09 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E72AC0613CF
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:20 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n5so10329379wro.12
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FBdsYqHeqx6lb5nLRyVgCyGnQTI8xvcildAZAC0FEaE=;
        b=O81AqUuTZoeZzFSsgdCr0JShVJGZWZQdXULiy2Qe6hkBFinQ3qwYQPAb+76kz70Eob
         iWplycCT7d6Jm9EduxIAGDrCzfdhL5tFbsiAuhLaHGUuhkUUd1nGAuhoRO/wgLWWWnqc
         59m+X0nybTywT1bS4aLTkt0j7YbUTyzj31+ENC+/L+3m5E8QYXCzJDaKi3wqO89XaHVf
         i3HjqBhaLOG0r4HIqLryNPH7mtQcLl++HEsJ/Vivwl0oiIUmHlko75s7tirpcNIVLtkk
         mQ83e6/osegiUn8jeLh2IQp3SGC5L9axB+iq+M7N7WJxXZQWXk26lRlIzNupOdjftbAD
         LfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FBdsYqHeqx6lb5nLRyVgCyGnQTI8xvcildAZAC0FEaE=;
        b=EjSRdSu1NU9s+in6tlgOCkeEOaEyMpjcV2xe4yiM9q8KHYT+ZRiHyPPFhDteZIHLgY
         M8pYP/vQajry5MkwMo/zK0xXW8dfur5Xbry1stt3v091gNPjzwOta8xmGYMfJ7Iq111f
         pgPdDzfqclFcsdLcictGn3f+InBNqb5v9nkt+eR7jRTHg6+XklvqT+QM6O1I/4hsTUwO
         upyn0kL1H4zx7RFGItWwvlqdFx2fiO6jZ8jKh0mAoZ5fFDV6jwaOEyr+iH/wS+LHsMYS
         UrD7nTEtkq6O4zLgjlyElCshloSXCFSAmnh4vDRfFNhU8Hh9Qt8GYVVJ0gPKH/Y8+H9V
         z2zA==
X-Gm-Message-State: AOAM533qqCJJelbsxeidcS5yvlMPOf/iOw3N+VPv5+Or8QvRi2bFci66
        83rL8teQCKno/MmNzhipZEc=
X-Google-Smtp-Source: ABdhPJzxv6Bj55wCSWTpVkwuk38XzehXa9nn2snemNLVc2gKQiRBtONNITad+Hj2lq3qCehFx/z+yg==
X-Received: by 2002:adf:9ccc:: with SMTP id h12mr10180484wre.385.1630070599204;
        Fri, 27 Aug 2021 06:23:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y24sm2425114wma.9.2021.08.27.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 04/25] tegra: Fix mmap() of GEM buffer objects
Date:   Fri, 27 Aug 2021 15:22:44 +0200
Message-Id: <20210827132305.3572077-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Store 64-bit offset values and use libdrm's built-in drm_mmap() function
instead of mmap() to ensure the full 64-bit offset is used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/private.h | 2 +-
 tegra/tegra.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tegra/private.h b/tegra/private.h
index 215dd3309bce..d0f2944bfb3a 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -41,7 +41,7 @@ struct drm_tegra {
 struct drm_tegra_bo {
     struct drm_tegra *drm;
     uint32_t handle;
-    uint32_t offset;
+    uint64_t offset;
     uint32_t flags;
     uint32_t size;
     atomic_t ref;
diff --git a/tegra/tegra.c b/tegra/tegra.c
index bf8e5c9213ca..5225ad052fb3 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -215,8 +215,8 @@ drm_public int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr)
 
         bo->offset = args.offset;
 
-        bo->map = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
-                       drm->fd, bo->offset);
+        bo->map = drm_mmap(NULL, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+                           drm->fd, bo->offset);
         if (bo->map == MAP_FAILED) {
             bo->map = NULL;
             return -errno;
-- 
2.32.0

