Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1ACC48BE5
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 11:05:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C05E613FF
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 11:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFJLHS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 07:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhFJLHR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 07:07:17 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C05FC061574
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=bx7HtzrhZnE7U7kDOh5/4faOTFZ00ObyvELF0wozSz4=; b=18FkVRep+9Lx9cBryfEtIJdGZc
        J33fJ/fClIpXnEsYHiliUOHdWcLZg9QSvdwYw5rRfqOOFi8jXjJqWF0lux1F1dUhM4OBzAjOuufjm
        vQlqyXyvIQbfgaQD5Fq+m5CUzs5Y4SRBvVHe9wThi5WYlqU9lmBhd7HjAVTc+8M2b6a6wWVCtzofL
        x2HheMWwBcL8/BlrAU3h5UAF33YxvfLnURJqh8Kac8KWQLpQGuTFoHqYqYMBljn0xa89F2GbKmhyq
        VSU3iGEuBMOaoxGVZnKnxWpxuZFgkZlq34aR3l0KChbSZlxW7zff6gh+lfZqF2kH+wk54YZsXo5MK
        sUWXQjOQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lrIUt-0001s7-4B; Thu, 10 Jun 2021 14:05:15 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v7 06/15] drm/tegra: Extract tegra_gem_lookup
Date:   Thu, 10 Jun 2021 14:04:47 +0300
Message-Id: <20210610110456.3692391-7-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The static function host1x_bo_lookup in drm.c is also useful
elsewhere. Extract it as tegra_gem_lookup in gem.c.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
- New patch
---
 drivers/gpu/drm/tegra/drm.c | 20 +++-----------------
 drivers/gpu/drm/tegra/gem.c | 13 +++++++++++++
 drivers/gpu/drm/tegra/gem.h |  2 ++
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 0e2a6f24c4f6..f7dc50e5f817 100644
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
2.30.1

