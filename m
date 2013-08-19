From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v2 tegra-cbootimage] Add automake option subdir-objects to
 prevent warnings
Date: Mon, 19 Aug 2013 22:10:20 +0200
Message-ID: <c0f44202ad8a959b1bd4c93f43c1dc42@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The SoC specific code is in subdirectories which leads to warnings in
newer
automake versions. The option subdir-objects prevents those warnings.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---

Sorry, was in vacation. I could not reproduce the message Thierry sees
on
my automake 1.14 installation, however, the option make sense as far as
I 
understand its meaning.

 configure.ac    | 1 +
 src/Makefile.am | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/configure.ac b/configure.ac
index ccd0a55..9b83a21 100644
--- a/configure.ac
+++ b/configure.ac
@@ -10,6 +10,7 @@ AC_CONFIG_HEADERS([config.h])
 # Checks for programs.
 AC_PROG_CXX
 AC_PROG_CC
+AM_PROG_CC_C_O
 PKG_PROG_PKG_CONFIG
 
 # Checks for libraries.
diff --git a/src/Makefile.am b/src/Makefile.am
index 6fcc0d8..6fecfc7 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -1,3 +1,5 @@
+AUTOMAKE_OPTIONS = subdir-objects
+
 AM_CFLAGS = -Wall -std=c99
 
 bin_PROGRAMS = cbootimage bct_dump
-- 
1.8.3.4
