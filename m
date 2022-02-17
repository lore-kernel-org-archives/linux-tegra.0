Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED12EC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244868AbiBQTVX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:21:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245105AbiBQTVW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:21:22 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81962C3C3B
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:21:07 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id k25so9599888ejp.5
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HTKok7TvgpY6QNzI+oRZeDcw++fUDYiHS6n1/vtZ/0k=;
        b=RqqUxwZma9dM24nZg69u+Qgrk+hrBk/pS5XZsSD4wzsNl6aYvfDNo4XbP0kLsTyF4a
         8cJ+99qTFE87gcarcVPn044T9FdcnPM2c4xt0k3u4bLRIfRjh4tPSUk1owdmVH4gaeMF
         U2LF9DJpvqllyoLn6nxpEr5tjKgqbkOUnoXk0Vpt1UH4mot+r0/11AdkOE/Rix+1wP7O
         59guoR2H4IsGhp7JphY1grRCvx6d7bhqQbrTkAKo81wRlBvgQwL3gVrPjw6PkEpCOsRa
         11AB5XQlM737Nu8FxcyFRS5sZWmIrS7wJq5XaB1dAtQ2SCfyK4jleeT5OBTZdl7Ltji/
         pTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HTKok7TvgpY6QNzI+oRZeDcw++fUDYiHS6n1/vtZ/0k=;
        b=eG9kqX5IH9FXe750btnX7ylfvzebgBGpIY7/yvd4qiAd6zRFMwagpP6dPyJqDbreoh
         p2LGikf5ecoXuZA2gRHWll7tMEDHYfRBnUjVtEDNr3FA4M9fJM6L06CPa68Dg2oRDFvk
         +ScbfAIqMR6r+OpK0Jn5X8PUJY13uWfMbTuVRrk0gzRcoQ54TMk3aC5uxFq+et4W1vRM
         585bVcKSrWJGJP7rMfwouX+6Vd5x56rXPsCHy+QxFLXqiWy7ZHZusQHoOn6u0f1s+qGK
         IrYEkqORsNFlJ87oWNXjcaJDYeoof3ik0P5PJ6HP8AE50eMheTU9P36mqHh8uGbb5VL/
         w6tw==
X-Gm-Message-State: AOAM530hW80Lz7YMblH/q+ZoKI20uGeiN4ERnGqtyXYHZkZyusUL20bt
        MJ3JKU23nJmoU7AkQTSB2zw=
X-Google-Smtp-Source: ABdhPJx0FhYWKBvWBVDT4ju8u4njMBSHB48O6TUDkykhR0ukryBkFJruNoc7GpoPOX/DEPSZkKCGrQ==
X-Received: by 2002:a17:906:ae56:b0:6ce:375a:4b93 with SMTP id lf22-20020a170906ae5600b006ce375a4b93mr3611118ejb.189.1645125666031;
        Thu, 17 Feb 2022 11:21:06 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id i27sm1461760ejo.214.2022.02.17.11.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:21:05 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 16/25] tests: tegra: Add syncpt-wait test
Date:   Thu, 17 Feb 2022 20:19:22 +0100
Message-Id: <20220217191931.2534836-11-thierry.reding@gmail.com>
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
index 337fee8c6246..8602709e8694 100644
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
+  c_args : libdrm_c_args,
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
2.35.1

