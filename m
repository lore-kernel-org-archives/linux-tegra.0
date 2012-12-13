From: =?UTF-8?q?Arto=20Meril=C3=A4inen?= <amerilainen@nvidia.com>
Subject: [RFC,libdrm 3/3] tests: tegra: Add 2d tests
Date: Thu, 13 Dec 2012 16:01:08 +0200
Message-ID: <1355407268-32381-4-git-send-email-amerilainen@nvidia.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: thierry.reding@avionic-design.de, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: fhart@nvidia.com, tbergstrom@nvidia.com
List-Id: linux-tegra@vger.kernel.org

From: Francis Hart <fhart@nvidia.com>

This patch adds a test application for 2d library. The application
performs 2d operations using the hardware and outputs the results
into files.

Signed-off-by: Francis Hart <fhart@nvidia.com>
---
 configure.ac                   |    1 +
 tests/tegra/2d/Makefile.am     |   13 ++
 tests/tegra/2d/tegra_2d_test.c |  413 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 427 insertions(+)
 create mode 100644 tests/tegra/2d/Makefile.am
 create mode 100644 tests/tegra/2d/tegra_2d_test.c

diff --git a/configure.ac b/configure.ac
index 36c55c7..b1170d3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -376,6 +376,7 @@ AC_CONFIG_FILES([
 	tests/kmstest/Makefile
 	tests/radeon/Makefile
 	tests/vbltest/Makefile
+	tests/tegra/2d/Makefile
 	include/Makefile
 	include/drm/Makefile
 	man/Makefile
diff --git a/tests/tegra/2d/Makefile.am b/tests/tegra/2d/Makefile.am
new file mode 100644
index 0000000..6967fbf
--- /dev/null
+++ b/tests/tegra/2d/Makefile.am
@@ -0,0 +1,13 @@
+AM_CFLAGS = \
+	-I $(top_srcdir)/include/drm \
+	-I $(top_srcdir)
+
+LDADD = \
+	$(top_builddir)/libdrm.la \
+	$(top_builddir)/tegra/libdrm_tegra.la
+
+noinst_PROGRAMS = \
+	tegra_2d_test
+
+tegra_2d_test_SOURCES = \
+	tegra_2d_test.c
diff --git a/tests/tegra/2d/tegra_2d_test.c b/tests/tegra/2d/tegra_2d_test.c
new file mode 100644
index 0000000..11cc089
--- /dev/null
+++ b/tests/tegra/2d/tegra_2d_test.c
@@ -0,0 +1,413 @@
+/*
+ * Copyright (C) 2012 NVIDIA Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Francis Hart <fhart@nvidia.com>
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include "tegra/tegra_drmif.h"
+#include "tegra/tegra_2d.h"
+#include "xf86drm.h"
+#include "xf86drmMode.h"
+#include "include/drm/drm_fourcc.h"
+
+static void
+set_pixel_color(struct tegra_2d_surface *surface,
+                int x,
+                int y,
+                struct tegra_2d_surface_color *color)
+{
+    int i;
+
+    for (i=0; i<surface->num_planes; ++i)
+    {
+        int px;
+        int py;
+        int offset;
+        uint32_t bytes_per_pixel;
+        const uint8_t *src;
+        uint8_t *dst;
+        void *ptr;
+        struct tegra_2d_plane *plane = &surface->planes[i];
+
+        bytes_per_pixel = TEGRA_2D_FORMAT_BYTES(plane->format);
+
+        ptr = tegra_bo_map(plane->mem_handle);
+        if (ptr == NULL)
+            continue;
+
+        px = (x * plane->width) / surface->planes[0].width;
+        py = (y * plane->height) / surface->planes[0].height;
+
+        offset = (py * plane->pitch) + (px * bytes_per_pixel);
+
+        src = (const uint8_t *) &color->planes[i].value;
+        dst = ((uint8_t *) ptr) + plane->mem_offset + offset;
+
+        switch (bytes_per_pixel)
+        {
+            case 4: dst[3] = src[3];
+            case 3: dst[2] = src[2];
+            case 2: dst[1] = src[1];
+            case 1: dst[0] = src[0];
+            default:
+                break;
+        }
+
+        tegra_bo_unmap(plane->mem_handle);
+    }
+}
+
+static void
+set_pixel_rgba(struct tegra_2d_surface *surface,
+               int x,
+               int y,
+               uint32_t r,
+               uint32_t g,
+               uint32_t b,
+               uint32_t a)
+{
+    struct tegra_2d_surface_color color;
+
+    color.num_planes = surface->num_planes;
+    color.planes[0].format = surface->planes[0].format;
+    color.planes[1].format = surface->planes[1].format;
+    color.planes[2].format = surface->planes[2].format;
+
+    tegra_2d_color_from_rgba(&color, r, g, b, a);
+
+    set_pixel_color(surface, x, y, &color);
+}
+
+static void
+clear_surface(struct tegra_2d_surface *surface,
+              uint32_t r,
+              uint32_t g,
+              uint32_t b,
+              uint32_t a)
+{
+    int x;
+    int y;
+    struct tegra_2d_surface_color color;
+
+    color.num_planes = surface->num_planes;
+    color.planes[0].format = surface->planes[0].format;
+    color.planes[1].format = surface->planes[1].format;
+    color.planes[2].format = surface->planes[2].format;
+
+    tegra_2d_color_from_rgba(&color, r, g, b, a);
+
+    for (y=0; y<surface->planes[0].height; ++y)
+    for (x=0; x<surface->planes[0].width; ++x)
+        set_pixel_color(surface, x, y, &color);
+}
+
+static int
+test_fill(struct tegra_2d_context *ctx)
+{
+    int result;
+    struct tegra_2d_surface dst;
+    struct tegra_2d_surface_color color;
+
+    memset(&dst, 0, sizeof(struct tegra_2d_surface));
+
+    dst.num_planes = 1;
+    dst.planes[0].width = 16;
+    dst.planes[0].height = 16;
+    dst.planes[0].format = TEGRA_2D_FORMAT_A8R8G8B8;
+    dst.planes[0].layout = TEGRA_2D_LAYOUT_LINEAR;
+
+    color.num_planes = 1;
+    color.planes[0].format = TEGRA_2D_FORMAT_A8R8G8B8;
+    color.planes[0].value = 0xFF00FFFF;
+
+    result = tegra_2d_allocate_surface(ctx, &dst);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    clear_surface(&dst, 255, 255, 0, 255);
+
+    result = tegra_2d_begin(ctx, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_fill(ctx, &dst, &color, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_end(ctx, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+exit:
+    tegra_2d_free_surface(ctx, &dst);
+
+    return result == TEGRA_2D_OK ? 1 : 0;
+}
+
+static int
+test_copy(struct tegra_2d_context *ctx)
+{
+    int result;
+    struct tegra_2d_surface src;
+    struct tegra_2d_surface dst;
+
+    memset(&dst, 0, sizeof(struct tegra_2d_surface));
+
+    src.num_planes = 3;
+    src.planes[0].width = 16;
+    src.planes[0].height = 16;
+    src.planes[0].format = TEGRA_2D_FORMAT_Y8;
+    src.planes[0].layout = TEGRA_2D_LAYOUT_LINEAR;
+    src.planes[1].width = 8;
+    src.planes[1].height = 8;
+    src.planes[1].format = TEGRA_2D_FORMAT_U8;
+    src.planes[1].layout = TEGRA_2D_LAYOUT_LINEAR;
+    src.planes[2].width = 8;
+    src.planes[2].height = 8;
+    src.planes[2].format = TEGRA_2D_FORMAT_V8;
+    src.planes[2].layout = TEGRA_2D_LAYOUT_LINEAR;
+
+    dst.num_planes = 3;
+    dst.planes[0].width = 16;
+    dst.planes[0].height = 16;
+    dst.planes[0].format = TEGRA_2D_FORMAT_Y8;
+    dst.planes[0].layout = TEGRA_2D_LAYOUT_LINEAR;
+    dst.planes[1].width = 8;
+    dst.planes[1].height = 8;
+    dst.planes[1].format = TEGRA_2D_FORMAT_U8;
+    dst.planes[1].layout = TEGRA_2D_LAYOUT_LINEAR;
+    dst.planes[2].width = 8;
+    dst.planes[2].height = 8;
+    dst.planes[2].format = TEGRA_2D_FORMAT_V8;
+    dst.planes[2].layout = TEGRA_2D_LAYOUT_LINEAR;
+
+    result = tegra_2d_allocate_surface(ctx, &src);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_allocate_surface(ctx, &dst);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    clear_surface(&dst, 255, 255, 0, 255);
+    clear_surface(&src, 255, 0, 255, 255);
+
+    set_pixel_rgba(&src, 1, 1, 255,   0,   0, 255);
+    set_pixel_rgba(&src, 2, 1,   0, 255,   0, 255);
+    set_pixel_rgba(&src, 1, 2,   0,   0, 255, 255);
+
+    result = tegra_2d_begin(ctx, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_copy(ctx,
+                           &dst,
+                           &src,
+                           NULL,
+                           NULL,
+                           TEGRA_2D_TRANSFORM_IDENTITY);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_end(ctx, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+exit:
+    tegra_2d_free_surface(ctx, &src);
+    tegra_2d_free_surface(ctx, &dst);
+
+    return result == TEGRA_2D_OK ? 1 : 0;
+}
+
+static int
+test_transform(struct tegra_2d_context *ctx)
+{
+    int result;
+    struct tegra_2d_surface src;
+    struct tegra_2d_surface dst;
+
+    memset(&dst, 0, sizeof(struct tegra_2d_surface));
+
+    src.num_planes = 1;
+    src.planes[0].width = 10;
+    src.planes[0].height = 10;
+    src.planes[0].format = TEGRA_2D_FORMAT_A8R8G8B8;
+    src.planes[0].layout = TEGRA_2D_LAYOUT_LINEAR;
+
+    dst.num_planes = 1;
+    dst.planes[0].width = 10;
+    dst.planes[0].height = 10;
+    dst.planes[0].format = TEGRA_2D_FORMAT_A8R8G8B8;
+    dst.planes[0].layout = TEGRA_2D_LAYOUT_LINEAR;
+
+    result = tegra_2d_allocate_surface(ctx, &src);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_allocate_surface(ctx, &dst);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    clear_surface(&dst, 255, 255, 0, 255);
+    clear_surface(&src, 255, 0, 255, 255);
+
+    set_pixel_rgba(&src, 1, 1, 255,   0,   0, 255);
+    set_pixel_rgba(&src, 2, 1,   0, 255,   0, 255);
+    set_pixel_rgba(&src, 1, 2,   0,   0, 255, 255);
+
+    result = tegra_2d_begin(ctx, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_copy(ctx,
+                           &dst,
+                           &src,
+                           NULL,
+                           NULL,
+                           TEGRA_2D_TRANSFORM_ROT_90);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_end(ctx, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+exit:
+    tegra_2d_free_surface(ctx, &src);
+    tegra_2d_free_surface(ctx, &dst);
+
+    return result == TEGRA_2D_OK ? 1 : 0;
+}
+
+static int
+test_scale(struct tegra_2d_context *ctx)
+{
+    int result;
+    struct tegra_2d_surface src;
+    struct tegra_2d_surface dst;
+
+    memset(&dst, 0, sizeof(struct tegra_2d_surface));
+
+    src.num_planes = 1;
+    src.planes[0].width = 10;
+    src.planes[0].height = 10;
+    src.planes[0].format = TEGRA_2D_FORMAT_A8R8G8B8;
+    src.planes[0].layout = TEGRA_2D_LAYOUT_LINEAR;
+
+    dst.num_planes = 1;
+    dst.planes[0].width = 20;
+    dst.planes[0].height = 20;
+    dst.planes[0].format = TEGRA_2D_FORMAT_A8R8G8B8;
+    dst.planes[0].layout = TEGRA_2D_LAYOUT_LINEAR;
+
+    result = tegra_2d_allocate_surface(ctx, &src);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_allocate_surface(ctx, &dst);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    clear_surface(&dst, 255, 255, 0, 255);
+    clear_surface(&src, 255, 255, 255, 255);
+
+    set_pixel_rgba(&src, 1, 1, 255,   0,   0, 255);
+    set_pixel_rgba(&src, 2, 1,   0, 255,   0, 255);
+    set_pixel_rgba(&src, 1, 2,   0,   0, 255, 255);
+
+    result = tegra_2d_begin(ctx, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_copy(ctx,
+                           &dst,
+                           &src,
+                           NULL,
+                           NULL,
+                           TEGRA_2D_TRANSFORM_IDENTITY);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+    result = tegra_2d_end(ctx, NULL);
+    if (result != TEGRA_2D_OK)
+        goto exit;
+
+exit:
+    tegra_2d_free_surface(ctx, &src);
+    tegra_2d_free_surface(ctx, &dst);
+
+    return result == TEGRA_2D_OK ? 1 : 0;
+}
+
+int
+main(int argc,
+     char *argv[])
+{
+    int num_failures = 0;
+    struct tegra_2d_context *ctx;
+    int fd;
+
+    fd = drmOpen("tegra", NULL);
+    if (fd < 0) {
+        ++num_failures;
+        goto exit;
+    }
+
+    ctx = tegra_2d_open(fd);
+    if (ctx == NULL)
+    {
+        ++num_failures;
+        goto exit;
+    }
+
+    ctx->log_enable = 1;
+    ctx->dump_enable = 1;
+
+    if (test_fill(ctx) == 0)
+        ++num_failures;
+
+    if (test_copy(ctx) == 0)
+        ++num_failures;
+
+    if (test_transform(ctx) == 0)
+        ++num_failures;
+
+    if (test_scale(ctx) == 0)
+        ++num_failures;
+
+exit:
+    tegra_2d_close(ctx);
+
+    if (num_failures > 0)
+        printf("FAILED\n");
+    else
+        printf("PASSED\n");
+
+   if (fd > 0)
+       drmClose(fd);
+    return EXIT_SUCCESS;
+}
-- 
1.7.9.5
