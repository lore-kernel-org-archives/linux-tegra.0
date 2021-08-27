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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C38C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9A1460FC4
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245433AbhH0NYh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245172AbhH0NYh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:37 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E7DC061757
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:48 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h13so10453771wrp.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LbELmXWMHSKxwOrAgarH0W+SEsR9r8MnvJdNy39oRdg=;
        b=o9G0iOloJd+JvRzjTnGgsRAw9tI7iwnE06qhQJ13YkFcBlSYN6eD3LdpA4Ib/9+91V
         g4g4fc9Jwh6Z/+aukIAtiLkUWVNdPK+2p7CEJaENUdiEyK7X0K+ruq0L4yC7vYSfnOb7
         lgFQbCnnhcKXEjuvNmPlWjnVHs3xIb+jIsvqomyOc0jH1tmbmeLz9UjEXUlmcHKwr8EL
         Xec9YxNjWwVveZVcumEpvXvGpvIRAGZxhhXkCekttC8KRrST2v0fyGeTubmMycg1zCY4
         BYrUs3zfCoaZeycxi2f5KJ3qJWoKRy2bS77E48V8k53Cx2AbspQUzOfhjfs7XSpVyX8K
         mOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LbELmXWMHSKxwOrAgarH0W+SEsR9r8MnvJdNy39oRdg=;
        b=QkUVIMAHfQF7xoY10PM0HhVNfwRRczBvqvB0RiE29TwjQehh32+to02m4P2lGAu60H
         up9Z9NlOfJR+4M/k2Pf/0IJcl+IMaFdesA0whiRQ5KzpvBkSw4oLR5HC3q+o3Y213Ab8
         rxGvYzV65oXnEvN6VQns+Q99EQPVSvFyibVFNAdgPRcXC24lLBTCDfD+iKiVJdNOmdPy
         EQy7YOyLcR+OGDfGNpVrZ65rU01Ff0Ir6emPzANEZZcd4MpFsxvT84kK1azwdH8XqEXL
         m2N1NoqGe5ZIOlikGjKL6FEwYSfKdB8EnQT9QSH9GZaUkyLvGRxu+yTh0tTxIfppdSTB
         kDKA==
X-Gm-Message-State: AOAM531z7Yy/KSzUX1JLyTT2NutzIHlVTOMCiWsjWD/QP8BpUUtU9O0b
        uc4DhwytwCBn/ApC5wA0kGiFmELMsCc=
X-Google-Smtp-Source: ABdhPJzjdAShCedkgxVIO9rqBS+5OS3pdycCPXXtI9InTLp4lTJ4mkaJm/MTGCqb1IBCmKGvpuYNMw==
X-Received: by 2002:adf:e78d:: with SMTP id n13mr10249418wrm.55.1630070627089;
        Fri, 27 Aug 2021 06:23:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d8sm6922081wrv.20.2021.08.27.06.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 17/25] tests: tegra: Add syncpoint timeout test
Date:   Fri, 27 Aug 2021 15:22:57 +0200
Message-Id: <20210827132305.3572077-18-thierry.reding@gmail.com>
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

This test can be used to purposefully trigger a job timeout.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build      |   9 ++
 tests/tegra/syncpt-timeout.c | 163 +++++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 tests/tegra/syncpt-timeout.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 8b1b8bf58dd1..4b05569e0971 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -63,3 +63,12 @@ syncpt_wait = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+syncpt_timeout = executable(
+  'tegra-syncpt-timeout',
+  files('syncpt-timeout.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : warn_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/syncpt-timeout.c b/tests/tegra/syncpt-timeout.c
new file mode 100644
index 000000000000..fea3665cb126
--- /dev/null
+++ b/tests/tegra/syncpt-timeout.c
@@ -0,0 +1,163 @@
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 8, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    /*
+     * Empty command streams will be rejected, so we use this as an easy way
+     * to add something to the command stream. But this could be any other,
+     * valid command stream.
+     */
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, syncpt,
+                                      DRM_TEGRA_SYNC_COND_IMMEDIATE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return 1;
+    }
+
+    /* pretend that the syncpoint was incremented a second time */
+    err = drm_tegra_pushbuf_sync(pushbuf, syncpt, 1);
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
+    err = drm_tegra_job_wait(job, 250000);
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

