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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D243C07E9B
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86765613CF
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGITcW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhGITcW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:22 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B706CC0613E6
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:38 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id f9so7887275wrq.11
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fleDkTlpZCnkAhAKVFvno1InuM+Dhrnib08wE4hr/VE=;
        b=ahNE4pzYVKxUy5kYAdYGrmDRiXtYKG8+n/QkPjISNglNBPwhedxhJceud0S53OCDvk
         45/UouVs/lLKpxLH06WEr7N8oGyQHAuISGa4yxLGJouAX8J109dwt8abgTslDz7BM4nU
         2NYomJOCCBymOI85A7m9qk4Hr+/StRKUqjdz5nUEClkuGbpvMI2gBolcqVYx77d6xM8j
         Fa3bnmssnut4WOh+j9eTdaNDVeuyJRgPujoFef3AuXJXvLGy8SISoSMtXxhoJTtxwR2l
         RmL2FzDT6CSbL093KoKrzvSEO0niCMZxO8+6SIFhuIs0b6Q9zjtokVyL5aPbeWy8GF6c
         oB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fleDkTlpZCnkAhAKVFvno1InuM+Dhrnib08wE4hr/VE=;
        b=GF3DZ1vbzhUhW3jKq7G9lTwbZDqVxg910t/T0lhtW0N+3iupO4NvhAK3w8ZbbaZoFj
         TMOi7ReTl2pApQEBUdHjT2onbORFrY71UTeWVd8Dvjt4Cb6P2CPsBWrEgVXLT5A4h7Hi
         lwMmK8M7FRhANrWcdWZUMFBs9INZIbzKpZeisyhGyg/N65fhs/t+fIqz8LQZt6FMoSqp
         0VycTUU/i3H0bOcmFSaNuJal3LaGtGj7twi/GE9uj7BecdCGDcL/TSSsY4ME+G2qp+1u
         9ycEgaoyyeISYAP3hI3MhvaRDFy7FMzS4CicDwlLvVhqX4IgZsn7tfpRKrAkopcqUH37
         11zg==
X-Gm-Message-State: AOAM531iqOqvj1i7PcFakR8+pyr5xbwkqlmkjpWIq+BmY4hYSgs/bOYD
        2ruhTv1XC5UnUfdgfLPiwXk=
X-Google-Smtp-Source: ABdhPJwwp2qzAkEDPdrGaHdEuk1+ij56XzDLU6J2OkRvUXUHJiMq7oJ8Bx+sSgrrTYeHduW/xdbasw==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr37346415wrz.111.1625858977406;
        Fri, 09 Jul 2021 12:29:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b12sm6096749wrx.60.2021.07.09.12.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:36 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 10/14] drm/tegra: Implement syncpoint management UAPI
Date:   Fri,  9 Jul 2021 21:31:42 +0200
Message-Id: <20210709193146.2859516-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Implement TegraDRM IOCTLs for allocating and freeing syncpoints.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c  |  5 ++++
 drivers/gpu/drm/tegra/uapi.c | 52 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h |  5 ++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6ee08e49ec57..18aee825a1ff 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -92,6 +92,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 
 	idr_init_base(&fpriv->legacy_contexts, 1);
 	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
+	xa_init(&fpriv->syncpoints);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
@@ -727,6 +728,10 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_ALLOCATE, tegra_drm_ioctl_syncpoint_allocate,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_FREE, tegra_drm_ioctl_syncpoint_free,
+			  DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index 48e872c768a9..e91394e7264e 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -49,12 +49,17 @@ static void tegra_drm_channel_context_close(struct tegra_drm_context *context)
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
 {
 	struct tegra_drm_context *context;
+	struct host1x_syncpt *sp;
 	unsigned long id;
 
 	xa_for_each(&file->contexts, id, context)
 		tegra_drm_channel_context_close(context);
 
+	xa_for_each(&file->syncpoints, id, sp)
+		host1x_syncpt_put(sp);
+
 	xa_destroy(&file->contexts);
+	xa_destroy(&file->syncpoints);
 }
 
 static struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra,
@@ -311,3 +316,50 @@ int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
 
 	return 0;
 }
+
+int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
+				       struct drm_file *file)
+{
+	struct host1x *host1x = tegra_drm_to_host1x(drm->dev_private);
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_syncpoint_allocate *args = data;
+	struct host1x_syncpt *sp;
+	int err;
+
+	if (args->id)
+		return -EINVAL;
+
+	sp = host1x_syncpt_alloc(host1x, HOST1X_SYNCPT_CLIENT_MANAGED,
+				 current->comm);
+	if (!sp)
+		return -EBUSY;
+
+	args->id = host1x_syncpt_id(sp);
+
+	err = xa_insert(&fpriv->syncpoints, args->id, sp, GFP_KERNEL);
+	if (err) {
+		host1x_syncpt_put(sp);
+		return err;
+	}
+
+	return 0;
+}
+
+int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_syncpoint_allocate *args = data;
+	struct host1x_syncpt *sp;
+
+	mutex_lock(&fpriv->lock);
+	sp = xa_erase(&fpriv->syncpoints, args->id);
+	mutex_unlock(&fpriv->lock);
+
+	if (!sp)
+		return -EINVAL;
+
+	host1x_syncpt_put(sp);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
index fbef39726c29..e4e498facf61 100644
--- a/drivers/gpu/drm/tegra/uapi.h
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -21,6 +21,7 @@ struct tegra_drm_file {
 
 	/* New UAPI state */
 	struct xarray contexts;
+	struct xarray syncpoints;
 };
 
 struct tegra_drm_mapping {
@@ -44,6 +45,10 @@ int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
 				  struct drm_file *file);
 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 				   struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
+				       struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
+				   struct drm_file *file);
 
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
 void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
-- 
2.32.0

