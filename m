From: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [flasher PATCH V2] Add a --post-flash-cmd command line argument
Date: Thu,  4 Dec 2014 11:53:59 +0000
Message-ID: <1417694039-13060-1-git-send-email-james.thomas@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This allows a user to specify the u-boot command to run after flashing
is complete (e.g 'ums 0 mmc 0'), defaults to 'reset' if not set

Signed-off-by: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
 tegra-uboot-flasher | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index b71f967..39a077a 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -218,7 +218,10 @@ def func_flash():
         bootcmd += 'echo >>> Flashing OK, rebooting... ; '
         # To update the bootloader, reset.
         # If wanting to run installer, set installer_args.configname in environment, 'run bootcmd'
-        bootcmd += 'reset'
+        if args.post_flash_cmd:
+            bootcmd += args.post_flash_cmd
+        else:
+            bootcmd += 'reset'
         print 'bootcmd:', bootcmd
         cmd = ['fdtput', '-p', '-t', 's', u_boot_dtb_runflash, '/config', 'bootcmd', bootcmd]
         run(workdir, cmd)
@@ -307,6 +310,8 @@ parser_flash.add_argument('--env', type=str, nargs=2, action='append',
     metavar=("VAR", "VALUE"),
     help='Set a U-Boot environment variable after flashing. This option ' +
         'may be given multiple times')
+parser_flash.add_argument('--post-flash-cmd', type=str,
+    help='The U-Boot command to run after flashing, defaults to \'reset\'')
 
 parser_exec = subparsers.add_parser('exec',
     help='Download and execute an unmodified bootloader binary, named ' +
-- 
1.9.3
