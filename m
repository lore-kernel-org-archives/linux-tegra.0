From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH tegra-uboot-scripts 2/2] Make folder for dtb files as an argument
Date: Wed, 23 Jul 2014 22:27:12 +0200
Message-ID: <cc27525d885d60e977b2cf17ccf7e8735b9eddb7.1406147204.git.stefan@agner.ch>
References: <b1286f43830d50fc483310e2e32c61ab2308a4e5.1406147204.git.stefan@agner.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b1286f43830d50fc483310e2e32c61ab2308a4e5.1406147204.git.stefan-XLVq0VzYD2Y@public.gmane.org>
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
 gen-uboot-script.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/gen-uboot-script.py b/gen-uboot-script.py
index 8ca3d01..74a42a8 100755
--- a/gen-uboot-script.py
+++ b/gen-uboot-script.py
@@ -71,6 +71,9 @@ parser.add_argument('--noisy', action='store_true',
 parser.add_argument('--cmdline',
     help='Extra command-line options')
 
+parser.add_argument('--dtb-dir', dest='dtbdir', default='/boot',
+    help='Search directory for dtbs on target; defaults to /boot')
+
 args = parser.parse_args()
 if args.debug: print args
 
@@ -126,7 +129,7 @@ else
     set _fdt ${soc}-${board}${boardver}.dtb;
 fi
 ''')
-f.write(load + ' ${fdt_addr_r} ' + prefix + '${_fdt}\n')
+f.write(load + ' ${fdt_addr_r} ' + args.dtbdir + '/${_fdt}\n')
 f.write('set _fdt\n')
 
 bootargs = ''
-- 
2.0.2
