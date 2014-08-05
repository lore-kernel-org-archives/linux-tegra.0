From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [flasher PATCH] Add support for colibri_t30
Date: Tue,  5 Aug 2014 23:57:55 +0200
Message-ID: <1407275875-18722-1-git-send-email-stefan@agner.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This commit adds support for the Toradex Colibri T30 module. Since
we use the same boot loader for all carrier board, in the boot
loader world (U-Boot/BCT) the board name consists of the module
name only, without any reference to the carrier board.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 configs/colibri_t30.board  | 4 ++++
 configs/colibri_t30.config | 8 ++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 configs/colibri_t30.board
 create mode 100644 configs/colibri_t30.config

diff --git a/configs/colibri_t30.board b/configs/colibri_t30.board
new file mode 100644
index 0000000..1549ec9
--- /dev/null
+++ b/configs/colibri_t30.board
@@ -0,0 +1,4 @@
+board = {
+    'vendor': 'toradex',
+    'soc': 'tegra30',
+}
diff --git a/configs/colibri_t30.config b/configs/colibri_t30.config
new file mode 100644
index 0000000..ee986ea
--- /dev/null
+++ b/configs/colibri_t30.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'colibri_t30_12MHz_1GB_NT5CC256M16CP-DI_400MHz-shmoo.bct',
+    'board': 'colibri_t30',
+    'dtbfn-extra': '',
+    'flash-id-uboot': 0,
+    'flash-image': 'colibri_t30.img',
+    'flash-type': 'emmc',
+}
-- 
2.0.4
