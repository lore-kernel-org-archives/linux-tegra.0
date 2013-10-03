From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage-configs PATCH] Build using Makefiles, add separate bct/img targets
Date: Thu,  3 Oct 2013 13:10:25 -0600
Message-ID: <1380827425-9816-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In some situations, one may only need BCT binaries and not flashable
image binaries. Hence, it's useful to allow BCTs and flashable image
to be built separately, rather than always building both together.

While re-writing the build system, convert from shell-scripts to
Makefiles. Now, one can "make", "make bcts", or "make images", all with
appropriate dependency checking.

Many Avionic Design boards use a carrier/module design, with the carrier
and module files stored in separate directories. Use symlinks to handle
this, rather than complicating the build system with support for files
from other directories.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .gitignore                                         |  2 ++
 build/gen-image-deps.sh                            | 34 ++++++++++++++++++
 build/post.mk                                      | 31 +++++++++++++++++
 build/pre.mk                                       | 19 ++++++++++
 tegra114/nvidia/dalmore/Makefile                   | 33 ++++++++++++++++++
 tegra114/nvidia/dalmore/build.sh                   | 18 +---------
 tegra124/nvidia/venice2/Makefile                   | 29 ++++++++++++++++
 tegra124/nvidia/venice2/build.sh                   |  8 +----
 tegra20/avionic-design/medcom-wide/Makefile        | 30 ++++++++++++++++
 ...onten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg |  1 +
 tegra20/avionic-design/medcom-wide/build.sh        | 10 ++----
 .../medcom-wide/tegra20-medcom-wide.img.cfg        |  1 +
 tegra20/avionic-design/plutux/Makefile             | 30 ++++++++++++++++
 ...onten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg |  1 +
 tegra20/avionic-design/plutux/build.sh             | 10 ++----
 .../avionic-design/plutux/tegra20-plutux.img.cfg   |  1 +
 tegra20/avionic-design/tec/Makefile                | 30 ++++++++++++++++
 ...onten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg |  1 +
 tegra20/avionic-design/tec/build.sh                | 10 ++----
 tegra20/avionic-design/tec/tegra20-tec.img.cfg     |  1 +
 tegra20/compulab/trimslice/Makefile                | 31 +++++++++++++++++
 tegra20/compulab/trimslice/build.sh                | 11 ++----
 tegra20/nvidia/harmony/Makefile                    | 29 ++++++++++++++++
 tegra20/nvidia/harmony/build.sh                    | 10 ++----
 tegra20/nvidia/seaboard/Makefile                   | 29 ++++++++++++++++
 tegra20/nvidia/seaboard/build.sh                   | 10 ++----
 tegra20/nvidia/ventana/Makefile                    | 29 ++++++++++++++++
 tegra20/nvidia/ventana/build.sh                    | 10 ++----
 tegra20/nvidia/whistler/Makefile                   | 29 ++++++++++++++++
 tegra20/nvidia/whistler/build.sh                   | 10 ++----
 tegra20/toradex/colibri-t20/Makefile               | 40 ++++++++++++++++++++++
 tegra20/toradex/colibri-t20/build.sh               | 24 ++-----------
 tegra30/avionic-design/tec-ng/Makefile             | 30 ++++++++++++++++
 ..._Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg |  1 +
 tegra30/avionic-design/tec-ng/build.sh             | 10 ++----
 .../avionic-design/tec-ng/tegra30-tec-ng.img.cfg   |  1 +
 tegra30/nvidia/beaver/Makefile                     | 29 ++++++++++++++++
 tegra30/nvidia/beaver/build.sh                     | 10 ++----
 tegra30/nvidia/cardhu/Makefile                     | 33 ++++++++++++++++++
 tegra30/nvidia/cardhu/build.sh                     | 20 ++---------
 40 files changed, 551 insertions(+), 145 deletions(-)
 create mode 100755 build/gen-image-deps.sh
 create mode 100644 build/post.mk
 create mode 100644 build/pre.mk
 create mode 100644 tegra114/nvidia/dalmore/Makefile
 create mode 100644 tegra124/nvidia/venice2/Makefile
 create mode 100644 tegra20/avionic-design/medcom-wide/Makefile
 create mode 120000 tegra20/avionic-design/medcom-wide/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
 create mode 120000 tegra20/avionic-design/medcom-wide/tegra20-medcom-wide.img.cfg
 create mode 100644 tegra20/avionic-design/plutux/Makefile
 create mode 120000 tegra20/avionic-design/plutux/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
 create mode 120000 tegra20/avionic-design/plutux/tegra20-plutux.img.cfg
 create mode 100644 tegra20/avionic-design/tec/Makefile
 create mode 120000 tegra20/avionic-design/tec/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
 create mode 120000 tegra20/avionic-design/tec/tegra20-tec.img.cfg
 create mode 100644 tegra20/compulab/trimslice/Makefile
 create mode 100644 tegra20/nvidia/harmony/Makefile
 create mode 100644 tegra20/nvidia/seaboard/Makefile
 create mode 100644 tegra20/nvidia/ventana/Makefile
 create mode 100644 tegra20/nvidia/whistler/Makefile
 create mode 100644 tegra20/toradex/colibri-t20/Makefile
 create mode 100644 tegra30/avionic-design/tec-ng/Makefile
 create mode 120000 tegra30/avionic-design/tec-ng/TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg
 create mode 120000 tegra30/avionic-design/tec-ng/tegra30-tec-ng.img.cfg
 create mode 100644 tegra30/nvidia/beaver/Makefile
 create mode 100644 tegra30/nvidia/cardhu/Makefile

diff --git a/.gitignore b/.gitignore
index 9750905..c9fa379 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,5 @@
+.*.d
+.*.swp
 *.bct
 *.img
 u-boot.bin
diff --git a/build/gen-image-deps.sh b/build/gen-image-deps.sh
new file mode 100755
index 0000000..10c4001
--- /dev/null
+++ b/build/gen-image-deps.sh
@@ -0,0 +1,34 @@
+#!/bin/bash
+
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+img_cfg_file=$1
+img_file=$2
+dep_file=$3
+
+rm -f ${dep_file}
+bct=`grep -i bctfile ${img_cfg_file} | sed -e 's/^.*=//' -e s'/[,;].*$//'`
+bootloader=`grep -i bootloader ${img_cfg_file} | sed -e 's/^.*=//' -e s'/[,;].*$//'`
+
+cat > ${dep_file} <<ENDOFHERE
+${img_file}: \\
+	${img_cfg_file} \\
+	${bct} \\
+	${bootloader}
+ENDOFHERE
diff --git a/build/post.mk b/build/post.mk
new file mode 100644
index 0000000..979d8ce
--- /dev/null
+++ b/build/post.mk
@@ -0,0 +1,31 @@
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+bcts: $(bcts)
+
+images: $(images)
+
+image_deps := $(addprefix .,$(addsuffix .d,$(images)))
+-include $(image_deps)
+
+%.bct: %.bct.cfg
+	cbootimage -gbct -$(soc) $< $@
+
+%.img: %.img.cfg
+	../../../build/gen-image-deps.sh $< $@ .$@.d
+	cbootimage -$(soc) $< $@
diff --git a/build/pre.mk b/build/pre.mk
new file mode 100644
index 0000000..24f0c09
--- /dev/null
+++ b/build/pre.mk
@@ -0,0 +1,19 @@
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+all: bcts images
diff --git a/tegra114/nvidia/dalmore/Makefile b/tegra114/nvidia/dalmore/Makefile
new file mode 100644
index 0000000..023511b
--- /dev/null
+++ b/tegra114/nvidia/dalmore/Makefile
@@ -0,0 +1,33 @@
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t114
+
+bcts := \
+	E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct \
+	E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct \
+	E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct
+
+images := \
+	dalmore-t40x-1866.img \
+	dalmore-t40s-1866.img \
+	dalmore-t40s-1600.img
+
+include ../../../build/post.mk
diff --git a/tegra114/nvidia/dalmore/build.sh b/tegra114/nvidia/dalmore/build.sh
index bac5651..7dc6a05 100755
--- a/tegra114/nvidia/dalmore/build.sh
+++ b/tegra114/nvidia/dalmore/build.sh
@@ -18,20 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -t114 -gbct \
-    E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct.cfg \
-    E1611_Hynix_2GB_H5TC4G63AFR-RDA_792MHz_r403_v03.bct
-cbootimage -t114 dalmore-t40x-1866.img.cfg dalmore-t40x-1866.img
-
-cbootimage -t114 -gbct \
-    E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct.cfg \
-    E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct
-cbootimage -t114 dalmore-t40s-1866.img.cfg dalmore-t40s-1866.img
-
-cbootimage -t114 -gbct \
-    E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct.cfg \
-    E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct
-cbootimage -t114 dalmore-t40s-1600.img.cfg dalmore-t40s-1600.img
+make
diff --git a/tegra124/nvidia/venice2/Makefile b/tegra124/nvidia/venice2/Makefile
new file mode 100644
index 0000000..9795725
--- /dev/null
+++ b/tegra124/nvidia/venice2/Makefile
@@ -0,0 +1,29 @@
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t124
+
+bcts := \
+	PM371_Hynix_2GB_H5TC4G63AFR_RDA_792MHz_0719.bct
+
+images := \
+	venice2-spi.img
+
+include ../../../build/post.mk
diff --git a/tegra124/nvidia/venice2/build.sh b/tegra124/nvidia/venice2/build.sh
index 03e96e7..7dc6a05 100755
--- a/tegra124/nvidia/venice2/build.sh
+++ b/tegra124/nvidia/venice2/build.sh
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -t124 -gbct \
-    PM371_Hynix_2GB_H5TC4G63AFR_RDA_792MHz_0719.bct.cfg \
-    PM371_Hynix_2GB_H5TC4G63AFR_RDA_792MHz_0719.bct
-cbootimage -t124 venice2-spi.img.cfg venice2-spi.img
+make
diff --git a/tegra20/avionic-design/medcom-wide/Makefile b/tegra20/avionic-design/medcom-wide/Makefile
new file mode 100644
index 0000000..7d37aa7
--- /dev/null
+++ b/tegra20/avionic-design/medcom-wide/Makefile
@@ -0,0 +1,30 @@
+# Copyright (C) 2013 Avionic Design GmbH
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
+
+images := \
+	tegra20-medcom-wide.img
+
+include ../../../build/post.mk
diff --git a/tegra20/avionic-design/medcom-wide/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg b/tegra20/avionic-design/medcom-wide/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
new file mode 120000
index 0000000..6c76445
--- /dev/null
+++ b/tegra20/avionic-design/medcom-wide/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
@@ -0,0 +1 @@
+../tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
\ No newline at end of file
diff --git a/tegra20/avionic-design/medcom-wide/build.sh b/tegra20/avionic-design/medcom-wide/build.sh
index 9fa70e5..7dc6a05 100755
--- a/tegra20/avionic-design/medcom-wide/build.sh
+++ b/tegra20/avionic-design/medcom-wide/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (C) 2013 Avionic Design GmbH
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -t20 -gbct \
-	../tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg \
-	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
-cbootimage -t20 ../tamonten/tegra20.img.cfg tegra20-medcom-wide.img
+make
diff --git a/tegra20/avionic-design/medcom-wide/tegra20-medcom-wide.img.cfg b/tegra20/avionic-design/medcom-wide/tegra20-medcom-wide.img.cfg
new file mode 120000
index 0000000..46d2243
--- /dev/null
+++ b/tegra20/avionic-design/medcom-wide/tegra20-medcom-wide.img.cfg
@@ -0,0 +1 @@
+../tamonten/tegra20.img.cfg
\ No newline at end of file
diff --git a/tegra20/avionic-design/plutux/Makefile b/tegra20/avionic-design/plutux/Makefile
new file mode 100644
index 0000000..72ed811
--- /dev/null
+++ b/tegra20/avionic-design/plutux/Makefile
@@ -0,0 +1,30 @@
+# Copyright (C) 2013 Avionic Design GmbH
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
+
+images := \
+	tegra20-plutux.img
+
+include ../../../build/post.mk
diff --git a/tegra20/avionic-design/plutux/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg b/tegra20/avionic-design/plutux/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
new file mode 120000
index 0000000..6c76445
--- /dev/null
+++ b/tegra20/avionic-design/plutux/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
@@ -0,0 +1 @@
+../tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
\ No newline at end of file
diff --git a/tegra20/avionic-design/plutux/build.sh b/tegra20/avionic-design/plutux/build.sh
index 382e451..7dc6a05 100755
--- a/tegra20/avionic-design/plutux/build.sh
+++ b/tegra20/avionic-design/plutux/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (C) 2013 Avionic Design GmbH
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -t20 -gbct \
-	../tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg \
-	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
-cbootimage -t20 ../tamonten/tegra20.img.cfg tegra20-plutux.img
+make
diff --git a/tegra20/avionic-design/plutux/tegra20-plutux.img.cfg b/tegra20/avionic-design/plutux/tegra20-plutux.img.cfg
new file mode 120000
index 0000000..46d2243
--- /dev/null
+++ b/tegra20/avionic-design/plutux/tegra20-plutux.img.cfg
@@ -0,0 +1 @@
+../tamonten/tegra20.img.cfg
\ No newline at end of file
diff --git a/tegra20/avionic-design/tec/Makefile b/tegra20/avionic-design/tec/Makefile
new file mode 100644
index 0000000..f5b81b6
--- /dev/null
+++ b/tegra20/avionic-design/tec/Makefile
@@ -0,0 +1,30 @@
+# Copyright (C) 2013 Avionic Design GmbH
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
+
+images := \
+	tegra20-tec.img
+
+include ../../../build/post.mk
diff --git a/tegra20/avionic-design/tec/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg b/tegra20/avionic-design/tec/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
new file mode 120000
index 0000000..6c76445
--- /dev/null
+++ b/tegra20/avionic-design/tec/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
@@ -0,0 +1 @@
+../tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg
\ No newline at end of file
diff --git a/tegra20/avionic-design/tec/build.sh b/tegra20/avionic-design/tec/build.sh
index 2a49fdd..7dc6a05 100755
--- a/tegra20/avionic-design/tec/build.sh
+++ b/tegra20/avionic-design/tec/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (C) 2013 Avionic Design GmbH
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -t20 -gbct \
-	../tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct.cfg \
-	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
-cbootimage -t20 ../tamonten/tegra20.img.cfg tegra20-tec.img
+make
diff --git a/tegra20/avionic-design/tec/tegra20-tec.img.cfg b/tegra20/avionic-design/tec/tegra20-tec.img.cfg
new file mode 120000
index 0000000..46d2243
--- /dev/null
+++ b/tegra20/avionic-design/tec/tegra20-tec.img.cfg
@@ -0,0 +1 @@
+../tamonten/tegra20.img.cfg
\ No newline at end of file
diff --git a/tegra20/compulab/trimslice/Makefile b/tegra20/compulab/trimslice/Makefile
new file mode 100644
index 0000000..59d54e2
--- /dev/null
+++ b/tegra20/compulab/trimslice/Makefile
@@ -0,0 +1,31 @@
+# Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	trimslice-mmc.bct \
+	trimslice-spi.bct
+
+images := \
+	trimslice-mmc.img \
+	trimslice-spi.img
+
+include ../../../build/post.mk
diff --git a/tegra20/compulab/trimslice/build.sh b/tegra20/compulab/trimslice/build.sh
index 9b730c6..7dc6a05 100755
--- a/tegra20/compulab/trimslice/build.sh
+++ b/tegra20/compulab/trimslice/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,11 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -gbct trimslice-mmc.bct.cfg trimslice-mmc.bct
-cbootimage trimslice-mmc.img.cfg trimslice-mmc.img
-
-cbootimage -gbct trimslice-spi.bct.cfg trimslice-spi.bct
-cbootimage trimslice-spi.img.cfg trimslice-spi.img
+make
diff --git a/tegra20/nvidia/harmony/Makefile b/tegra20/nvidia/harmony/Makefile
new file mode 100644
index 0000000..113de21
--- /dev/null
+++ b/tegra20/nvidia/harmony/Makefile
@@ -0,0 +1,29 @@
+# Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct
+
+images := \
+	harmony-nand.img
+
+include ../../../build/post.mk
diff --git a/tegra20/nvidia/harmony/build.sh b/tegra20/nvidia/harmony/build.sh
index 2209860..7dc6a05 100755
--- a/tegra20/nvidia/harmony/build.sh
+++ b/tegra20/nvidia/harmony/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -gbct \
-    harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct.cfg \
-    harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct
-cbootimage harmony-nand.img.cfg harmony-nand.img
+make
diff --git a/tegra20/nvidia/seaboard/Makefile b/tegra20/nvidia/seaboard/Makefile
new file mode 100644
index 0000000..cbe451b
--- /dev/null
+++ b/tegra20/nvidia/seaboard/Makefile
@@ -0,0 +1,29 @@
+# Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct
+
+images := \
+	seaboard-nand.img
+
+include ../../../build/post.mk
diff --git a/tegra20/nvidia/seaboard/build.sh b/tegra20/nvidia/seaboard/build.sh
index 558a7ce..7dc6a05 100755
--- a/tegra20/nvidia/seaboard/build.sh
+++ b/tegra20/nvidia/seaboard/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -gbct \
-    PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct.cfg \
-    PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct
-cbootimage seaboard-nand.img.cfg seaboard-nand.img
+make
diff --git a/tegra20/nvidia/ventana/Makefile b/tegra20/nvidia/ventana/Makefile
new file mode 100644
index 0000000..2c5ca20
--- /dev/null
+++ b/tegra20/nvidia/ventana/Makefile
@@ -0,0 +1,29 @@
+# Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct
+
+images := \
+	ventana-emmc.img
+
+include ../../../build/post.mk
diff --git a/tegra20/nvidia/ventana/build.sh b/tegra20/nvidia/ventana/build.sh
index e1a7681..7dc6a05 100755
--- a/tegra20/nvidia/ventana/build.sh
+++ b/tegra20/nvidia/ventana/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -gbct \
-    ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct.cfg \
-    ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct
-cbootimage ventana-emmc.img.cfg ventana-emmc.img
+make
diff --git a/tegra20/nvidia/whistler/Makefile b/tegra20/nvidia/whistler/Makefile
new file mode 100644
index 0000000..5d8ff04
--- /dev/null
+++ b/tegra20/nvidia/whistler/Makefile
@@ -0,0 +1,29 @@
+# Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct
+
+images := \
+	whistler-emmc.img
+
+include ../../../build/post.mk
diff --git a/tegra20/nvidia/whistler/build.sh b/tegra20/nvidia/whistler/build.sh
index 36d3665..7dc6a05 100755
--- a/tegra20/nvidia/whistler/build.sh
+++ b/tegra20/nvidia/whistler/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -gbct \
-    E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct.cfg \
-    E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct
-cbootimage whistler-emmc.img.cfg whistler-emmc.img
+make
diff --git a/tegra20/toradex/colibri-t20/Makefile b/tegra20/toradex/colibri-t20/Makefile
new file mode 100644
index 0000000..c6c8b7b
--- /dev/null
+++ b/tegra20/toradex/colibri-t20/Makefile
@@ -0,0 +1,40 @@
+# Copyright (c) 2013, Lucas Stach
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t20
+
+bcts := \
+	colibri-t20_256_hsmmc.bct \
+	colibri-t20_512_hsmmc.bct \
+	colibri-t20_256_v11_nand.bct \
+	colibri-t20_256_v12_nand.bct \
+	colibri-t20_512_v11_nand.bct \
+	colibri-t20_512_v12_nand.bct
+
+images := \
+	colibri-t20_256_hsmmc.img \
+	colibri-t20_512_hsmmc.img \
+	colibri-t20_256_v11_nand.img \
+	colibri-t20_256_v12_nand.img \
+	colibri-t20_512_v11_nand.img \
+	colibri-t20_512_v12_nand.img
+
+include ../../../build/post.mk
diff --git a/tegra20/toradex/colibri-t20/build.sh b/tegra20/toradex/colibri-t20/build.sh
index ca950b1..7dc6a05 100755
--- a/tegra20/toradex/colibri-t20/build.sh
+++ b/tegra20/toradex/colibri-t20/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (c) 2013, Lucas Stach
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,24 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -gbct colibri-t20_256_hsmmc.bct.cfg colibri-t20_256_hsmmc.bct
-cbootimage colibri-t20_256_hsmmc.img.cfg colibri-t20_256_hsmmc.img
-
-cbootimage -gbct colibri-t20_512_hsmmc.bct.cfg colibri-t20_512_hsmmc.bct
-cbootimage colibri-t20_512_hsmmc.img.cfg colibri-t20_512_hsmmc.img
-
-cbootimage -gbct colibri-t20_256_v11_nand.bct.cfg colibri-t20_256_v11_nand.bct
-cbootimage colibri-t20_256_v11_nand.img.cfg colibri-t20_256_v11_nand.img
-
-cbootimage -gbct colibri-t20_256_v12_nand.bct.cfg colibri-t20_256_v12_nand.bct
-cbootimage colibri-t20_256_v12_nand.img.cfg colibri-t20_256_v12_nand.img
-
-cbootimage -gbct colibri-t20_512_v11_nand.bct.cfg colibri-t20_512_v11_nand.bct
-cbootimage colibri-t20_512_v11_nand.img.cfg colibri-t20_512_v11_nand.img
-
-cbootimage -gbct colibri-t20_512_v12_nand.bct.cfg colibri-t20_512_v12_nand.bct
-cbootimage colibri-t20_512_v12_nand.img.cfg colibri-t20_512_v12_nand.img
-
+make
diff --git a/tegra30/avionic-design/tec-ng/Makefile b/tegra30/avionic-design/tec-ng/Makefile
new file mode 100644
index 0000000..6509e04
--- /dev/null
+++ b/tegra30/avionic-design/tec-ng/Makefile
@@ -0,0 +1,30 @@
+# Copyright (C) 2013 Avionic Design GmbH
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t30
+
+bcts := \
+	TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct
+
+images := \
+	tegra30-tec-ng.img
+
+include ../../../build/post.mk
diff --git a/tegra30/avionic-design/tec-ng/TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg b/tegra30/avionic-design/tec-ng/TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg
new file mode 120000
index 0000000..2936b81
--- /dev/null
+++ b/tegra30/avionic-design/tec-ng/TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg
@@ -0,0 +1 @@
+../tamonten-ng/TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg
\ No newline at end of file
diff --git a/tegra30/avionic-design/tec-ng/build.sh b/tegra30/avionic-design/tec-ng/build.sh
index f522c12..7dc6a05 100755
--- a/tegra30/avionic-design/tec-ng/build.sh
+++ b/tegra30/avionic-design/tec-ng/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (C) 2013 Avionic Design GmbH
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -t30 -gbct \
-    ../tamonten-ng/TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg \
-    TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct
-cbootimage -t30 ../tamonten-ng/tegra30.img.cfg tegra30-tec-ng.img
+make
diff --git a/tegra30/avionic-design/tec-ng/tegra30-tec-ng.img.cfg b/tegra30/avionic-design/tec-ng/tegra30-tec-ng.img.cfg
new file mode 120000
index 0000000..df08f65
--- /dev/null
+++ b/tegra30/avionic-design/tec-ng/tegra30-tec-ng.img.cfg
@@ -0,0 +1 @@
+../tamonten-ng/tegra30.img.cfg
\ No newline at end of file
diff --git a/tegra30/nvidia/beaver/Makefile b/tegra30/nvidia/beaver/Makefile
new file mode 100644
index 0000000..b27e18d
--- /dev/null
+++ b/tegra30/nvidia/beaver/Makefile
@@ -0,0 +1,29 @@
+# Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t30
+
+bcts := \
+	Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct
+
+images := \
+	beaver-emmc.img
+
+include ../../../build/post.mk
diff --git a/tegra30/nvidia/beaver/build.sh b/tegra30/nvidia/beaver/build.sh
index c06735d..7dc6a05 100755
--- a/tegra30/nvidia/beaver/build.sh
+++ b/tegra30/nvidia/beaver/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,10 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -t30 -gbct \
-    Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct.cfg \
-    Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct
-cbootimage -t30 beaver-emmc.img.cfg beaver-emmc.img
+make
diff --git a/tegra30/nvidia/cardhu/Makefile b/tegra30/nvidia/cardhu/Makefile
new file mode 100644
index 0000000..63773e9
--- /dev/null
+++ b/tegra30/nvidia/cardhu/Makefile
@@ -0,0 +1,33 @@
+# Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+include ../../../build/pre.mk
+
+soc := t30
+
+bcts := \
+	E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct \
+	E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct \
+	E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct
+
+images := \
+	cardhu-a02-a04-1gb-emmc.img \
+	cardhu-a02-a04-2gb-emmc.img \
+	cardhu-a05-2gb-emmc.img
+
+include ../../../build/post.mk
diff --git a/tegra30/nvidia/cardhu/build.sh b/tegra30/nvidia/cardhu/build.sh
index fbd5f62..7dc6a05 100755
--- a/tegra30/nvidia/cardhu/build.sh
+++ b/tegra30/nvidia/cardhu/build.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
 #
 # This software is provided 'as-is', without any express or implied
 # warranty. In no event will the authors be held liable for any damages
@@ -18,20 +18,4 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
-set -e
-set -x
-
-cbootimage -t30 -gbct \
-    E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct.cfg \
-    E1186_Hynix_1GB_H5TC2G83BFR-PBA_375MHz_111114_317_sdmmc4_x8.bct
-cbootimage -t30 cardhu-a02-a04-1gb-emmc.img.cfg cardhu-a02-a04-1gb-emmc.img
-
-cbootimage -t30 -gbct \
-    E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct.cfg \
-    E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct
-cbootimage -t30 cardhu-a02-a04-2gb-emmc.img.cfg cardhu-a02-a04-2gb-emmc.img
-
-cbootimage -t30 -gbct \
-    E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct.cfg \
-    E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct
-cbootimage -t30 cardhu-a05-2gb-emmc.img.cfg cardhu-a05-2gb-emmc.img
+make
-- 
1.8.1.5
