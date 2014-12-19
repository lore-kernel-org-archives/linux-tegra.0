From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH tegra-uboot-scripts] Add option --zimage to specify zImage filename
Date: Fri, 19 Dec 2014 15:40:28 +0900
Message-ID: <1418971228-24068-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It may be desirable to use a different zImage filename for systems that
contain different kernel images. Add a --zimage option that allows to
specify a custom zImage filename.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 gen-uboot-script.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/gen-uboot-script.py b/gen-uboot-script.py
index 48d43d10f22f..e11dbf15553c 100755
--- a/gen-uboot-script.py
+++ b/gen-uboot-script.py
@@ -36,6 +36,9 @@ parser.add_argument('--type', choices=['disk', 'net'], default='disk',
 parser.add_argument('-o', dest='outfile', default='boot.scr',
     help='output filename; defaults to boot.scr')
 
+parser.add_argument('--zimage', default='zImage',
+    help='zImage filename to load; defaults to "zImage"')
+
 parser.add_argument('--initrd',
     help='initrd filename to load; defaults to no initrd')
 
@@ -117,7 +120,7 @@ if not args.dtbdir:
 elif not args.dtbdir.endswith('/'):
     args.dtbdir += '/'
 
-f.write(load + ' ${kernel_addr_r} ' + prefix + 'zImage\n')
+f.write(load + ' ${kernel_addr_r} ' + prefix + args.zimage + '\n')
 
 if args.initrd:
     f.write(load + ' ${ramdisk_addr_r} ' + prefix + args.initrd + '\n')
-- 
2.1.3
