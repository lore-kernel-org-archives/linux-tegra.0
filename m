From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher manifests PATCH] Move dtc from jdl.com to kernel.org
Date: Wed, 18 Sep 2013 15:00:44 -0600
Message-ID: <1379538044-8149-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The primary dtc repository recently moved from jdl.com to kernel.org.
Update tegra-uboot-flasher manifests to reflect the move.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 default-notools.xml | 1 -
 default.xml         | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/default-notools.xml b/default-notools.xml
index dce72e4..62b296e 100644
--- a/default-notools.xml
+++ b/default-notools.xml
@@ -1,6 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <manifest>
-  <remote name="dtc" fetch="git://git.jdl.com/"/>
   <remote name="denx" fetch="git://git.denx.de/"/>
   <remote name="github" fetch="git://github.com/NVIDIA/"/>
 
diff --git a/default.xml b/default.xml
index d6da4dd..c409bfd 100644
--- a/default.xml
+++ b/default.xml
@@ -1,14 +1,14 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <manifest>
-  <remote name="dtc" fetch="git://git.jdl.com/"/>
   <remote name="denx" fetch="git://git.denx.de/"/>
   <remote name="github" fetch="git://github.com/NVIDIA/"/>
+  <remote name="korg" fetch="git://git.kernel.org/pub/scm/"/>
 
   <default revision="master"/>
 
   <project path="cbootimage" name="cbootimage.git" remote="github"/>
   <project path="cbootimage-configs" name="cbootimage-configs.git" remote="github"/>
-  <project path="dtc" name="software/dtc.git" remote="dtc"/>
+  <project path="dtc" name="linux/kernel/git/jdl/dtc.git" remote="korg"/>
   <project path="scripts" name="tegra-uboot-flasher-scripts.git" remote="github"/>
   <project path="tegrarcm" name="tegrarcm.git" remote="github"/>
   <project path="u-boot" name="u-boot.git" remote="denx"/>
-- 
1.8.1.5
