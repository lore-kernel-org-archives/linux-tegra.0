From: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [cbootimage-configs PATCH 2/2] Use fixed variables to track image dependencies
Date: Mon, 3 Apr 2017 14:25:11 +0200
Message-ID: <20170403122511.7194-2-nikolaus.schulz@avionic-design.de>
References: <8bf27012-af67-3faf-206b-ebd5cd76b276@wwwdotorg.org>
 <20170403122511.7194-1-nikolaus.schulz@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403122511.7194-1-nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The dependencies of the emmc image on the bootloader image and the bct
file are specified in the .img.cfg config files.  Currently a shell
script extracts these dependencies from the .img.cfg file.  But the bct
filename is already known to make, so only the bootloader image filename
is left as a somewhat dynamic component.  Add the bootloader filename to
the per-soc Makefiles, and kill the dynamic dependency file.

Signed-off-by: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 build/gen-image-deps.sh                     | 42 -----------------------------
 build/post.mk                               |  6 +----
 tegra114/nvidia/dalmore/Makefile            |  3 +++
 tegra124/nvidia/jetson-tk1/Makefile         |  3 +++
 tegra124/nvidia/norrin/Makefile             |  3 +++
 tegra124/nvidia/venice2/Makefile            |  3 +++
 tegra20/avionic-design/medcom-wide/Makefile |  3 +++
 tegra20/avionic-design/plutux/Makefile      |  3 +++
 tegra20/avionic-design/tec/Makefile         |  3 +++
 tegra20/compulab/trimslice/Makefile         |  3 +++
 tegra20/nvidia/harmony/Makefile             |  3 +++
 tegra20/nvidia/seaboard/Makefile            |  3 +++
 tegra20/nvidia/ventana/Makefile             |  3 +++
 tegra20/nvidia/whistler/Makefile            |  3 +++
 tegra20/toradex/colibri_t20/Makefile        |  3 +++
 tegra210/nvidia/p2371-2180/Makefile         |  3 +++
 tegra30/avionic-design/tec-ng/Makefile      |  3 +++
 tegra30/nvidia/beaver/Makefile              |  3 +++
 tegra30/nvidia/cardhu/Makefile              |  3 +++
 tegra30/toradex/colibri_t30/Makefile        |  3 +++
 20 files changed, 55 insertions(+), 47 deletions(-)
 delete mode 100755 build/gen-image-deps.sh

diff --git a/build/gen-image-deps.sh b/build/gen-image-deps.sh
deleted file mode 100755
index fcbb64c..0000000
--- a/build/gen-image-deps.sh
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/bash
-
-# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
-#
-# This software is provided 'as-is', without any express or implied
-# warranty. In no event will the authors be held liable for any damages
-# arising from the use of this software.
-#
-# Permission is granted to anyone to use this software for any purpose,
-# including commercial applications, and to alter it and redistribute it
-# freely, subject to the following restrictions:
-#
-# 1. The origin of this software must not be misrepresented; you must not
-#    claim that you wrote the original software. If you use this software
-#    in a product, an acknowledgment in the product documentation would be
-#    appreciated but is not required.
-# 2. Altered source versions must be plainly marked as such, and must not be
-#    misrepresented as being the original software.
-# 3. This notice may not be removed or altered from any source distribution.
-
-deps_script=$0
-img_cfg_file=$1
-img_file=$2
-dep_file=$3
-
-rm -f ${dep_file}
-bct=`grep -i bctfile ${img_cfg_file} | sed -e 's/^.*=\s*//' -e s'/[,;].*$//'`
-bootloader=`grep -i bootloader ${img_cfg_file} | sed -e 's/^.*=\s*//' -e s'/[,;].*$//'`
-
-cat > ${dep_file} <<ENDOFHERE
-${img_file}: \\
-	${deps_script} \\
-	${img_cfg_file} \\
-	${bct} \\
-	${bootloader}
-
-${img_cfg_file}:
-
-${bct}:
-
-${bootloader}:
-ENDOFHERE
diff --git a/build/post.mk b/build/post.mk
index 809fa2b..1c0f8cf 100644
--- a/build/post.mk
+++ b/build/post.mk
@@ -20,12 +20,8 @@ bcts: $(bcts)
 
 images: $(images)
 
-image_deps := $(addprefix .,$(addsuffix .d,$(images)))
--include $(image_deps)
-
 %.bct: %.bct.cfg
 	cbootimage -gbct -$(soc) $< $@
 
-%.img: %.img.cfg $(bcts)
-	../../../build/gen-image-deps.sh $< $@ .$@.d
+%.img: %.img.cfg $(bcts) $(bootloaders)
 	cbootimage -$(soc) $< $@
diff --git a/tegra114/nvidia/dalmore/Makefile b/tegra114/nvidia/dalmore/Makefile
index 023511b..a644b9a 100644
--- a/tegra114/nvidia/dalmore/Makefile
+++ b/tegra114/nvidia/dalmore/Makefile
@@ -25,6 +25,9 @@ bcts := \
 	E1611_Hynix_2GB_H5TC4G63AFR-RDA_792Mhz_r403_v2.bct \
 	E1611_Hynix_2GB_H5TC4G63MFR-PBA_792Mhz_r403_v05.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	dalmore-t40x-1866.img \
 	dalmore-t40s-1866.img \
diff --git a/tegra124/nvidia/jetson-tk1/Makefile b/tegra124/nvidia/jetson-tk1/Makefile
index 8142ca5..a163728 100644
--- a/tegra124/nvidia/jetson-tk1/Makefile
+++ b/tegra124/nvidia/jetson-tk1/Makefile
@@ -23,6 +23,9 @@ soc := t124
 bcts := \
 	PM375_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	jetson-tk1-emmc.img
 
diff --git a/tegra124/nvidia/norrin/Makefile b/tegra124/nvidia/norrin/Makefile
index dce9668..aafcaac 100644
--- a/tegra124/nvidia/norrin/Makefile
+++ b/tegra124/nvidia/norrin/Makefile
@@ -23,6 +23,9 @@ soc := t124
 bcts := \
 	PM370_Hynix_2GB_H5TC4G63AFR_PBA_924MHz_01212014.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	norrin-spi.img
 
diff --git a/tegra124/nvidia/venice2/Makefile b/tegra124/nvidia/venice2/Makefile
index 9795725..ef45981 100644
--- a/tegra124/nvidia/venice2/Makefile
+++ b/tegra124/nvidia/venice2/Makefile
@@ -23,6 +23,9 @@ soc := t124
 bcts := \
 	PM371_Hynix_2GB_H5TC4G63AFR_RDA_792MHz_0719.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	venice2-spi.img
 
diff --git a/tegra20/avionic-design/medcom-wide/Makefile b/tegra20/avionic-design/medcom-wide/Makefile
index 7d37aa7..25828b4 100644
--- a/tegra20/avionic-design/medcom-wide/Makefile
+++ b/tegra20/avionic-design/medcom-wide/Makefile
@@ -24,6 +24,9 @@ soc := t20
 bcts := \
 	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	tegra20-medcom-wide.img
 
diff --git a/tegra20/avionic-design/plutux/Makefile b/tegra20/avionic-design/plutux/Makefile
index 72ed811..3cdd480 100644
--- a/tegra20/avionic-design/plutux/Makefile
+++ b/tegra20/avionic-design/plutux/Makefile
@@ -24,6 +24,9 @@ soc := t20
 bcts := \
 	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	tegra20-plutux.img
 
diff --git a/tegra20/avionic-design/tec/Makefile b/tegra20/avionic-design/tec/Makefile
index f5b81b6..1b5027c 100644
--- a/tegra20/avionic-design/tec/Makefile
+++ b/tegra20/avionic-design/tec/Makefile
@@ -24,6 +24,9 @@ soc := t20
 bcts := \
 	Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	tegra20-tec.img
 
diff --git a/tegra20/compulab/trimslice/Makefile b/tegra20/compulab/trimslice/Makefile
index 59d54e2..00e3e0b 100644
--- a/tegra20/compulab/trimslice/Makefile
+++ b/tegra20/compulab/trimslice/Makefile
@@ -24,6 +24,9 @@ bcts := \
 	trimslice-mmc.bct \
 	trimslice-spi.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	trimslice-mmc.img \
 	trimslice-spi.img
diff --git a/tegra20/nvidia/harmony/Makefile b/tegra20/nvidia/harmony/Makefile
index 113de21..619ad9a 100644
--- a/tegra20/nvidia/harmony/Makefile
+++ b/tegra20/nvidia/harmony/Makefile
@@ -23,6 +23,9 @@ soc := t20
 bcts := \
 	harmony_a02_12Mhz_H5PS1G83EFR-S6C_333Mhz_1GB_2K8Nand_HY27UF084G2B-TP.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	harmony-nand.img
 
diff --git a/tegra20/nvidia/seaboard/Makefile b/tegra20/nvidia/seaboard/Makefile
index cbe451b..b17123a 100644
--- a/tegra20/nvidia/seaboard/Makefile
+++ b/tegra20/nvidia/seaboard/Makefile
@@ -23,6 +23,9 @@ soc := t20
 bcts := \
 	PM282_Hynix_1GB_H5PS2G83AFR-S6C_380MHz_nand.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	seaboard-nand.img
 
diff --git a/tegra20/nvidia/ventana/Makefile b/tegra20/nvidia/ventana/Makefile
index 2c5ca20..d831b38 100644
--- a/tegra20/nvidia/ventana/Makefile
+++ b/tegra20/nvidia/ventana/Makefile
@@ -23,6 +23,9 @@ soc := t20
 bcts := \
 	ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	ventana-emmc.img
 
diff --git a/tegra20/nvidia/whistler/Makefile b/tegra20/nvidia/whistler/Makefile
index 5d8ff04..c5705c1 100644
--- a/tegra20/nvidia/whistler/Makefile
+++ b/tegra20/nvidia/whistler/Makefile
@@ -23,6 +23,9 @@ soc := t20
 bcts := \
 	E1108_Elpida_512MB_EDB4032B2PB-6D-F_300MHz_40nm_emmc_x8.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	whistler-emmc.img
 
diff --git a/tegra20/toradex/colibri_t20/Makefile b/tegra20/toradex/colibri_t20/Makefile
index 41f3c1d..e6e0800 100644
--- a/tegra20/toradex/colibri_t20/Makefile
+++ b/tegra20/toradex/colibri_t20/Makefile
@@ -29,6 +29,9 @@ bcts := \
 	colibri_t20-512-v11-nand.bct \
 	colibri_t20-512-v12-nand.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	colibri_t20-256-hsmmc.img \
 	colibri_t20-512-hsmmc.img \
diff --git a/tegra210/nvidia/p2371-2180/Makefile b/tegra210/nvidia/p2371-2180/Makefile
index e8391a4..c4b6bb5 100644
--- a/tegra210/nvidia/p2371-2180/Makefile
+++ b/tegra210/nvidia/p2371-2180/Makefile
@@ -23,6 +23,9 @@ soc := t210
 bcts := \
 	P2180_A00_LP4_DSC_204Mhz.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	p2371-2180-emmc.img
 
diff --git a/tegra30/avionic-design/tec-ng/Makefile b/tegra30/avionic-design/tec-ng/Makefile
index 6509e04..e1dbfb4 100644
--- a/tegra30/avionic-design/tec-ng/Makefile
+++ b/tegra30/avionic-design/tec-ng/Makefile
@@ -24,6 +24,9 @@ soc := t30
 bcts := \
 	TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	tegra30-tec-ng.img
 
diff --git a/tegra30/nvidia/beaver/Makefile b/tegra30/nvidia/beaver/Makefile
index b27e18d..dfa276e 100644
--- a/tegra30/nvidia/beaver/Makefile
+++ b/tegra30/nvidia/beaver/Makefile
@@ -23,6 +23,9 @@ soc := t30
 bcts := \
 	Pm315_Hynix_2GB_H5TC4G83MFR-PBA_400MHz_120613_sdmmc4_x8.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	beaver-emmc.img
 
diff --git a/tegra30/nvidia/cardhu/Makefile b/tegra30/nvidia/cardhu/Makefile
index 63773e9..94e4a32 100644
--- a/tegra30/nvidia/cardhu/Makefile
+++ b/tegra30/nvidia/cardhu/Makefile
@@ -25,6 +25,9 @@ bcts := \
 	E1198_Hynix_2GB_H5TC2G83BFR-PBA_667MHz_111121_317_sdmmc4_x8.bct \
 	E1198_Hynix_2GB_H5TC4G83MFR-PBA_375MHz_111122_317_sdmmc4_x8.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	cardhu-a02-a04-1gb-emmc.img \
 	cardhu-a02-a04-2gb-emmc.img \
diff --git a/tegra30/toradex/colibri_t30/Makefile b/tegra30/toradex/colibri_t30/Makefile
index dffc9f0..916a087 100644
--- a/tegra30/toradex/colibri_t30/Makefile
+++ b/tegra30/toradex/colibri_t30/Makefile
@@ -24,6 +24,9 @@ soc := t30
 bcts := \
 	colibri_t30_12MHz_1GB_NT5CC256M16CP-DI_400MHz-shmoo.bct
 
+bootloaders := \
+	u-boot.bin
+
 images := \
 	colibri_t30.img
 
-- 
2.11.0
