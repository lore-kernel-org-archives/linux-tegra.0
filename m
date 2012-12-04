From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: =?UTF-8?q?=5BRFC=20libdrm=5D=20Add=20NVIDIA=20Tegra=20support?=
Date: Tue,  4 Dec 2012 16:13:52 +0100
Message-ID: <1354634032-9986-2-git-send-email-thierry.reding@avionic-design.de>
References: <1354634032-9986-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354634032-9986-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add the libdrm_tegra helper library to encapsulate Tegra-specific
interfaces to the DRM.

=46urthermore, Tegra is added to the list of supported chips in the
modetest and vbltest programs.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 Makefile.am               |   6 +-
 configure.ac              |  15 ++-
 include/drm/Makefile.am   |   1 +
 include/drm/tegra_drm.h   |  48 ++++++++++
 tegra/Makefile.am         |  17 ++++
 tegra/libdrm_tegra.pc.in  |  11 +++
 tegra/tegra.c             | 227 ++++++++++++++++++++++++++++++++++++++=
++++++++
 tegra/tegra.h             |  51 +++++++++++
 tests/modetest/modetest.c |   2 +-
 tests/vbltest/vbltest.c   |   2 +-
 10 files changed, 376 insertions(+), 4 deletions(-)
 create mode 100644 include/drm/tegra_drm.h
 create mode 100644 tegra/Makefile.am
 create mode 100644 tegra/libdrm_tegra.pc.in
 create mode 100644 tegra/tegra.c
 create mode 100644 tegra/tegra.h

diff --git a/Makefile.am b/Makefile.am
index 8ecd9d9..e90ae43 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -49,7 +49,11 @@ if HAVE_EXYNOS
 EXYNOS_SUBDIR =3D exynos
 endif
=20
-SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RAD=
EON_SUBDIR) $(OMAP_SUBDIR) $(EXYNOS_SUBDIR) tests include man
+if HAVE_TEGRA
+TEGRA_SUBDIR =3D tegra
+endif
+
+SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RAD=
EON_SUBDIR) $(OMAP_SUBDIR) $(EXYNOS_SUBDIR) $(TEGRA_SUBDIR) tests inclu=
de man
=20
 libdrm_la_LTLIBRARIES =3D libdrm.la
 libdrm_ladir =3D $(libdir)
diff --git a/configure.ac b/configure.ac
index 0c19929..72d6dfa 100644
--- a/configure.ac
+++ b/configure.ac
@@ -114,6 +114,11 @@ AC_ARG_ENABLE(exynos-experimental-api,
 	      [Enable support for EXYNOS's experimental API (default: disable=
d)]),
 	      [EXYNOS=3D$enableval], [EXYNOS=3Dno])
=20
+AC_ARG_ENABLE(tegra-experimental-api,
+	      AS_HELP_STRING([--enable-tegra-experimental-api],
+	      [Enable support for Tegra's experimental API (default: disabled=
)]),
+	      [TEGRA=3D$enableval], [TEGRA=3Dno])
+
 dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
 dnl check compiler flags
 AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
@@ -222,6 +227,11 @@ if test "x$EXYNOS" =3D xyes; then
 	AC_DEFINE(HAVE_EXYNOS, 1, [Have EXYNOS support])
 fi
=20
+AM_CONDITIONAL(HAVE_TEGRA, [test "x$TEGRA" =3D xyes])
+if test "x$TEGRA" =3D xyes; then
+	AC_DEFINE(HAVE_TEGRA, 1, [Have Tegra support])
+fi
+
 AC_ARG_ENABLE([cairo-tests],
               [AS_HELP_STRING([--enable-cairo-tests],
                               [Enable support for Cairo rendering in t=
ests (default: auto)])],
@@ -247,7 +257,7 @@ if test "x$HAVE_LIBUDEV" =3D xyes; then
 fi
 AM_CONDITIONAL(HAVE_LIBUDEV, [test "x$HAVE_LIBUDEV" =3D xyes])
=20
-if test "x$INTEL" !=3D "xno" -o "x$RADEON" !=3D "xno" -o "x$NOUVEAU" !=
=3D "xno" -o "x$OMAP" !=3D "xno"; then
+if test "x$INTEL" !=3D "xno" -o "x$RADEON" !=3D "xno" -o "x$NOUVEAU" !=
=3D "xno" -o "x$OMAP" !=3D "xno" -o "x$TEGRA" !=3D "xno"; then
     # Check for atomic intrinsics
     AC_CACHE_CHECK([for native atomic primitives], drm_cv_atomic_primi=
tives,
     [
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
+echo "  Tegra API      $TEGRA"
 echo ""
diff --git a/include/drm/Makefile.am b/include/drm/Makefile.am
index 2923ab4..3e33ed0 100644
--- a/include/drm/Makefile.am
+++ b/include/drm/Makefile.am
@@ -35,6 +35,7 @@ klibdrminclude_HEADERS =3D \
 	radeon_drm.h \
 	savage_drm.h \
 	sis_drm.h \
+	tegra_drm.h \
 	via_drm.h \
 	mach64_drm.h
=20
diff --git a/include/drm/tegra_drm.h b/include/drm/tegra_drm.h
new file mode 100644
index 0000000..eaec602
--- /dev/null
+++ b/include/drm/tegra_drm.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright =C2=A9 2012 Thierry Reding
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaini=
ng a
+ * copy of this software and associated documentation files (the "Soft=
ware"),
+ * to deal in the Software without restriction, including without limi=
tation
+ * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
+ * and/or sell copies of the Software, and to permit persons to whom t=
he
+ * Software is furnished to do so, subject to the following conditions=
:
+ *
+ * The above copyright notice and this permission notice (including th=
e next
+ * paragraph) shall be included in all copies or substantial portions =
of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMA=
GES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __TEGRA_DRM_H__
+#define __TEGRA_DRM_H__
+
+struct drm_tegra_gem_create {
+	uint32_t handle;
+	uint32_t offset;
+	uint32_t flags;
+	uint32_t size;
+};
+
+struct drm_tegra_gem_info {
+	uint32_t handle;
+	uint32_t offset;
+	uint32_t flags;
+	uint32_t size;
+};
+
+#define DRM_TEGRA_GEM_CREATE		0x40
+#define DRM_TEGRA_GEM_INFO		0x41
+
+#define DRM_IOCTL_TEGRA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_TEG=
RA_GEM_CREATE, struct drm_tegra_gem_create)
+#define DRM_IOCTL_TEGRA_GEM_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA=
_GEM_INFO, struct drm_tegra_gem_info)
+
+#endif /* __TEGRA_DRM_H__ */
diff --git a/tegra/Makefile.am b/tegra/Makefile.am
new file mode 100644
index 0000000..65cd628
--- /dev/null
+++ b/tegra/Makefile.am
@@ -0,0 +1,17 @@
+AM_CPPFLAGS =3D \
+	-I$(top_srcdir) \
+	-I$(top_srcdir)/include/drm
+
+libdrm_tegra_ladir =3D $(libdir)
+libdrm_tegra_la_LTLIBRARIES =3D libdrm_tegra.la
+libdrm_tegra_la_LDFLAGS =3D -version-number 0:0:0 -no-undefined
+libdrm_tegra_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
+
+libdrm_tegra_la_SOURCES =3D \
+	tegra.c
+
+libdrm_tegraincludedir =3D ${includedir}/libdrm
+libdrm_tegrainclude_HEADERS =3D tegra.h
+
+pkgconfigdir =3D @pkgconfigdir@
+pkgconfig_DATA =3D libdrm_tegra.pc
diff --git a/tegra/libdrm_tegra.pc.in b/tegra/libdrm_tegra.pc.in
new file mode 100644
index 0000000..f83c74c
--- /dev/null
+++ b/tegra/libdrm_tegra.pc.in
@@ -0,0 +1,11 @@
+prefix=3D@prefix@
+exec_prefix=3D@exec_prefix@
+libdir=3D@libdir@
+includedir=3D@includedir@
+
+Name: libdrm_tegra
+Description: Userspace interface to Tegra kernel DRM services
+Version: 2.4.40
+Libs: -L${libdir} -ldrm_tegra
+Cflags: -I${includedir} -I${includedir}/libdrm
+Requires.private: libdrm
diff --git a/tegra/tegra.c b/tegra/tegra.c
new file mode 100644
index 0000000..d92eca5
--- /dev/null
+++ b/tegra/tegra.c
@@ -0,0 +1,227 @@
+/*
+ * Copyright =C2=A9 2012 Thierry Reding
+ *
+ * Permission is hereby granted, free of charge, to any person obtaini=
ng a
+ * copy of this software and associated documentation files (the "Soft=
ware"),
+ * to deal in the Software without restriction, including without limi=
tation
+ * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
+ * and/or sell copies of the Software, and to permit persons to whom t=
he
+ * Software is furnished to do so, subject to the following conditions=
:
+ *
+ * The above copyright notice and this permission notice shall be incl=
uded in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifdef HAVE_CONFIG_H
+#  include "config.h"
+#endif
+
+#include <errno.h>
+#include <fcntl.h>
+#include <string.h>
+
+#include <sys/mman.h>
+
+#include <libdrm_lists.h>
+#include <xf86atomic.h>
+#include <xf86drm.h>
+
+#include <tegra_drm.h>
+
+#include "tegra.h"
+
+struct drm_tegra {
+	drmMMListHead bo_list;
+	int fd;
+};
+struct tegra_bo {
+	struct drm_tegra_bo base;
+	drmMMListHead list;
+	atomic_t ref;
+};
+
+static inline struct tegra_bo *tegra_bo(struct drm_tegra_bo *bo)
+{
+	return (struct tegra_bo *)bo;
+}
+
+static void drm_tegra_bo_free(struct drm_tegra_bo *bo)
+{
+	struct tegra_bo *priv =3D tegra_bo(bo);
+	struct drm_gem_close args;
+
+	DRMLISTDEL(&priv->list);
+
+	if (bo->map)
+		munmap(bo->map, bo->size);
+
+	memset(&args, 0, sizeof(args));
+	args.handle =3D bo->handle;
+
+	drmIoctl(bo->device->fd, DRM_IOCTL_GEM_CLOSE, &args);
+
+	free(bo);
+}
+
+int drm_tegra_open(const char *path, struct drm_tegra **devicep)
+{
+	struct drm_tegra *device;
+	int err;
+
+	if (!path || !devicep)
+		return -EINVAL;
+
+	device =3D calloc(1, sizeof(*device));
+	if (!device)
+		return -ENOMEM;
+
+	DRMINITLISTHEAD(&device->bo_list);
+
+	device->fd =3D open(path, O_RDWR);
+	if (device->fd < 0) {
+		err =3D -errno;
+		free(device);
+		return err;
+	}
+
+	*devicep =3D device;
+
+	return 0;
+}
+
+void drm_tegra_close(struct drm_tegra *device)
+{
+	if (device) {
+		close(device->fd);
+		free(device);
+	}
+}
+
+int drm_tegra_bo_new(struct drm_tegra *device, uint32_t flags, uint32_=
t size,
+		     struct drm_tegra_bo **bop)
+{
+	struct drm_tegra_gem_create args;
+	struct drm_tegra_bo *bo;
+	struct tegra_bo *priv;
+	int err;
+
+	if (!device || size =3D=3D 0 || !bop)
+		return -EINVAL;
+
+	bo =3D calloc(1, sizeof(*bo));
+	if (!bo)
+		return -ENOMEM;
+
+	priv =3D tegra_bo(bo);
+
+	DRMLISTINITHEAD(&priv->list);
+	atomic_set(&priv->ref, 1);
+	bo->device =3D device;
+	bo->flags =3D flags;
+	bo->size =3D size;
+
+	memset(&args, 0, sizeof(args));
+	args.flags =3D flags;
+	args.size =3D size;
+
+	err =3D drmCommandWriteRead(device->fd, DRM_TEGRA_GEM_CREATE, &args,
+				  sizeof(args));
+	if (err < 0) {
+		err =3D -errno;
+		free(bo);
+		return err;
+	}
+
+	DRMLISTADD(&priv->list, &device->bo_list);
+	bo->handle =3D args.handle;
+	bo->offset =3D args.offset;
+
+	*bop =3D bo;
+
+	return 0;
+}
+
+int drm_tegra_bo_open(struct drm_tegra *device, uint32_t handle,
+		      struct drm_tegra_bo **bop)
+{
+	struct drm_tegra_gem_info args;
+	struct drm_tegra_bo *bo;
+	struct tegra_bo *priv;
+	int err;
+
+	if (!device || !bop)
+		return -EINVAL;
+
+	bo =3D calloc(1, sizeof(*bo));
+	if (!bo)
+		return -ENOMEM;
+
+	priv =3D tegra_bo(bo);
+
+	DRMLISTINITHEAD(&priv->list);
+	atomic_set(&priv->ref, 1);
+	bo->device =3D device;
+
+	memset(&args, 0, sizeof(args));
+	args.handle =3D handle;
+
+	err =3D drmCommandWriteRead(device->fd, DRM_TEGRA_GEM_INFO, &args,
+				  sizeof(args));
+	if (err < 0) {
+		err =3D -errno;
+		free(bo);
+		return err;
+	}
+
+	DRMLISTADD(&priv->list, &device->bo_list);
+	bo->handle =3D args.handle;
+	bo->offset =3D args.offset;
+	bo->flags =3D args.flags;
+	bo->size =3D args.size;
+
+	*bop =3D bo;
+
+	return 0;
+}
+
+struct drm_tegra_bo *drm_tegra_bo_get(struct drm_tegra_bo *bo)
+{
+	if (bo) {
+		struct tegra_bo *priv =3D tegra_bo(bo);
+		atomic_inc(&priv->ref);
+	}
+
+	return bo;
+}
+
+void drm_tegra_bo_put(struct drm_tegra_bo *bo)
+{
+	if (bo) {
+		struct tegra_bo *priv =3D tegra_bo(bo);
+
+		if (atomic_dec_and_test(&priv->ref))
+			drm_tegra_bo_free(bo);
+	}
+}
+
+int drm_tegra_bo_map(struct drm_tegra_bo *bo)
+{
+	if (!bo->map) {
+		bo->map =3D mmap(0, bo->size, PROT_READ | PROT_WRITE,
+			       MAP_SHARED, bo->device->fd, bo->offset);
+		if (bo->map =3D=3D MAP_FAILED) {
+			bo->map =3D NULL;
+			return -errno;
+		}
+	}
+
+	return 0;
+}
diff --git a/tegra/tegra.h b/tegra/tegra.h
new file mode 100644
index 0000000..619090c
--- /dev/null
+++ b/tegra/tegra.h
@@ -0,0 +1,51 @@
+/*
+ * Copyright =C2=A9 2012 Thierry Reding
+ *
+ * Permission is hereby granted, free of charge, to any person obtaini=
ng a
+ * copy of this software and associated documentation files (the "Soft=
ware"),
+ * to deal in the Software without restriction, including without limi=
tation
+ * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
+ * and/or sell copies of the Software, and to permit persons to whom t=
he
+ * Software is furnished to do so, subject to the following conditions=
:
+ *
+ * The above copyright notice and this permission notice shall be incl=
uded in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __DRM_TEGRA_H__
+#define __DRM_TEGRA_H__ 1
+
+#include <stdint.h>
+#include <stdlib.h>
+
+struct drm_tegra;
+
+struct drm_tegra_bo {
+	struct drm_tegra *device;
+	uint32_t handle;
+	uint32_t offset;
+	uint32_t flags;
+	uint32_t size;
+	void *map;
+};
+
+int drm_tegra_open(const char *path, struct drm_tegra **devicep);
+void drm_tegra_close(struct drm_tegra *device);
+
+int drm_tegra_bo_new(struct drm_tegra *device, uint32_t flags, uint32_=
t size,
+		     struct drm_tegra_bo **bop);
+int drm_tegra_bo_open(struct drm_tegra *device, uint32_t handle,
+		      struct drm_tegra_bo **bop);
+int drm_tegra_bo_map(struct drm_tegra_bo *bo);
+struct drm_tegra_bo *drm_tegra_bo_get(struct drm_tegra_bo *bo);
+void drm_tegra_bo_put(struct drm_tegra_bo *bo);
+
+#endif /* __DRM_TEGRA_H__ */
diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index c91bb9d..913ede8 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -939,7 +939,7 @@ int main(int argc, char **argv)
 	int c;
 	int encoders =3D 0, connectors =3D 0, crtcs =3D 0, planes =3D 0, fram=
ebuffers =3D 0;
 	int test_vsync =3D 0;
-	char *modules[] =3D { "i915", "radeon", "nouveau", "vmwgfx", "omapdrm=
", "exynos" };
+	char *modules[] =3D { "i915", "radeon", "nouveau", "vmwgfx", "omapdrm=
", "exynos", "tegra" };
 	unsigned int i;
 	int count =3D 0, plane_count =3D 0;
 	struct connector con_args[2];
diff --git a/tests/vbltest/vbltest.c b/tests/vbltest/vbltest.c
index 4fccd59..22a5339 100644
--- a/tests/vbltest/vbltest.c
+++ b/tests/vbltest/vbltest.c
@@ -103,7 +103,7 @@ static void usage(char *name)
 int main(int argc, char **argv)
 {
 	int i, c, fd, ret;
-	char *modules[] =3D { "i915", "radeon", "nouveau", "vmwgfx", "exynos"=
 };
+	char *modules[] =3D { "i915", "radeon", "nouveau", "vmwgfx", "exynos"=
, "tegra" };
 	drmVBlank vbl;
 	drmEventContext evctx;
 	struct vbl_info handler_info;
--=20
1.8.0.1
