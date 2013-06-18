From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] tegrarcm: Bump version to 1.4
Date: Mon, 17 Jun 2013 20:26:54 -0700
Message-ID: <1371526014-2869-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Bump the version number to 1.4 and update change log.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README       | 4 ++++
 configure.ac | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/README b/README
index e61938f..516f839 100644
--- a/README
+++ b/README
@@ -56,6 +56,10 @@ u-boot.bin sent successfully
 
 
 Changes (see git logs for complete list):
+V1.4 - Changed licnese for minloader files
+     - Added --version command
+     - Updated T114 miniloader to fix SPI boot problem
+     - Added --help command to man page
 V1.3 - Added some better error checking on return values
      - Fixed configure problem related to libcrypto++ and libpthread
        interaction
diff --git a/configure.ac b/configure.ac
index 9964316..487666a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,7 +2,7 @@
 # Process this file with autoconf to produce a configure script.
 
 AC_PREREQ([2.67])
-AC_INIT([tegrarcm], [1.3], [amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
+AC_INIT([tegrarcm], [1.4], [amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
 AM_INIT_AUTOMAKE
 AC_CONFIG_SRCDIR([src/main.c])
 AC_CONFIG_HEADERS([config.h])
-- 
1.8.1.5
