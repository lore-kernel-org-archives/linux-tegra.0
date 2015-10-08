From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH] Add generated files to .gitignore
Date: Thu, 8 Oct 2015 14:44:56 -0700
Message-ID: <1444340696-3251-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add generated and temporary files to .gitignore rules to prevent them from
cluttering up git status or being accidently committed.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .gitignore | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/.gitignore b/.gitignore
index 6293a671b432..b879c34bd28c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -2,3 +2,21 @@ bct_dump
 cbootimage
 .*.swp
 *.o
+*~
+
+.deps
+.dirstamp
+Makefile
+Makefile.in
+/aclocal.m4
+/autom4te.cache/
+/compile
+/config.h
+/config.h.in
+/config.log
+/config.status
+/configure
+/depcomp
+/install-sh
+/missing
+/stamp-h1
-- 
1.9.1
