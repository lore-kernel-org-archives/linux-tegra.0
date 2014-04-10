From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] tegrarcm: Version 1.6
Date: Thu, 10 Apr 2014 13:52:12 -0700
Message-ID: <1397163132-24752-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Update version number to 1.6 and update changelog in README for
version 1.6 release notes.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README       | 1 +
 configure.ac | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/README b/README
index 764aecf09822..df1e106ba760 100644
--- a/README
+++ b/README
@@ -56,6 +56,7 @@ u-boot.bin sent successfully
 
 
 Changes (see git logs for complete list):
+V1.6 - Added support for ODM secure mode
 V1.5 - Added support for RCM protocol version 40
      - Added Tegra124 support
      - Added support for readbct command
diff --git a/configure.ac b/configure.ac
index 19285c95057d..c95a0ec0ddfc 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,7 +2,7 @@
 # Process this file with autoconf to produce a configure script.
 
 AC_PREREQ([2.67])
-AC_INIT([tegrarcm], [1.5], [amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
+AC_INIT([tegrarcm], [1.6], [amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
 AM_INIT_AUTOMAKE
 AC_CONFIG_SRCDIR([src/main.c])
 AC_CONFIG_HEADERS([config.h])
-- 
1.8.1.5
