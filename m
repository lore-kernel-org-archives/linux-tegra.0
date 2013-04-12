From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFCv2,libdrm 1/2] tegra: Add stream library
Date: Fri, 12 Apr 2013 13:41:59 +0300
Message-ID: <1365763320-31360-2-git-send-email-amerilainen@nvidia.com>
References: <1365763320-31360-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365763320-31360-1-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch introduces tegra stream library. The library is used for
buffer management, command stream construction and work
synchronization.

Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Makefile.am                |    6 +-
 configure.ac               |   13 +
 tegra/Makefile.am          |   25 ++
 tegra/class_ids.h          |   36 ++
 tegra/host1x01_hardware.h  |  125 ++++++
 tegra/hw_host1x01_uclass.h |  155 +++++++
 tegra/libdrm_tegra.pc.in   |   10 +
 tegra/tegra_drm.c          |  998 ++++++++++++++++++++++++++++++++++++++++++++
 tegra/tegra_drm.h          |  136 ++++++
 tegra/tegra_drmif.h        |  110 +++++
 10 files changed, 1613 insertions(+), 1 deletion(-)
 create mode 100644 tegra/Makefile.am
 create mode 100644 tegra/class_ids.h
 create mode 100644 tegra/host1x01_hardware.h
 create mode 100644 tegra/hw_host1x01_uclass.h
 create mode 100644 tegra/libdrm_tegra.pc.in
 create mode 100644 tegra/tegra_drm.c
 create mode 100644 tegra/tegra_drm.h
 create mode 100644 tegra/tegra_drmif.h

diff --git a/Makefile.am b/Makefile.am
index f726036..bd942e7 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -51,7 +51,11 @@ if HAVE_FREEDRENO
 FREEDRENO_SUBDIR = freedreno
 endif
 
-SUBDIRS = . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RADEON_SUBDIR) $(OMAP_SUBDIR) $(EXYNOS_SUBDIR) $(FREEDRENO_SUBDIR) tests include man
+if HAVE_TEGRA
+TEGRA_SUBDIR = tegra
+endif
+
+SUBDIRS = . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RADEON_SUBDIR) $(OMAP_SUBDIR) $(EXYNOS_SUBDIR) $(FREEDRENO_SUBDIR) $(TEGRA_SUBDIR) tests include man
 
 libdrm_la_LTLIBRARIES = libdrm.la
 libdrm_ladir = $(libdir)
diff --git a/configure.ac b/configure.ac
index 2786c87..e55e9c1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -103,6 +103,11 @@ AC_ARG_ENABLE(install-test-programs,
 		  [Install test programs (default: no)]),
 		  [INSTALL_TESTS=$enableval], [INSTALL_TESTS=no])
 
+AC_ARG_ENABLE(tegra,
+	      AS_HELP_STRING([--enable-tegra],
+	      [Enable support for tegra's API (default: disabled)]),
+	      [TEGRA=$enableval], [TEGRA=no])
+
 dnl ===========================================================================
 dnl check compiler flags
 AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
@@ -216,6 +221,11 @@ if test "x$FREEDRENO" = xyes; then
 	AC_DEFINE(HAVE_FREEDRENO, 1, [Have freedreno support])
 fi
 
+AM_CONDITIONAL(HAVE_TEGRA, [test "x$TEGRA" = xyes])
+if test "x$TEGRA" = xyes; then
+	AC_DEFINE(HAVE_TEGRA, 1, [Have TEGRA support])
+fi
+
 AM_CONDITIONAL(HAVE_INSTALL_TESTS, [test "x$INSTALL_TESTS" = xyes])
 if test "x$INSTALL_TESTS" = xyes; then
 	AC_DEFINE(HAVE_INSTALL_TESTS, 1, [Install test programs])
@@ -380,6 +390,8 @@ AC_CONFIG_FILES([
 	exynos/libdrm_exynos.pc
 	freedreno/Makefile
 	freedreno/libdrm_freedreno.pc
+	tegra/Makefile
+	tegra/libdrm_tegra.pc
 	tests/Makefile
 	tests/modeprint/Makefile
 	tests/modetest/Makefile
@@ -404,4 +416,5 @@ echo "  Nouveau API    $NOUVEAU"
 echo "  OMAP API       $OMAP"
 echo "  EXYNOS API     $EXYNOS"
 echo "  Freedreno API  $FREEDRENO"
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
index 0000000..b512306
--- /dev/null
+++ b/tegra/class_ids.h
@@ -0,0 +1,36 @@
+/*
+ * Copyright (C) 2012-2013 NVIDIA Corporation.
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
+ *	Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ */
+
+#ifndef CLASS_IDS_H_
+#define CLASS_IDS_H_
+
+enum host1x_class {
+	HOST1X_CLASS_HOST1X	= 0x1,
+	HOST1X_CLASS_GR2D	= 0x51,
+	HOST1X_CLASS_GR2D_SB	= 0x52
+};
+
+#endif
diff --git a/tegra/host1x01_hardware.h b/tegra/host1x01_hardware.h
new file mode 100644
index 0000000..34878e7
--- /dev/null
+++ b/tegra/host1x01_hardware.h
@@ -0,0 +1,125 @@
+/*
+ * Copyright (C) 2012-2013 NVIDIA Corporation.
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
+ *	Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ */
+
+#ifndef HOST1X01_HARDWARE_H_
+#define HOST1X01_HARDWARE_H_
+
+#include <linux/types.h>
+#include "hw_host1x01_uclass.h"
+
+/* channel registers */
+#define HOST1X_CHANNEL_MAP_SIZE_BYTES 16384
+#define HOST1X_SYNC_MLOCK_NUM 16
+
+/* sync registers */
+#define HOST1X_CHANNEL_SYNC_REG_BASE   0x3000
+#define HOST1X_NB_MLOCKS 16
+
+#define BIT(nr)	(1UL << (nr))
+
+static inline uint32_t host1x_class_host_wait_syncpt(unsigned indx,
+						      unsigned threshold)
+{
+	return host1x_uclass_wait_syncpt_indx_f(indx) |
+		host1x_uclass_wait_syncpt_thresh_f(threshold);
+}
+
+static inline uint32_t host1x_class_host_load_syncpt_base(unsigned indx,
+							  unsigned threshold)
+{
+	return host1x_uclass_load_syncpt_base_base_indx_f(indx) |
+		host1x_uclass_load_syncpt_base_value_f(threshold);
+}
+
+static inline uint32_t host1x_class_host_wait_syncpt_base(unsigned indx,
+							  unsigned base_indx,
+							  unsigned offset)
+{
+	return host1x_uclass_wait_syncpt_base_indx_f(indx) |
+		host1x_uclass_wait_syncpt_base_base_indx_f(base_indx) |
+		host1x_uclass_wait_syncpt_base_offset_f(offset);
+}
+
+static inline uint32_t host1x_class_host_incr_syncpt_base(unsigned base_indx,
+							  unsigned offset)
+{
+	return host1x_uclass_incr_syncpt_base_base_indx_f(base_indx) |
+		host1x_uclass_incr_syncpt_base_offset_f(offset);
+}
+
+static inline uint32_t host1x_class_host_incr_syncpt(unsigned cond,
+						     unsigned indx)
+{
+	return host1x_uclass_incr_syncpt_cond_f(cond) |
+		host1x_uclass_incr_syncpt_indx_f(indx);
+}
+
+static inline uint32_t host1x_class_host_indoff_reg_write(unsigned mod_id,
+							  unsigned offset,
+							  int auto_inc)
+{
+	uint32_t v = host1x_uclass_indoff_indbe_f(0xf) |
+		host1x_uclass_indoff_indmodid_f(mod_id) |
+		host1x_uclass_indoff_indroffset_f(offset);
+	if (auto_inc)
+		v |= host1x_uclass_indoff_autoinc_f(1);
+	return v;
+}
+
+static inline uint32_t host1x_class_host_indoff_reg_read(unsigned mod_id,
+							 unsigned offset,
+							 int auto_inc)
+{
+	uint32_t v = host1x_uclass_indoff_indmodid_f(mod_id) |
+		host1x_uclass_indoff_indroffset_f(offset) |
+		host1x_uclass_indoff_rwn_read_v();
+	if (auto_inc)
+		v |= host1x_uclass_indoff_autoinc_f(1);
+	return v;
+}
+
+
+/* cdma opcodes */
+static inline uint32_t host1x_opcode_setclass(unsigned class_id,
+					      unsigned offset, unsigned mask)
+{
+	return (0 << 28) | (offset << 16) | (class_id << 6) | mask;
+}
+static inline uint32_t host1x_opcode_nonincr(unsigned offset, unsigned count)
+{
+	return (2 << 28) | (offset << 16) | count;
+}
+
+static inline uint32_t host1x_opcode_mask(unsigned offset, unsigned mask)
+{
+	return (3 << 28) | (offset << 16) | mask;
+}
+
+static inline uint32_t host1x_mask2(unsigned x, unsigned y)
+{
+	return 1 | (1 << (y - x));
+}
+#endif
diff --git a/tegra/hw_host1x01_uclass.h b/tegra/hw_host1x01_uclass.h
new file mode 100644
index 0000000..2237e47
--- /dev/null
+++ b/tegra/hw_host1x01_uclass.h
@@ -0,0 +1,155 @@
+/*
+ * Copyright (C) 2012-2013 NVIDIA Corporation.
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
+ *	Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ */
+
+ /*
+  * Function naming determines intended use:
+  *
+  *	 <x>_r(void) : Returns the offset for register <x>.
+  *
+  *	 <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
+  *
+  *	 <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
+  *
+  *	 <x>_<y>_f(uint32_t v) : Returns a value based on 'v' which has been shifted
+  *		 and masked to place it at field <y> of register <x>.  This value
+  *		 can be |'d with others to produce a full register value for
+  *		 register <x>.
+  *
+  *	 <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
+  *		 value can be ~'d and then &'d to clear the value of field <y> for
+  *		 register <x>.
+  *
+  *	 <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
+  *		 to place it at field <y> of register <x>.  This value can be |'d
+  *		 with others to produce a full register value for <x>.
+  *
+  *	 <x>_<y>_v(uint32_t r) : Returns the value of field <y> from a full register
+  *		 <x> value 'r' after being shifted to place its LSB at bit 0.
+  *		 This value is suitable for direct comparison with other unshifted
+  *		 values appropriate for use in field <y> of register <x>.
+  *
+  *	 <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
+  *		 field <y> of register <x>.  This value is suitable for direct
+  *		 comparison with unshifted values appropriate for use in field <y>
+  *		 of register <x>.
+  */
+
+#ifndef HW_HOST1X_UCLASS_HOST1X_H_
+#define HW_HOST1X_UCLASS_HOST1X_H_
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
+static inline uint32_t host1x_uclass_wait_syncpt_incr_indx_f(uint32_t v)
+{
+	return (v & 0xff) << 24;
+}
+static inline uint32_t host1x_uclass_wait_syncpt_incr_r(void)
+{
+	return 0x0a;
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
+static inline uint32_t host1x_uclass_delay_usec_r(void)
+{
+	return 0x10;
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
+#endif
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
index 0000000..05133fe
--- /dev/null
+++ b/tegra/tegra_drm.c
@@ -0,0 +1,998 @@
+/*
+ * Copyright (C) 2012-2013 NVIDIA Corporation.
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
+ *	Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ */
+
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+
+#include <drm.h>
+#include <xf86drm.h>
+#include <xf86atomic.h>
+
+#include "hw_host1x01_uclass.h"
+#include "host1x01_hardware.h"
+#include "tegra_drmif.h"
+#include "tegra_drm.h"
+#include "class_ids.h"
+
+#define TEGRA_SYNCPT_INVALID	((uint32_t)(-1))
+
+/*
+ * Default configuration for new streams
+ *
+ * NUMBER_OF_BUFFERS - Determine the number of preallocated command buffers
+ * RELOC_TABLE_SIZE  - Maximum number of memory references in a command buffer
+ * BUFFER_SIZE_WORDS - Define the size of command buffers
+ */
+
+#define NUMBER_OF_BUFFERS		4
+#define RELOC_TABLE_SIZE		128
+#define BUFFER_SIZE_WORDS		1024
+
+enum tegra_stream_status {
+	TEGRADRM_STREAM_FREE,
+	TEGRADRM_STREAM_CONSTRUCT,
+	TEGRADRM_STREAM_READY
+};
+
+struct tegra_device {
+	int				fd;
+};
+
+struct tegra_bo {
+	struct tegra_device		*dev;
+	void				*vaddr;
+	uint32_t			gem_handle;
+	unsigned int			offset;
+	uint32_t			size;
+	atomic_t			refcount;
+};
+
+struct tegra_channel {
+	struct tegra_device		*dev;
+	uint64_t			context;
+
+	enum tegra_module_id		module_id;
+	uint32_t			default_class_id;
+	uint32_t			syncpt_id;
+};
+
+struct tegra_command_buffer {
+
+	struct tegra_bo			*mem;
+
+	struct tegra_drm_reloc		*reloc_table;
+	uint32_t			*data;
+
+	uint32_t			cmd_ptr;
+	uint32_t			reloc_ptr;
+	uint64_t			syncpt_max;
+
+	int				flushed;
+	int				preallocated;
+};
+
+struct tegra_stream {
+
+	enum tegra_stream_status	status;
+
+	struct tegra_channel		*channel;
+	int				num_words;
+	int				num_relocs;
+	int				num_syncpt_incrs;
+
+	int				num_buffers;
+	int				num_max_relocs;
+	uint32_t			buffer_size;
+
+	struct tegra_command_buffer	*buffers;
+	struct tegra_command_buffer	*active_buffer;
+	unsigned int			active_buffer_idx;
+
+	uint32_t			current_class_id;
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
+	stream->active_buffer_idx =
+		(stream->active_buffer_idx + 1) % stream->num_buffers;
+	stream->active_buffer = &stream->buffers[stream->active_buffer_idx];
+}
+
+/*
+ * tegra_release_cmdbuf(buffer)
+ *
+ * This function releases given command buffer.
+ */
+
+static void tegra_release_cmdbuf(struct tegra_command_buffer *buffer)
+{
+	free(buffer->reloc_table);
+	tegra_bo_free(buffer->mem);
+	memset(buffer, 0, sizeof(*buffer));
+}
+
+/*
+ * tegra_allocate_cmdbuf(buffer)
+ *
+ * This function allocates and initializes a command buffer. cmduf
+ * structure must be zeroed before calling this function!
+ */
+
+static int tegra_allocate_cmdbuf(struct tegra_device *dev,
+				 struct tegra_command_buffer *buffer,
+				 uint32_t buffer_size, uint32_t num_relocs)
+{
+
+	/* Allocate and map memory for opcodes */
+
+	if (!(buffer->mem =
+	    tegra_bo_allocate(dev, sizeof(uint32_t) * buffer_size, 4)))
+		goto err_buffer_create;
+
+	if(!(buffer->data = tegra_bo_map(buffer->mem)))
+		goto err_buffer_create;
+
+	/* Allocate reloc_table */
+	if (!(buffer->reloc_table =
+	    malloc(num_relocs * sizeof(struct tegra_drm_reloc))))
+		goto err_buffer_create;
+
+	/* Initialize rest of the struct */
+	buffer->reloc_ptr = 0;
+	buffer->cmd_ptr = 0;
+
+	return 0;
+
+err_buffer_create:
+	tegra_release_cmdbuf(buffer);
+	return -ENOMEM;
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
+	struct tegra_device *dev;
+
+	if (!(dev = malloc(sizeof(dev))))
+		goto err_dev_alloc;
+	dev->fd = fd;
+
+	return dev;
+
+err_dev_alloc:
+	return NULL;
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
+	if (!dev)
+		return;
+	free(dev);
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
+struct tegra_channel *tegra_channel_open(struct tegra_device *dev,
+					 enum tegra_module_id module_id)
+{
+	struct tegra_channel *channel;
+	struct tegra_drm_get_syncpt get_args;
+	struct tegra_drm_open_channel open_args;
+	uint32_t default_class_id;
+
+	if (!(channel = malloc(sizeof(*channel))))
+		goto err_channel_alloc;
+
+	switch (module_id) {
+	case TEGRADRM_MODULEID_2D:
+		default_class_id = HOST1X_CLASS_GR2D;
+		break;
+	default:
+		return NULL;
+	}
+
+	channel->dev = dev;
+	channel->module_id = module_id;
+	channel->default_class_id = default_class_id;
+
+	/* Open the channel */
+	open_args.client = default_class_id;
+	if (drmIoctl(dev->fd, DRM_IOCTL_TEGRA_OPEN_CHANNEL, &open_args))
+		goto err_channel_open;
+	channel->context = open_args.context;
+
+	/* Get a syncpoint for the channel */
+	get_args.context = open_args.context;
+	get_args.index = 0;
+	if (drmIoctl(dev->fd, DRM_IOCTL_TEGRA_GET_SYNCPT, &get_args))
+		goto err_tegra_ioctl;
+	channel->syncpt_id = get_args.id;
+
+	return channel;
+
+err_tegra_ioctl:
+	drmIoctl(dev->fd, DRM_IOCTL_TEGRA_CLOSE_CHANNEL, &open_args);
+err_channel_open:
+	free(channel);
+err_channel_alloc:
+	return NULL;
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
+	struct tegra_drm_close_channel close_args;
+
+	if (!channel)
+		return;
+
+	close_args.context = channel->context;
+	drmIoctl(channel->dev->fd, DRM_IOCTL_TEGRA_CLOSE_CHANNEL, &close_args);
+
+	free(channel);
+}
+
+
+/*
+ * tegra_stream_create(channel)
+ *
+ * Create a stream for given channel. This function preallocates several
+ * command buffers for later usage to improve performance. Streams are
+ * used for generating command buffers opcode by opcode using
+ * tegra_stream_push().
+ */
+
+struct tegra_stream *tegra_stream_create(struct tegra_channel *channel,
+					 uint32_t buffer_size,
+					 int num_buffers, int num_max_relocs)
+{
+	struct tegra_stream *stream;
+	int i;
+
+	if (!channel)
+		goto err_bad_channel;
+
+	if (!(stream = malloc(sizeof(*stream))))
+		goto err_alloc_stream;
+
+	memset(stream, 0, sizeof(*stream));
+	stream->channel = channel;
+	stream->status = TEGRADRM_STREAM_FREE;
+
+	stream->buffer_size = buffer_size ? buffer_size : BUFFER_SIZE_WORDS;
+	stream->num_buffers = num_buffers ? num_buffers : NUMBER_OF_BUFFERS;
+	stream->num_max_relocs =
+		num_max_relocs ? num_max_relocs : RELOC_TABLE_SIZE;
+
+	if (!(stream->buffers =
+	    malloc(sizeof(struct tegra_command_buffer) * stream->num_buffers)))
+		goto err_alloc_cmdbufs;
+
+	/* tegra_allocate_cmdbuf() assumes buffer elements to be zeroed */
+	memset(stream->buffers, 0,
+	       sizeof(struct tegra_command_buffer) * stream->num_buffers);
+
+	for (i = 0; i < stream->num_buffers; i++) {
+		if (tegra_allocate_cmdbuf(channel->dev, &stream->buffers[i],
+			stream->buffer_size, stream->num_max_relocs))
+			goto err_buffer_create;
+
+		stream->buffers[i].preallocated = 1;
+	}
+
+	stream->active_buffer_idx = 0;
+	stream->active_buffer = &stream->buffers[0];
+
+	return stream;
+
+err_buffer_create:
+	for (i = 0; i < stream->num_buffers; i++)
+		tegra_release_cmdbuf(&stream->buffers[i]);
+	free(stream->buffers);
+err_alloc_cmdbufs:
+	free(stream);
+err_alloc_stream:
+err_bad_channel:
+	return NULL;
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
+	int i;
+
+	if (!stream)
+		return;
+
+	for (i = 0; i < stream->num_buffers; i++) {
+		free(stream->buffers[i].reloc_table);
+		tegra_bo_free(stream->buffers[i].mem);
+	}
+
+	free(stream->buffers);
+	free(stream);
+}
+
+/*
+ * tegra_fence_is_valid(fence)
+ *
+ * Check validity of a fence.
+ */
+
+int tegra_fence_is_valid(const struct tegra_fence *fence)
+{
+	int valid = 1;
+	valid = valid && fence ? 1 : 0;
+	valid = valid && fence->id != TEGRA_SYNCPT_INVALID;
+	return valid;
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
+	fence->id = TEGRA_SYNCPT_INVALID;
+	fence->value = 0;
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
+	*dst = *src;
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
+		       struct tegra_fence *fence, long timeout, long *value)
+{
+	struct tegra_drm_syncpt_wait args;
+	int err;
+
+	if (!tegra_fence_is_valid(fence))
+		return -EINVAL;
+
+	args.timeout = timeout;
+	args.id = fence->id;
+	args.thresh = fence->value;
+	args.value = 0;
+
+	err = drmIoctl(channel->dev->fd, DRM_IOCTL_TEGRA_SYNCPT_WAIT, &args);
+
+	if (value)
+		*value = args.value;
+
+	return err;
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
+			     struct tegra_fence *fence, long timeout)
+{
+	return tegra_fence_waitex(channel, fence, timeout, NULL);
+}
+
+/*
+ * tegra_fence_wait(channel, wait)
+ *
+ * Wait for a given syncpoint value without timeout.
+ */
+
+int tegra_fence_wait(struct tegra_channel *channel, struct tegra_fence *fence)
+{
+	return tegra_fence_waitex(channel, fence, DRM_TEGRA_NO_TIMEOUT, NULL);
+}
+
+/*
+ * tegra_stream_push_reloc(stream, h, offset)
+ *
+ * Push a memory reference to the stream.
+ */
+
+int tegra_stream_push_reloc(struct tegra_stream *stream, struct tegra_bo *h,
+			    int offset)
+{
+	struct tegra_drm_reloc reloc;
+
+	if (!(stream && h && stream->num_words >= 1 && stream->num_relocs >= 1))
+		return -EINVAL;
+
+	reloc.cmdbuf.handle = stream->active_buffer->mem->gem_handle;
+	reloc.cmdbuf.offset = stream->active_buffer->cmd_ptr * 4;
+	reloc.target.handle = h->gem_handle;
+	reloc.target.offset = offset;
+	reloc.shift = 0;
+
+	stream->num_words--;
+	stream->num_relocs--;
+	stream->active_buffer->data[stream->active_buffer->cmd_ptr++] =
+		0xDEADBEEF;
+	stream->active_buffer->reloc_table[stream->active_buffer->reloc_ptr++] =
+		reloc;
+
+	return 0;
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
+	return h->gem_handle;
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
+				   uint32_t num_bytes, uint32_t alignment)
+{
+	struct tegra_drm_gem_create create;
+	struct tegra_bo *h;
+
+	if (!(h = malloc(sizeof(*h))))
+		goto err_alloc_memory_handle;
+
+	/* Allocate memory */
+	memset(&create, 0, sizeof(create));
+	create.size = num_bytes;
+	if (drmIoctl(dev->fd, DRM_IOCTL_TEGRA_GEM_CREATE, &create))
+		goto err_alloc_memory;
+
+	h->gem_handle = create.handle;
+	h->size = create.size;
+	h->offset = 0;
+	h->vaddr = NULL;
+	h->dev = dev;
+	atomic_set(&h->refcount, 1);
+
+	return h;
+
+err_alloc_memory:
+	free(h);
+err_alloc_memory_handle:
+	return NULL;
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
+	struct drm_gem_close unref;
+
+	if (!h)
+		return;
+
+	tegra_bo_unmap(h);
+	unref.handle = h->gem_handle;
+	drmIoctl(h->dev->fd, DRM_IOCTL_GEM_CLOSE, &unref);
+	free(h);
+}
+
+/*
+ * tegra_bo_get(h)
+ *
+ * Increase reference counting to the given bo handle
+ */
+
+void tegra_bo_get(struct tegra_bo *h)
+{
+	if (!h)
+		return;
+	atomic_inc(&h->refcount);
+}
+
+/*
+ * tegra_bo_put(h)
+ *
+ * Decrease reference counting to the given bo handle. The buffer is freed
+ * if all references to the buffer object are dropped.
+ */
+
+void tegra_bo_put(struct tegra_bo *h)
+{
+	if (!h)
+		return;
+	if (atomic_dec_and_test(&h->refcount))
+		tegra_bo_free(h);
+}
+/*
+ * tegra_bo_map(h)
+ *
+ * Map the given handle for the application.
+ */
+
+void * tegra_bo_map(struct tegra_bo * h)
+{
+	if (!h->offset) {
+		struct tegra_drm_gem_mmap args = {h->gem_handle, 0};
+		int ret;
+
+		ret = drmIoctl(h->dev->fd, DRM_IOCTL_TEGRA_GEM_MMAP, &args);
+		if (ret)
+			return NULL;
+		h->offset = args.offset;
+	}
+
+	if (!h->vaddr)
+		h->vaddr = mmap(NULL, h->size, PROT_READ | PROT_WRITE,
+				MAP_SHARED, h->dev->fd, h->offset);
+
+	return h->vaddr;
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
+	if (!(h && h->vaddr))
+		return;
+
+	munmap(h->vaddr, h->size);
+	h->vaddr = NULL;
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
+int tegra_stream_flush(struct tegra_stream *stream, struct tegra_fence *fence)
+{
+	struct tegra_channel *ch = stream->channel;
+	struct tegra_drm_cmdbuf cmdbuf;
+	struct tegra_drm_submit submit;
+	struct tegra_drm_syncpt syncpt_incr;
+	struct tegra_command_buffer * buffer = stream->active_buffer;
+	int err;
+
+	if (!stream)
+		return -EINVAL;
+
+	/* Reflushing is fine */
+	if (stream->status == TEGRADRM_STREAM_FREE)
+		return 0;
+
+	/* Return error if stream is constructed badly */
+	if(stream->status != TEGRADRM_STREAM_READY)
+		return -EINVAL;
+
+	/* Clean args */
+	memset(&submit, 0, sizeof(submit));
+
+	/* Construct cmd buffer */
+	cmdbuf.handle = buffer->mem->gem_handle;
+	cmdbuf.offset = 0;
+	cmdbuf.words = buffer->cmd_ptr;
+
+	/* Construct syncpoint increments struct */
+	syncpt_incr.id = ch->syncpt_id;
+	syncpt_incr.incrs = stream->num_syncpt_incrs;
+
+	/* Create submit */
+	submit.context = ch->context;
+	submit.num_relocs = buffer->reloc_ptr;
+	submit.num_syncpts = 1;
+	submit.num_cmdbufs = 1;
+	submit.relocs = (uint32_t)buffer->reloc_table;
+	submit.syncpts = (uint32_t)&syncpt_incr;
+	submit.cmdbufs = (uint32_t)&cmdbuf;
+
+	/* Push submits to the channel */
+	if ((err = drmIoctl(ch->dev->fd, DRM_IOCTL_TEGRA_SUBMIT, &submit))) {
+		tegra_fence_clear(fence);
+		return err;
+	}
+
+	/* Return fence */
+	if (fence) {
+		fence->id = ch->syncpt_id;
+		fence->value = submit.fence;
+	}
+
+	stream->num_syncpt_incrs = 0;
+	stream->active_buffer->syncpt_max = submit.fence;
+	stream->active_buffer->flushed = 1;
+
+	/* Release non-preallocated buffers */
+	if (!stream->active_buffer->preallocated) {
+		tegra_release_cmdbuf(stream->active_buffer);
+		free(stream->active_buffer);
+
+		/* Restore the original active buffer */
+		stream->active_buffer =
+			&stream->buffers[stream->active_buffer_idx];
+	}
+
+	stream->status = TEGRADRM_STREAM_FREE;
+	return 0;
+}
+
+/*
+ * tegra_stream_begin(stream, num_words, fence, num_fences, num_syncpt_incrs,
+ *		  num_relocs, class_id)
+ *
+ * Start constructing a stream.
+ *  - num_words refer to the maximum number of words the stream can contain.
+ *  - fence is a pointer to a table that contains syncpoint preconditions
+ *	before the stream execution can start.
+ *  - num_fences indicate the number of elements in the fence table.
+ *  - num_relocs indicate the number of memory references in the buffer.
+ *  - class_id refers to the class_id that is selected in the beginning of a
+ *	stream. If no class id is given, the default class id (=usually the
+ *	client device's class) is selected.
+ *
+ * This function verifies that the current buffer has enough room for holding
+ * the whole stream (this is computed using num_words and num_relocs). The
+ * function blocks until the stream buffer is ready for use.
+ */
+
+int tegra_stream_begin(struct tegra_stream *stream, int num_words,
+		       struct tegra_fence *fence, int num_fences,
+		       int num_relocs, uint32_t class_id)
+{
+	int i;
+
+	/* check stream and its state */
+	if (!(stream && (stream->status == TEGRADRM_STREAM_FREE ||
+	    stream->status == TEGRADRM_STREAM_READY)))
+		return -EINVAL;
+
+	/* check fence validity */
+	for (i = 0; i < num_fences; i++)
+		if(!tegra_fence_is_valid(fence + i))
+			return -EINVAL;
+
+	/* handle class id */
+	if (!class_id && stream->channel->default_class_id)
+		class_id = stream->channel->default_class_id;
+
+	/* include following in num words:
+	 *  - fence waits in the beginningi ( 1 + num_fences)
+	 *  - setclass in the beginning (1 word)
+	 *  - syncpoint increment at the end of the stream (2 words)
+	 */
+
+	num_words += 2;
+	num_words += class_id ? 1 : 0;
+	num_words += num_fences ? 1 + num_fences : 0;
+
+	/* Flush, if the current buffer is full */
+
+	if ((stream->active_buffer->cmd_ptr + num_words + num_relocs >
+	    stream->buffer_size) ||
+	    (stream->active_buffer->reloc_ptr + num_relocs >
+	    (uint32_t)stream->num_max_relocs))
+		tegra_stream_flush(stream, NULL);
+
+	/* Check if we cannot use a preallocated buffer */
+
+	if ((uint32_t)(num_words + num_relocs) > stream->buffer_size ||
+	    num_relocs > stream->num_max_relocs) {
+		struct tegra_command_buffer *cmdbuf;
+
+		/* The new stream does not fit into a preallocated buffer.
+		 * Allocate a new buffer */
+
+		if (!(cmdbuf = malloc(sizeof(*cmdbuf))))
+			return -ENOMEM;
+		memset(cmdbuf, 0, sizeof(*cmdbuf));
+
+		if (tegra_allocate_cmdbuf(stream->channel->dev, cmdbuf,
+			num_words, num_relocs)) {
+			free(cmdbuf);
+			return -ENOMEM;
+		}
+
+		stream->active_buffer = cmdbuf;
+
+	} else if (stream->active_buffer->flushed) {
+
+		/* We can use preallocated buffer. Make sure the buffer is
+		 * actually free */
+
+		struct tegra_fence fence;
+
+		tegra_next_buffer(stream);
+
+		fence.id = stream->channel->syncpt_id;
+		fence.value = stream->active_buffer->syncpt_max;
+		tegra_fence_wait(stream->channel, &fence);
+
+		stream->active_buffer->cmd_ptr = 0;
+		stream->active_buffer->reloc_ptr = 0;
+		stream->active_buffer->flushed = 0;
+	}
+
+	stream->status = TEGRADRM_STREAM_CONSTRUCT;
+	stream->current_class_id = class_id;
+	stream->num_relocs = num_relocs;
+	stream->num_words = num_words;
+
+	/* Add fences */
+	if (num_fences) {
+		tegra_stream_push(stream,
+				  host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
+				  host1x_uclass_wait_syncpt_r(), num_fences));
+
+		for (i = 0; i < num_fences; i++)
+			tegra_stream_push(stream,
+					  host1x_class_host_wait_syncpt(
+					  fence[i].id, fence[i].value));
+	}
+
+	if (class_id)
+		tegra_stream_push(stream,
+				  host1x_opcode_setclass(class_id, 0, 0));
+
+	return 0;
+}
+
+/*
+ * tegra_stream_push_incr(stream, cond)
+ *
+ * Push "increment syncpt" opcode to the stream. This function maintains
+ * the counter of pushed increments
+ */
+
+int tegra_stream_push_incr(struct tegra_stream *stream, uint32_t cond)
+{
+	if (!(stream && stream->num_words >= 2 &&
+	    stream->status == TEGRADRM_STREAM_CONSTRUCT))
+		return -EINVAL;
+
+	/* Add syncpoint increment on cond */
+	tegra_stream_push(stream, host1x_opcode_nonincr(
+					host1x_uclass_incr_syncpt_r(), 1));
+	tegra_stream_push(stream, host1x_class_host_incr_syncpt(
+					cond, stream->channel->syncpt_id));
+
+	stream->num_syncpt_incrs += 1;
+
+	return 0;
+}
+
+/*
+ * tegra_stream_push_setclass(stream, class_id)
+ *
+ * Push "set class" opcode to the stream. Do nothing if the class is already
+ * active
+ */
+
+int tegra_stream_push_setclass(struct tegra_stream *stream, uint32_t class_id)
+{
+	if (!(stream && stream->num_words >= 1 &&
+	    stream->status == TEGRADRM_STREAM_CONSTRUCT))
+		return -EINVAL;
+
+	if (stream->current_class_id == class_id)
+		return 0;
+
+	tegra_stream_push(stream, host1x_opcode_setclass(class_id, 0, 0));
+
+	stream->current_class_id = class_id;
+	return 0;
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
+	if (!(stream && stream->status == TEGRADRM_STREAM_CONSTRUCT &&
+	    stream->num_words >= 2))
+		return -EINVAL;
+
+	/* Add last syncpoint increment on OP_DONE */
+	tegra_stream_push_incr(stream,
+			       host1x_uclass_incr_syncpt_cond_op_done_v());
+
+	stream->status = TEGRADRM_STREAM_READY;
+	return 0;
+}
+
+/*
+ * tegra_stream_push(stream, word)
+ *
+ * Push a single word to given stream.
+ */
+
+int tegra_stream_push(struct tegra_stream *stream, uint32_t word)
+{
+	if (!(stream && stream->num_words >= 1 &&
+	    stream->status == TEGRADRM_STREAM_CONSTRUCT))
+		return -EINVAL;
+
+	stream->num_words--;
+	stream->active_buffer->data[stream->active_buffer->cmd_ptr++] = word;
+
+	return 0;
+}
+
+/*
+ * tegra_reloc (variable, handle, offset)
+ *
+ * This function creates a reloc allocation. The function should be used in
+ * conjunction with tegra_stream_push_words.
+ */
+
+struct tegra_reloc tegra_reloc(const void *var, const struct tegra_bo *h,
+			       const uint32_t offset)
+{
+	struct tegra_reloc reloc = {var, (struct tegra_bo *)h, offset};
+	return reloc;
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
+int tegra_stream_push_words(struct tegra_stream *stream, const void *addr,
+			    int words, int num_relocs, int num_syncpt_incrs,
+			    ...)
+{
+	va_list ap;
+	struct tegra_reloc reloc_arg;
+	struct tegra_command_buffer *buffer;
+
+	if (!(stream && stream->num_words >= words &&
+	    stream->num_relocs >= num_relocs))
+		return -EINVAL;
+
+	buffer = stream->active_buffer;
+
+	stream->num_words -= words;
+	stream->num_relocs -= num_relocs;
+	stream->num_syncpt_incrs += num_syncpt_incrs;
+
+	/* Copy the contents */
+	memcpy(buffer->data + buffer->cmd_ptr, addr, words * sizeof(uint32_t));
+
+	/* Copy relocs */
+	va_start(ap, num_syncpt_incrs);
+	for (; num_relocs; num_relocs--) {
+
+		uint32_t cmd_ptr;
+		struct tegra_drm_reloc reloc_entry;
+
+		reloc_arg = va_arg(ap, struct tegra_reloc);
+
+		cmd_ptr = buffer->cmd_ptr +
+			((uint32_t *) reloc_arg.addr) - ((uint32_t *) addr);
+
+		reloc_entry.cmdbuf.handle = buffer->mem->gem_handle;
+		reloc_entry.cmdbuf.offset = cmd_ptr * 4;
+		reloc_entry.target.handle = reloc_arg.h->gem_handle;
+		reloc_entry.target.offset = reloc_arg.offset;
+		reloc_entry.shift = 0;
+
+		buffer->data[cmd_ptr] = 0xDEADBEEF;
+		buffer->reloc_table[buffer->reloc_ptr++] = reloc_entry;
+	}
+	va_end(ap);
+
+	buffer->cmd_ptr += words;
+
+	return 0;
+}
diff --git a/tegra/tegra_drm.h b/tegra/tegra_drm.h
new file mode 100644
index 0000000..d1fe337
--- /dev/null
+++ b/tegra/tegra_drm.h
@@ -0,0 +1,136 @@
+/*
+ * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef TEGRA_DRM_H_
+#define TEGRA_DRM_H_
+
+struct tegra_drm_gem_create {
+	__u64 size;
+	__u32 flags;
+	__u32 handle;
+};
+
+struct tegra_drm_gem_mmap {
+	__u32 handle;
+	__u32 offset;
+};
+
+struct tegra_drm_syncpt_read {
+	__u32 id;
+	__u32 value;
+};
+
+struct tegra_drm_syncpt_incr {
+	__u32 id;
+	__u32 pad;
+};
+
+struct tegra_drm_syncpt_wait {
+	__u32 id;
+	__u32 thresh;
+	__u32 timeout;
+	__u32 value;
+};
+
+#define DRM_TEGRA_NO_TIMEOUT	(0xffffffff)
+
+struct tegra_drm_open_channel {
+	__u32 client;
+	__u32 pad;
+	__u64 context;
+};
+
+struct tegra_drm_close_channel {
+	__u64 context;
+};
+
+struct tegra_drm_get_syncpt {
+	__u64 context;
+	__u32 index;
+	__u32 id;
+};
+
+struct tegra_drm_syncpt {
+	__u32 id;
+	__u32 incrs;
+};
+
+struct tegra_drm_cmdbuf {
+	__u32 handle;
+	__u32 offset;
+	__u32 words;
+	__u32 pad;
+};
+
+struct tegra_drm_reloc {
+	struct {
+		__u32 handle;
+		__u32 offset;
+	} cmdbuf;
+	struct {
+		__u32 handle;
+		__u32 offset;
+	} target;
+	__u32 shift;
+	__u32 pad;
+};
+
+struct tegra_drm_waitchk {
+	__u32 handle;
+	__u32 offset;
+	__u32 syncpt;
+	__u32 thresh;
+};
+
+struct tegra_drm_submit {
+	__u64 context;
+	__u32 num_syncpts;
+	__u32 num_cmdbufs;
+	__u32 num_relocs;
+	__u32 num_waitchks;
+	__u32 waitchk_mask;
+	__u32 timeout;
+	__u32 pad;
+	__u64 syncpts;
+	__u64 cmdbufs;
+	__u64 relocs;
+	__u64 waitchks;
+	__u32 fence;		/* Return value */
+
+	__u32 reserved[5];	/* future expansion */
+};
+
+#define DRM_TEGRA_GEM_CREATE	0x00
+#define DRM_TEGRA_GEM_MMAP	0x01
+#define DRM_TEGRA_SYNCPT_READ	0x02
+#define DRM_TEGRA_SYNCPT_INCR	0x03
+#define DRM_TEGRA_SYNCPT_WAIT	0x04
+#define DRM_TEGRA_OPEN_CHANNEL	0x05
+#define DRM_TEGRA_CLOSE_CHANNEL	0x06
+#define DRM_TEGRA_GET_SYNCPT	0x07
+#define DRM_TEGRA_SUBMIT	0x08
+
+#define DRM_IOCTL_TEGRA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_CREATE, struct tegra_drm_gem_create)
+#define DRM_IOCTL_TEGRA_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_MMAP, struct tegra_drm_gem_mmap)
+#define DRM_IOCTL_TEGRA_SYNCPT_READ DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_SYNCPT_READ, struct tegra_drm_syncpt_read)
+#define DRM_IOCTL_TEGRA_SYNCPT_INCR DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_SYNCPT_INCR, struct tegra_drm_syncpt_incr)
+#define DRM_IOCTL_TEGRA_SYNCPT_WAIT DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_SYNCPT_WAIT, struct tegra_drm_syncpt_wait)
+#define DRM_IOCTL_TEGRA_OPEN_CHANNEL DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_OPEN_CHANNEL, struct tegra_drm_open_channel)
+#define DRM_IOCTL_TEGRA_CLOSE_CHANNEL DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_CLOSE_CHANNEL, struct tegra_drm_open_channel)
+#define DRM_IOCTL_TEGRA_GET_SYNCPT DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GET_SYNCPT, struct tegra_drm_get_syncpt)
+#define DRM_IOCTL_TEGRA_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_SUBMIT, struct tegra_drm_submit)
+
+#endif
diff --git a/tegra/tegra_drmif.h b/tegra/tegra_drmif.h
new file mode 100644
index 0000000..198696b
--- /dev/null
+++ b/tegra/tegra_drmif.h
@@ -0,0 +1,110 @@
+/*
+ * Copyright (C) 2012-2013 NVIDIA Corporation.
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
+ *	Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ */
+
+#ifndef TEGRA_DRMIF_H_
+#define TEGRA_DRMIF_H_
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
+	uint32_t id;
+	uint32_t value;
+};
+
+struct tegra_reloc {
+	const void *addr;
+	struct tegra_bo *h;
+	uint32_t offset;
+};
+
+enum tegra_module_id {
+	TEGRADRM_MODULEID_2D
+};
+
+/* Device operations */
+struct tegra_device *tegra_device_create(int fd);
+void tegra_device_destroy(struct tegra_device *dev);
+
+/* Memory operations */
+uint32_t tegra_bo_gethandle(struct tegra_bo *handle);
+struct tegra_bo *tegra_bo_allocate(struct tegra_device *dev,
+				   uint32_t num_bytes, uint32_t alignment);
+void tegra_bo_free(struct tegra_bo * handle);
+void * tegra_bo_map(struct tegra_bo * handle);
+void tegra_bo_unmap(struct tegra_bo * handle);
+void tegra_bo_get(struct tegra_bo *handle);
+void tegra_bo_put(struct tegra_bo *handle);
+
+/* Channel operations */
+struct tegra_channel *tegra_channel_open(struct tegra_device *dev,
+					 enum tegra_module_id module_id);
+void tegra_channel_close(struct tegra_channel *channel);
+
+/* Stream operations */
+struct tegra_stream *tegra_stream_create(struct tegra_channel *channel,
+					 uint32_t buffer_size,
+					 int num_buffers, int num_max_relocs);
+void tegra_stream_destroy(struct tegra_stream *stream);
+int tegra_stream_begin(struct tegra_stream *stream, int num_words,
+		       struct tegra_fence *fence, int num_fences,
+		       int num_relocs, uint32_t class_id);
+int tegra_stream_end(struct tegra_stream *stream);
+int tegra_stream_flush(struct tegra_stream *stream, struct tegra_fence *fence);
+int tegra_stream_push(struct tegra_stream *stream, uint32_t word);
+int tegra_stream_push_incr(struct tegra_stream *stream, uint32_t cond);
+int tegra_stream_push_setclass(struct tegra_stream *stream, uint32_t class_id);
+int tegra_stream_push_reloc(struct tegra_stream *stream,
+			    struct tegra_bo *handle, int offset);
+struct tegra_reloc tegra_reloc(const void *var, const struct tegra_bo *handle,
+			       const uint32_t offset);
+int tegra_stream_push_words(struct tegra_stream *stream, const void *addr,
+			    int words, int num_relocs, int num_syncpt_incrs,
+			    ...);
+
+/* Fence operations */
+int tegra_fence_wait(struct tegra_channel *channel, struct tegra_fence *fence);
+int tegra_fence_wait_timeout(struct tegra_channel *channel,
+			     struct tegra_fence *fence, long timeout);
+int tegra_fence_waitex(struct tegra_channel *channel,
+		       struct tegra_fence *fence, long timeout, long *value);
+int tegra_fence_is_valid(const struct tegra_fence *fence);
+void tegra_fence_clear(struct tegra_fence *fence);
+void tegra_fence_copy(struct tegra_fence *dst, const struct tegra_fence *src);
+
+#ifdef __cplusplus
+};
+#endif
+
+#endif
-- 
1.7.9.5
