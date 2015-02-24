From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage PATCH] Add a README file
Date: Tue, 24 Feb 2015 15:34:26 -0700
Message-ID: <1424817266-25784-1-git-send-email-swarren@wwwdotorg.org>
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
 README.txt | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 README.txt

diff --git a/README.txt b/README.txt
new file mode 100644
index 000000000000..ce95b5a35ed2
--- /dev/null
+++ b/README.txt
@@ -0,0 +1,34 @@
+Introduction
+============
+
+This project provides a tool which compiles BCT (Boot Configuration Table)
+images to place into the boot flash of a Tegra-based device.
+
+The tool will either:
+
+a) Compile a textual representation of a BCT into a binary image.
+
+b) Generate an entire boot image from a previously compiled BCT and a
+   bootloader binary.
+
+Submitting Changes
+==================
+
+To submit patches to this project, please use the following commands:
+
+* git format-patch --subject-prefix="cbootimage PATCH"
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
