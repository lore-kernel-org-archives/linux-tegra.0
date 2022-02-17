Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F0EC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245117AbiBQTXH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:23:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245111AbiBQTXG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:23:06 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B04CCC41
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:22:50 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id i11so9803332eda.9
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M0e3VJ0bS12JJ8JkG0rtjJHWWTbEehg0Nr+IkUkHMC8=;
        b=GMik/6fCXgjyX9ftT57GCPA3ldu3Xnr6TksIaE8B5fsj8AH8lf9tL7yigq0UVvhtQl
         qjodrBTwlvSeE0Y6YHnmVaACZMZLJmxRolUmlvx0IJ7av6m004LIQJNQqkl4KetiBxlM
         FYrESBXnJRJcwMb5UCf08BCovpSgrtC7esTd8FWDLHF6gyp1YcujBVVbV8EW3zfsLpE6
         L2KidxZNn3tCy7xY33LHETiSrZcn7eEnWQvsXyfCzpaxEaj4WTikhcH9b45YzMkWiZ9M
         S/cUKOs2YnIZvt+POrGHL5y3B+BBH08w9D/nRVuEBfPE6f5uPISLBpnpwOrBDoJ4Jx12
         0D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M0e3VJ0bS12JJ8JkG0rtjJHWWTbEehg0Nr+IkUkHMC8=;
        b=oyDesX90cEtVDFSG4UULdgLiJBumcJvsyrkce9I0RMQpkO7fX7+zy4nUyJJdtasT9g
         Yp/seRtNS36DNP2dG0DXw8INqLO0OWJF14klKe8TxwTk80IeEtdXb0/hUkyqxteG6CJn
         A/ZFzlehkc4Oh5M3jkkAGz0BkaLeSRcQomJcYZjGoZ0c88X2pdfO+LPxVNw3UIbD+0fk
         0LRrDCuEqdK7pxD6pK6qU+/Dajjv/PFx4sLq5ZsXHB7U8UvhzPpI5aA5ALmmoIAKTGk0
         +F6EUpNANOLjyqFPDw7G82a7h7LT9U0DjCVXsA80UqstDkWNIPNmWPyKoZLE9drJHVzI
         2p2g==
X-Gm-Message-State: AOAM530P9s1f8VvA6niFAF+sCt4SJAno/QSO4uMFDiuUHMAmscNsFZKW
        3WH4j/+Q4ZKBRwjsGcow15uSfxz7h/M=
X-Google-Smtp-Source: ABdhPJxU892lGYgPUi2T0/gdWx0X4JhVGmTmdh0ClJvG/Kpx95ZQG5qZZtbrvI9nh6F3StwPHelzWA==
X-Received: by 2002:a05:6402:42ca:b0:408:ed7:b011 with SMTP id i10-20020a05640242ca00b004080ed7b011mr4208022edc.6.1645125768597;
        Thu, 17 Feb 2022 11:22:48 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id d25sm1490580ejz.4.2022.02.17.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:22:47 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 25/25] tests: tegra: Add VIC flip test
Date:   Thu, 17 Feb 2022 20:19:31 +0100
Message-Id: <20220217191931.2534836-20-thierry.reding@gmail.com>
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

This test will attempt to use the VIC to blit one surface to another
and perform a vertical flip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   9 ++
 tests/tegra/vic-flip.c  | 333 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 342 insertions(+)
 create mode 100644 tests/tegra/vic-flip.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 3cccbf64ecf4..26a32e868593 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -100,3 +100,12 @@ vic_blit = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+vic_flip = executable(
+  'tegra-vic-flip',
+  files('vic-flip.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : libdrm_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/vic-flip.c b/tests/tegra/vic-flip.c
new file mode 100644
index 000000000000..e94336be1697
--- /dev/null
+++ b/tests/tegra/vic-flip.c
@@ -0,0 +1,333 @@
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
+#include "host1x.h"
+#include "vic.h"
+
+/* clear output image to red */
+static int clear(struct vic *vic, struct drm_tegra_channel *channel,
+                 struct vic_image *output)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic_clear(vic, output, 1023, 0, 0, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+/* fill bottom half of image to blue */
+static int fill(struct vic *vic, struct drm_tegra_channel *channel,
+                struct vic_image *output)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->fill(vic, output, 0, output->height / 2, output->width - 1,
+                         output->height - 1, 0, 0, 1023, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed ot fill surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+/* flip image vertically */
+static int flip(struct vic *vic, struct drm_tegra_channel *channel,
+                struct vic_image *output, struct vic_image *input)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
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
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->flip(vic, output, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to flip: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, &input, 1);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+int main(int argc, char *argv[])
+{
+    const unsigned int format = VIC_PIXEL_FORMAT_A8R8G8B8;
+    const unsigned int kind = VIC_BLK_KIND_PITCH;
+    const unsigned int width = 16, height = 16;
+    const char *device = "/dev/dri/renderD128";
+    struct drm_tegra_channel *channel;
+    struct vic_image *input, *output;
+    struct drm_tegra *drm;
+    unsigned int version;
+    struct vic *vic;
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
+                        &input);
+    if (err < 0) {
+        fprintf(stderr, "failed to create input image: %d\n", err);
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
+    err = clear(vic, channel, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear image: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = fill(vic, channel, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to fill rectangle: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = flip(vic, channel, output, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to flip image: %s\n", strerror(-err));
+        return 1;
+    }
+
+    printf("input: %ux%u\n", input->width, input->height);
+    vic_image_dump(input, stdout);
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
+
+    vic_image_free(output);
+    vic_image_free(input);
+
+    vic_free(vic);
+    drm_tegra_channel_close(channel);
+    drm_tegra_close(drm);
+    close(fd);
+
+    return 0;
+}
-- 
2.35.1

