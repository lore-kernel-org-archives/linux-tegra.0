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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B27C4320A
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4185060E93
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245170AbhH0NYf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245433AbhH0NYe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:34 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D51C0613D9
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:45 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id z4so10392922wrr.6
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T6ZWXMnWygGPmctQBKk9BzIeZRZGN1KZ4kRyQOtB3JQ=;
        b=DmARuFUyNRLuxDXQ6cdCA9IjjD1iVyFJPStM8EGYT2hSCtLy5yXkbYbQ9U4Heled8c
         /M9oqs3hUwKqcUNEUUBnwfLhhXL+JwJ6AsjvNlnQaWmD8Pbi58cnsnWSVuDUiSlNiEpD
         rWdSIDaAna8ljPFDT1yu9VceDm8jJpCxr5gG5gtk87Gv6132SrOvLOOtb1O2V18qWaUV
         vEdIXDNWfeg++sA9mhRQak6C2d/qHFucpmZ9X9K1IxunHFjOQfOPDnZtaBIGBdG+i3hU
         7Cm5zr1vXxcXXk+Nx5WhmUm3dJPAXk9Fv8VZ+GYv4kqQUWqO84tL10mTaxRZOeDW9cLx
         sZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T6ZWXMnWygGPmctQBKk9BzIeZRZGN1KZ4kRyQOtB3JQ=;
        b=q84VqCfSkMv5xXFmaP6RKr4qsI+eYDPjlIGgS1Z9Sxo5scixaoABrrnD6018ZjtyLS
         35DIbeH8Joy6+gqwwRvMZ4FEDvE4FFeChkr/47aNrv1bDjKBDALJbn15k4lA0PlqbFLA
         Uq4ky6zxCTZQp5BfGapKHVnSleZurMFVPvXJ+v1U5xsu28KM9k6EcxoBWvCvausMBkpu
         4PJOa4KcHUJOQWMAWDF3i3NN691EphdTs3j2msj0CUQMCdzp40UaGedUDdD9DMv3zxaJ
         oiEMr/n84rsos+lu8nrVdn10bRjWhougfLSDH0FoJYmf5SdcH3YWYc+abkoc+XcRS28k
         L9Rg==
X-Gm-Message-State: AOAM530zXoJ19ptLed9O7CSf4Z2z09VGujPH/nREaCQws6ZTBwCO/vcx
        I6KCvJkvTm8SHjq4eGoQNFo=
X-Google-Smtp-Source: ABdhPJwg5aSQfmlVy9FCPCnEDPzaPF84Szdq8juhRVgn9u1Rp21EVpdVNi419IQaUSV0jeKU6yselA==
X-Received: by 2002:adf:9f45:: with SMTP id f5mr6675335wrg.384.1630070624332;
        Fri, 27 Aug 2021 06:23:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u10sm6412051wrt.14.2021.08.27.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:42 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 16/25] tests: tegra: Add syncpt-wait test
Date:   Fri, 27 Aug 2021 15:22:56 +0200
Message-Id: <20210827132305.3572077-17-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is a very simple sanity test to check whether or not a syncpt can
be incremented by a host1x client. This uses gr2d on Tegra20 through
Tegra114 and VIC on Tegra124 and later.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build   |   9 +++
 tests/tegra/syncpt-wait.c | 151 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)
 create mode 100644 tests/tegra/syncpt-wait.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index b4aea33f4298..8b1b8bf58dd1 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -54,3 +54,12 @@ gr2d_fill = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+syncpt_wait = executable(
+  'tegra-syncpt-wait',
+  files('syncpt-wait.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : warn_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/syncpt-wait.c b/tests/tegra/syncpt-wait.c
new file mode 100644
index 000000000000..f18117425f6d
--- /dev/null
+++ b/tests/tegra/syncpt-wait.c
@@ -0,0 +1,151 @@
+/*
+ * Copyright © 2018 NVIDIA Corporation
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
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "tegra.h"
+
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+static int channel_open(struct drm_tegra *drm,
+                        struct drm_tegra_channel **channel)
+{
+    static const struct {
+        enum drm_tegra_class class;
+        const char *name;
+    } classes[] = {
+        { DRM_TEGRA_VIC,  "VIC"  },
+        { DRM_TEGRA_GR2D, "GR2D" },
+    };
+    unsigned int i;
+    int err;
+
+    for (i = 0; i < ARRAY_SIZE(classes); i++) {
+        err = drm_tegra_channel_open(drm, classes[i].class, channel);
+        if (err < 0) {
+            fprintf(stderr, "failed to open channel to %s: %s\n",
+                    classes[i].name, strerror(-err));
+            continue;
+        }
+
+        break;
+    }
+
+    return err;
+}
+
+int main(int argc, char *argv[])
+{
+    const char *device = "/dev/dri/renderD128";
+    struct drm_tegra_syncpoint *syncpt;
+    struct drm_tegra_channel *channel;
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    struct drm_tegra *drm;
+    uint32_t *ptr;
+    int fd, err;
+
+    if (argc > 1)
+        device = argv[1];
+
+    fd = open(device, O_RDWR);
+    if (fd < 0) {
+        fprintf(stderr, "open() failed: %s\n", strerror(errno));
+        return 1;
+    }
+
+    err = drm_tegra_new(fd, &drm);
+    if (err < 0) {
+        fprintf(stderr, "failed to open Tegra device: %s\n", strerror(-err));
+        close(fd);
+        return 1;
+    }
+
+    err = drm_tegra_syncpoint_new(drm, &syncpt);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate syncpoint: %s\n", strerror(-err));
+        drm_tegra_close(drm);
+        close(fd);
+        return 1;
+    }
+
+    err = channel_open(drm, &channel);
+    if (err < 0) {
+        fprintf(stderr, "failed to open channel: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_new(channel, &job);
+    if (err < 0) {
+        fprintf(stderr, "failed to create job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_get_pushbuf(job, &pushbuf);
+    if (err < 0) {
+        fprintf(stderr, "failed to create push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 4, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, syncpt,
+                                      DRM_TEGRA_SYNC_COND_IMMEDIATE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_wait(job, 250000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    drm_tegra_job_free(job);
+    drm_tegra_channel_close(channel);
+    drm_tegra_syncpoint_free(syncpt);
+    drm_tegra_close(drm);
+    close(fd);
+
+    return 0;
+}
-- 
2.32.0

