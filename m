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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A14C48BCD
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 17:29:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45492613D2
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 17:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhFIRbR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 13:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhFIRbQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 13:31:16 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07F7C061574
        for <linux-tegra@vger.kernel.org>; Wed,  9 Jun 2021 10:29:04 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id i94so21331460wri.4
        for <linux-tegra@vger.kernel.org>; Wed, 09 Jun 2021 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hisQDQi2+qRJM6f0zvtzRz/avVS3f798AS+aYM2Iq80=;
        b=J3x9CdeBpq+5uCmg69UOOA+CCvqmLVZmMtJbo2BeBn33JUlCbULGgK6jzjNw+kk7lc
         6XWAbz852Q41K5al5xO7F5i+ggLcin9N4KsgPX77Qp03+aA3PCLcwAr9AkZF/Ry+2/Lp
         sumWm5XvkviOOVlZc/i6abIxDBUcu0nuPotCtP2P6LMaHgNijFkuRQs7l/rIc+xdqsg4
         2t1SY1aU6ixWWrORWV0lSV6fjbqlIrp8vlfyC6PSmgcubA5EZWVh4yAq0TvBJwWQ1VOz
         RLbA8OYolfH1n/3q9HU3J2+XNZ/5HLuEN6reYV7QvYKobDdzueIV7xM4vSUJckdUKuZz
         3XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hisQDQi2+qRJM6f0zvtzRz/avVS3f798AS+aYM2Iq80=;
        b=pf86R/dPxrRoxTAGyK1FNB1bfWeQ61awVf3ffEskWk5J0Mr9ND/cpBiMhNvZuFrtB+
         NLmD/IXtybuDd6KY8oQNCGDNmEUyymiRAHHoliRnokboD0FAc5d6HpuDyXxzAiIWYobd
         DIEEJ2zJhnpsEt0gpaeiW6Rb+jW/ddGa4HVxUo7lm3WFjz9atiycRp0lYoRZ20nA/tZy
         Y0LNm8+SIKddvaXsJECD5AoJZ/OJHBQGFG+RGkDLMNz/fAEy7+GcFuQwGAB13M1jg26G
         Gr3ehBqYHi149J33o6siTvYkNQLX6puIrzFu1R19Cl+NzHE9lgbJunfKTTCbrvQAtACr
         WERQ==
X-Gm-Message-State: AOAM533v41zhqABZeNjp5pjJ3U345gq+TDyyckIm1rrs+U8FcDkQ0OUX
        raafHSYjhRFiWRBy37a76jg=
X-Google-Smtp-Source: ABdhPJy85u2jsCOke2wD/gZLF8ArY3JCZKYO07JVfhpzyRmDf61JGNZzvRYD4gJ3l5dxpgdnH44+cA==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr884648wrv.371.1623259743420;
        Wed, 09 Jun 2021 10:29:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b195:7245:6855:de04])
        by smtp.gmail.com with ESMTPSA id w13sm364488wmi.48.2021.06.09.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 10:29:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     imirkin@alum.mit.edu, cyndis@kapsi.fi, linux-tegra@vger.kernel.org,
        nouveau@lists.freedesktop.org, ray.huang@amd.com,
        matthew.auld@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: init the base GEM fields for internal BOs
Date:   Wed,  9 Jun 2021 19:29:02 +0200
Message-Id: <20210609172902.1937-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

TTMs buffer objects are based on GEM objects for quite a while
and rely on initializing those fields before initializing the TTM BO.

Noveau now doesn't init the GEM object for internally allocated BOs,
so make sure that we at least initialize some necessary fields.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 520b1ea9d16c..085023624fb0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -149,6 +149,8 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	 */
 	if (bo->base.dev)
 		drm_gem_object_release(&bo->base);
+	else
+		dma_resv_fini(&bo->base._resv);
 
 	kfree(nvbo);
 }
@@ -330,6 +332,10 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
+	nvbo->bo.base.size = size;
+	dma_resv_init(&nvbo->bo.base._resv);
+	drm_vma_node_reset(&nvbo->bo.base.vma_node);
+
 	ret = nouveau_bo_init(nvbo, size, align, domain, sg, robj);
 	if (ret)
 		return ret;
-- 
2.25.1

