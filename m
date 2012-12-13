From: =?UTF-8?q?Arto=20Meril=C3=A4inen?= <amerilainen@nvidia.com>
Subject: [RFC,libdrm 1/3] tegra: Add stream library
Date: Thu, 13 Dec 2012 16:01:06 +0200
Message-ID: <1355407268-32381-2-git-send-email-amerilainen@nvidia.com>
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

From: Arto Merilainen <amerilainen@nvidia.com>

This patch introduces tegra stream library. The library is used for
buffer management, command stream construction and work
synchronization.

Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
---
 Makefile.am                |    6 +-
 configure.ac               |   13 +
 tegra/Makefile.am          |   25 ++
 tegra/class_ids.h          |   35 ++
 tegra/host1x01_hardware.h  |  122 ++++++
 tegra/hw_host1x01_uclass.h |  143 ++++++++
 tegra/libdrm_tegra.pc.in   |   10 +
 tegra/tegra_drm.c          |  876 ++++++++++++++++++++++++++++++++++++++++++++
 tegra/tegra_drm.h          |  142 +++++++
 tegra/tegra_drmif.h        |  107 ++++++
 10 files changed, 1478 insertions(+), 1 deletion(-)
 create mode 100644 tegra/Makefile.am
 create mode 100644 tegra/class_ids.h
 create mode 100644 tegra/host1x01_hardware.h
 create mode 100644 tegra/hw_host1x01_uclass.h
 create mode 100644 tegra/libdrm_tegra.pc.in
 create mode 100644 tegra/tegra_drm.c
 create mode 100644 tegra/tegra_drm.h
 create mode 100644 tegra/tegra_drmif.h

diff --git a/Makefile.am b/Makefile.am
index 8ecd9d9..e90ae43 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -49,7 +49,11 @@ if HAVE_EXYNOS
 EXYNOS_SUBDIR = exynos
 endif
 
-SUBDIRS = . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RADEON_SUBDIR) $(OMAP_SUBDIR) $(EXYNOS_SUBDIR) tests include man
+if HAVE_TEGRA
+TEGRA_SUBDIR = tegra
+endif
+
+SUBDIRS = . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RADEON_SUBDIR) $(OMAP_SUBDIR) $(EXYNOS_SUBDIR) $(TEGRA_SUBDIR) tests include man
 
 libdrm_la_LTLIBRARIES = libdrm.la
 libdrm_ladir = $(libdir)
diff --git a/configure.ac b/configure.ac
index 0c19929..36c55c7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -114,6 +114,11 @@ AC_ARG_ENABLE(exynos-experimental-api,
 	      [Enable support for EXYNOS's experimental API (default: disabled)]),
 	      [EXYNOS=$enableval], [EXYNOS=no])
 
+AC_ARG_ENABLE(tegra,
+	      AS_HELP_STRING([--enable-tegra],
+	      [Enable support for tegra's API (default: disabled)]),
+	      [TEGRA=$enableval], [TEGRA=no])
+
 dnl ===========================================================================
 dnl check compiler flags
 AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
@@ -222,6 +227,11 @@ if test "x$EXYNOS" = xyes; then
 	AC_DEFINE(HAVE_EXYNOS, 1, [Have EXYNOS support])
 fi
 
+AM_CONDITIONAL(HAVE_TEGRA, [test "x$TEGRA" = xyes])
+if test "x$TEGRA" = xyes; then
+	AC_DEFINE(HAVE_TEGRA, 1, [Have TEGRA support])
+fi
+
 AC_ARG_ENABLE([cairo-tests],
               [AS_HELP_STRING([--enable-cairo-tests],
                               [Enable support for Cairo rendering in tests (default: auto)])],
@@ -358,6 +368,8 @@ AC_CONFIG_FILES([
 	omap/libdrm_omap.pc
 	exynos/Makefile
 	exynos/libdrm_exynos.pc
+	tegra/Makefile
+	tegra/libdrm_tegra.pc
 	tests/Makefile
 	tests/modeprint/Makefile
 	tests/modetest/Makefile
@@ -380,4 +392,5 @@ echo "  Radeon API     $RADEON"
 echo "  Nouveau API    $NOUVEAU"
 echo "  OMAP API       $OMAP"
 echo "  EXYNOS API     $EXYNOS"
+echo "  TEGRA API      $TEGRA"
 echo ""
diff --git a/tegra/Makefile.am b/tegra/Makefile.am
new file mode 100644
index 0000000..72675e5
--- /dev/null
+++ b/tegra/Makefile.am
@@ -0,0 +1,25 @@
+AM_CFLAGS = \
+	$(WARN_CFLAGS) \
+	-I$(top_srcdir) \
+	-I$(top_srcdir)/tegra \
+	$(PTHREADSTUBS_CFLAGS) \
+	-I$(top_srcdir)/include/drm
+
+libdrm_tegra_la_LTLIBRARIES = libdrm_tegra.la
+libdrm_tegra_ladir = $(libdir)
+libdrm_tegra_la_LDFLAGS = -version-number 1:0:0 -no-undefined
+libdrm_tegra_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
+
+libdrm_tegra_la_SOURCES = \
+	tegra_drm.c
+
+libdrm_tegracommonincludedir = ${includedir}/tegra
+libdrm_tegracommoninclude_HEADERS = \
+	tegra_drm.h
+
+libdrm_tegraincludedir = ${includedir}/libdrm
+libdrm_tegrainclude_HEADERS = \
+	tegra_drmif.h
+
+pkgconfigdir = @pkgconfigdir@
+pkgconfig_DATA = libdrm_tegra.pc
diff --git a/tegra/class_ids.h b/tegra/class_ids.h
new file mode 100644
index 0000000..834e291
--- /dev/null
+++ b/tegra/class_ids.h
@@ -0,0 +1,35 @@
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
+ */
+
+#ifndef __NVHOST_CLASS_IDS_H
+#define __NVHOST_CLASS_IDS_H
+
+
+enum {
+	NV_HOST1X_CLASS_ID		= 0x1,
+	NV_GRAPHICS_2D_CLASS_ID		= 0x51,
+	NV_GRAPHICS_2D_SB_CLASS_ID	= 0x52,
+};
+
+#endif /*__NVHOST_CLASS_IDS_H */
diff --git a/tegra/host1x01_hardware.h b/tegra/host1x01_hardware.h
new file mode 100644
index 0000000..5f94d52
--- /dev/null
+++ b/tegra/host1x01_hardware.h
@@ -0,0 +1,122 @@
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
+ *    Arto Merilainen <amerilainen@nvidia.com>
+ */
+
+#ifndef __NVHOST_HOST1X01_HARDWARE_H
+#define __NVHOST_HOST1X01_HARDWARE_H
+
+#include <linux/types.h>
+#include "hw_host1x01_uclass.h"
+
+/* channel registers */
+#define NV_HOST1X_CHANNEL_MAP_SIZE_BYTES 16384
+#define NV_HOST1X_SYNC_MLOCK_NUM 16
+
+/* sync registers */
+#define HOST1X_CHANNEL_SYNC_REG_BASE   0x3000
+#define NV_HOST1X_NB_MLOCKS 16
+
+#define BIT(nr)	(1UL << (nr))
+
+static inline uint32_t nvhost_class_host_wait_syncpt(
+	unsigned indx, unsigned threshold)
+{
+	return host1x_uclass_wait_syncpt_indx_f(indx)
+		| host1x_uclass_wait_syncpt_thresh_f(threshold);
+}
+
+static inline uint32_t nvhost_class_host_load_syncpt_base(
+	unsigned indx, unsigned threshold)
+{
+	return host1x_uclass_load_syncpt_base_base_indx_f(indx)
+		| host1x_uclass_load_syncpt_base_value_f(threshold);
+}
+
+static inline uint32_t nvhost_class_host_wait_syncpt_base(
+	unsigned indx, unsigned base_indx, unsigned offset)
+{
+	return host1x_uclass_wait_syncpt_base_indx_f(indx)
+		| host1x_uclass_wait_syncpt_base_base_indx_f(base_indx)
+		| host1x_uclass_wait_syncpt_base_offset_f(offset);
+}
+
+static inline uint32_t nvhost_class_host_incr_syncpt_base(
+	unsigned base_indx, unsigned offset)
+{
+	return host1x_uclass_incr_syncpt_base_base_indx_f(base_indx)
+		| host1x_uclass_incr_syncpt_base_offset_f(offset);
+}
+
+static inline uint32_t nvhost_class_host_incr_syncpt(
+	unsigned cond, unsigned indx)
+{
+	return host1x_uclass_incr_syncpt_cond_f(cond)
+		| host1x_uclass_incr_syncpt_indx_f(indx);
+}
+
+static inline uint32_t nvhost_class_host_indoff_reg_write(
+	unsigned mod_id, unsigned offset, int auto_inc)
+{
+	uint32_t v = host1x_uclass_indoff_indbe_f(0xf)
+		| host1x_uclass_indoff_indmodid_f(mod_id)
+		| host1x_uclass_indoff_indroffset_f(offset);
+	if (auto_inc)
+		v |= host1x_uclass_indoff_autoinc_f(1);
+	return v;
+}
+
+static inline uint32_t nvhost_class_host_indoff_reg_read(
+	unsigned mod_id, unsigned offset, int auto_inc)
+{
+	uint32_t v = host1x_uclass_indoff_indmodid_f(mod_id)
+		| host1x_uclass_indoff_indroffset_f(offset)
+		| host1x_uclass_indoff_rwn_read_v();
+	if (auto_inc)
+		v |= host1x_uclass_indoff_autoinc_f(1);
+	return v;
+}
+
+
+/* cdma opcodes */
+static inline uint32_t nvhost_opcode_setclass(
+	unsigned class_id, unsigned offset, unsigned mask)
+{
+	return (0 << 28) | (offset << 16) | (class_id << 6) | mask;
+}
+static inline uint32_t nvhost_opcode_nonincr(unsigned offset, unsigned count)
+{
+	return (2 << 28) | (offset << 16) | count;
+}
+
+static inline uint32_t nvhost_opcode_mask(unsigned offset, unsigned mask)
+{
+	return (3 << 28) | (offset << 16) | mask;
+}
+
+static inline uint32_t nvhost_mask2(unsigned x, unsigned y)
+{
+	return 1 | (1 << (y - x));
+}
+#endif
diff --git a/tegra/hw_host1x01_uclass.h b/tegra/hw_host1x01_uclass.h
new file mode 100644
index 0000000..ba8c2d5
--- /dev/null
+++ b/tegra/hw_host1x01_uclass.h
@@ -0,0 +1,143 @@
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
+ *    Arto Merilainen <amerilainen@nvidia.com>
+ */
+
+ /*
+  * Function naming determines intended use:
+  *
+  *     <x>_r(void) : Returns the offset for register <x>.
+  *
+  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
+  *
+  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
+  *
+  *     <x>_<y>_f(uint32_t v) : Returns a value based on 'v' which has been shifted
+  *         and masked to place it at field <y> of register <x>.  This value
+  *         can be |'d with others to produce a full register value for
+  *         register <x>.
+  *
+  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
+  *         value can be ~'d and then &'d to clear the value of field <y> for
+  *         register <x>.
+  *
+  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
+  *         to place it at field <y> of register <x>.  This value can be |'d
+  *         with others to produce a full register value for <x>.
+  *
+  *     <x>_<y>_v(uint32_t r) : Returns the value of field <y> from a full register
+  *         <x> value 'r' after being shifted to place its LSB at bit 0.
+  *         This value is suitable for direct comparison with other unshifted
+  *         values appropriate for use in field <y> of register <x>.
+  *
+  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
+  *         field <y> of register <x>.  This value is suitable for direct
+  *         comparison with unshifted values appropriate for use in field <y>
+  *         of register <x>.
+  */
+
+#ifndef __hw_host1x_uclass_host1x_h__
+#define __hw_host1x_uclass_host1x_h__
+
+static inline uint32_t host1x_uclass_incr_syncpt_r(void)
+{
+	return 0x0;
+}
+static inline uint32_t host1x_uclass_incr_syncpt_cond_f(uint32_t v)
+{
+	return (v & 0xff) << 8;
+}
+static inline uint32_t host1x_uclass_incr_syncpt_cond_op_done_v(void)
+{
+	return 1;
+}
+static inline uint32_t host1x_uclass_incr_syncpt_indx_f(uint32_t v)
+{
+	return (v & 0xff) << 0;
+}
+static inline uint32_t host1x_uclass_wait_syncpt_r(void)
+{
+	return 0x8;
+}
+static inline uint32_t host1x_uclass_wait_syncpt_indx_f(uint32_t v)
+{
+	return (v & 0xff) << 24;
+}
+static inline uint32_t host1x_uclass_wait_syncpt_thresh_f(uint32_t v)
+{
+	return (v & 0xffffff) << 0;
+}
+static inline uint32_t host1x_uclass_wait_syncpt_base_indx_f(uint32_t v)
+{
+	return (v & 0xff) << 24;
+}
+static inline uint32_t host1x_uclass_wait_syncpt_base_base_indx_f(uint32_t v)
+{
+	return (v & 0xff) << 16;
+}
+static inline uint32_t host1x_uclass_wait_syncpt_base_offset_f(uint32_t v)
+{
+	return (v & 0xffff) << 0;
+}
+static inline uint32_t host1x_uclass_load_syncpt_base_base_indx_f(uint32_t v)
+{
+	return (v & 0xff) << 24;
+}
+static inline uint32_t host1x_uclass_load_syncpt_base_value_f(uint32_t v)
+{
+	return (v & 0xffffff) << 0;
+}
+static inline uint32_t host1x_uclass_incr_syncpt_base_base_indx_f(uint32_t v)
+{
+	return (v & 0xff) << 24;
+}
+static inline uint32_t host1x_uclass_incr_syncpt_base_offset_f(uint32_t v)
+{
+	return (v & 0xffffff) << 0;
+}
+static inline uint32_t host1x_uclass_indoff_r(void)
+{
+	return 0x2d;
+}
+static inline uint32_t host1x_uclass_indoff_indbe_f(uint32_t v)
+{
+	return (v & 0xf) << 28;
+}
+static inline uint32_t host1x_uclass_indoff_autoinc_f(uint32_t v)
+{
+	return (v & 0x1) << 27;
+}
+static inline uint32_t host1x_uclass_indoff_indmodid_f(uint32_t v)
+{
+	return (v & 0xff) << 18;
+}
+static inline uint32_t host1x_uclass_indoff_indroffset_f(uint32_t v)
+{
+	return (v & 0xffff) << 2;
+}
+static inline uint32_t host1x_uclass_indoff_rwn_read_v(void)
+{
+	return 1;
+}
+#endif /* __hw_host1x_uclass_host1x_h__ */
diff --git a/tegra/libdrm_tegra.pc.in b/tegra/libdrm_tegra.pc.in
new file mode 100644
index 0000000..3ad8c6f
--- /dev/null
+++ b/tegra/libdrm_tegra.pc.in
@@ -0,0 +1,10 @@
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+libdir=@libdir@
+includedir=@includedir@
+
+Name: libdrm_tegra
+Description: Userspace interface to tegra kernel DRM services
+Version: @PACKAGE_VERSION@
+Libs: -L${libdir} -ldrm_tegra
+Cflags: -I${includedir} -I${includedir}/libdrm -I${includedir}/tegra
diff --git a/tegra/tegra_drm.c b/tegra/tegra_drm.c
new file mode 100644
index 0000000..ad3a90e
--- /dev/null
+++ b/tegra/tegra_drm.c
@@ -0,0 +1,876 @@
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
+ *    Arto Merilainen <amerilainen@nvidia.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <assert.h>
+
+#include <drm.h>
+#include <xf86drm.h>
+
+#include "tegra_drmif.h"
+#include "tegra_drm.h"
+
+#include "class_ids.h"
+#include "hw_host1x01_uclass.h"
+#include "host1x01_hardware.h"
+
+/*
+ * stream library configuration
+ *
+ * NUMBER_OF_BUFFERS - Determine the number of preallocated command buffers
+ * RELOC_TABLE_SIZE  - Maximum number of memory references in a command buffer
+ * BUFFER_SIZE_WORDS - Define the size of command buffers
+ */
+
+#define NUMBER_OF_BUFFERS   4
+#define RELOC_TABLE_SIZE    128
+#define BUFFER_SIZE_WORDS   1024
+
+enum tegra_stream_status {
+    TEGRADRM_STREAM_FREE,
+    TEGRADRM_STREAM_CONSTRUCT,
+    TEGRADRM_STREAM_READY
+};
+
+struct tegra_device {
+    int             fd;
+};
+
+struct tegra_bo {
+
+    struct tegra_device     *dev;
+
+    void                    *vaddr;
+
+    uint32_t                gem_handle;
+    unsigned int            offset;
+
+    uint32_t                size;
+};
+
+struct tegra_channel {
+
+    struct tegra_device     *dev;
+
+    uint64_t                context;
+
+    enum tegra_module_id    module_id;
+    uint32_t                default_class_id;
+
+    uint32_t                syncpt_id;
+};
+
+struct tegra_command_buffer {
+
+    struct tegra_bo         *mem;
+
+    struct tegra_drm_reloc  *reloc_table;
+    uint32_t                *data;
+
+    uint32_t                cmd_ptr;
+    uint32_t                reloc_ptr;
+
+    uint64_t                syncpt_max;
+
+    int                     flushed;
+};
+
+struct tegra_stream {
+
+    enum tegra_stream_status    status;
+
+    struct tegra_channel        *channel;
+    int                         num_words;
+    int                         num_relocs;
+    uint32_t                    num_syncpt_incrs;
+
+    struct tegra_command_buffer buffers[NUMBER_OF_BUFFERS];
+    struct tegra_command_buffer *active_buffer;
+    unsigned int                active_buffer_idx;
+
+    uint32_t                    current_class_id;
+};
+
+/*
+ * tegra_next_buffer(stream)
+ *
+ * Move to use next command buffer. NOTE! This routine does not verify that the
+ * new buffer is ready to use.
+ */
+
+static void tegra_next_buffer(struct tegra_stream *stream)
+{
+    stream->active_buffer_idx = (stream->active_buffer_idx + 1) %
+        NUMBER_OF_BUFFERS;
+    stream->active_buffer = &stream->buffers[stream->active_buffer_idx];
+}
+
+/*
+ * tegra_device_create(fd)
+ *
+ * Create a device "object" representing tegra drm device. The device should be
+ * opened using i.e. drmOpen(). If object cannot be created, NULL is returned
+ */
+
+struct tegra_device *tegra_device_create(int fd)
+{
+    struct tegra_device *dev;
+
+    if (!(dev = malloc(sizeof(dev))))
+        goto err_dev_alloc;
+    dev->fd = fd;
+
+    return dev;
+
+err_dev_alloc:
+    return NULL;
+}
+
+/*
+ * tegra_device_destroy(dev)
+ *
+ * Remove device object created using tegra_device_create(). The caller is
+ * responsible for calling drmClose().
+ */
+
+void tegra_device_destroy(struct tegra_device *dev)
+{
+    if (!dev)
+        return;
+    free(dev);
+}
+
+/*
+ * tegra_channel_open(dev, module_id)
+ *
+ * Reserve channel resources for given module. Host1x has several channels
+ * each of which is dedicated for a certain hardware module. The opened
+ * channel is used by streams for delivering command buffers.
+ */
+
+struct tegra_channel *tegra_channel_open(
+                struct tegra_device *dev,
+                enum tegra_module_id module_id)
+{
+    struct tegra_channel *channel;
+    struct tegra_drm_get_channel_param_args get_args;
+    struct tegra_drm_open_channel_args open_args;
+    uint32_t default_class_id;
+
+    if (!(channel = malloc(sizeof(*channel))))
+        goto err_channel_alloc;
+
+    switch (module_id) {
+    case TEGRADRM_MODULEID_2D:
+        default_class_id = NV_GRAPHICS_2D_CLASS_ID;
+        break;
+    default:
+        return NULL;
+    }
+
+    channel->module_id = module_id;
+    channel->default_class_id = default_class_id;
+
+    open_args.class = default_class_id;
+    if (drmIoctl(dev->fd, DRM_IOCTL_TEGRA_DRM_OPEN_CHANNEL, &open_args))
+        goto err_channel_open;
+
+    channel->context = open_args.context;
+    get_args.context = open_args.context;
+    get_args.param = 0;
+
+    if (drmIoctl(dev->fd, DRM_IOCTL_TEGRA_DRM_GET_SYNCPOINT,
+        &get_args))
+        goto err_tegra_ioctl;
+    channel->syncpt_id = get_args.value;
+
+    channel->dev = dev;
+
+    return channel;
+
+err_tegra_ioctl:
+    drmIoctl(dev->fd, DRM_IOCTL_TEGRA_DRM_CLOSE_CHANNEL, &open_args);
+err_channel_open:
+    free(channel);
+err_channel_alloc:
+    return NULL;
+}
+
+/*
+ * tegra_channel_close(channel)
+ *
+ * Close a channel.
+ */
+
+void tegra_channel_close(struct tegra_channel *channel)
+{
+    struct tegra_drm_open_channel_args close_args;
+
+    if (!channel)
+        return;
+
+    close_args.class = channel->default_class_id;
+    close_args.context = channel->context;
+
+    drmIoctl(channel->dev->fd, DRM_IOCTL_TEGRA_DRM_CLOSE_CHANNEL,
+        &close_args);
+
+    free(channel);
+}
+
+/*
+ * tegra_stream_create(channel)
+ *
+ * Create a stream for given channel. This function preallocates several
+ * command buffers for later usage to improve performance. Streams are
+ * used for generating command buffers opcode by opcode using
+ * tegra_stream_push*().
+ */
+
+struct tegra_stream *tegra_stream_create(
+                struct tegra_channel *channel)
+{
+    struct tegra_stream *stream;
+    int i;
+
+    if (!channel)
+        goto err_bad_channel;
+
+    if (!(stream = malloc(sizeof(*stream))))
+        goto err_alloc_stream;
+
+    memset(stream, '\0', sizeof(*stream));
+    stream->channel = channel;
+    stream->status = TEGRADRM_STREAM_FREE;
+
+    for (i = 0; i < NUMBER_OF_BUFFERS; i++) {
+        struct tegra_command_buffer *buffer = &stream->buffers[i];
+
+        if (!(buffer->mem = tegra_bo_allocate(stream->channel->dev,
+            sizeof(uint32_t) * BUFFER_SIZE_WORDS, 4)))
+            goto err_buffer_create;
+
+        if(!(buffer->data = tegra_bo_map(buffer->mem)))
+		goto err_buffer_create;
+
+        if (!(buffer->reloc_table =
+            malloc(RELOC_TABLE_SIZE * sizeof(struct tegra_drm_reloc))))
+            goto err_buffer_create;
+
+        buffer->reloc_ptr = 0;
+        buffer->cmd_ptr = 0;
+    }
+
+    stream->active_buffer_idx = 0;
+    stream->active_buffer = &stream->buffers[0];
+
+    return stream;
+
+err_buffer_create:
+    for (i = 0; i < NUMBER_OF_BUFFERS; i++) {
+        free(stream->buffers[i].reloc_table);
+        tegra_bo_free(stream->buffers[i].mem);
+    }
+    free(stream);
+err_alloc_stream:
+err_bad_channel:
+    return NULL;
+}
+
+/*
+ * tegra_stream_destroy(stream)
+ *
+ * Destroy the given stream object. All resrouces are released.
+ */
+
+void tegra_stream_destroy(struct tegra_stream *stream)
+{
+    int i;
+
+    if (!stream)
+        return;
+
+    for (i = 0; i < NUMBER_OF_BUFFERS; i++) {
+        free(stream->buffers[i].reloc_table);
+        tegra_bo_free(stream->buffers[i].mem);
+    }
+
+    free(stream);
+}
+
+/*
+ * tegra_fence_is_valid(fence)
+ *
+ * Check validity of a fence. We just check that the fence range
+ * is valid w.r.t. host1x hardware.
+ */
+
+int tegra_fence_is_valid(const struct tegra_fence *fence)
+{
+    int valid = fence ? 1 : 0;
+    valid = valid && fence->id != (uint32_t) -1;
+    valid = valid && fence->id < 32;
+    return valid;
+}
+
+/*
+ * tegra_fence_clear(fence)
+ *
+ * Clear (=invalidate) given fence
+ */
+
+void tegra_fence_clear(struct tegra_fence *fence)
+{
+    fence->id = (uint32_t) -1;
+    fence->value = 0;
+}
+
+/*
+ * tegra_fence_copy(dst, src)
+ *
+ * Copy fence
+ */
+
+void tegra_fence_copy(struct tegra_fence *dst, const struct tegra_fence *src)
+{
+    *dst = *src;
+}
+
+/*
+ * tegra_fence_waitex(channel, fence, timeout, value)
+ *
+ * Wait for a given syncpoint value with timeout. The end value is returned in
+ * "value" variable. The function returns 0 if the syncpoint value was
+ * reached before timeout, otherwise an error code.
+ */
+
+int tegra_fence_waitex(struct tegra_channel *channel,
+                struct tegra_fence *fence,
+                long timeout,
+                long *value)
+{
+    struct tegra_drm_syncpt_wait_args args;
+    int err;
+
+    if (!tegra_fence_is_valid(fence))
+        return -EINVAL;
+
+    args.timeout = timeout;
+    args.id = fence->id;
+    args.thresh = fence->value;
+
+    err = drmIoctl(channel->dev->fd, DRM_IOCTL_TEGRA_DRM_SYNCPT_WAIT, &args);
+
+    if (value)
+        *value = args.value;
+
+    return err;
+}
+
+/*
+ * tegra_fence_wait_timeout(channel, fence, timeout)
+ *
+ * Wait for a given syncpoint value with timeout. The function returns 0 if
+ * the syncpoint value was reached before timeout, otherwise an error code.
+ */
+
+int tegra_fence_wait_timeout(struct tegra_channel *channel,
+                struct tegra_fence *fence,
+                long timeout)
+{
+    return tegra_fence_waitex(channel, fence, timeout, NULL);
+}
+
+/*
+ * tegra_fence_wait(channel, wait)
+ *
+ * Wait for a given syncpoint value without timeout.
+ */
+
+int tegra_fence_wait(struct tegra_channel *channel,
+            struct tegra_fence *fence)
+{
+    return tegra_fence_waitex(channel, fence, DRM_TEGRA_NO_TIMEOUT, NULL);
+}
+
+/*
+ * tegra_stream_push_reloc(stream, h, offset)
+ *
+ * Push a memory reference to the stream.
+ */
+
+void tegra_stream_push_reloc(struct tegra_stream *stream,
+                    struct tegra_bo *h,
+                    int offset)
+{
+    struct tegra_drm_reloc reloc;
+
+    if (!stream || !h)
+        return;
+
+    reloc.cmdbuf_mem = stream->active_buffer->mem->gem_handle;
+    reloc.cmdbuf_offset = stream->active_buffer->cmd_ptr * 4;
+    reloc.target = h->gem_handle;
+    reloc.target_offset = offset;
+    reloc.shift = 0;
+
+    stream->num_words--;
+    stream->num_relocs--;
+    assert(stream->num_words >= 0);
+    assert(stream->status == TEGRADRM_STREAM_CONSTRUCT);
+    stream->active_buffer->data[stream->active_buffer->cmd_ptr++] = 0xDEADBEEF;
+    stream->active_buffer->reloc_table[stream->active_buffer->reloc_ptr++] =
+        reloc;
+}
+
+/*
+ * tegra_bo_gethandle(h)
+ *
+ * Get drm memory handle. This is required if the object is used as a
+ * framebuffer.
+ */
+
+uint32_t tegra_bo_gethandle(struct tegra_bo *h)
+{
+    return h->gem_handle;
+}
+
+/*
+ * tegra_bo_allocate(dev, num_bytes, alignment)
+ *
+ * Allocate num_bytes for host1x device operations. The memory is not
+ * automatically mapped for the application.
+ */
+
+struct tegra_bo *tegra_bo_allocate(struct tegra_device *dev,
+                       uint32_t num_bytes,
+                       uint32_t alignment)
+{
+    struct tegra_gem_create create;
+    struct tegra_bo *h;
+
+    if (!(h = malloc(sizeof(*h))))
+        goto err_alloc_memory_handle;
+
+    /* Allocate memory */
+    memset(&create, 0, sizeof(create));
+    create.size = num_bytes;
+    if (drmIoctl(dev->fd, DRM_IOCTL_TEGRA_GEM_CREATE, &create))
+        goto err_alloc_memory;
+
+    h->gem_handle = create.handle;
+    h->size = create.size;
+    h->offset = create.offset;
+    h->vaddr = NULL;
+    h->dev = dev;
+
+    return h;
+
+err_alloc_memory:
+    free(h);
+err_alloc_memory_handle:
+    return NULL;
+}
+
+/*
+ * tegra_bo_free(h)
+ *
+ * Release given memory handle. Memory is unmapped if it is mapped. Kernel
+ * takes care of reference counting, so the memory area will not be freed
+ * unless the kernel actually has finished using the area.
+ */
+
+void tegra_bo_free(struct tegra_bo * h)
+{
+    struct drm_gem_close unref;
+
+    if (!h)
+        return;
+
+    tegra_bo_unmap(h);
+    unref.handle = h->gem_handle;
+    drmIoctl(h->dev->fd, DRM_IOCTL_GEM_CLOSE, &unref);
+    free(h);
+}
+
+/*
+ * tegra_bo_map(h)
+ *
+ * Map the given handle for the application.
+ */
+
+void * tegra_bo_map(struct tegra_bo * h)
+{
+    if (!h->vaddr) {
+        h->vaddr = mmap(NULL, h->size, PROT_READ | PROT_WRITE,
+            MAP_SHARED, h->dev->fd, h->offset);
+    }
+
+    return h->vaddr;
+}
+
+/*
+ * tegra_bo_unmap(h)
+ *
+ * Unmap memory from the application. The contents of the memory region is
+ * automatically flushed to the memory
+ */
+
+void tegra_bo_unmap(struct tegra_bo * h)
+{
+    if (!(h && h->vaddr))
+        return;
+
+    munmap(h->vaddr, h->size);
+    h->vaddr = NULL;
+}
+
+/*
+ * tegra_stream_flush(stream, fence)
+ *
+ * Send the current contents of stream buffer. The stream must be
+ * synchronized correctly (we cannot send partial streams). If
+ * pointer to fence is given, the fence will contain the syncpoint value
+ * that is reached when operations in the buffer are finished.
+ */
+
+int tegra_stream_flush(struct tegra_stream *stream,
+              struct tegra_fence *fence)
+{
+    struct tegra_channel *ch = stream->channel;
+    struct tegra_drm_cmdbuf cmdbuf;
+    struct tegra_drm_submit_args submit;
+    struct tegra_drm_syncpt_incr syncpt_incr;
+    struct tegra_command_buffer * buffer = stream->active_buffer;
+    int err;
+
+    if (!stream)
+        return -EINVAL;
+
+    /* Reflushing is fine */
+    if (stream->status == TEGRADRM_STREAM_FREE)
+        return 0;
+
+    /* Crash if stream is constructed badly */
+    assert(stream->status == TEGRADRM_STREAM_READY);
+
+    /* Clean args */
+    memset(&submit, 0, sizeof(submit));
+
+    /* Construct cmd buffer */
+    cmdbuf.mem = buffer->mem->gem_handle;
+    cmdbuf.offset = 0;
+    cmdbuf.words = buffer->cmd_ptr;
+
+    /* Construct syncpoint increments struct */
+    syncpt_incr.syncpt_id = ch->syncpt_id;
+    syncpt_incr.syncpt_incrs = stream->num_syncpt_incrs;
+
+    /* Create submit */
+    submit.context = ch->context;
+    submit.submit_version = 1;
+    submit.num_relocs = buffer->reloc_ptr;
+    submit.num_syncpt_incrs = 1;
+    submit.num_cmdbufs = 1;
+    submit.relocs = (uint32_t)buffer->reloc_table;
+    submit.syncpt_incrs = (uint32_t)&syncpt_incr;
+    submit.cmdbufs = (uint32_t)&cmdbuf;
+
+    /* Push submits to the channel */
+    if ((err = drmIoctl(ch->dev->fd, DRM_IOCTL_TEGRA_DRM_SUBMIT, &submit))) {
+        tegra_fence_clear(fence);
+        return err;
+    }
+
+    /* Return fence */
+    if (fence) {
+        fence->id = ch->syncpt_id;
+        fence->value = submit.fence;
+    }
+
+    stream->num_syncpt_incrs = 0;
+    stream->active_buffer->syncpt_max = submit.fence;
+    stream->active_buffer->flushed = 1;
+    tegra_next_buffer(stream);
+
+    stream->status = TEGRADRM_STREAM_FREE;
+    return 0;
+}
+
+/*
+ * tegra_stream_begin(stream, num_words, fence, num_fences, num_syncpt_incrs,
+ *          num_relocs, class_id)
+ *
+ * Start constructing a stream.
+ *  - num_words refer to the maximum number of words the stream can contain.
+ *  - fence is a pointer to a table that contains syncpoint preconditions
+ *    before the stream execution can start.
+ *  - num_fences indicate the number of elements in the fence table.
+ *  - num_syncpt_incrs indicate the number of syncpoint increments the stream
+ *    is doing.
+ *  - num_relocs indicate the number of memory references in the buffer.
+ *  - class_id refers to the class_id that is selected in the beginning of a
+ *    stream. If no class id is given, the default class id (=usually the
+ *    client device's class) is selected.
+ *
+ * This function verifies that the current buffer has enough room for holding
+ * the whole stream (this is computed using num_words and num_relocs). The
+ * function blocks until the stream buffer is ready for use.
+ */
+
+int tegra_stream_begin(struct tegra_stream *stream,
+              uint32_t num_words,
+              struct tegra_fence *fence,
+              uint32_t num_fences,
+              uint32_t num_syncpt_incrs,
+              uint32_t num_relocs,
+              uint32_t class_id)
+{
+    if (!stream)
+        return -EINVAL;
+
+    assert(stream->status == TEGRADRM_STREAM_FREE ||
+        stream->status == TEGRADRM_STREAM_READY);
+
+    /* handle class id */
+    if (!class_id && stream->channel->default_class_id)
+        class_id = stream->channel->default_class_id;
+
+    /* include following in num words:
+     *  - fence waits in the beginningi ( 1 + num_fences)
+     *  - setclass in the beginning (1 word)
+     *  - syncpoint increment at the end of the stream (2 words)
+     */
+
+    num_words += 2;
+    num_words += class_id ? 1 : 0;
+    num_words += num_fences ? 1 + num_fences : 0;
+
+    if (num_words + num_relocs > BUFFER_SIZE_WORDS ||
+        num_relocs > RELOC_TABLE_SIZE)
+        return -EINVAL;
+
+    if ((stream->active_buffer->cmd_ptr + num_words + num_relocs >
+        BUFFER_SIZE_WORDS) ||
+        (stream->active_buffer->reloc_ptr + num_relocs > RELOC_TABLE_SIZE)) {
+        tegra_stream_flush(stream, NULL);
+    }
+
+    /* If we are about to start using a new buffer, make sure it is
+     * actually free */
+
+    if (stream->active_buffer->flushed) {
+        struct tegra_fence fence;
+
+        fence.id = stream->channel->syncpt_id;
+        fence.value = stream->active_buffer->syncpt_max;
+        tegra_fence_wait(stream->channel, &fence);
+
+        stream->active_buffer->cmd_ptr = 0;
+        stream->active_buffer->reloc_ptr = 0;
+        stream->active_buffer->flushed = 0;
+    }
+
+    stream->status = TEGRADRM_STREAM_CONSTRUCT;
+    stream->current_class_id = class_id;
+    stream->num_relocs = num_relocs;
+    stream->num_words = num_words;
+    stream->num_syncpt_incrs += num_syncpt_incrs;
+
+    /* Add fences */
+    if (num_fences) {
+
+        tegra_stream_push(stream,
+            nvhost_opcode_setclass(NV_HOST1X_CLASS_ID,
+            host1x_uclass_wait_syncpt_r(), num_fences));
+
+        for (; num_fences; num_fences--, fence++) {
+            assert(tegra_fence_is_valid(fence));
+
+            tegra_stream_push(stream, nvhost_class_host_wait_syncpt(fence->id,
+                fence->value));
+        }
+    }
+
+    if (class_id)
+        tegra_stream_push(stream, nvhost_opcode_setclass(class_id, 0, 0));
+
+    return 0;
+}
+
+/*
+ * tegra_stream_push_setclass(stream, class_id)
+ *
+ * Push "set class" opcode to the stream. Do nothing if the class is already
+ * active
+ */
+
+void tegra_stream_push_setclass(struct tegra_stream *stream,
+                uint32_t class_id)
+{
+    if (stream->current_class_id == class_id)
+        return;
+
+    tegra_stream_push(stream, nvhost_opcode_setclass(class_id, 0, 0));
+    stream->current_class_id = class_id;
+}
+
+/*
+ * tegra_stream_end(stream)
+ *
+ * Mark end of stream. This function pushes last syncpoint increment for
+ * marking end of stream.
+ */
+
+int tegra_stream_end(struct tegra_stream *stream)
+{
+    if (!stream)
+        return -EINVAL;
+
+    /* Add last syncpoint increment on OP_DONE */
+    tegra_stream_push(stream, nvhost_opcode_nonincr(0, 1));
+    tegra_stream_push(stream, nvhost_class_host_incr_syncpt(
+	host1x_uclass_incr_syncpt_cond_op_done_v(),
+	stream->channel->syncpt_id));
+    stream->num_syncpt_incrs += 1;
+
+    assert(stream->status == TEGRADRM_STREAM_CONSTRUCT);
+    stream->status = TEGRADRM_STREAM_READY;
+    return 0;
+}
+
+/*
+ * tegra_stream_push(stream, word)
+ *
+ * Push a single word to given stream.
+ */
+
+void tegra_stream_push(struct tegra_stream *stream, int word)
+{
+    if (!stream)
+        return;
+
+    stream->num_words--;
+    assert(stream->num_words >= 0);
+    assert(stream->status == TEGRADRM_STREAM_CONSTRUCT);
+    stream->active_buffer->data[stream->active_buffer->cmd_ptr++] = word;
+}
+
+/*
+ * tegra_channel_syncpt(channel)
+ *
+ * Get channel syncpoint
+ */
+
+int tegra_channel_syncpt(struct tegra_channel *channel)
+{
+    if (!channel)
+        return -EINVAL;
+
+    return channel->syncpt_id;
+}
+
+/*
+ * tegra_reloc (variable, handle, offset)
+ *
+ * This function creates a reloc allocation. The function should be used in
+ * conjunction with tegra_stream_push_words.
+ */
+
+struct tegra_reloc tegra_reloc(const void *var,
+                const struct tegra_bo *h,
+                const uint32_t offset)
+{
+    struct tegra_reloc reloc = {var, (struct tegra_bo *)h, offset};
+    return reloc;
+
+}
+
+/*
+ * tegra_stream_push_words(stream, addr, words, ...)
+ *
+ * Push words from given address to stream. The function takes
+ * reloc structs as its argument. You can generate the structs with tegra_reloc
+ * function.
+ */
+
+void tegra_stream_push_words(struct tegra_stream *stream,
+                const void *addr, uint32_t words,
+                uint32_t num_relocs, ...)
+{
+    va_list ap;
+    struct tegra_reloc reloc_arg;
+    struct tegra_command_buffer *buffer;
+
+    if (!stream)
+        return;
+
+    buffer = stream->active_buffer;
+
+    stream->num_words -= words;
+    stream->num_relocs -= num_relocs;
+    assert(stream->num_words >= 0 && stream->num_relocs >= 0);
+    assert(stream->status == TEGRADRM_STREAM_CONSTRUCT);
+
+    /* Copy the contents */
+    memcpy(buffer->data + buffer->cmd_ptr, addr,
+        words * sizeof(uint32_t));
+
+    /* Copy relocs */
+    va_start(ap, num_relocs);
+    for (; num_relocs; num_relocs--) {
+
+        uint32_t cmd_ptr;
+        struct tegra_drm_reloc reloc_entry;
+
+        reloc_arg = va_arg(ap, struct tegra_reloc);
+
+        cmd_ptr = buffer->cmd_ptr +
+            ((uint32_t *) reloc_arg.addr) - ((uint32_t *) addr);
+
+        reloc_entry.cmdbuf_mem = buffer->mem->gem_handle;
+        reloc_entry.cmdbuf_offset = cmd_ptr * 4;
+        reloc_entry.target = reloc_arg.h->gem_handle;
+        reloc_entry.target_offset = reloc_arg.offset;
+        reloc_entry.shift = 0;
+
+        buffer->data[cmd_ptr] = 0xDEADBEEF;
+        buffer->reloc_table[buffer->reloc_ptr++] = reloc_entry;
+    }
+    va_end(ap);
+
+    buffer->cmd_ptr += words;
+}
diff --git a/tegra/tegra_drm.h b/tegra/tegra_drm.h
new file mode 100644
index 0000000..358a2fd
--- /dev/null
+++ b/tegra/tegra_drm.h
@@ -0,0 +1,142 @@
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
+ *    Arto Merilainen <amerilainen@nvidia.com>
+ */
+
+#ifndef _TEGRA_DRM_H_
+#define _TEGRA_DRM_H_
+
+struct tegra_gem_create {
+    __u64 size;
+    unsigned int flags;
+    unsigned int handle;
+    unsigned int offset;
+};
+
+struct tegra_gem_invalidate {
+    unsigned int handle;
+};
+
+struct tegra_gem_flush {
+    unsigned int handle;
+};
+
+struct tegra_drm_syncpt_read_args {
+    __u32 id;
+    __u32 value;
+};
+
+struct tegra_drm_syncpt_incr_args {
+    __u32 id;
+    __u32 pad;
+};
+
+struct tegra_drm_syncpt_wait_args {
+    __u32 id;
+    __u32 thresh;
+    __s32 timeout;
+    __u32 value;
+};
+
+#define DRM_TEGRA_NO_TIMEOUT    (-1)
+
+struct tegra_drm_open_channel_args {
+    __u32 class;
+    __u32 pad;
+    __u64 context;
+};
+
+struct tegra_drm_get_channel_param_args {
+    __u64 context;
+    __u32 param;
+    __u32 value;
+};
+
+struct tegra_drm_syncpt_incr {
+    __u32 syncpt_id;
+    __u32 syncpt_incrs;
+};
+
+struct tegra_drm_cmdbuf {
+    __u32 mem;
+    __u32 offset;
+    __u32 words;
+};
+
+struct tegra_drm_reloc {
+    __u32 cmdbuf_mem;
+    __u32 cmdbuf_offset;
+    __u32 target;
+    __u32 target_offset;
+    __u32 shift;
+    __u32 pad;
+};
+
+struct tegra_drm_waitchk {
+    __u32 mem;
+    __u32 offset;
+    __u32 syncpt_id;
+    __u32 thresh;
+};
+
+struct tegra_drm_submit_args {
+    __u64 context;
+    __u32 num_syncpt_incrs;
+    __u32 num_cmdbufs;
+    __u32 num_relocs;
+    __u32 submit_version;
+    __u32 num_waitchks;
+    __u32 waitchk_mask;
+    __u32 timeout;
+    __u32 pad;
+    __u64 syncpt_incrs;
+    __u64 cmdbufs;
+    __u64 relocs;
+    __u64 waitchks;
+    __u32 fence; /* Return value */
+
+    __u32 reserved[5]; /* future expansion */
+};
+
+#define DRM_TEGRA_GEM_CREATE            0x00
+#define DRM_TEGRA_DRM_SYNCPT_READ       0x01
+#define DRM_TEGRA_DRM_SYNCPT_INCR       0x02
+#define DRM_TEGRA_DRM_SYNCPT_WAIT       0x03
+#define DRM_TEGRA_DRM_OPEN_CHANNEL      0x04
+#define DRM_TEGRA_DRM_CLOSE_CHANNEL     0x05
+#define DRM_TEGRA_DRM_GET_SYNCPOINT     0x06
+#define DRM_TEGRA_DRM_GET_MODMUTEXES    0x07
+#define DRM_TEGRA_DRM_SUBMIT            0x08
+
+#define DRM_IOCTL_TEGRA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_CREATE, struct tegra_gem_create)
+#define DRM_IOCTL_TEGRA_DRM_SYNCPT_READ DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_DRM_SYNCPT_READ, struct tegra_drm_syncpt_read_args)
+#define DRM_IOCTL_TEGRA_DRM_SYNCPT_INCR DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_DRM_SYNCPT_INCR, struct tegra_drm_syncpt_incr_args)
+#define DRM_IOCTL_TEGRA_DRM_SYNCPT_WAIT DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_DRM_SYNCPT_WAIT, struct tegra_drm_syncpt_wait_args)
+#define DRM_IOCTL_TEGRA_DRM_OPEN_CHANNEL DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_DRM_OPEN_CHANNEL, struct tegra_drm_open_channel_args)
+#define DRM_IOCTL_TEGRA_DRM_CLOSE_CHANNEL DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_DRM_CLOSE_CHANNEL, struct tegra_drm_open_channel_args)
+#define DRM_IOCTL_TEGRA_DRM_GET_SYNCPOINT DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_DRM_GET_SYNCPOINT, struct tegra_drm_get_channel_param_args)
+#define DRM_IOCTL_TEGRA_DRM_GET_MODMUTEXES DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_DRM_GET_MODMUTEXES, struct tegra_drm_get_channel_param_args)
+#define DRM_IOCTL_TEGRA_DRM_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_DRM_SUBMIT, struct tegra_drm_submit_args)
+
+#endif
diff --git a/tegra/tegra_drmif.h b/tegra/tegra_drmif.h
new file mode 100644
index 0000000..b3f6872
--- /dev/null
+++ b/tegra/tegra_drmif.h
@@ -0,0 +1,107 @@
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
+ *    Arto Merilainen <amerilainen@nvidia.com>
+ */
+
+#ifndef TEGRA_DRMIF_H
+#define TEGRA_DRMIF_H
+
+#include <stdint.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+struct tegra_channel;
+struct tegra_bo;
+struct tegra_stream;
+struct tegra_device;
+
+struct tegra_fence {
+    uint32_t id;
+    uint32_t value;
+};
+
+struct tegra_reloc {
+    const void *addr;
+    struct tegra_bo *h;
+    uint32_t offset;
+};
+
+enum tegra_module_id {
+    TEGRADRM_MODULEID_2D
+};
+
+/* Device operations */
+struct tegra_device *tegra_device_create(int fd);
+void tegra_device_destroy(struct tegra_device *dev);
+
+/* Memory operations */
+uint32_t tegra_bo_gethandle(struct tegra_bo *h);
+struct tegra_bo *tegra_bo_allocate(struct tegra_device *dev,
+                                    uint32_t num_bytes, uint32_t alignment);
+void tegra_bo_free(struct tegra_bo * h);
+void * tegra_bo_map(struct tegra_bo * h);
+void tegra_bo_unmap(struct tegra_bo * h);
+
+/* Channel operations */
+struct tegra_channel *tegra_channel_open(struct tegra_device *dev,
+                enum tegra_module_id module_id);
+void tegra_channel_close(struct tegra_channel *channel);
+int tegra_channel_syncpt(struct tegra_channel *channel);
+
+/* Stream operations */
+struct tegra_stream *tegra_stream_create(struct tegra_channel *channel);
+void tegra_stream_destroy(struct tegra_stream *stream);
+int tegra_stream_begin(struct tegra_stream *stream, uint32_t num_words,
+                        struct tegra_fence *fence, uint32_t num_fences,
+                        uint32_t num_syncpt_incrs, uint32_t num_relocs,
+                        uint32_t class_id);
+int tegra_stream_end(struct tegra_stream *stream);
+int tegra_stream_flush(struct tegra_stream *stream, struct tegra_fence *fence);
+void tegra_stream_push(struct tegra_stream *stream, int word);
+void tegra_stream_push_setclass(struct tegra_stream *stream,
+                                uint32_t class_id);
+void tegra_stream_push_reloc(struct tegra_stream *stream, struct tegra_bo *h,
+                                int offset);
+struct tegra_reloc tegra_reloc(const void *var, const struct tegra_bo *h,
+                                const uint32_t offset);
+void tegra_stream_push_words(struct tegra_stream *stream, const void *addr,
+                                uint32_t words, uint32_t num_relocs, ...);
+
+/* Fence operations */
+int tegra_fence_wait(struct tegra_channel *channel, struct tegra_fence *fence);
+int tegra_fence_wait_timeout(struct tegra_channel *channel,
+                                struct tegra_fence *fence, long timeout);
+int tegra_fence_waitex(struct tegra_channel *channel, struct tegra_fence *fence,
+                        long timeout, long *value);
+int tegra_fence_is_valid(const struct tegra_fence *fence);
+void tegra_fence_clear(struct tegra_fence *fence);
+void tegra_fence_copy(struct tegra_fence *dst, const struct tegra_fence *src);
+
+#ifdef __cplusplus
+};
+#endif
+
+#endif /* TEGRA_DRMIF_H */
-- 
1.7.9.5
