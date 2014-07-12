From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH tegra-uboot-flasher-scripts] Explicitly ask for Python 2
Date: Sat, 12 Jul 2014 23:55:09 +0200
Message-ID: <745064308751f6389975f4fb70d2d6e0c8175d4e.1405201965.git.stefan@agner.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

To make the scripts work without changes on distribution which
"python" defaults to Python 3, we should explicitly ask for
Python 2.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 build               | 2 +-
 build-tools         | 2 +-
 tegra-uboot-flasher | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/build b/build
index 139b502..af863dd 100755
--- a/build
+++ b/build
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Copyright (c) 2013, NVIDIA CORPORATION. All rights reserved.
 #
diff --git a/build-tools b/build-tools
index 307d8a2..074c837 100755
--- a/build-tools
+++ b/build-tools
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Copyright (c) 2013, NVIDIA CORPORATION. All rights reserved.
 #
diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index ed2f2d9..b71f967 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Copyright (c) 2013, NVIDIA CORPORATION. All rights reserved.
 #
-- 
2.0.0
