From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] [tegra-uboot-flasher-scripts] Add support for norrin board
Date: Mon, 30 Jun 2014 13:44:00 -0700
Message-ID: <1404161040-10747-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for norrin (Tegra124 Chromebook reference design)

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/norrin.board  | 4 ++++
 configs/norrin.config | 9 +++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 configs/norrin.board
 create mode 100644 configs/norrin.config

diff --git a/configs/norrin.board b/configs/norrin.board
new file mode 100644
index 000000000000..73b23ae86dd2
--- /dev/null
+++ b/configs/norrin.board
@@ -0,0 +1,4 @@
+board = {
+    'vendor': 'nvidia',
+    'soc': 'tegra124',
+}
diff --git a/configs/norrin.config b/configs/norrin.config
new file mode 100644
index 000000000000..cce4f26c61fb
--- /dev/null
+++ b/configs/norrin.config
@@ -0,0 +1,9 @@
+config = {
+    'bct': 'PM370_Hynix_2GB_H5TC4G63AFR_PBA_924MHz_01212014.bct',
+    'board': 'norrin',
+    'dtbfn-extra': '',
+    'flash-erase-size': 1048576,
+    'flash-image': 'norrin-spi.img',
+    'flash-type': 'spi',
+    'flash-id-uboot': '1:0',
+}
-- 
1.8.1.5
