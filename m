Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82461C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiBQTUx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:20:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245105AbiBQTUs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:20:48 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616E4C3C3B
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:20:32 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id p14so9536702ejf.11
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tk/OH48XvBg3Yj1hF1+iSHnphu7CKNd/Jzy6pGBzzJw=;
        b=O7HcYGQhMaw54F2sc5KJdjSwuuyMwWJOBd1nLAvO2qI2LQV8YduqPPJZIxWvFFMKWl
         maP2A4xJ6jgUif2Tjehv/W3HfWk6GcfbKXnzh3bgZBOH74dsyd5qzFkZc4AFDuShEI8N
         mWaHQQbJAlrnUNaiosVpK51M1KqvfUOAN259sSR2bEpEgcXhXWOX4gulsaBlphAenp4T
         PwURapDgGL43HWjabiHLHd60uuks89DFdRiS8DqXC/JyBvwvxXdzqbJnD59TbN5jvGtK
         6xt+2JHfhw0Hlvwlfz9+tdiHER1Ezn6P762ZELGNYykNOdOSt1CZFIpEQ4EghSzntpHp
         X3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tk/OH48XvBg3Yj1hF1+iSHnphu7CKNd/Jzy6pGBzzJw=;
        b=t3Y0d378gLxl4PnmiSj/DB5UIplCohnF9T/MWYh3tofEQI/mVR5HTBEUM1iV5OJjqJ
         n9XOafvG4s0oLqg8VFlHQvGZCLvJuQ80I25Jrw4UwUsY3n6SEwouBHlX/lQKxKnVKrcP
         oyBNJJz4xV9cg957OKdHwijTebBP/qW/buhsMjC2jJW462zkaWoOdoQF+65o7Vb4ZrUl
         Mb5WjMdsCCi5mfybAzkeB83W0N+eelHAt8HPeQFe9LBzyqDO8wjaqX5FxN95U1b1YFzt
         0WbZ5b7+iFJ0DE7z5p+MLMFosxNTLV8VhVtnyc+uZxp2wov1fFH795tCKmKi+LVB4B6Y
         HfCA==
X-Gm-Message-State: AOAM532SsM0oueRhoXbHmd+Uyr4KO4FM8wTeEMMDFOx6ZRLoKSGVY52d
        z2mRPZvE7NIj4oa4/0Xwa/SuPRZkj48=
X-Google-Smtp-Source: ABdhPJxFVRpRv7RcwV/02HYZ9z5/pwmK+6WFFq8ItlCMtFUtXE8iFjwwQblydB4Ywwdy8q+x5s2hEQ==
X-Received: by 2002:a17:906:dfca:b0:6bb:c8d8:31c with SMTP id jt10-20020a170906dfca00b006bbc8d8031cmr3522862ejc.240.1645125630928;
        Thu, 17 Feb 2022 11:20:30 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id z22sm3927368edd.45.2022.02.17.11.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:20:30 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 13/25] tegra: Add syncpoint APIs
Date:   Thu, 17 Feb 2022 20:19:19 +0100
Message-Id: <20220217191931.2534836-8-thierry.reding@gmail.com>
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

These new functions can be used to allocate and free syncpoints, as well
as wait for a syncpoint threshold to be reached. Jobs can also be waited
on if a syncpoint was attached to them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/job.c             |  23 +++++++++
 tegra/meson.build       |   2 +-
 tegra/private.h         |   5 ++
 tegra/pushbuf.c         |  48 +++++++++++++++++++
 tegra/syncpt.c          | 101 ++++++++++++++++++++++++++++++++++++++++
 tegra/tegra-symbols.txt |   7 +++
 tegra/tegra.h           |  16 +++++++
 7 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 tegra/syncpt.c

diff --git a/tegra/job.c b/tegra/job.c
index c8c94e131ef0..75a344f1dcc5 100644
--- a/tegra/job.c
+++ b/tegra/job.c
@@ -162,3 +162,26 @@ drm_tegra_job_submit(struct drm_tegra_job *job, struct drm_tegra_fence *fence)
 
     return 0;
 }
+
+drm_public int
+drm_tegra_job_wait(struct drm_tegra_job *job, unsigned long timeout)
+{
+    struct drm_tegra_channel *channel = job->channel;
+    struct drm_tegra *drm = channel->drm;
+    struct drm_tegra_syncpoint_wait args;
+    struct timespec ts;
+    int err;
+
+    clock_gettime(CLOCK_MONOTONIC, &ts);
+
+    memset(&args, 0, sizeof(args));
+    args.timeout_ns = ts.tv_sec * 1000000000 + ts.tv_nsec + timeout;
+    args.id = job->syncpt.id;
+    args.threshold = job->syncpt.fence;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_SYNCPOINT_WAIT, &args);
+    if (err < 0)
+        return -errno;
+
+    return 0;
+}
diff --git a/tegra/meson.build b/tegra/meson.build
index 7698acec9ad0..0b63d7894f9d 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -22,7 +22,7 @@ libdrm_tegra = library(
   'drm_tegra',
   [
     files(
-      'channel.c', 'job.c', 'private.h', 'pushbuf.c', 'tegra.c'
+      'channel.c', 'job.c', 'private.h', 'pushbuf.c', 'syncpt.c', 'tegra.c'
     ),
     config_file
   ],
diff --git a/tegra/private.h b/tegra/private.h
index 970ee8ad66d4..f134f3ea2cea 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -104,4 +104,9 @@ struct drm_tegra_submit_cmd *
 drm_tegra_job_add_command(struct drm_tegra_job *job, uint32_t type,
                           uint32_t flags);
 
+struct drm_tegra_syncpoint {
+    struct drm_tegra *drm;
+    uint32_t id;
+};
+
 #endif /* __DRM_TEGRA_PRIVATE_H__ */
diff --git a/tegra/pushbuf.c b/tegra/pushbuf.c
index 380a50abbbb0..0c0212e127a7 100644
--- a/tegra/pushbuf.c
+++ b/tegra/pushbuf.c
@@ -101,6 +101,25 @@ drm_tegra_pushbuf_end(struct drm_tegra_pushbuf *pushbuf, uint32_t *ptr)
     return 0;
 }
 
+drm_public int
+drm_tegra_pushbuf_wait(struct drm_tegra_pushbuf *pushbuf,
+                       struct drm_tegra_syncpoint *syncpt,
+                       uint32_t value)
+{
+    struct drm_tegra_submit_cmd *command;
+
+    command = drm_tegra_job_add_command(pushbuf->job,
+                                        DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT,
+                                        0);
+    if (!command)
+        return -ENOMEM;
+
+    command->wait_syncpt.id = syncpt->id;
+    command->wait_syncpt.value = value;
+
+    return 0;
+}
+
 drm_public int
 drm_tegra_pushbuf_relocate(struct drm_tegra_pushbuf *pushbuf, uint32_t **ptrp,
                            struct drm_tegra_mapping *target,
@@ -134,3 +153,32 @@ drm_tegra_pushbuf_relocate(struct drm_tegra_pushbuf *pushbuf, uint32_t **ptrp,
 
     return 0;
 }
+
+drm_public int
+drm_tegra_pushbuf_sync(struct drm_tegra_pushbuf *pushbuf,
+                       struct drm_tegra_syncpoint *syncpt,
+                       unsigned int count)
+{
+    struct drm_tegra_job *job = pushbuf->job;
+
+    job->syncpt.increments += count;
+    job->syncpt.id = syncpt->id;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_pushbuf_sync_cond(struct drm_tegra_pushbuf *pushbuf, uint32_t **ptrp,
+                            struct drm_tegra_syncpoint *syncpt,
+                            enum drm_tegra_sync_cond cond)
+{
+    struct drm_tegra_channel *channel = pushbuf->job->channel;
+
+    if (cond >= DRM_TEGRA_SYNC_COND_MAX)
+        return -EINVAL;
+
+    *(*ptrp)++ = HOST1X_OPCODE_NONINCR(0x0, 0x1);
+    *(*ptrp)++ = cond << channel->cond_shift | syncpt->id;
+
+    return drm_tegra_pushbuf_sync(pushbuf, syncpt, 1);
+}
diff --git a/tegra/syncpt.c b/tegra/syncpt.c
new file mode 100644
index 000000000000..16014186fa30
--- /dev/null
+++ b/tegra/syncpt.c
@@ -0,0 +1,101 @@
+/*
+ * Copyright © 2021 NVIDIA Corporation
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
+drm_tegra_syncpoint_new(struct drm_tegra *drm,
+                        struct drm_tegra_syncpoint **syncptp)
+{
+    struct drm_tegra_syncpoint_allocate args;
+    struct drm_tegra_syncpoint *syncpt;
+    int err;
+
+    syncpt = calloc(1, sizeof(*syncpt));
+    if (!syncpt)
+        return -ENOMEM;
+
+    memset(&args, 0, sizeof(args));
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_SYNCPOINT_ALLOCATE, &args);
+    if (err < 0) {
+        free(syncpt);
+        return -errno;
+    }
+
+    syncpt->drm = drm;
+    syncpt->id = args.id;
+
+    *syncptp = syncpt;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_syncpoint_free(struct drm_tegra_syncpoint *syncpt)
+{
+    struct drm_tegra_syncpoint_free args;
+    struct drm_tegra *drm = syncpt->drm;
+    int err;
+
+    if (!syncpt)
+        return -EINVAL;
+
+    memset(&args, 0, sizeof(args));
+    args.id = syncpt->id;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_SYNCPOINT_FREE, &args);
+    if (err < 0)
+        return -errno;
+
+    free(syncpt);
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_fence_wait(struct drm_tegra_fence *fence, unsigned long timeout)
+{
+    struct drm_tegra_syncpoint_wait args;
+    struct drm_tegra *drm = fence->drm;
+    int err;
+
+    memset(&args, 0, sizeof(args));
+    args.timeout_ns = 0;
+    args.id = fence->syncpt;
+    args.threshold = fence->value;
+
+    err = ioctl(drm->fd, DRM_IOCTL_TEGRA_SYNCPOINT_WAIT, &args);
+    if (err < 0)
+        return -errno;
+
+    return 0;
+}
diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index da3972cb99e1..1a75c3d27c83 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -15,11 +15,18 @@ drm_tegra_channel_map
 drm_tegra_channel_open
 drm_tegra_channel_unmap
 drm_tegra_close
+drm_tegra_fence_wait
 drm_tegra_job_free
 drm_tegra_job_get_pushbuf
 drm_tegra_job_new
 drm_tegra_job_submit
+drm_tegra_job_wait
 drm_tegra_new
 drm_tegra_pushbuf_begin
 drm_tegra_pushbuf_end
 drm_tegra_pushbuf_relocate
+drm_tegra_pushbuf_sync
+drm_tegra_pushbuf_sync_cond
+drm_tegra_pushbuf_wait
+drm_tegra_syncpoint_free
+drm_tegra_syncpoint_new
diff --git a/tegra/tegra.h b/tegra/tegra.h
index 0213e3b11e04..8f3c0554f29b 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -65,6 +65,7 @@ struct drm_tegra_channel;
 struct drm_tegra_mapping;
 struct drm_tegra_pushbuf;
 struct drm_tegra_job;
+struct drm_tegra_syncpoint;
 
 enum drm_tegra_sync_cond {
     DRM_TEGRA_SYNC_COND_IMMEDIATE,
@@ -102,10 +103,25 @@ int drm_tegra_job_wait(struct drm_tegra_job *job, unsigned long timeout);
 int drm_tegra_pushbuf_begin(struct drm_tegra_pushbuf *pushbuf,
                             unsigned int words, uint32_t **ptrp);
 int drm_tegra_pushbuf_end(struct drm_tegra_pushbuf *pushbuf, uint32_t *ptr);
+int drm_tegra_pushbuf_wait(struct drm_tegra_pushbuf *pushbuf,
+                           struct drm_tegra_syncpoint *syncpt,
+                           uint32_t value);
 int drm_tegra_pushbuf_relocate(struct drm_tegra_pushbuf *pushbuf,
                                uint32_t **ptrp,
                                struct drm_tegra_mapping *target,
                                unsigned long offset, unsigned int shift,
                                uint32_t flags);
+int drm_tegra_pushbuf_sync(struct drm_tegra_pushbuf *pushbuf,
+                           struct drm_tegra_syncpoint *syncpt,
+                           unsigned int count);
+int drm_tegra_pushbuf_sync_cond(struct drm_tegra_pushbuf *pushbuf,
+                                uint32_t **ptrp,
+                                struct drm_tegra_syncpoint *syncpt,
+                                enum drm_tegra_sync_cond cond);
+
+int drm_tegra_syncpoint_new(struct drm_tegra *drm,
+                            struct drm_tegra_syncpoint **syncptp);
+int drm_tegra_syncpoint_free(struct drm_tegra_syncpoint *syncpt);
+int drm_tegra_fence_wait(struct drm_tegra_fence *fence, unsigned long timeout);
 
 #endif /* __DRM_TEGRA_H__ */
-- 
2.35.1

