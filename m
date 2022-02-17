Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D93C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245109AbiBQTVf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:21:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245105AbiBQTVe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:21:34 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DAF7C3C37
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:21:19 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id f17so11504901edd.2
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PLg06xcpVyzhs8BjM9iap5lP+80pqbLcIRSWclBZPRc=;
        b=Ck681jzrBJmR2dD4GzVgdXiAS5AuQf+bPid09+kGbjM2wFqqChg4rOBC9Yi5qzkS7H
         xef0kPqY6UoSmXx7jDlaA13Kv2Xsix6dF/0SM2HPzky0WKohl6yHEaFgm2QfTTpL4Xrc
         F3WiCwDJJjOzoBbGpfgZJXxsQuNj+G4u0Ul70td1GonWQaBdA1yxCBDsdCLWFMOqoJyw
         trzizWF0pqOvzyOYoB14/cComLerz2NJMTjk9KU+GRZh8T6ar7arFVkwQjTsvOqzB0Mc
         oBqPB1rRzjM+WVHROIRF594P1RlzPwC3CREtfSr7lPpRiK/126XCCFm3cCyRWs7ej6vJ
         r2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PLg06xcpVyzhs8BjM9iap5lP+80pqbLcIRSWclBZPRc=;
        b=Vld88LPX0Lgk7dPokiVgshyvJ4Cq+3CRoxRQI7cW+dyHAIYKk84p6xP0H+AwnONVz2
         If0VjNfccckbKh4BbhRx3WPcL87xLegmxXd+OeBGWImDDRIbx0d/duFk/Jn1wnJ4c30y
         yzlgX5FbLyzPP1h0TbZvqcxqNq2pAf3LhmXJt5uIEFjxnGSCIXWs5z+GZvhUO179Fees
         aWKrXP761kCsntNPeuLKvgpvxJYuzsgVG5Ugfxxckt9X0caPos+TFwZdzAnLbWOGZPYm
         Hoa97dF7141oqUDuGK8MLmUkTeELZGx+DSpZuF6dCnmOKB3afrokEn3k8odSP0Wonn3u
         cYWQ==
X-Gm-Message-State: AOAM533XE6Qbwatm0+7ZKsPZ4K7BdmLaeGhylubgzHux+UgQkkmovVvB
        Ge5KaOXZlF6HHdvO3dFufrc=
X-Google-Smtp-Source: ABdhPJydNsI+UNeR01fw/OxxSX3zzdN0Bza14KVpoY5R41pUQFuMxDgrx65T3BGd+iuApcxtbrl7DA==
X-Received: by 2002:a05:6402:50c7:b0:40a:276f:cc78 with SMTP id h7-20020a05640250c700b0040a276fcc78mr4226186edb.349.1645125677803;
        Thu, 17 Feb 2022 11:21:17 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id i27sm1461924ejo.214.2022.02.17.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:21:17 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 17/25] tests: tegra: Add syncpoint timeout test
Date:   Thu, 17 Feb 2022 20:19:23 +0100
Message-Id: <20220217191931.2534836-12-thierry.reding@gmail.com>
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

This test can be used to purposefully trigger a job timeout.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build      |   9 ++
 tests/tegra/syncpt-timeout.c | 163 +++++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 tests/tegra/syncpt-timeout.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 8602709e8694..983b91195ba3 100644
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
+  c_args : libdrm_c_args,
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
2.35.1

