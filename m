From: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [flasher PATCH] Use hex (x) type argument for fdtput when writing bootdelay
Date: Thu,  4 Dec 2014 12:02:43 +0000
Message-ID: <1417694563-17844-1-git-send-email-james.thomas@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This ensures the correct value (-2) is set on both 32-bit and 64-bit
systems

Signed-off-by: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
 tegra-uboot-flasher | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index b71f967..69f9262 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -195,7 +195,7 @@ def func_flash():
         cp(u_boot_dtb, u_boot_dtb_runflash)
 
         # 0xfffffffe==-2; never delay or interrupt
-        cmd = ['fdtput', '-p', '-t', 'i', u_boot_dtb_runflash, '/config', 'bootdelay', '0xfffffffe']
+        cmd = ['fdtput', '-p', '-t', 'x', u_boot_dtb_runflash, '/config', 'bootdelay', '0xfffffffe']
         run(workdir, cmd)
 
         bootcmd = ''
-- 
1.9.3
