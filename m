Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B568CC072AD
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B37022795
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbhAKNCI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 08:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728977AbhAKNCG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 08:02:06 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB245C0617BA
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=qwBkWS2+aPjAOQgUEip8lG7nJZAsdhHQsAwmIStamgk=; b=tNo1GpMpANqOm7kcZzD7Dej4tJ
        PJf3TCC6AxcScZCRwMJdcJoy2kGWCTZjzffRIHIimJBItMcRLM6hi7Y9sxSY4pyPLpiTUGA3zcUge
        +X+C8y4G2s3Aaah6R0H1fW/neMILO/FENwGRk7Nzh95E7KdrueOr8AgzKPN8HDnlzeT/opK/1hB2L
        onM31KUdlHi9hNGN0dLNKGlcfxh+FQ+6G+Doepy52+Ze+BhHBAs+rb/BssdIpFATeotoLAcxt9Gu3
        EouhiRGtDUV6WMsQmRRFpWFIZTNhr9EpgGrXrjBAFpT7ffmf6bngquf8y1LF/41ozGY/U1ygILthi
        Q7hCZFsg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kywo7-0002tl-Lw; Mon, 11 Jan 2021 15:00:27 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 19/21] drm/tegra: Implement new UAPI
Date:   Mon, 11 Jan 2021 15:00:17 +0200
Message-Id: <20210111130019.3515669-20-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Implement the non-submission parts of the new UAPI, including
channel management and memory mapping. The UAPI is under the
CONFIG_DRM_TEGRA_STAGING config flag for now.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Set iova_end in both mapping paths
v4:
* New patch, split out from combined UAPI + submit patch.
---
 drivers/gpu/drm/tegra/Makefile    |   1 +
 drivers/gpu/drm/tegra/drm.c       |  41 ++--
 drivers/gpu/drm/tegra/drm.h       |   5 +
 drivers/gpu/drm/tegra/uapi.h      |  63 ++++++
 drivers/gpu/drm/tegra/uapi/uapi.c | 307 ++++++++++++++++++++++++++++++
 5 files changed, 401 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/uapi.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index d6cf202414f0..0abdb21b38b9 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -3,6 +3,7 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
 
 tegra-drm-y := \
 	drm.o \
+	uapi/uapi.o \
 	gem.o \
 	fb.o \
 	dp.o \
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index afd3f143c5e0..6a51035ce33f 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -20,6 +20,7 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#include "uapi.h"
 #include "drm.h"
 #include "gem.h"
 
@@ -33,11 +34,6 @@
 #define CARVEOUT_SZ SZ_64M
 #define CDMA_GATHER_FETCHES_MAX_NB 16383
 
-struct tegra_drm_file {
-	struct idr contexts;
-	struct mutex lock;
-};
-
 static int tegra_atomic_check(struct drm_device *drm,
 			      struct drm_atomic_state *state)
 {
@@ -90,7 +86,8 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	if (!fpriv)
 		return -ENOMEM;
 
-	idr_init_base(&fpriv->contexts, 1);
+	idr_init_base(&fpriv->legacy_contexts, 1);
+	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
@@ -429,7 +426,7 @@ static int tegra_client_open(struct tegra_drm_file *fpriv,
 	if (err < 0)
 		return err;
 
-	err = idr_alloc(&fpriv->contexts, context, 1, 0, GFP_KERNEL);
+	err = idr_alloc(&fpriv->legacy_contexts, context, 1, 0, GFP_KERNEL);
 	if (err < 0) {
 		client->ops->close_channel(context);
 		return err;
@@ -484,13 +481,13 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -EINVAL;
 		goto unlock;
 	}
 
-	idr_remove(&fpriv->contexts, context->id);
+	idr_remove(&fpriv->legacy_contexts, context->id);
 	tegra_drm_context_free(context);
 
 unlock:
@@ -509,7 +506,7 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -538,7 +535,7 @@ static int tegra_submit(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -563,7 +560,7 @@ static int tegra_get_syncpt_base(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -732,10 +729,21 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
 
 static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 #ifdef CONFIG_DRM_TEGRA_STAGING
-	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create,
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_OPEN, tegra_drm_ioctl_channel_open,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_CLOSE, tegra_drm_ioctl_channel_close,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_MAP, tegra_drm_ioctl_channel_map,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap,
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
+			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE_LEGACY, tegra_gem_create, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP_LEGACY, tegra_gem_mmap, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_READ, tegra_syncpt_read,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_INCR, tegra_syncpt_incr,
@@ -789,10 +797,11 @@ static void tegra_drm_postclose(struct drm_device *drm, struct drm_file *file)
 	struct tegra_drm_file *fpriv = file->driver_priv;
 
 	mutex_lock(&fpriv->lock);
-	idr_for_each(&fpriv->contexts, tegra_drm_context_cleanup, NULL);
+	idr_for_each(&fpriv->legacy_contexts, tegra_drm_context_cleanup, NULL);
+	tegra_drm_uapi_close_file(fpriv);
 	mutex_unlock(&fpriv->lock);
 
-	idr_destroy(&fpriv->contexts);
+	idr_destroy(&fpriv->legacy_contexts);
 	mutex_destroy(&fpriv->lock);
 	kfree(fpriv);
 }
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 0f38f159aa8e..1af57c2016eb 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -59,6 +59,11 @@ struct tegra_drm {
 	struct tegra_display_hub *hub;
 };
 
+static inline struct host1x *tegra_drm_to_host1x(struct tegra_drm *tegra)
+{
+	return dev_get_drvdata(tegra->drm->dev->parent);
+}
+
 struct tegra_drm_client;
 
 struct tegra_drm_context {
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
new file mode 100644
index 000000000000..5c422607e8fa
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#ifndef _TEGRA_DRM_UAPI_H
+#define _TEGRA_DRM_UAPI_H
+
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/kref.h>
+#include <linux/xarray.h>
+
+#include <drm/drm.h>
+
+struct drm_file;
+struct drm_device;
+
+struct tegra_drm_file {
+	/* Legacy UAPI state */
+	struct idr legacy_contexts;
+	struct mutex lock;
+
+	/* New UAPI state */
+	struct xarray contexts;
+};
+
+struct tegra_drm_channel_ctx {
+	struct tegra_drm_client *client;
+	struct host1x_channel *channel;
+	struct xarray mappings;
+};
+
+struct tegra_drm_mapping {
+	struct kref ref;
+
+	struct device *dev;
+	struct host1x_bo *bo;
+	struct sg_table *sgt;
+	enum dma_data_direction direction;
+	dma_addr_t iova;
+	dma_addr_t iova_end;
+};
+
+int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
+				 struct drm_file *file);
+int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
+				  struct drm_file *file);
+int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
+				struct drm_file *file);
+int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
+				struct drm_file *file);
+int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
+				   struct drm_file *file);
+int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
+				struct drm_file *file);
+int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
+				struct drm_file *file);
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
+void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
+struct tegra_drm_channel_ctx *
+tegra_drm_channel_ctx_lock(struct tegra_drm_file *file, u32 id);
+
+#endif
diff --git a/drivers/gpu/drm/tegra/uapi/uapi.c b/drivers/gpu/drm/tegra/uapi/uapi.c
new file mode 100644
index 000000000000..d503b5e817c4
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/uapi.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/list.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+
+#include "../uapi.h"
+#include "../drm.h"
+
+struct tegra_drm_channel_ctx *
+tegra_drm_channel_ctx_lock(struct tegra_drm_file *file, u32 id)
+{
+	struct tegra_drm_channel_ctx *ctx;
+
+	mutex_lock(&file->lock);
+	ctx = xa_load(&file->contexts, id);
+	if (!ctx)
+		mutex_unlock(&file->lock);
+
+	return ctx;
+}
+
+static void tegra_drm_mapping_release(struct kref *ref)
+{
+	struct tegra_drm_mapping *mapping =
+		container_of(ref, struct tegra_drm_mapping, ref);
+
+	if (mapping->sgt)
+		dma_unmap_sgtable(mapping->dev, mapping->sgt,
+				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
+
+	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
+	host1x_bo_put(mapping->bo);
+
+	kfree(mapping);
+}
+
+void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping)
+{
+	kref_put(&mapping->ref, tegra_drm_mapping_release);
+}
+
+static void tegra_drm_channel_ctx_close(struct tegra_drm_channel_ctx *ctx)
+{
+	unsigned long mapping_id;
+	struct tegra_drm_mapping *mapping;
+
+	xa_for_each(&ctx->mappings, mapping_id, mapping)
+		tegra_drm_mapping_put(mapping);
+
+	xa_destroy(&ctx->mappings);
+
+	host1x_channel_put(ctx->channel);
+
+	kfree(ctx);
+}
+
+int close_channel_ctx(int id, void *p, void *data)
+{
+	struct tegra_drm_channel_ctx *ctx = p;
+
+	tegra_drm_channel_ctx_close(ctx);
+
+	return 0;
+}
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
+{
+	unsigned long ctx_id;
+	struct tegra_drm_channel_ctx *ctx;
+
+	xa_for_each(&file->contexts, ctx_id, ctx)
+		tegra_drm_channel_ctx_close(ctx);
+
+	xa_destroy(&file->contexts);
+}
+
+int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
+				 struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct tegra_drm *tegra = drm->dev_private;
+	struct drm_tegra_channel_open *args = data;
+	struct tegra_drm_client *client = NULL;
+	struct tegra_drm_channel_ctx *ctx;
+	int err;
+
+	if (args->flags)
+		return -EINVAL;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	err = -ENODEV;
+	list_for_each_entry(client, &tegra->clients, list) {
+		if (client->base.class == args->host1x_class) {
+			err = 0;
+			break;
+		}
+	}
+	if (err)
+		goto free_ctx;
+
+	if (client->shared_channel) {
+		ctx->channel = host1x_channel_get(client->shared_channel);
+	} else {
+		ctx->channel = host1x_channel_request(&client->base);
+		if (!ctx->channel) {
+			err = -EBUSY;
+			goto free_ctx;
+		}
+	}
+
+	err = xa_alloc(&fpriv->contexts, &args->channel_ctx, ctx,
+		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
+	if (err < 0)
+		goto put_channel;
+
+	ctx->client = client;
+	xa_init_flags(&ctx->mappings, XA_FLAGS_ALLOC1);
+
+	args->hardware_version = client->version;
+
+	return 0;
+
+put_channel:
+	host1x_channel_put(ctx->channel);
+free_ctx:
+	kfree(ctx);
+
+	return err;
+}
+
+int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
+				  struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_close *args = data;
+	struct tegra_drm_channel_ctx *ctx;
+
+	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
+	if (!ctx)
+		return -EINVAL;
+
+	xa_erase(&fpriv->contexts, args->channel_ctx);
+
+	mutex_unlock(&fpriv->lock);
+
+	tegra_drm_channel_ctx_close(ctx);
+
+	return 0;
+}
+
+int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
+				struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_map *args = data;
+	struct tegra_drm_channel_ctx *ctx;
+	struct tegra_drm_mapping *mapping;
+	struct drm_gem_object *gem;
+	u32 mapping_id;
+	int err = 0;
+
+	if (args->flags & ~DRM_TEGRA_CHANNEL_MAP_READWRITE)
+		return -EINVAL;
+
+	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
+	if (!ctx)
+		return -EINVAL;
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping) {
+		err = -ENOMEM;
+		goto unlock;
+	}
+
+	kref_init(&mapping->ref);
+
+	gem = drm_gem_object_lookup(file, args->handle);
+	if (!gem) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	mapping->dev = ctx->client->base.dev;
+	mapping->bo = &container_of(gem, struct tegra_bo, gem)->base;
+
+	if (!iommu_get_domain_for_dev(mapping->dev) ||
+	    ctx->client->base.group) {
+		host1x_bo_pin(mapping->dev, mapping->bo,
+			      &mapping->iova);
+	} else {
+		mapping->direction = DMA_TO_DEVICE;
+		if (args->flags & DRM_TEGRA_CHANNEL_MAP_READWRITE)
+			mapping->direction = DMA_BIDIRECTIONAL;
+
+		mapping->sgt =
+			host1x_bo_pin(mapping->dev, mapping->bo, NULL);
+		if (IS_ERR(mapping->sgt)) {
+			err = PTR_ERR(mapping->sgt);
+			goto put_gem;
+		}
+
+		err = dma_map_sgtable(mapping->dev, mapping->sgt,
+				      mapping->direction,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+		if (err)
+			goto unpin;
+
+		/* TODO only map the requested part */
+		mapping->iova = sg_dma_address(mapping->sgt->sgl);
+	}
+
+	mapping->iova_end = mapping->iova + gem->size;
+
+	mutex_unlock(&fpriv->lock);
+
+	err = xa_alloc(&ctx->mappings, &mapping_id, mapping,
+		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
+	if (err < 0)
+		goto unmap;
+
+	args->mapping_id = mapping_id;
+
+	return 0;
+
+unmap:
+	if (mapping->sgt) {
+		dma_unmap_sgtable(mapping->dev, mapping->sgt,
+				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
+	}
+unpin:
+	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
+put_gem:
+	drm_gem_object_put(gem);
+	kfree(mapping);
+unlock:
+	mutex_unlock(&fpriv->lock);
+	return err;
+}
+
+int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
+				  struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_unmap *args = data;
+	struct tegra_drm_channel_ctx *ctx;
+	struct tegra_drm_mapping *mapping;
+
+	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
+	if (!ctx)
+		return -EINVAL;
+
+	mapping = xa_erase(&ctx->mappings, args->mapping_id);
+
+	mutex_unlock(&fpriv->lock);
+
+	if (mapping) {
+		tegra_drm_mapping_put(mapping);
+		return 0;
+	} else {
+		return -EINVAL;
+	}
+}
+
+int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
+			       struct drm_file *file)
+{
+	struct drm_tegra_gem_create *args = data;
+	struct tegra_bo *bo;
+
+	if (args->flags)
+		return -EINVAL;
+
+	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
+					 &args->handle);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	return 0;
+}
+
+int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
+			     struct drm_file *file)
+{
+	struct drm_tegra_gem_mmap *args = data;
+	struct drm_gem_object *gem;
+	struct tegra_bo *bo;
+
+	gem = drm_gem_object_lookup(file, args->handle);
+	if (!gem)
+		return -EINVAL;
+
+	bo = to_tegra_bo(gem);
+
+	args->offset = drm_vma_node_offset_addr(&bo->gem.vma_node);
+
+	drm_gem_object_put(gem);
+
+	return 0;
+}
-- 
2.30.0

