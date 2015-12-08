From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] Add support for tegrarcm's --usb-port-path cmdline option
Date: Tue,  8 Dec 2015 10:47:28 -0700
Message-ID: <1449596849-27393-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This allows the user to specify which USB device to operate on. See
the related tegrarcm commit for a full description of this option and
how to calculate the required option value. An example is:

    ./tegra-uboot-flasher exec --usb-port-path 3-10.5 jetson-tk1

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index d20e3ad413ef..3a77a8be9e6b 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -93,7 +93,10 @@ def get_loadaddr():
 def gen_tegrarcm_cmd(bootloader, loadaddr):
     if type(loadaddr) != str:
         loadaddr = "0x%08x" % loadaddr
-    return ['tegrarcm', '--bct=' + bct, '--bootloader=' + bootloader , '--loadaddr=' + loadaddr]
+    cmd = ['tegrarcm', '--bct=' + bct, '--bootloader=' + bootloader , '--loadaddr=' + loadaddr]
+    if args.usb_port_path:
+        cmd.extend(['--usb-port-path', args.usb_port_path])
+    return cmd
 
 def find_config_dir():
     if not configs.has_key(args.configname):
@@ -326,6 +329,8 @@ parser_exec.add_argument('--loadaddr', type=str,
     help='Load address for the bootloader binary')
 
 for p in (parser_flash, parser_exec):
+    p.add_argument('--usb-port-path', metavar='USBPORTPATH', type=str,
+        help='The USB port path of the Tegra device')
     p.add_argument('configname', metavar='CONFIG', type=str,
         help='The configuration name of the board')
 
-- 
2.6.3
