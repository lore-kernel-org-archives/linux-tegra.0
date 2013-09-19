From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] Use the correct dtc.git on kernel.org
Date: Thu, 19 Sep 2013 12:00:05 -0600
Message-ID: <1379613605-32435-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit 3e4b099 "Move dtc from jdl.com to kernel.org" used the wrong
instance of dtc.git on kernel.org. Update the manifest to use the
correct one.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 default.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/default.xml b/default.xml
index c409bfd..c5a504d 100644
--- a/default.xml
+++ b/default.xml
@@ -8,7 +8,7 @@
 
   <project path="cbootimage" name="cbootimage.git" remote="github"/>
   <project path="cbootimage-configs" name="cbootimage-configs.git" remote="github"/>
-  <project path="dtc" name="linux/kernel/git/jdl/dtc.git" remote="korg"/>
+  <project path="dtc" name="utils/dtc/dtc.git" remote="korg"/>
   <project path="scripts" name="tegra-uboot-flasher-scripts.git" remote="github"/>
   <project path="tegrarcm" name="tegrarcm.git" remote="github"/>
   <project path="u-boot" name="u-boot.git" remote="denx"/>
-- 
1.8.1.5
