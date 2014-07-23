From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH tegra-uboot-scripts 1/2] Explicitly ask for Python 2
Date: Wed, 23 Jul 2014 22:27:11 +0200
Message-ID: <b1286f43830d50fc483310e2e32c61ab2308a4e5.1406147204.git.stefan@agner.ch>
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
 gen-uboot-script.py | 2 +-
 part-uuid.py        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/gen-uboot-script.py b/gen-uboot-script.py
index a60aed0..8ca3d01 100755
--- a/gen-uboot-script.py
+++ b/gen-uboot-script.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Copyright (c) 2013, NVIDIA CORPORATION. All rights reserved.
 #
diff --git a/part-uuid.py b/part-uuid.py
index cd82c7d..e53a64c 100755
--- a/part-uuid.py
+++ b/part-uuid.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Copyright (c) 2011-2013, NVIDIA CORPORATION. All rights reserved.
 #
-- 
2.0.2
