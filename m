From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage-configs PATCH] Image dependency generator cleanups
Date: Wed,  2 Apr 2014 11:43:05 -0600
Message-ID: <1396460585-9178-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

1) Remove whitespace from parsed filenames.
2) Make image file depend on dependency generator script.
3) Provide dummy rules for all dependencies. Without this change, if any
   dependency is renamed, make will try to build it but won't know how.
   With the dummy rules in place, make will execute an empty command to
   build any missing dependencies, which is fine if they've simply been
   renamed. Any real errors due to incorrect filenames in the current
   config files will be caught by the cbootimage invocation itself.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build/gen-image-deps.sh | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/build/gen-image-deps.sh b/build/gen-image-deps.sh
index 10c4001e0050..fcbb64cdbf5e 100755
--- a/build/gen-image-deps.sh
+++ b/build/gen-image-deps.sh
@@ -18,17 +18,25 @@
 #    misrepresented as being the original software.
 # 3. This notice may not be removed or altered from any source distribution.
 
+deps_script=$0
 img_cfg_file=$1
 img_file=$2
 dep_file=$3
 
 rm -f ${dep_file}
-bct=`grep -i bctfile ${img_cfg_file} | sed -e 's/^.*=//' -e s'/[,;].*$//'`
-bootloader=`grep -i bootloader ${img_cfg_file} | sed -e 's/^.*=//' -e s'/[,;].*$//'`
+bct=`grep -i bctfile ${img_cfg_file} | sed -e 's/^.*=\s*//' -e s'/[,;].*$//'`
+bootloader=`grep -i bootloader ${img_cfg_file} | sed -e 's/^.*=\s*//' -e s'/[,;].*$//'`
 
 cat > ${dep_file} <<ENDOFHERE
 ${img_file}: \\
+	${deps_script} \\
 	${img_cfg_file} \\
 	${bct} \\
 	${bootloader}
+
+${img_cfg_file}:
+
+${bct}:
+
+${bootloader}:
 ENDOFHERE
-- 
1.8.1.5
