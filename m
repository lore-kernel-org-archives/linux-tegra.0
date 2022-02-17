Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1B6C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245097AbiBQTUY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:20:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiBQTUX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:20:23 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74820C3C37
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:20:08 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id hw13so9546759ejc.9
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/SZ+FgAfr+kOkPIsRk6Vrc2Z3qvUkpazmSMFT/zX7/4=;
        b=CUSDqaLmxI2JUGNrWeHIfNOdr+eN7xgYk5qOctSmU09Xv5CT0rGmrVE6uzwmIX+dLy
         sAGsbrCwKI9Iypwr4kkt/uStwKuROEQiBySn0WtCWiSsVPRUqDpvDQQGDaSAzGsw3po3
         JZGdYaUAZF6Tb776M+9+x3McrQnrF/AiIVKjqgpYlOVZWYf+6Y9afrhc3eHKSSWebjxq
         B/d33EVBpt59fsRCLyEpfG36oa6rBpWYxQ04SYWDOS730w5RSWI4fLOmuulBvnXTXSME
         av9D1QRjNViEKHU/GbzamXNsw9nCLrM8nkSnA/qDtH3hZ7FAgvRuaxQmchcFOLY1G32+
         fBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/SZ+FgAfr+kOkPIsRk6Vrc2Z3qvUkpazmSMFT/zX7/4=;
        b=KOm7SktsHc8BV2//osB6cJ5ugv8tPw3K3BnGUvR1nLlqDR1mBPuvWLl8jue629llOI
         i6awo8Lt2PvW+dbMBlA4OMuYLeTiw/A5TxELjH1Au8bulG2GGhiFHByd69ffzirYVjMr
         EbLXh14Tu2kQJlgcwmavKNCMnQ2X33cQ2sWlqt2xSzUtjILSKvQEZ4Kbol2iDV9nivjP
         kw2o4L3DsWYyOUYkv9otzmzl1/ORW1PkdFYzgs5IGXKywNJEi/gl8j6H89DFeUDZQXh3
         8rvgaC9pXzJxQppSjaKpBx1aPPKP2kmcBpI6AjCcGNO43anHS/vcZrkcnsjHe3gTdHQC
         yrwQ==
X-Gm-Message-State: AOAM532qLH9jN4GbNJm6qD9eSbFUGbvhBit/YylKM5umtPwryMJ0Kdn2
        M/8ysk/TiEZ3E0/4TwyTLzE=
X-Google-Smtp-Source: ABdhPJwfAXm7GQsmjD1vJDCfrZswTkLDub7uCqEFKp5nGameasMhM75P4pltn/LYvqQQL3MbTDx5TA==
X-Received: by 2002:a17:907:98a5:b0:6ce:8c66:e75e with SMTP id ju5-20020a17090798a500b006ce8c66e75emr3775419ejc.239.1645125606999;
        Thu, 17 Feb 2022 11:20:06 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id f29sm1492410ejl.12.2022.02.17.11.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:20:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 11/25] tegra: Add channel APIs
Date:   Thu, 17 Feb 2022 20:19:17 +0100
Message-Id: <20220217191931.2534836-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These new functions can be used to open a channel to a given engine, map
and unmap buffer objects to that channel, and close the channel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/channel.c         | 195 ++++++++++++++++++++++++++++++++++++++++
 tegra/meson.build       |   2 +-
 tegra/private.h         |  24 +++++
 tegra/tegra-symbols.txt |   5 ++
 tegra/tegra.h           |  22 +++++
 5 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 tegra/channel.c

diff --git a/tegra/channel.c b/tegra/channel.c
new file mode 100644
index 000000000000..391362023259
--- /dev/null
+++ b/tegra/channel.c
@@ -0,0 +1,195 @@
+/*
+ * Copyright © 2012, 2013 Thierry Reding
+ * Copyright © 2013 Erik Faye-Lund
+ * Copyright © 2014-2021 NVIDIA Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifdef HAVE_CONFIG_H
+#  include "config.h"
+#endif
+
+#include <errno.h>
+#include <string.h>
+
+#include <sys/ioctl.h>
+
+#include "private.h"
+
+drm_public int
+drm_tegra_channel_open(struct drm_tegra *drm,
+                       enum drm_tegra_class client,
+                       struct drm_tegra_channel **channelp)
+{
+    struct drm_tegra_channel_open args;
+    struct drm_tegra_channel *channel;
+    enum host1x_class class;
+    int err;
+
+    switch (client) {
+    case DRM_TEGRA_HOST1X:
+        class = HOST1X_CLASS_HOST1X;
+        break;
+
+    case DRM_TEGRA_GR2D:
+        class = HOST1X_CLASS_GR2D;
+        break;
+
+    case DRM_TEGRA_GR3D:
+        class = HOST1X_CLASS_GR3D;
+        break;
+
+    case DRM_TEGRA_VIC:
+        class = HOST1X_CLASS_VIC;
+        break;
+
+    default:
+        return -EINVAL;
+    }
+
+    channel = calloc(1, sizeof(*channel));
+    if (!channel)
+        return -ENOMEM;
+
+    channel->drm = drm;
+
+    memset(&args, 0, sizeof(args));
+    args.host1x_class = class;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_OPEN, &args);
+    if (err < 0) {
+        free(channel);
+        return -errno;
+    }
+
+    channel->context = args.context;
+    channel->version = args.version;
+    channel->capabilities = args.capabilities;
+    channel->class = class;
+
+    switch (channel->version) {
+    case 0x20:
+    case 0x30:
+    case 0x35:
+    case 0x40:
+    case 0x21:
+        channel->cond_shift = 8;
+        break;
+
+    case 0x18:
+    case 0x19:
+        channel->cond_shift = 10;
+        break;
+
+    default:
+        return -ENOTSUP;
+    }
+
+    *channelp = channel;
+
+    return 0;
+}
+
+drm_public int drm_tegra_channel_close(struct drm_tegra_channel *channel)
+{
+    struct drm_tegra_channel_close args;
+    struct drm_tegra *drm;
+    int err;
+
+    if (!channel)
+        return -EINVAL;
+
+    drm = channel->drm;
+
+    memset(&args, 0, sizeof(args));
+    args.context = channel->context;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_CLOSE, &args);
+    if (err < 0)
+        return -errno;
+
+    free(channel);
+
+    return 0;
+}
+
+drm_public unsigned int
+drm_tegra_channel_get_version(struct drm_tegra_channel *channel)
+{
+    return channel->version;
+}
+
+drm_public int
+drm_tegra_channel_map(struct drm_tegra_channel *channel,
+                      struct drm_tegra_bo *bo, uint32_t flags,
+                      struct drm_tegra_mapping **mapp)
+{
+    struct drm_tegra *drm = channel->drm;
+    struct drm_tegra_channel_map args;
+    struct drm_tegra_mapping *map;
+    int err;
+
+    if (!drm || !bo || !mapp)
+        return -EINVAL;
+
+    map = calloc(1, sizeof(*map));
+    if (!map)
+        return -ENOMEM;
+
+    memset(&args, 0, sizeof(args));
+    args.context = channel->context;
+    args.handle = bo->handle;
+    args.flags = flags;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_MAP, &args);
+    if (err < 0) {
+        free(map);
+        return -errno;
+    }
+
+    map->channel = channel;
+    map->id = args.mapping;
+    *mapp = map;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_channel_unmap(struct drm_tegra_mapping *map)
+{
+    struct drm_tegra_channel *channel = map->channel;
+    struct drm_tegra *drm = channel->drm;
+    struct drm_tegra_channel_unmap args;
+    int err;
+
+    if (!channel || !map)
+        return -EINVAL;
+
+    memset(&args, 0, sizeof(args));
+    args.context = channel->context;
+    args.mapping = map->id;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_CHANNEL_UNMAP, &args);
+    if (err < 0)
+        return -errno;
+
+    free(map);
+    return 0;
+}
diff --git a/tegra/meson.build b/tegra/meson.build
index 53724d2107f5..34900c896f15 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -22,7 +22,7 @@ libdrm_tegra = library(
   'drm_tegra',
   [
     files(
-      'private.h', 'tegra.c'
+      'channel.c', 'private.h', 'tegra.c'
     ),
     config_file
   ],
diff --git a/tegra/private.h b/tegra/private.h
index d0f2944bfb3a..7c05276707bf 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -31,8 +31,17 @@
 #include <libdrm_macros.h>
 #include <xf86atomic.h>
 
+#include "tegra_drm.h"
 #include "tegra.h"
 
+enum host1x_class {
+    HOST1X_CLASS_HOST1X = 0x01,
+    HOST1X_CLASS_GR2D = 0x51,
+    HOST1X_CLASS_GR2D_SB = 0x52,
+    HOST1X_CLASS_VIC = 0x5d,
+    HOST1X_CLASS_GR3D = 0x60,
+};
+
 struct drm_tegra {
     bool close;
     int fd;
@@ -48,4 +57,19 @@ struct drm_tegra_bo {
     void *map;
 };
 
+struct drm_tegra_channel {
+    struct drm_tegra *drm;
+    enum host1x_class class;
+    uint32_t capabilities;
+    unsigned int version;
+    uint64_t context;
+
+    unsigned int cond_shift;
+};
+
+struct drm_tegra_mapping {
+    struct drm_tegra_channel *channel;
+    uint32_t id;
+};
+
 #endif /* __DRM_TEGRA_PRIVATE_H__ */
diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index f8811bcd26f4..c16a351171f1 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -9,5 +9,10 @@ drm_tegra_bo_ref
 drm_tegra_bo_unmap
 drm_tegra_bo_unref
 drm_tegra_bo_wrap
+drm_tegra_channel_close
+drm_tegra_channel_get_version
+drm_tegra_channel_map
+drm_tegra_channel_open
+drm_tegra_channel_unmap
 drm_tegra_close
 drm_tegra_new
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 2bcd596e2d61..621fef6b7000 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -28,6 +28,15 @@
 #include <stdint.h>
 #include <stdlib.h>
 
+#include <tegra_drm.h>
+
+enum drm_tegra_class {
+    DRM_TEGRA_HOST1X,
+    DRM_TEGRA_GR2D,
+    DRM_TEGRA_GR3D,
+    DRM_TEGRA_VIC,
+};
+
 struct drm_tegra_bo;
 struct drm_tegra;
 
@@ -52,4 +61,17 @@ int drm_tegra_bo_export(struct drm_tegra_bo *bo, uint32_t flags);
 int drm_tegra_bo_import(struct drm_tegra *drm, int fd,
                         struct drm_tegra_bo **bop);
 
+struct drm_tegra_channel;
+struct drm_tegra_mapping;
+
+int drm_tegra_channel_open(struct drm_tegra *drm,
+                           enum drm_tegra_class client,
+                           struct drm_tegra_channel **channelp);
+int drm_tegra_channel_close(struct drm_tegra_channel *channel);
+unsigned int drm_tegra_channel_get_version(struct drm_tegra_channel *channel);
+int drm_tegra_channel_map(struct drm_tegra_channel *channel,
+                          struct drm_tegra_bo *bo, uint32_t flags,
+                          struct drm_tegra_mapping **mapp);
+int drm_tegra_channel_unmap(struct drm_tegra_mapping *map);
+
 #endif /* __DRM_TEGRA_H__ */
-- 
2.35.1

