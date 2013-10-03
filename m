From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher manifests PATCH] Use groups rather than separate manifests
Date: Thu,  3 Oct 2013 14:50:55 -0600
Message-ID: <1380833455-32147-2-git-send-email-swarren@wwwdotorg.org>
References: <1380833455-32147-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380833455-32147-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

repo allows projects to be placed into groups. Use this feature, rather
than separate manually-maintained manifests, to allow syncing the flasher
source excluding the tools repositories.

Also add a group for the U-Boot repo, since it may be useful to exclude
that if you're building U-Boot elsewhere, and manually copying its build
results into the flasher directory. This change would have multiplied
the number of manifests by two if not implemented using repo's group
feature.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 default-notools.xml | 11 -----------
 default.xml         |  8 ++++----
 2 files changed, 4 insertions(+), 15 deletions(-)
 delete mode 100644 default-notools.xml

diff --git a/default-notools.xml b/default-notools.xml
deleted file mode 100644
index 62b296e..0000000
--- a/default-notools.xml
+++ /dev/null
@@ -1,11 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<manifest>
-  <remote name="denx" fetch="git://git.denx.de/"/>
-  <remote name="github" fetch="git://github.com/NVIDIA/"/>
-
-  <default revision="master"/>
-
-  <project path="cbootimage-configs" name="cbootimage-configs.git" remote="github"/>
-  <project path="scripts" name="tegra-uboot-flasher-scripts.git" remote="github"/>
-  <project path="u-boot" name="u-boot.git" remote="denx"/>
-</manifest>
diff --git a/default.xml b/default.xml
index c5a504d..f21690d 100644
--- a/default.xml
+++ b/default.xml
@@ -6,10 +6,10 @@
 
   <default revision="master"/>
 
-  <project path="cbootimage" name="cbootimage.git" remote="github"/>
+  <project path="cbootimage" name="cbootimage.git" remote="github" groups="tools"/>
   <project path="cbootimage-configs" name="cbootimage-configs.git" remote="github"/>
-  <project path="dtc" name="utils/dtc/dtc.git" remote="korg"/>
+  <project path="dtc" name="utils/dtc/dtc.git" remote="korg" groups="tools"/>
   <project path="scripts" name="tegra-uboot-flasher-scripts.git" remote="github"/>
-  <project path="tegrarcm" name="tegrarcm.git" remote="github"/>
-  <project path="u-boot" name="u-boot.git" remote="denx"/>
+  <project path="tegrarcm" name="tegrarcm.git" remote="github" groups="tools"/>
+  <project path="u-boot" name="u-boot.git" remote="denx" groups="bootloader"/>
 </manifest>
-- 
1.8.1.5
