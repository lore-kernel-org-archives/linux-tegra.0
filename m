From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH tegra-uboot-scripts v2] Make folder for dtb files as an argument
Date: Thu, 24 Jul 2014 23:55:09 +0200
Message-ID: <aaa2e78cfda2a2afe91e9ac8dca4583e8a860123.1406238873.git.stefan@agner.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some distribution use different folders to store the dtb files
rather then storing them directly in /boot. This adds a new
argument to define which folder U-Boot should search the dtb
file.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 gen-uboot-script.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/gen-uboot-script.py b/gen-uboot-script.py
index 8ca3d01..47de520 100755
--- a/gen-uboot-script.py
+++ b/gen-uboot-script.py
@@ -71,6 +71,9 @@ parser.add_argument('--noisy', action='store_true',
 parser.add_argument('--cmdline',
     help='Extra command-line options')
 
+parser.add_argument('--dtb-dir', dest='dtbdir', default=None,
+    help='Search directory for dtbs on target; defaults to /boot')
+
 args = parser.parse_args()
 if args.debug: print args
 
@@ -107,7 +110,10 @@ if args.type == 'net':
     prefix=''
 else:
     load='load ${devtype} ${devnum}:${rootpart}'
-    prefix='/boot/'
+    if not args.dtbdir:
+        prefix='/boot/'
+    else:
+        prefix=args.dtbdir+'/'
 
 f.write(load + ' ${kernel_addr_r} ' + prefix + 'zImage\n')
 
-- 
2.0.2
