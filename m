From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher manifests PATCH] Move tools from nv-tegra to github
Date: Wed, 28 Aug 2013 15:02:58 -0600
Message-ID: <1377723778-6714-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Certain tools were moved from nv-tegra.nvidia.com to github in order
to support features beyond git itself. Update tegra-uboot-flasher
manifests to reflect the move.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 default-notools.xml | 3 +--
 default.xml         | 7 +++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/default-notools.xml b/default-notools.xml
index e3dfca1..dce72e4 100644
--- a/default-notools.xml
+++ b/default-notools.xml
@@ -3,11 +3,10 @@
   <remote name="dtc" fetch="git://git.jdl.com/"/>
   <remote name="denx" fetch="git://git.denx.de/"/>
   <remote name="github" fetch="git://github.com/NVIDIA/"/>
-  <remote name="nv-tegra" fetch="git://nv-tegra.nvidia.com/"/>
 
   <default revision="master"/>
 
-  <project path="cbootimage-configs" name="tools/tegra-cbootimage-configs.git" remote="nv-tegra"/>
+  <project path="cbootimage-configs" name="cbootimage-configs.git" remote="github"/>
   <project path="scripts" name="tegra-uboot-flasher-scripts.git" remote="github"/>
   <project path="u-boot" name="u-boot.git" remote="denx"/>
 </manifest>
diff --git a/default.xml b/default.xml
index 8e67c43..d6da4dd 100644
--- a/default.xml
+++ b/default.xml
@@ -3,14 +3,13 @@
   <remote name="dtc" fetch="git://git.jdl.com/"/>
   <remote name="denx" fetch="git://git.denx.de/"/>
   <remote name="github" fetch="git://github.com/NVIDIA/"/>
-  <remote name="nv-tegra" fetch="git://nv-tegra.nvidia.com/"/>
 
   <default revision="master"/>
 
-  <project path="cbootimage" name="tools/cbootimage.git" remote="nv-tegra"/>
-  <project path="cbootimage-configs" name="tools/tegra-cbootimage-configs.git" remote="nv-tegra"/>
+  <project path="cbootimage" name="cbootimage.git" remote="github"/>
+  <project path="cbootimage-configs" name="cbootimage-configs.git" remote="github"/>
   <project path="dtc" name="software/dtc.git" remote="dtc"/>
   <project path="scripts" name="tegra-uboot-flasher-scripts.git" remote="github"/>
-  <project path="tegrarcm" name="tools/tegrarcm.git" remote="nv-tegra"/>
+  <project path="tegrarcm" name="tegrarcm.git" remote="github"/>
   <project path="u-boot" name="u-boot.git" remote="denx"/>
 </manifest>
-- 
1.8.1.5
