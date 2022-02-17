Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB78EC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245104AbiBQTVM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:21:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244868AbiBQTVM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:21:12 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87A9C3C37
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:20:55 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a8so9595496ejc.8
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHRtc9ePqjGH8hAF7Lu17NqbL1i0haVvTDPsiBYwu7k=;
        b=A0lprPscR/Kzb3webGaApYC4C0Qp74JUmUxL8788PCMWHbJ9fhoZ7xzpDaIORWp/US
         Ex+JUhhTJgr3RXGWLoaVOqGJ7X82yzJYBzyI+52KCNdrLh6L2FQ7iGo2x4+6q9gK2tIT
         8DIPutN2+uEYuLRw63V45OXvdUDn6RIyYJlR7e/YNGD2Md97yUF9fbDbzG0EXHbVfNnv
         Ju0hV2ENhmKZGUFqPmBN9SEWbNHOBKys1U5jBer9n7nxUzNvVeEpDUeVXAPMpHDLXNI2
         sBCtf1ZyjEZRdsLZkJoovPil8DxKYeFQChUJSAVktVnHZPViZYNHLQRB/6G1MkKOPxcT
         t51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHRtc9ePqjGH8hAF7Lu17NqbL1i0haVvTDPsiBYwu7k=;
        b=y/d1Ale7Z2jFv67rD6nZlqVdjAzk/dM3wR0MpuNGZG0AO+rdMzBGeU+y6qoaw31LuX
         /yTEhPO20mAzCIKQoHAQGqazthbqRa5DanHhGxXUC01gjZqBKVANEsES2gpLWwLfcZwq
         pM/TdMBHZRQoaNeK+77bVg8JrnyVCDGR5PPxd6P/+oSTM3tZ90h+iDQvJTjpc87YHEdy
         1PHUR6ozxwtvO7kehN6B7+JF3jZU544K0zcTtL0OM+j17+jHlkHufKedUEiKQNMsHcA/
         WJ29BgpKHSPBe3nJY615wdVEBqvEHaOWk9nlkGFRS1JNqXV0JVPi/kjMR8JWQTTrFfHY
         t+oA==
X-Gm-Message-State: AOAM532k9EgGEKVrVOOJhPpLoT4DChJpwzP/NnLBfxYIJGxehQs/iIkw
        ugt9Hjd8uoP/gziSOyl2rl8=
X-Google-Smtp-Source: ABdhPJz0dRzRn1xVte+j0yskgoHLf4dNTgEOgEP4T5fc5aIzqLGDgh1yyv80F1kyCk2grbqJH9Ibzw==
X-Received: by 2002:a17:906:2719:b0:6cf:37ec:d47f with SMTP id z25-20020a170906271900b006cf37ecd47fmr3723642ejc.401.1645125654288;
        Thu, 17 Feb 2022 11:20:54 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id mb23sm1453566ejb.62.2022.02.17.11.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:20:53 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 15/25] tests: tegra: Add gr2d-fill test
Date:   Thu, 17 Feb 2022 20:19:21 +0100
Message-Id: <20220217191931.2534836-10-thierry.reding@gmail.com>
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

This test uses the IOCTLs for job submission and fences to fill a sub-
region of the screen to a specific color using gr2d.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/.gitignore       |   1 +
 tests/tegra/drm-test-tegra.c | 147 +++++++++++++++++++++++++++++++++++
 tests/tegra/drm-test-tegra.h |  55 +++++++++++++
 tests/tegra/gr2d-fill.c      | 146 ++++++++++++++++++++++++++++++++++
 tests/tegra/meson.build      |  19 +++++
 5 files changed, 368 insertions(+)
 create mode 100644 tests/tegra/drm-test-tegra.c
 create mode 100644 tests/tegra/drm-test-tegra.h
 create mode 100644 tests/tegra/gr2d-fill.c

diff --git a/tests/tegra/.gitignore b/tests/tegra/.gitignore
index 56cfb62b785f..0db9e5401302 100644
--- a/tests/tegra/.gitignore
+++ b/tests/tegra/.gitignore
@@ -1 +1,2 @@
+tegra-gr2d-fill
 tegra-openclose
diff --git a/tests/tegra/drm-test-tegra.c b/tests/tegra/drm-test-tegra.c
new file mode 100644
index 000000000000..1a9fa8961de9
--- /dev/null
+++ b/tests/tegra/drm-test-tegra.c
@@ -0,0 +1,147 @@
+/*
+ * Copyright © 2014 NVIDIA Corporation
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
+#include <stdio.h>
+
+#include "drm-test-tegra.h"
+#include "tegra.h"
+
+int drm_tegra_gr2d_open(struct drm_tegra *drm, struct drm_tegra_gr2d **gr2dp)
+{
+    struct drm_tegra_gr2d *gr2d;
+    int err;
+
+    gr2d = calloc(1, sizeof(*gr2d));
+    if (!gr2d)
+        return -ENOMEM;
+
+    gr2d->drm = drm;
+
+    err = drm_tegra_channel_open(drm, DRM_TEGRA_GR2D, &gr2d->channel);
+    if (err < 0) {
+        free(gr2d);
+        return err;
+    }
+
+    *gr2dp = gr2d;
+
+    return 0;
+}
+
+int drm_tegra_gr2d_close(struct drm_tegra_gr2d *gr2d)
+{
+    if (!gr2d)
+        return -EINVAL;
+
+    drm_tegra_channel_close(gr2d->channel);
+    free(gr2d);
+
+    return 0;
+}
+
+int drm_tegra_gr2d_fill(struct drm_tegra_gr2d *gr2d, struct drm_framebuffer *fb,
+                        unsigned int x, unsigned int y, unsigned int width,
+                        unsigned int height, uint32_t color)
+{
+    struct drm_tegra_bo *fbo = fb->data;
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_mapping *map;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
+
+    err = drm_tegra_job_new(gr2d->channel, &job);
+    if (err < 0)
+        return err;
+
+    err = drm_tegra_channel_map(gr2d->channel, fbo, 0, &map);
+    if (err < 0)
+        return err;
+
+    err = drm_tegra_job_get_pushbuf(job, &pushbuf);
+    if (err < 0)
+        return err;
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0)
+        return err;
+
+    *ptr++ = HOST1X_OPCODE_SETCL(0, HOST1X_CLASS_GR2D, 0);
+
+    *ptr++ = HOST1X_OPCODE_MASK(0x9, 0x9);
+    *ptr++ = 0x0000003a;
+    *ptr++ = 0x00000000;
+
+    *ptr++ = HOST1X_OPCODE_MASK(0x1e, 0x7);
+    *ptr++ = 0x00000000;
+    *ptr++ = (2 << 16) | (1 << 6) | (1 << 2);
+    *ptr++ = 0x000000cc;
+
+    *ptr++ = HOST1X_OPCODE_MASK(0x2b, 0x9);
+
+    /* relocate destination buffer */
+    err = drm_tegra_pushbuf_relocate(pushbuf, &ptr, map, 0, 0, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to relocate buffer object: %d\n", err);
+        return err;
+    }
+
+    *ptr++ = fb->pitch;
+
+    *ptr++ = HOST1X_OPCODE_NONINCR(0x35, 1);
+    *ptr++ = color;
+
+    *ptr++ = HOST1X_OPCODE_NONINCR(0x46, 1);
+    *ptr++ = 0x00000000;
+
+    *ptr++ = HOST1X_OPCODE_MASK(0x38, 0x5);
+    *ptr++ = height << 16 | width;
+    *ptr++ = y << 16 | x;
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %d\n", -err);
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %d\n", err);
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for fence: %d\n", err);
+        return err;
+    }
+
+    drm_tegra_channel_unmap(map);
+    drm_tegra_job_free(job);
+
+    return 0;
+}
diff --git a/tests/tegra/drm-test-tegra.h b/tests/tegra/drm-test-tegra.h
new file mode 100644
index 000000000000..eefa954cd40b
--- /dev/null
+++ b/tests/tegra/drm-test-tegra.h
@@ -0,0 +1,55 @@
+/*
+ * Copyright © 2014 NVIDIA Corporation
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
+#ifndef TEGRA_DRM_TEST_TEGRA_H
+#define TEGRA_DRM_TEST_TEGRA_H
+
+#include "drm-test.h"
+#include "tegra.h"
+
+#define HOST1X_OPCODE_SETCL(offset, classid, mask) \
+    ((0x0 << 28) | (((offset) & 0xfff) << 16) | (((classid) & 0x3ff) << 6) | ((mask) & 0x3f))
+#define HOST1X_OPCODE_INCR(offset, count) \
+    ((0x1 << 28) | (((offset) & 0xfff) << 16) | ((count) & 0xffff))
+#define HOST1X_OPCODE_NONINCR(offset, count) \
+    ((0x2 << 28) | (((offset) & 0xfff) << 16) | ((count) & 0xffff))
+#define HOST1X_OPCODE_MASK(offset, mask) \
+    ((0x3 << 28) | (((offset) & 0xfff) << 16) | ((mask) & 0xffff))
+#define HOST1X_OPCODE_IMM(offset, data) \
+    ((0x4 << 28) | (((offset) & 0xfff) << 16) | ((data) & 0xffff))
+#define HOST1X_OPCODE_EXTEND(subop, value) \
+    ((0xe << 28) | (((subop) & 0xf) << 24) | ((value) & 0xffffff))
+
+#define HOST1X_CLASS_GR2D 0x51
+
+struct drm_tegra_gr2d {
+    struct drm_tegra *drm;
+    struct drm_tegra_channel *channel;
+};
+
+int drm_tegra_gr2d_open(struct drm_tegra *drm, struct drm_tegra_gr2d **gr2dp);
+int drm_tegra_gr2d_close(struct drm_tegra_gr2d *gr2d);
+int drm_tegra_gr2d_fill(struct drm_tegra_gr2d *gr2d, struct drm_framebuffer *fb,
+                        unsigned int x, unsigned int y, unsigned int width,
+                        unsigned int height, uint32_t color);
+
+#endif
diff --git a/tests/tegra/gr2d-fill.c b/tests/tegra/gr2d-fill.c
new file mode 100644
index 000000000000..d138cc4c6f85
--- /dev/null
+++ b/tests/tegra/gr2d-fill.c
@@ -0,0 +1,146 @@
+/*
+ * Copyright © 2014 NVIDIA Corporation
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
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <sys/ioctl.h>
+
+#include "xf86drm.h"
+#include "xf86drmMode.h"
+#include "drm_fourcc.h"
+
+#include "drm-test-tegra.h"
+#include "tegra.h"
+
+int main(int argc, char *argv[])
+{
+    uint32_t format = DRM_FORMAT_XRGB8888;
+    struct drm_tegra_gr2d *gr2d;
+    struct drm_framebuffer *fb;
+    struct drm_screen *screen;
+    unsigned int pitch, size;
+    struct drm_tegra_bo *bo;
+    struct drm_tegra *drm;
+    uint32_t handle;
+    int fd, err;
+    void *ptr;
+
+    fd = drm_open(argv[1]);
+    if (fd < 0) {
+        fprintf(stderr, "failed to open DRM device %s: %s\n", argv[1],
+                strerror(errno));
+        return 1;
+    }
+
+    err = drm_screen_open(&screen, fd);
+    if (err < 0) {
+        fprintf(stderr, "failed to open screen: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_new(fd, &drm);
+    if (err < 0) {
+        fprintf(stderr, "failed to create Tegra DRM context: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_gr2d_open(drm, &gr2d);
+    if (err < 0) {
+        fprintf(stderr, "failed to open gr2d channel: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    pitch = screen->width * screen->bpp / 8;
+    size = pitch * screen->height;
+
+    err = drm_tegra_bo_new(drm, 0, size, &bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to create buffer object: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_bo_get_handle(bo, &handle);
+    if (err < 0) {
+        fprintf(stderr, "failed to get handle to buffer object: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_bo_map(bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map buffer object: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    memset(ptr, 0xff, size);
+
+    err = drm_framebuffer_new(&fb, screen, handle, screen->width,
+                              screen->height, pitch, format, bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to create framebuffer: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    err = drm_screen_set_framebuffer(screen, fb);
+    if (err < 0) {
+        fprintf(stderr, "failed to display framebuffer: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    sleep(1);
+
+    err = drm_tegra_gr2d_fill(gr2d, fb, fb->width / 4, fb->height / 4,
+                              fb->width / 2, fb->height / 2, 0x00000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to fill rectangle: %s\n",
+                strerror(-err));
+        return 1;
+    }
+
+    sleep(1);
+
+    drm_framebuffer_free(fb);
+    drm_tegra_bo_unref(bo);
+    drm_tegra_gr2d_close(gr2d);
+    drm_tegra_close(drm);
+    drm_screen_close(screen);
+    drm_close(fd);
+
+    return 0;
+}
diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 3ac9015fbed8..337fee8c6246 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -27,6 +27,16 @@ libdrm_test = static_library(
   link_with : libdrm,
 )
 
+libdrm_test_tegra = static_library(
+  'drm-test-tegra',
+  [files(
+    'drm-test-tegra.c',
+    'drm-test-tegra.h',
+  ), config_file ],
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  link_with : libdrm,
+)
+
 openclose = executable(
   'tegra-openclose',
   files('openclose.c'),
@@ -35,3 +45,12 @@ openclose = executable(
   link_with : [libdrm, libdrm_tegra],
   install : with_install_tests,
 )
+
+gr2d_fill = executable(
+  'tegra-gr2d-fill',
+  files('gr2d-fill.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : libdrm_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
-- 
2.35.1

