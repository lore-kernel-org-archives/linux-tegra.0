From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 3/3] Support U-Boot's temporary output DTB path
Date: Tue, 25 Feb 2014 11:28:47 -0700
Message-ID: <1393352927-27595-3-git-send-email-swarren@wwwdotorg.org>
References: <1393352927-27595-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393352927-27595-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Historically, U-Boot has generated $(obj)/u-boot.dtb. During the Kbuild
conversion, this file was moved to $(obj)/dts/dt.dtb. While this change
will be imminentely reverted in the U-Boot makefiles, it's quite easy to
support in the flasher build scripts, so we may as well. This prevents
user confusion and/or "git bisect" issues.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/build b/build
index f1df6ce9536b..7bfc2d9d0aa8 100755
--- a/build
+++ b/build
@@ -136,6 +136,8 @@ def import_uboot_one_board(boardname, build_uboot_dir):
     cp(src, dst)
 
     src = os.path.join(build_uboot_dir, 'u-boot.dtb')
+    if not os.path.exists(src):
+        src = os.path.join(build_uboot_dir, 'dts/dt.dtb')
     dst = os.path.join(out_board_dir, 'u-boot.dtb')
     cp(src, dst)
 
-- 
1.8.1.5
