From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 11/11] tegrarcm: Bump version to 1.5
Date: Mon, 9 Sep 2013 13:16:01 -0700
Message-ID: <1378757761-20939-12-git-send-email-amartin@nvidia.com>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Update README with change log for version 1.5, and bump version
number.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README       | 2 ++
 configure.ac | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/README b/README
index 4dde32b..c9757f5 100644
--- a/README
+++ b/README
@@ -56,6 +56,8 @@ u-boot.bin sent successfully
 
 
 Changes (see git logs for complete list):
+V1.5 - Added support for RCM protocol version 40
+     - Added Tegra124 support
 V1.4 - Added --version command
      - Updated T114 miniloader to fix SPI boot problem
      - Added --help command to man page
diff --git a/configure.ac b/configure.ac
index 487666a..19285c9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,7 +2,7 @@
 # Process this file with autoconf to produce a configure script.
 
 AC_PREREQ([2.67])
-AC_INIT([tegrarcm], [1.4], [amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
+AC_INIT([tegrarcm], [1.5], [amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
 AM_INIT_AUTOMAKE
 AC_CONFIG_SRCDIR([src/main.c])
 AC_CONFIG_HEADERS([config.h])
-- 
1.8.1.5
