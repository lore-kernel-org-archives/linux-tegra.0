Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80547C07E9B
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A2F1613CF
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbhGITcM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGITcM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:12 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A874CC0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:28 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso6952054wmj.4
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=35f9uUm3ArgMp1cLHX0Pf0HqrWQHxue9iozfkzujAeI=;
        b=WVFtFfqBM7xmsOGH6rhkPw2CDdjE9M7kwkiAhdNx+cmgnqqDwTlnqRwjzW7ud8zjyG
         wD9lih2wk3yQmwjFMQ/SR1+0AJ8Ci15nrelRD6hiVpl8dziOIU6ziJ9Z/uAGu1EIO6wF
         3v/G8neZ7kvFHuRhF2jIrFQlfjypNNXo9zK91m0DpzkB6Ea0P7JJvfTzHiW07kWKjUd4
         UOLlZPBJMr2qwLXF8Bj2CuoZOPXO1BKFws+3NGTUAxpSPS89mUvhYsNcIlSC43QvMnUB
         bqG0By90z9AHXy7sAbpZYb95EsV1Fb2ifbwDlFVbNNBtt/6nMh+rA9OvE1604YlFrGTY
         l5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=35f9uUm3ArgMp1cLHX0Pf0HqrWQHxue9iozfkzujAeI=;
        b=CK4V/MJSGLhRADx5z6ph8tM0NP/VGetzSWCBTt+m11ZPWPj0MkDXpnQmcm8UUkm3pE
         kxqBB3NIbcF9vPC/tkb1eBmtwq3M6ObBtKycXYYbFsCaTEOIgO/ojc9S0bQGHVz4fbTu
         9q7+CRG7olibT1iTSE9c9NfenSljbZ00/vomcElQkKJw5rozZtkRhX09ItZHKJNqWcqq
         iAHYNipnQi1LGL2zqVzAHvZyTIpZ/12OfxY/LOLLBbV9Gk3OlWwHpSEjMLfx25Kq8v4B
         OXz9ahEpHTfTEZSt20ZGkVMOm6aLYDXLlo86unfSMXpBQtIClYCyLV9AZF/IyBB1qjAZ
         y6aw==
X-Gm-Message-State: AOAM531Q9l5XGoWiwjctrjbX+Q0501Cugb+afV7CzGFf42KUL1rlzypl
        wGIKUJU65LrTz+Z2lSi0BA8=
X-Google-Smtp-Source: ABdhPJybQBin29CwVDlAxvB2J6f2tMQwe/ss+S6TkbXMpAA49yLabyuNbfkYReGhISaKkmygI2pfQw==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr535392wml.140.1625858967292;
        Fri, 09 Jul 2021 12:29:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p8sm5681757wre.76.2021.07.09.12.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 05/14] drm/tegra: Extract tegra_gem_lookup
Date:   Fri,  9 Jul 2021 21:31:37 +0200
Message-Id: <20210709193146.2859516-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

The static function host1x_bo_lookup in drm.c is also useful
elsewhere. Extract it as tegra_gem_lookup in gem.c.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 20 +++-----------------
 drivers/gpu/drm/tegra/gem.c | 13 +++++++++++++
 drivers/gpu/drm/tegra/gem.h |  2 ++
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 739250acd498..87954e69ab6c 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -107,20 +107,6 @@ static void tegra_drm_context_free(struct tegra_drm_context *context)
 	kfree(context);
 }
 
-static struct host1x_bo *
-host1x_bo_lookup(struct drm_file *file, u32 handle)
-{
-	struct drm_gem_object *gem;
-	struct tegra_bo *bo;
-
-	gem = drm_gem_object_lookup(file, handle);
-	if (!gem)
-		return NULL;
-
-	bo = to_tegra_bo(gem);
-	return &bo->base;
-}
-
 static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
 				       struct drm_tegra_reloc __user *src,
 				       struct drm_device *drm,
@@ -151,11 +137,11 @@ static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
 
 	dest->flags = HOST1X_RELOC_READ | HOST1X_RELOC_WRITE;
 
-	dest->cmdbuf.bo = host1x_bo_lookup(file, cmdbuf);
+	dest->cmdbuf.bo = tegra_gem_lookup(file, cmdbuf);
 	if (!dest->cmdbuf.bo)
 		return -ENOENT;
 
-	dest->target.bo = host1x_bo_lookup(file, target);
+	dest->target.bo = tegra_gem_lookup(file, target);
 	if (!dest->target.bo)
 		return -ENOENT;
 
@@ -238,7 +224,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 			goto fail;
 		}
 
-		bo = host1x_bo_lookup(file, cmdbuf.handle);
+		bo = tegra_gem_lookup(file, cmdbuf.handle);
 		if (!bo) {
 			err = -ENOENT;
 			goto fail;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 26af8daa9a16..6ec598f5d5b3 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -707,3 +707,16 @@ struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
 
 	return &bo->gem;
 }
+
+struct host1x_bo *tegra_gem_lookup(struct drm_file *file, u32 handle)
+{
+	struct drm_gem_object *gem;
+	struct tegra_bo *bo;
+
+	gem = drm_gem_object_lookup(file, handle);
+	if (!gem)
+		return NULL;
+
+	bo = to_tegra_bo(gem);
+	return &bo->base;
+}
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index c15fd99d6cb2..cb5146a67668 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -80,4 +80,6 @@ struct dma_buf *tegra_gem_prime_export(struct drm_gem_object *gem,
 struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
 					      struct dma_buf *buf);
 
+struct host1x_bo *tegra_gem_lookup(struct drm_file *file, u32 handle);
+
 #endif
-- 
2.32.0

