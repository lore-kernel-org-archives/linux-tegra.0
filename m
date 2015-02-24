From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher scripts PATCH] Add a README file
Date: Tue, 24 Feb 2015 15:45:22 -0700
Message-ID: <1424817922-26230-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

A plain README.txt is a more commit name for a README file than the
existing README-*.txt files. This will help direct users to the correct
file they need to read.

Also add a section describing how/where to send patches, etc.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-developer.txt | 22 ++++++++++++++++++++++
 README.txt           |  9 +++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 README.txt

diff --git a/README-developer.txt b/README-developer.txt
index e2648c39f796..4372d644b7e5 100644
--- a/README-developer.txt
+++ b/README-developer.txt
@@ -62,6 +62,28 @@ repo init -u ... -g default,-notools
 # Only include the bare minimum
 repo init -u ... -g default,-notools,-bootloader
 
+Submitting Changes
+==================
+
+To submit patches to this project, please use the following commands:
+
+* git format-patch --subject-prefix="flasher scripts PATCH"
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
 Pre-requisites
 ==============
 
diff --git a/README.txt b/README.txt
new file mode 100644
index 000000000000..3bba5c2b9042
--- /dev/null
+++ b/README.txt
@@ -0,0 +1,9 @@
+Introduction
+============
+
+If you want to download the source to this tool and compile it, or submit
+changes to this tool, see README-developer.txt.
+
+If you want to use this tool either after having compiled it yourself, or
+after having received a pre-compiled version from someone else (e.g. a
+distribution packager), see README-user.txt
-- 
1.9.1
