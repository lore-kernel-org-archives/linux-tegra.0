From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [tegrarcm PATCH] Add "submitting patches" section to README
Date: Tue, 24 Feb 2015 15:39:07 -0700
Message-ID: <1424817547-26046-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This tells users how/where to send patches, etc.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/README b/README
index df1e106ba760..2c6765387a3f 100644
--- a/README
+++ b/README
@@ -1,6 +1,6 @@
-tegrarcm
+Introduction
+============
 
-What is it?
 This program is used to send code to a Tegra device in recovery mode.
 It does not supported locked devices with an encrypted boot key, only
 open devices such as the ventana, cardhu, or dalmore reference boards.
@@ -15,7 +15,9 @@ Platforms supported:
 -Tegra30
 -Tegra114
 
-How to use:
+Usage
+=====
+
 - Connect a USB cable from your development system to your Tegra
 device.  You will either need a USB A to A cable or A to micro B
 depending on the target board.
@@ -54,8 +56,33 @@ sending file: u-boot.bin
 - 268314/268314 bytes sent
 u-boot.bin sent successfully
 
+Submitting Changes
+==================
+
+To submit patches to this project, please use the following commands:
+
+* git format-patch --subject-prefix="tegrarcm PATCH"
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
+
+Changelog
+=========
+
+Ssee git logs for complete list.
 
-Changes (see git logs for complete list):
 V1.6 - Added support for ODM secure mode
 V1.5 - Added support for RCM protocol version 40
      - Added Tegra124 support
-- 
1.9.1
