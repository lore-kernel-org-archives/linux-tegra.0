Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3443C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245077AbiBQTQw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:16:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243342AbiBQTQv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:16:51 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DF5289BB
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:16:36 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id q17so11482310edd.4
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iZ1+dbVgEHbMNHKD2WHu+8n1k/4rgOGziLcagk+Gug0=;
        b=U/ayq/86gSmWoe7OjV1Qbq++ogkPATV2dXmZ5XvHe15rD1RvOu8S4lSE5mT5h4dCjk
         wTr47oDHOLr947Ybax3deSXi0hxgE1d2XdANXt9tL7HAGRXyVu85mYMZrGELlVjEr9aL
         604VFgZzI5iMNH3uXDol+MooCZRc8uYj2dxHkUgISxwvHJe0DCy5GQx9/i4Esbm+LtTR
         N+TtfvOK3JbPQtW1nNYU2pYujStOieql3ts2acP4I35yql5Opvko6SaM9uoJA8wLKrN2
         o6i4l5Bso8hk3xdFfJJHaPUmJnmt6kFm7hhuno21Q3eCx/Wg1CMJQ0zagJjUVHISqyaT
         Ow8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iZ1+dbVgEHbMNHKD2WHu+8n1k/4rgOGziLcagk+Gug0=;
        b=71uZmvUvoL2uVx2nmwwGIptcAOTnjxtUt+taRPpjlIKAV6mNjVwYksgDvUZqumgJHk
         ori9sKCPuOrTSHrWTOY5JcDnsa/8QiWKyQHVIP0EcwlG4twtfXld/kjR4RdysNUblOW7
         vtX22Z7PH6rcm9fXBGNNNsjfns+DzMp+u2yRkd5hw7IcRu2AUcIwJRhecqlZP3gQlQsf
         2iNTGnaV8sehVkEN6Or58ksWjq8CswQYas0pLO/8umVHVDCctjNsr9ytICmtz0EPRiOv
         3F0sJ2Eizs6wlMYCbF8QrL0HIPStdziDgwcwUy3uFx0S1CYi30yZWfw7lw8BhOnIoExJ
         unZw==
X-Gm-Message-State: AOAM531gPQ/OVJO9OOVESSUKZpccius+cvlx9gp9KHKKM/tQzG2RvTXb
        QcKLryTguKBVJa5kmT3Yokc=
X-Google-Smtp-Source: ABdhPJx1d98WlY3RDywH1WZl5cYA57Sv98zrg9q3bXXG5y4Xhgueh+tGVzGr5tx0i4725R80mP2Ihw==
X-Received: by 2002:a50:cccf:0:b0:410:ba4e:65fd with SMTP id b15-20020a50cccf000000b00410ba4e65fdmr4313297edj.31.1645125394781;
        Thu, 17 Feb 2022 11:16:34 -0800 (PST)
Received: from localhost (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de. [2003:e4:1f0a:6900::43a])
        by smtp.gmail.com with ESMTPSA id m11sm3856156edc.110.2022.02.17.11.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:16:33 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 04/25] tegra: Fix mmap() of GEM buffer objects
Date:   Thu, 17 Feb 2022 20:16:04 +0100
Message-Id: <20220217191625.2534521-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191625.2534521-1-thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
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
index 74e1fd33c6e5..a9087e956f94 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -211,8 +211,8 @@ drm_public int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr)
 
         bo->offset = args.offset;
 
-        bo->map = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
-                       drm->fd, bo->offset);
+        bo->map = drm_mmap(NULL, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+                           drm->fd, bo->offset);
         if (bo->map == MAP_FAILED) {
             bo->map = NULL;
             return -errno;
-- 
2.35.1

