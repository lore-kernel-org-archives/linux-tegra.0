From: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [flasher PATCH] Set bootdelay to 0
Date: Wed, 26 Nov 2014 17:57:06 +0000
Message-ID: <1417024626-6616-2-git-send-email-james.thomas@codethink.co.uk>
References: <1417024626-6616-1-git-send-email-james.thomas@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417024626-6616-1-git-send-email-james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 32-bit systems fdtput writes 0xfffffffe as 0x7fffffff, which takes
some time to complete.

Setting this to 0 accomplishes the same goal
---
 tegra-uboot-flasher | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index b71f967..0121e7a 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -194,8 +194,8 @@ def func_flash():
         u_boot_dtb_runflash = os.path.join(workdir, 'u-boot-runflash.dtb')
         cp(u_boot_dtb, u_boot_dtb_runflash)
 
-        # 0xfffffffe==-2; never delay or interrupt
-        cmd = ['fdtput', '-p', '-t', 'i', u_boot_dtb_runflash, '/config', 'bootdelay', '0xfffffffe']
+        # Set a boot delay of 0 seconds
+        cmd = ['fdtput', '-p', '-t', 'i', u_boot_dtb_runflash, '/config', 'bootdelay', '0x0']
         run(workdir, cmd)
 
         bootcmd = ''
-- 
1.9.3
