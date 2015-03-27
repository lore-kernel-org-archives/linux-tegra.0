From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: [flasher PATCH] add colibri_t20
Date: Fri, 27 Mar 2015 19:23:53 +0100
Message-ID: <1427480633-32392-1-git-send-email-marcel@ziswiler.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Now with most of the U-Boot side cleaned-up ready for merging actually
make sure it can be used from within the tegra-uboot-flasher flasher.
As a second step add the actual board configuration.

Signed-off-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Tested-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
---
Yes, I did test it on all our module variants (;-p).

 configs/colibri_t20-256-hsmmc.config    | 8 ++++++++
 configs/colibri_t20-256-v11-nand.config | 8 ++++++++
 configs/colibri_t20-256-v12-nand.config | 8 ++++++++
 configs/colibri_t20-512-hsmmc.config    | 8 ++++++++
 configs/colibri_t20-512-v11-nand.config | 8 ++++++++
 configs/colibri_t20-512-v12-nand.config | 8 ++++++++
 configs/colibri_t20.board               | 5 +++++
 7 files changed, 53 insertions(+)
 create mode 100644 configs/colibri_t20-256-hsmmc.config
 create mode 100644 configs/colibri_t20-256-v11-nand.config
 create mode 100644 configs/colibri_t20-256-v12-nand.config
 create mode 100644 configs/colibri_t20-512-hsmmc.config
 create mode 100644 configs/colibri_t20-512-v11-nand.config
 create mode 100644 configs/colibri_t20-512-v12-nand.config
 create mode 100644 configs/colibri_t20.board

diff --git a/configs/colibri_t20-256-hsmmc.config b/configs/colibri_t20-256-hsmmc.config
new file mode 100644
index 0000000..7cd2ef3
--- /dev/null
+++ b/configs/colibri_t20-256-hsmmc.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'colibri_t20-256-hsmmc.bct',
+    'board': 'colibri_t20',
+    'dtbfn-extra': '',
+    'flash-id-uboot': 0,
+    'flash-image': 'colibri_t20-256-hsmmc.img',
+    'flash-type': 'emmc',
+}
diff --git a/configs/colibri_t20-256-v11-nand.config b/configs/colibri_t20-256-v11-nand.config
new file mode 100644
index 0000000..032045d
--- /dev/null
+++ b/configs/colibri_t20-256-v11-nand.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'colibri_t20-256-v11-nand.bct',
+    'board': 'colibri_t20',
+    'dtbfn-extra': '',
+    'flash-id-uboot': 0,
+    'flash-image': 'colibri_t20-256-v11-nand.img',
+    'flash-type': 'nand',
+}
diff --git a/configs/colibri_t20-256-v12-nand.config b/configs/colibri_t20-256-v12-nand.config
new file mode 100644
index 0000000..62716a2
--- /dev/null
+++ b/configs/colibri_t20-256-v12-nand.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'colibri_t20-256-v12-nand.bct',
+    'board': 'colibri_t20',
+    'dtbfn-extra': '',
+    'flash-id-uboot': 0,
+    'flash-image': 'colibri_t20-256-v12-nand.img',
+    'flash-type': 'nand',
+}
diff --git a/configs/colibri_t20-512-hsmmc.config b/configs/colibri_t20-512-hsmmc.config
new file mode 100644
index 0000000..1ebf83a
--- /dev/null
+++ b/configs/colibri_t20-512-hsmmc.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'colibri_t20-512-hsmmc.bct',
+    'board': 'colibri_t20',
+    'dtbfn-extra': '',
+    'flash-id-uboot': 0,
+    'flash-image': 'colibri_t20-512-hsmmc.img',
+    'flash-type': 'emmc',
+}
diff --git a/configs/colibri_t20-512-v11-nand.config b/configs/colibri_t20-512-v11-nand.config
new file mode 100644
index 0000000..79dc573
--- /dev/null
+++ b/configs/colibri_t20-512-v11-nand.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'colibri_t20-512-v11-nand.bct',
+    'board': 'colibri_t20',
+    'dtbfn-extra': '',
+    'flash-id-uboot': 0,
+    'flash-image': 'colibri_t20-512-v11-nand.img',
+    'flash-type': 'nand',
+}
diff --git a/configs/colibri_t20-512-v12-nand.config b/configs/colibri_t20-512-v12-nand.config
new file mode 100644
index 0000000..b1de6a2
--- /dev/null
+++ b/configs/colibri_t20-512-v12-nand.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'colibri_t20-512-v12-nand.bct',
+    'board': 'colibri_t20',
+    'dtbfn-extra': '',
+    'flash-id-uboot': 0,
+    'flash-image': 'colibri_t20-512-v12-nand.img',
+    'flash-type': 'nand',
+}
diff --git a/configs/colibri_t20.board b/configs/colibri_t20.board
new file mode 100644
index 0000000..168c484
--- /dev/null
+++ b/configs/colibri_t20.board
@@ -0,0 +1,5 @@
+board = {
+    'vendor': 'toradex',
+    'soc': 'tegra20',
+    'disabled': True,
+}
-- 
1.9.3
