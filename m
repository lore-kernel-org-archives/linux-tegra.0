From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] [tegra-uboot-flasher-scripts] Add support for Norrin board
Date: Wed, 2 Jul 2014 11:07:29 -0700
Message-ID: <1404324449-1883-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for Norrin (Tegra124 Chromebook reference design).
Disabled by default until u-boot patches make it upstream.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes for v2
 - Fixed capitalization
 - Change to disabled
---
 configs/norrin.board  | 5 +++++
 configs/norrin.config | 9 +++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 configs/norrin.board
 create mode 100644 configs/norrin.config

diff --git a/configs/norrin.board b/configs/norrin.board
new file mode 100644
index 000000000000..1dfb14c5ec9e
--- /dev/null
+++ b/configs/norrin.board
@@ -0,0 +1,5 @@
+board = {
+    'vendor': 'nvidia',
+    'soc': 'tegra124',
+    'disabled': True,
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
