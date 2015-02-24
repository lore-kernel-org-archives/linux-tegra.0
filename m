From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [uboot scripts PATCH] Add "submitting patches" section to README
Date: Tue, 24 Feb 2015 15:29:54 -0700
Message-ID: <1424816994-25641-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This tells users how/where to send patches, etc.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README.txt | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/README.txt b/README.txt
index 71b143e1fb0b..0fe8d4d54a29 100644
--- a/README.txt
+++ b/README.txt
@@ -1,3 +1,6 @@
+Usage
+=====
+
 This project provides a script which generates a U-Boot boot script for
 Tegra devices running upstream U-Boot.
 
@@ -31,3 +34,24 @@ partition. This may be used to provide the parameter to gen-uboot-script.py's
 
 The standard blkid command may be used to determine a partition's filesystem
 UUID, for use with gen-uboot-script.py's --fsuuid option.
+
+Submitting Changes
+==================
+
+To submit patches to this project, please use the following commands:
+
+* git format-patch --subject-prefix="uboot scripts PATCH"
+
+  Creates a patch file from your git commit.
+
+* git send-email --to linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org *.patch
+
+  Sends the patch by email to the Tegra mailing list.
+
+Even though the primary upstream repository for this project is hosted on
+github, contributions aren't accepted via github pull requests. Github pull
+requests would bypass public code review on the project mailing list.
+
+Patches should be signed off (include a signed-off-by line) to indicate your
+acceptance of the code's license (see the license header in each file). See
+http://developercertificate.org/ for details of what signed-off-by implies.
-- 
1.9.1
