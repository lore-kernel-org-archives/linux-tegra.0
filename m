From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 2/3] Use O= rather than BUILD_DIR= when building U-Boot
Date: Tue, 25 Feb 2014 11:28:46 -0700
Message-ID: <1393352927-27595-2-git-send-email-swarren@wwwdotorg.org>
References: <1393352927-27595-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393352927-27595-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

"make O=" works both before and after U-Boot's conversion to Kbuild,
whereas "make BUILD_DIR=" only works before.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/build b/build
index 6142f31e5d5a..f1df6ce9536b 100755
--- a/build
+++ b/build
@@ -159,8 +159,8 @@ def build_uboot_one_board(boardname):
     out_board_dir = gen_out_board_dir(boardname)
     mkdir(out_board_dir)
 
-    run(uboot_dir, 'make BUILD_DIR=' + build_uboot_dir + ' ' + boardname + '_config')
-    run(uboot_dir, 'make BUILD_DIR=' + build_uboot_dir + ' -s ' + makejobs)
+    run(uboot_dir, 'make O=' + build_uboot_dir + ' ' + boardname + '_config')
+    run(uboot_dir, 'make O=' + build_uboot_dir + ' -s ' + makejobs)
 
     import_uboot_one_board(boardname, build_uboot_dir)
 
-- 
1.8.1.5
