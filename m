From: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Subject: [PATCH 1/5] configure.ac: Don't search for c++ compiler
Date: Thu,  2 Oct 2014 10:16:24 +0200
Message-ID: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There is no C++ code to be compiled in the repository.

Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
---
 configure.ac | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index cc3999e..c720f93 100644
--- a/configure.ac
+++ b/configure.ac
@@ -8,7 +8,6 @@ AC_CONFIG_SRCDIR([src/cbootimage.c])
 AC_CONFIG_HEADERS([config.h])
 
 # Checks for programs.
-AC_PROG_CXX
 AC_PROG_CC
 AM_PROG_CC_C_O
 PKG_PROG_PKG_CONFIG
-- 
1.9.1
