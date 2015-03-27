From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: [cbootimage-configs PATCH] rename colibri_t20
Date: Fri, 27 Mar 2015 19:17:15 +0100
Message-ID: <1427480235-32193-1-git-send-email-marcel@ziswiler.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Now with most of the U-Boot side cleaned-up ready for merging actually
make sure it can be used from within the tegra-uboot-flasher flasher.
As a first step rename colibri-t20 to colibri_t20 as used anywhere else
(apart from the Yocto stuff I agree).

Signed-off-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Tested-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
---
 .../colibri-t20/colibri-t20_512_v11_nand.img.cfg   | 22 --------------------
 .../colibri-t20/colibri-t20_512_v12_nand.img.cfg   | 22 --------------------
 .../toradex/{colibri-t20 => colibri_t20}/Makefile  | 24 +++++++++++-----------
 .../toradex/{colibri-t20 => colibri_t20}/build.sh  |  0
 .../colibri_t20-256-hsmmc.bct.cfg}                 |  0
 .../colibri_t20-256-hsmmc.img.cfg}                 |  2 +-
 .../colibri_t20-256-v11-nand.bct.cfg}              |  0
 .../colibri_t20-256-v11-nand.img.cfg}              |  2 +-
 .../colibri_t20-256-v12-nand.bct.cfg}              |  0
 .../colibri_t20-256-v12-nand.img.cfg}              |  2 +-
 .../colibri_t20-512-hsmmc.bct.cfg}                 |  0
 .../colibri_t20-512-hsmmc.img.cfg}                 |  2 +-
 .../colibri_t20-512-v11-nand.bct.cfg}              |  0
 .../colibri_t20/colibri_t20-512-v11-nand.img.cfg   | 22 ++++++++++++++++++++
 .../colibri_t20-512-v12-nand.bct.cfg}              |  0
 .../colibri_t20/colibri_t20-512-v12-nand.img.cfg   | 22 ++++++++++++++++++++
 16 files changed, 60 insertions(+), 60 deletions(-)
 delete mode 100644 tegra20/toradex/colibri-t20/colibri-t20_512_v11_nand.img.cfg
 delete mode 100644 tegra20/toradex/colibri-t20/colibri-t20_512_v12_nand.img.cfg
 rename tegra20/toradex/{colibri-t20 => colibri_t20}/Makefile (73%)
 rename tegra20/toradex/{colibri-t20 => colibri_t20}/build.sh (100%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_256_hsmmc.bct.cfg => colibri_t20/colibri_t20-256-hsmmc.bct.cfg} (100%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_512_hsmmc.img.cfg => colibri_t20/colibri_t20-256-hsmmc.img.cfg} (95%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_256_v11_nand.bct.cfg => colibri_t20/colibri_t20-256-v11-nand.bct.cfg} (100%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_256_v12_nand.img.cfg => colibri_t20/colibri_t20-256-v11-nand.img.cfg} (95%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_256_v12_nand.bct.cfg => colibri_t20/colibri_t20-256-v12-nand.bct.cfg} (100%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_256_v11_nand.img.cfg => colibri_t20/colibri_t20-256-v12-nand.img.cfg} (95%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_512_hsmmc.bct.cfg => colibri_t20/colibri_t20-512-hsmmc.bct.cfg} (100%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_256_hsmmc.img.cfg => colibri_t20/colibri_t20-512-hsmmc.img.cfg} (95%)
 rename tegra20/toradex/{colibri-t20/colibri-t20_512_v11_nand.bct.cfg => colibri_t20/colibri_t20-512-v11-nand.bct.cfg} (100%)
 create mode 100644 tegra20/toradex/colibri_t20/colibri_t20-512-v11-nand.img.cfg
 rename tegra20/toradex/{colibri-t20/colibri-t20_512_v12_nand.bct.cfg => colibri_t20/colibri_t20-512-v12-nand.bct.cfg} (100%)
 create mode 100644 tegra20/toradex/colibri_t20/colibri_t20-512-v12-nand.img.cfg

diff --git a/tegra20/toradex/colibri-t20/colibri-t20_512_v11_nand.img.cfg b/tegra20/toradex/colibri-t20/colibri-t20_512_v11_nand.img.cfg
deleted file mode 100644
index 9ae818d..0000000
--- a/tegra20/toradex/colibri-t20/colibri-t20_512_v11_nand.img.cfg
+++ /dev/null
@@ -1,22 +0,0 @@
-# Copyright (c) 2013, Lucas Stach
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
-Version       = 0x00020001;
-Bctcopy       = 1;
-Bctfile       = colibri-t20_512_v11_nand.bct;
-BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_512_v12_nand.img.cfg b/tegra20/toradex/colibri-t20/colibri-t20_512_v12_nand.img.cfg
deleted file mode 100644
index e1e1694..0000000
--- a/tegra20/toradex/colibri-t20/colibri-t20_512_v12_nand.img.cfg
+++ /dev/null
@@ -1,22 +0,0 @@
-# Copyright (c) 2013, Lucas Stach
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
-Version       = 0x00020001;
-Bctcopy       = 1;
-Bctfile       = colibri-t20_512_v12_nand.bct;
-BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tegra20/toradex/colibri-t20/Makefile b/tegra20/toradex/colibri_t20/Makefile
similarity index 73%
rename from tegra20/toradex/colibri-t20/Makefile
rename to tegra20/toradex/colibri_t20/Makefile
index c6c8b7b..41f3c1d 100644
--- a/tegra20/toradex/colibri-t20/Makefile
+++ b/tegra20/toradex/colibri_t20/Makefile
@@ -22,19 +22,19 @@ include ../../../build/pre.mk
 soc := t20
 
 bcts := \
-	colibri-t20_256_hsmmc.bct \
-	colibri-t20_512_hsmmc.bct \
-	colibri-t20_256_v11_nand.bct \
-	colibri-t20_256_v12_nand.bct \
-	colibri-t20_512_v11_nand.bct \
-	colibri-t20_512_v12_nand.bct
+	colibri_t20-256-hsmmc.bct \
+	colibri_t20-512-hsmmc.bct \
+	colibri_t20-256-v11-nand.bct \
+	colibri_t20-256-v12-nand.bct \
+	colibri_t20-512-v11-nand.bct \
+	colibri_t20-512-v12-nand.bct
 
 images := \
-	colibri-t20_256_hsmmc.img \
-	colibri-t20_512_hsmmc.img \
-	colibri-t20_256_v11_nand.img \
-	colibri-t20_256_v12_nand.img \
-	colibri-t20_512_v11_nand.img \
-	colibri-t20_512_v12_nand.img
+	colibri_t20-256-hsmmc.img \
+	colibri_t20-512-hsmmc.img \
+	colibri_t20-256-v11-nand.img \
+	colibri_t20-256-v12-nand.img \
+	colibri_t20-512-v11-nand.img \
+	colibri_t20-512-v12-nand.img
 
 include ../../../build/post.mk
diff --git a/tegra20/toradex/colibri-t20/build.sh b/tegra20/toradex/colibri_t20/build.sh
similarity index 100%
rename from tegra20/toradex/colibri-t20/build.sh
rename to tegra20/toradex/colibri_t20/build.sh
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_256_hsmmc.bct.cfg b/tegra20/toradex/colibri_t20/colibri_t20-256-hsmmc.bct.cfg
similarity index 100%
rename from tegra20/toradex/colibri-t20/colibri-t20_256_hsmmc.bct.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-256-hsmmc.bct.cfg
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_512_hsmmc.img.cfg b/tegra20/toradex/colibri_t20/colibri_t20-256-hsmmc.img.cfg
similarity index 95%
rename from tegra20/toradex/colibri-t20/colibri-t20_512_hsmmc.img.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-256-hsmmc.img.cfg
index e97e3e2..e52bed7 100644
--- a/tegra20/toradex/colibri-t20/colibri-t20_512_hsmmc.img.cfg
+++ b/tegra20/toradex/colibri_t20/colibri_t20-256-hsmmc.img.cfg
@@ -18,5 +18,5 @@
 
 Version       = 0x00020001;
 Bctcopy       = 1;
-Bctfile       = colibri-t20_512_hsmmc.bct;
+Bctfile       = colibri_t20-256-hsmmc.bct;
 BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_256_v11_nand.bct.cfg b/tegra20/toradex/colibri_t20/colibri_t20-256-v11-nand.bct.cfg
similarity index 100%
rename from tegra20/toradex/colibri-t20/colibri-t20_256_v11_nand.bct.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-256-v11-nand.bct.cfg
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_256_v12_nand.img.cfg b/tegra20/toradex/colibri_t20/colibri_t20-256-v11-nand.img.cfg
similarity index 95%
rename from tegra20/toradex/colibri-t20/colibri-t20_256_v12_nand.img.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-256-v11-nand.img.cfg
index 09e2445..345fb8a 100644
--- a/tegra20/toradex/colibri-t20/colibri-t20_256_v12_nand.img.cfg
+++ b/tegra20/toradex/colibri_t20/colibri_t20-256-v11-nand.img.cfg
@@ -18,5 +18,5 @@
 
 Version       = 0x00020001;
 Bctcopy       = 1;
-Bctfile       = colibri-t20_256_v12_nand.bct;
+Bctfile       = colibri_t20-256-v11-nand.bct;
 BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_256_v12_nand.bct.cfg b/tegra20/toradex/colibri_t20/colibri_t20-256-v12-nand.bct.cfg
similarity index 100%
rename from tegra20/toradex/colibri-t20/colibri-t20_256_v12_nand.bct.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-256-v12-nand.bct.cfg
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_256_v11_nand.img.cfg b/tegra20/toradex/colibri_t20/colibri_t20-256-v12-nand.img.cfg
similarity index 95%
rename from tegra20/toradex/colibri-t20/colibri-t20_256_v11_nand.img.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-256-v12-nand.img.cfg
index ad3e2a5..523b4a1 100644
--- a/tegra20/toradex/colibri-t20/colibri-t20_256_v11_nand.img.cfg
+++ b/tegra20/toradex/colibri_t20/colibri_t20-256-v12-nand.img.cfg
@@ -18,5 +18,5 @@
 
 Version       = 0x00020001;
 Bctcopy       = 1;
-Bctfile       = colibri-t20_256_v11_nand.bct;
+Bctfile       = colibri_t20-256-v12-nand.bct;
 BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_512_hsmmc.bct.cfg b/tegra20/toradex/colibri_t20/colibri_t20-512-hsmmc.bct.cfg
similarity index 100%
rename from tegra20/toradex/colibri-t20/colibri-t20_512_hsmmc.bct.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-512-hsmmc.bct.cfg
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_256_hsmmc.img.cfg b/tegra20/toradex/colibri_t20/colibri_t20-512-hsmmc.img.cfg
similarity index 95%
rename from tegra20/toradex/colibri-t20/colibri-t20_256_hsmmc.img.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-512-hsmmc.img.cfg
index 541a02d..86c2697 100644
--- a/tegra20/toradex/colibri-t20/colibri-t20_256_hsmmc.img.cfg
+++ b/tegra20/toradex/colibri_t20/colibri_t20-512-hsmmc.img.cfg
@@ -18,5 +18,5 @@
 
 Version       = 0x00020001;
 Bctcopy       = 1;
-Bctfile       = colibri-t20_256_hsmmc.bct;
+Bctfile       = colibri_t20-512-hsmmc.bct;
 BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_512_v11_nand.bct.cfg b/tegra20/toradex/colibri_t20/colibri_t20-512-v11-nand.bct.cfg
similarity index 100%
rename from tegra20/toradex/colibri-t20/colibri-t20_512_v11_nand.bct.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-512-v11-nand.bct.cfg
diff --git a/tegra20/toradex/colibri_t20/colibri_t20-512-v11-nand.img.cfg b/tegra20/toradex/colibri_t20/colibri_t20-512-v11-nand.img.cfg
new file mode 100644
index 0000000..bee8660
--- /dev/null
+++ b/tegra20/toradex/colibri_t20/colibri_t20-512-v11-nand.img.cfg
@@ -0,0 +1,22 @@
+# Copyright (c) 2013, Lucas Stach
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
+Version       = 0x00020001;
+Bctcopy       = 1;
+Bctfile       = colibri_t20-512-v11-nand.bct;
+BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tegra20/toradex/colibri-t20/colibri-t20_512_v12_nand.bct.cfg b/tegra20/toradex/colibri_t20/colibri_t20-512-v12-nand.bct.cfg
similarity index 100%
rename from tegra20/toradex/colibri-t20/colibri-t20_512_v12_nand.bct.cfg
rename to tegra20/toradex/colibri_t20/colibri_t20-512-v12-nand.bct.cfg
diff --git a/tegra20/toradex/colibri_t20/colibri_t20-512-v12-nand.img.cfg b/tegra20/toradex/colibri_t20/colibri_t20-512-v12-nand.img.cfg
new file mode 100644
index 0000000..54d8ceb
--- /dev/null
+++ b/tegra20/toradex/colibri_t20/colibri_t20-512-v12-nand.img.cfg
@@ -0,0 +1,22 @@
+# Copyright (c) 2013, Lucas Stach
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
+Version       = 0x00020001;
+Bctcopy       = 1;
+Bctfile       = colibri_t20-512-v12-nand.bct;
+BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
-- 
1.9.3
