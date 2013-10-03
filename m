From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] Document manifest change to use groups
Date: Thu,  3 Oct 2013 14:50:54 -0600
Message-ID: <1380833455-32147-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Rather than the manifest repo containing separate default.xml and
default-notools.xml, there is now a single default.xml, and one may use
repo init's -g option to cut down what gets synced. Update the README
to document this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-developer.txt | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/README-developer.txt b/README-developer.txt
index 9016d2b..090f900 100644
--- a/README-developer.txt
+++ b/README-developer.txt
@@ -46,14 +46,21 @@ To obtain the source of the tegra-uboot-flasher project, do:
 
 mkdir tegra-uboot-flasher
 cd tegra-uboot-flasher
-repo init -u git://github.com/NVIDIA/tegra-uboot-flasher-manifests.git \
-        -m MANIFEST # see explanation below
+repo init -u git://github.com/NVIDIA/tegra-uboot-flasher-manifests.git
 repo sync
 
-There are two separate repo manifests for this project. Use repo's -m option
-to specify which you want. Valid values are default.xml (all required
-dependencies) and default-notools.xml (excludes the source to potentially
-distro-packaged utilities cbootimage, tegrarcm, dtc).
+The manifest includes the source to potentially distro-packaged utilities
+such as cbootimage and tegrarcm, and U-Boot itself. If you already have the
+pre-requisite tools installed, you may not want to download their source.
+Similarly, if you already build U-Boot yourself, you may not want another
+copy of the U-Boot source tree. You can request that repo not download
+those source trees using the -g option to repo init. For example:
+
+# Exclude just the pre-requisite tools:
+repo init -u ... -g default,-notools
+
+# Only include the bare minimum
+repo init -u ... -g default,-notools,-bootloader
 
 Pre-requisites
 ==============
-- 
1.8.1.5
