From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 2/2] Bump to version 1.5
Date: Mon, 16 Mar 2015 15:51:15 -0700
Message-ID: <1426546275-6214-3-git-send-email-jimmzhang@nvidia.com>
References: <1426546275-6214-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426546275-6214-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Create a release that includes Tegra210 support.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index cc3999eabead..17264ce8c2d7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -2,7 +2,7 @@
 # Process this file with autoconf to produce a configure script.
 
 AC_PREREQ([2.67])
-AC_INIT([cbootimage], [1.4], [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
+AC_INIT([cbootimage], [1.5], [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
 AM_INIT_AUTOMAKE
 AC_CONFIG_SRCDIR([src/cbootimage.c])
 AC_CONFIG_HEADERS([config.h])
-- 
1.8.1.5
