From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH tegra-cbootimage] Add automake option subdir-objects to
 prevent warnings
Date: Sun, 21 Jul 2013 23:25:28 +0200
Message-ID: <ba99c86b9074ac9053f665350e6b4985@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The SoC specific code is in subdirectories which leads to warnings in
newer
automake versions. The option subdir-objects prevents those warnings.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 src/Makefile.am | 2 ++
 1 file changed, 2 insertions(+)

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
1.8.3.3
