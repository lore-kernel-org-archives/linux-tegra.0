From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] Add "submitting patches" section to README
Date: Tue, 24 Feb 2015 15:26:51 -0700
Message-ID: <1424816811-25516-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This tells users how/where to send patches, etc.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/README.txt b/README.txt
index 1c423d684f5e..0ca5a939670a 100644
--- a/README.txt
+++ b/README.txt
@@ -5,6 +5,27 @@ Many aspects of many of Tegra's pins can configure via the pinmux and GPIO
 controllers. This project exists to assist with software's handling of the
 configuration of those controllers.
 
+Submitting Changes
+==================
+
+To submit patches to this project, please use the following commands:
+
+* git format-patch --subject-prefix="pinmux scripts PATCH"
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
+
 Data files
 ==========
 
-- 
1.9.1
