From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 2/2] Add config files for Venice2 board
Date: Wed, 11 Sep 2013 17:48:56 -0600
Message-ID: <1378943336-9263-2-git-send-email-swarren@wwwdotorg.org>
References: <1378943336-9263-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378943336-9263-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This board is currently disabled by default due to lack of U-Boot support
in the mainline repository. If you wish to test this, do as follows:

cd u-boot
git checkout some-branch-with-venice2-support
cd ../scripts
./build --boards venice2 build

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/tegra124.soc   | 3 +++
 configs/venice2.board  | 5 +++++
 configs/venice2.config | 8 ++++++++
 3 files changed, 16 insertions(+)
 create mode 100644 configs/tegra124.soc
 create mode 100644 configs/venice2.board
 create mode 100644 configs/venice2.config

diff --git a/configs/tegra124.soc b/configs/tegra124.soc
new file mode 100644
index 0000000..f5b29d9
--- /dev/null
+++ b/configs/tegra124.soc
@@ -0,0 +1,3 @@
+soc = {
+    'ram-base': 0x80000000,
+}
diff --git a/configs/venice2.board b/configs/venice2.board
new file mode 100644
index 0000000..1dfb14c
--- /dev/null
+++ b/configs/venice2.board
@@ -0,0 +1,5 @@
+board = {
+    'vendor': 'nvidia',
+    'soc': 'tegra124',
+    'disabled': True,
+}
diff --git a/configs/venice2.config b/configs/venice2.config
new file mode 100644
index 0000000..15d0b67
--- /dev/null
+++ b/configs/venice2.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'PM371_Hynix_2GB_H5TC4G63AFR_RDA_792MHz_0719.bct',
+    'board': 'venice2',
+    'dtbfn-extra': '',
+    'flash-erase-size': 1048576,
+    'flash-image': 'venice2-spi.img',
+    'flash-type': 'spi',
+}
-- 
1.8.1.5
