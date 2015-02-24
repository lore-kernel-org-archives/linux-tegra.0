From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher manifest PATCH] Add a README file
Date: Tue, 24 Feb 2015 15:55:19 -0700
Message-ID: <1424818519-26763-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This provides a brief introduction to the project, and information re:
how to submit patches.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README.txt | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 README.txt

diff --git a/README.txt b/README.txt
new file mode 100644
index 000000000000..9b86c55aa3e0
--- /dev/null
+++ b/README.txt
@@ -0,0 +1,30 @@
+Introduction
+============
+
+This project provides the manifest files that allow the repo tool to sync the
+tegra-uboot-flasher tool.
+
+For more details, see the various README files in the flasher scripts project
+at https://github.com/NVIDIA/tegra-uboot-flasher-scripts.
+
+Submitting Changes
+==================
+
+To submit patches to this project, please use the following commands:
+
+* git format-patch --subject-prefix="flasher manifest PATCH"
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
