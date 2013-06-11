From: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH tegra-uboot-flasher-scripts] README: use full file names for default.xml and default-notools.xml
Date: Tue, 11 Jun 2013 10:29:42 -0700
Message-ID: <1370971782-25735-1-git-send-email-aplattner@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Passing 'default' or 'default-notools' to repo init's -m parameter fails because
the manifests are actually called 'default.xml' and 'default-notools.xml'
respectively.

Signed-off-by: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Repo sync failed when I tried to follow these instructions because these
manifest names don't exist.

 README-developer.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/README-developer.txt b/README-developer.txt
index 46d3492..2525b40 100644
--- a/README-developer.txt
+++ b/README-developer.txt
@@ -51,15 +51,15 @@ repo init -u git://github.com/NVIDIA/tegra-uboot-flasher-manifests.git \
 repo sync
 
 There are two separate repo manifests for this project. Use repo's -m option
-to specify which you want. Valid values are default (all required
-dependencies) and default-notools (excludes the source to potentially distro-
-packaged utilities cbootimage, tegrarcm, dtc).
+to specify which you want. Valid values are default.xml (all required
+dependencies) and default-notools.xml (excludes the source to potentially
+distro-packaged utilities cbootimage, tegrarcm, dtc).
 
 Compiling Potentially Packaged Utilities
 ========================================
 
 If you have installed distro packages for the utilities mentioned above,
-and/or sync'd the default-notools manifest, skip this step.
+and/or sync'd the default-notools.xml manifest, skip this step.
 
 cd to the scripts sub-directory (i.e. the directory containing this README),
 and execute:
-- 
1.8.3
