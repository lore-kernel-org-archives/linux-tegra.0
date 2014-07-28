From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH tegra-uboot-scripts v3] Make folder for dtb files as an argument
Date: Mon, 28 Jul 2014 21:40:22 +0200
Message-ID: <463bd9459319d174d315a31eba4dc24daf03c0c3.1406576139.git.stefan@agner.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some distribution use different folders to store the dtb files
rather then storing them directly in /boot. This adds a new
argument to define in which folder U-Boot should search the dtb
file.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
No that was not what I wanted. The dtbdir should only affect the
DTB. Looks like beer and sending patches do not go well togheter
:-)

 gen-uboot-script.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/gen-uboot-script.py b/gen-uboot-script.py
index 8ca3d01..3f2c401 100755
--- a/gen-uboot-script.py
+++ b/gen-uboot-script.py
@@ -71,6 +71,9 @@ parser.add_argument('--noisy', action='store_true',
 parser.add_argument('--cmdline',
     help='Extra command-line options')
 
+parser.add_argument('--dtb-dir', dest='dtbdir', default=None,
+    help='Search directory for dtbs on target; defaults to boot directory')
+
 args = parser.parse_args()
 if args.debug: print args
 
@@ -109,6 +112,11 @@ else:
     load='load ${devtype} ${devnum}:${rootpart}'
     prefix='/boot/'
 
+if not args.dtbdir:
+    args.dtbdir = prefix
+elif args.dtbdir[-1:] != '/':
+    args.dtbdir += '/'
+
 f.write(load + ' ${kernel_addr_r} ' + prefix + 'zImage\n')
 
 if args.initrd:
@@ -126,7 +134,7 @@ else
     set _fdt ${soc}-${board}${boardver}.dtb;
 fi
 ''')
-f.write(load + ' ${fdt_addr_r} ' + prefix + '${_fdt}\n')
+f.write(load + ' ${fdt_addr_r} ' + args.dtbdir + '${_fdt}\n')
 f.write('set _fdt\n')
 
 bootargs = ''
-- 
2.0.3
