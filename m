From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH tegra-uboot-flasher] README: describe the CROSS_COMPILER variable
Date: Wed, 12 Jun 2013 16:11:50 -0600
Message-ID: <1371075110-13843-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The build script uses a cross-compiler. The variable CROSS_COMPILE can
be set to select one, or a default value will be assumed.

Reported-by: Victor Weinstein <vweinstein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-developer.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/README-developer.txt b/README-developer.txt
index 2525b40..89fcd2c 100644
--- a/README-developer.txt
+++ b/README-developer.txt
@@ -72,6 +72,15 @@ Creating Flash Images
 This step creates the target binaries and supporting data files necessary to
 run the tegra-uboot-flasher script. You will always need to perform this step.
 
+You will need an ARM cross-compiler in order to compile U-Boot. This may be
+obtained from a distribution package, or be a custom-built toolchain. The
+environment variable CROSS_COMPILE should be set to select the compiler to
+use. CROSS_COMPILE should contain the common prefix of all the binaries in
+the cross-compiler, for example if gcc is arm-linux-gnueabi-gcc, then
+CROSS_COMPILE should be set to arm-linux-gnueabi-, or
+/path/to/arm-linux-gnueabi-. If this variable is not set, then the build
+script assumes a value of arm-linux-gnueabi-.
+
 cd to the scripts sub-directory (i.e. the directory containing this README),
 and execute:
 
-- 
1.8.1.5
