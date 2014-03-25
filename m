From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] Add support for Jetson TK1 board
Date: Tue, 25 Mar 2014 11:37:29 -0600
Message-ID: <1395769049-7996-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This board is currently disabled by default due to lack of U-Boot support
in the mainline repository. If you wish to test this, do as follows:

cd ../u-boot
git checkout some-branch-with-jetson-tk1-support
cd ../scripts
./build --boards venice2 build

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/jetson-tk1.board  | 5 +++++
 configs/jetson-tk1.config | 8 ++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 configs/jetson-tk1.board
 create mode 100644 configs/jetson-tk1.config

diff --git a/configs/jetson-tk1.board b/configs/jetson-tk1.board
new file mode 100644
index 000000000000..1dfb14c5ec9e
--- /dev/null
+++ b/configs/jetson-tk1.board
@@ -0,0 +1,5 @@
+board = {
+    'vendor': 'nvidia',
+    'soc': 'tegra124',
+    'disabled': True,
+}
diff --git a/configs/jetson-tk1.config b/configs/jetson-tk1.config
new file mode 100644
index 000000000000..b72444f3a9d1
--- /dev/null
+++ b/configs/jetson-tk1.config
@@ -0,0 +1,8 @@
+config = {
+    'bct': 'PM375_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.bct',
+    'board': 'jetson-tk1',
+    'dtbfn-extra': '',
+    'flash-id-uboot': 0,
+    'flash-image': 'jetson-tk1-emmc.img',
+    'flash-type': 'emmc',
+}
-- 
1.8.1.5
