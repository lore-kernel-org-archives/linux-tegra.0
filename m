From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [tegrarcm PATCH] Release version 1.7
Date: Fri, 16 Oct 2015 10:57:20 -0600
Message-ID: <1445014640-1206-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Changelog:
- Documented patch submission process in this file
- Added better USB debugging message
- Require a specific minimum version of libusb
- Added --usb-port-path cmdline option

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README       | 4 ++++
 configure.ac | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/README b/README
index 2c6765387a3f..8ace10ce0440 100644
--- a/README
+++ b/README
@@ -83,6 +83,10 @@ Changelog
 
 Ssee git logs for complete list.
 
+V1.7 - Documented patch submission process in this file
+     - Added better USB debugging message
+     - Require a specific minimum version of libusb
+     - Added --usb-port-path cmdline option
 V1.6 - Added support for ODM secure mode
 V1.5 - Added support for RCM protocol version 40
      - Added Tegra124 support
diff --git a/configure.ac b/configure.ac
index 51ac73d95896..943654fd623d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,7 +2,7 @@
 # Process this file with autoconf to produce a configure script.
 
 AC_PREREQ([2.67])
-AC_INIT([tegrarcm], [1.6], [amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
+AC_INIT([tegrarcm], [1.7], [amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
 AM_INIT_AUTOMAKE
 AC_CONFIG_SRCDIR([src/main.c])
 AC_CONFIG_HEADERS([config.h])
-- 
1.9.1
