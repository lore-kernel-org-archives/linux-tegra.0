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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978CAC4320A
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 868866056C
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245265AbhH0NYy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245244AbhH0NYy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:54 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F5AC061757
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:24:05 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d26so10491988wrc.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gReCx/RYqHeEw0OorNM5z7a0NQpUD6+EvQt/5ylr3mg=;
        b=pFQ4eAOWG8j4+4HM17sdmKctg+Qzt0K+WJ8L5bialTjOKNbxBqsh5xfUgRmec+7HyN
         aw2N2PoQnc0Bfub0RefTxubzL12vdlDL4H82WM4dxJa9AcixOL2ZWlrkgg+3USO+brHo
         HD1pjIIclUWFfgv7/1kafjdGU+3JMd1/dthIKGfj5eRjeaWWTdnXLSEd1NKUuBex+gEO
         YaWc9fPlSp6ntGM7ilInylEnN8gzsqpeoAA+wHy/7ILEM7ehe0qlJEqx7YQ7QV0ffHw1
         sg2XeAXFvTX4o/7znsRNKuPr/b1pgGKYRAKOmI0h/PoPmrvqWgOFAIh5IPJw2rK0nYGw
         tHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gReCx/RYqHeEw0OorNM5z7a0NQpUD6+EvQt/5ylr3mg=;
        b=PKnUyLPPBY46lc90ox+WdTrP8AQcNTHxWcRVrWfGBkdPKPijsN9NcQa9CiYRgZbMDZ
         xbDPrziHIPUV5kyI1DfwcoEi1cIVsR8GtEJlab8H+Nd2Zn4RarAm9ux5dT4yilx4TRyZ
         v7dZMlKas2tzpq29UPvrgluWbEIBK8R5N0od3L9/CKy07AKT6Xeke3yaOfOwwMg2j5qg
         sZ5qYmsRuRBDN5NRaizrAr4iGB9pHxbh6inLRL1Qhr4m5F8xcjBMIbA1J2Pe8Fqw3qYK
         zamsf+lh5yAreSqaoqXWI0s7A+F4qQ4W8c2y03xxmDrwf0+fujBMrgAq/jpLyoWjZE/U
         laMw==
X-Gm-Message-State: AOAM533cfXdVes1fJC5HAILhr/WhPXWo1sSCXJ3oSrQqj3QIfT/VR1xT
        oEJMtcm+gtYZr3tO08ndtZ0=
X-Google-Smtp-Source: ABdhPJxzkCO8eIPpjOxZXNbtUwSr2q74f2paen8YhP062jiBDfwUqUVBBWM0ouweQONqA6QRcyAq9Q==
X-Received: by 2002:a05:6000:343:: with SMTP id e3mr2469187wre.96.1630070644067;
        Fri, 27 Aug 2021 06:24:04 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id h11sm7661885wrx.9.2021.08.27.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:24:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 23/25] tests: tegra: Add VIC clear test
Date:   Fri, 27 Aug 2021 15:23:03 +0200
Message-Id: <20210827132305.3572077-24-thierry.reding@gmail.com>
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

This test will attempt to use VIC to clear a surface.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   9 +++
 tests/tegra/vic-clear.c | 173 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 tests/tegra/vic-clear.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index d71d3d564efe..e44bd3a4393d 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -82,3 +82,12 @@ syncpt_timeout = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+vic_clear = executable(
+  'tegra-vic-clear',
+  files('vic-clear.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : warn_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/vic-clear.c b/tests/tegra/vic-clear.c
new file mode 100644
index 000000000000..f65a644d398c
--- /dev/null
+++ b/tests/tegra/vic-clear.c
@@ -0,0 +1,173 @@
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
+#include "util_math.h"
+
+#include "tegra.h"
+
+#include "host1x.h"
+#include "vic.h"
+
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+int main(int argc, char *argv[])
+{
+    const unsigned int format = VIC_PIXEL_FORMAT_A8R8G8B8;
+    const unsigned int kind = VIC_BLK_KIND_PITCH;
+    const unsigned int width = 16, height = 16;
+    const char *device = "/dev/dri/renderD128";
+    struct drm_tegra_channel *channel;
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    struct vic_image *output;
+    struct drm_tegra *drm;
+    unsigned int version;
+    struct vic *vic;
+    uint32_t *pb;
+    int fd, err;
+    void *ptr;
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
+    err = drm_tegra_channel_open(drm, DRM_TEGRA_VIC, &channel);
+    if (err < 0) {
+        fprintf(stderr, "failed to open channel to VIC: %s\n", strerror(-err));
+        return 1;
+    }
+
+    version = drm_tegra_channel_get_version(channel);
+    printf("version: %08x\n", version);
+
+    err = vic_new(drm, channel, &vic);
+    if (err < 0) {
+        fprintf(stderr, "failed to create VIC: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = vic_image_new(vic, width, height, format, kind, DRM_TEGRA_CHANNEL_MAP_READ_WRITE,
+                        &output);
+    if (err < 0) {
+        fprintf(stderr, "failed to create output image: %d\n", err);
+        return 1;
+    }
+
+    printf("image: %zu bytes\n", output->size);
+
+    err = drm_tegra_bo_map(output->bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map output image: %d\n", err);
+        return 1;
+    }
+
+    memset(ptr, 0xff, output->size);
+    drm_tegra_bo_unmap(output->bo);
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &pb);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = vic->ops->clear(vic, output, 1023, 0, 0, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &pb, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &pb, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, pb);
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
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
+
+    drm_tegra_job_free(job);
+    vic_image_free(output);
+    vic_free(vic);
+    drm_tegra_channel_close(channel);
+    drm_tegra_close(drm);
+    close(fd);
+
+    return 0;
+}
-- 
2.32.0

