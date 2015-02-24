From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage-configs PATCH] Add "submitting patches" section to README
Date: Tue, 24 Feb 2015 15:36:38 -0700
Message-ID: <1424817398-25898-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This tells users how/where to send patches, etc.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README.txt | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/README.txt b/README.txt
index 9f742cfcd9da..50a20a70aec1 100644
--- a/README.txt
+++ b/README.txt
@@ -1,3 +1,6 @@
+Introduction
+============
+
 The cbootimage-configs project contains cbootimage configuration files for
 many Tegra boards, both those designed by NVIDIA, and various third-parties.
 
@@ -8,6 +11,9 @@ If you wish to use cbootimage with a board that is not yet supported by this
 project, you might try contacting the vendor of the board to see if they'd be
 willing to contribute configuration files to this project.
 
+Adding Board Support
+====================
+
 If that doesn't work out, you may create the required configuration files
 using the following process:
 
@@ -74,3 +80,25 @@ Once you have performed these steps, you will have configuration files
 suitable for your personal use. We don't accept contributions to this project
 that were derived in this fashion.  We encourage you to contact the vendor
 and request them to submit their own configuration files.
+
+Submitting Changes
+==================
+
+To submit patches to this project, please use the following commands:
+
+* git format-patch --subject-prefix="cbootimage-configs PATCH"
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
+acceptance of the code's license (see COPYING and the license header in each
+file). See http://developercertificate.org/ for details of what signed-off-by
+implies.
-- 
1.9.1
