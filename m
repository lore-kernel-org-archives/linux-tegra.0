From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [[PATCH flasher] 6/6] Rework cmdline to use sub-commands
Date: Wed, 12 Jun 2013 17:30:07 -0600
Message-ID: <1371079807-16541-6-git-send-email-swarren@wwwdotorg.org>
References: <1371079807-16541-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371079807-16541-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Instead of using options like --list-confignames to select a specific
sub-command/operation to perform, and assuming a default command of flash
if none is specified, use explicit sub-commands.

Old: tegra-uboot-flasher --list-confignames
New: tegra-uboot-flasher list-configs

Old: tegra-uboot-flasher CONFIG
New: tegra-uboot-flasher flash CONFIG

Later changes will introduce more sub-commands, e.g. "exec" to simply
download and execute a bootloader.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-user.txt     |  4 ++--
 tegra-uboot-flasher | 50 +++++++++++++++++++++++++++++---------------------
 2 files changed, 31 insertions(+), 23 deletions(-)

diff --git a/README-user.txt b/README-user.txt
index ce4eaf3..249a096 100644
--- a/README-user.txt
+++ b/README-user.txt
@@ -18,7 +18,7 @@ harmony, cardhu-a02-1gb.config, cardhu-a04-1gb.config.
 
 You may find a list of valid values for configname by executing:
 
-tegra-uboot-flasher --list-confignames
+tegra-uboot-flasher list-configs
 
 Simple Usage
 ============
@@ -27,7 +27,7 @@ To flash a board, connect a USB cable from your host PC to the Tegra device,
 place that board into USB recovery mode, and execute the following as root
 on the host machine:
 
-tegra-uboot-flasher configname
+tegra-uboot-flasher flash CONFIG
 
 This will download code and data to the Tegra device and execute a flashing
 routine. Once this is complete, the system will reboot into the freshly
diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 630b0fb..aae7f19 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -204,26 +204,37 @@ def func_flash():
         else:
             rmtree(workdir)
 
-parser = argparse.ArgumentParser(description='Write an image to a Tegra board\'s flash')
+parser = argparse.ArgumentParser(description='Execute a bootloader on a ' +
+    'Tegra board, possibly modifying it prior to download so as to execute ' +
+    'commands, such as writing an image to flash.')
+
 parser.add_argument('--debug', action='store_true',
-                   help='Turn on debugging prints')
+    help='Turn on debugging prints')
 parser.add_argument('--data-dir', type=str,
-                   help='The directory containing board data')
-parser.add_argument('--work-dir', type=str,
-                   help='The temporary directory used during operation')
-parser.add_argument('--save-work-dir', action='store_true',
-                   help='Don\'t delete the work-dir after execution')
-parser.add_argument('--flash-image', type=str,
-                   help='The flash image to write, instead of U-Boot itself')
-parser.add_argument('--gen-only', action='store_true',
-                   help='Just create the work-dir; don\'t actually flash the image')
+    help='The directory containing board data')
 parser.add_argument('--force-no-out-dir', action='store_true',
-                   help='Don\'t check for ../_out* directories used in source tree')
-group = parser.add_mutually_exclusive_group(required=True)
-group.add_argument('--list-confignames', action='store_true',
-                   help='List known configuration names, and exit')
-group.add_argument('configname', type=str, nargs='?',
-                   help='The configuration name of the board')
+    help='Don\'t check for ../_out* directories used in source tree')
+
+subparsers = parser.add_subparsers()
+
+parser_list_configs = subparsers.add_parser('list-configs',
+    help='List known board configurations')
+parser_list_configs.set_defaults(func = func_list_configs)
+
+parser_flash = subparsers.add_parser('flash',
+    help='Write an image, usually U-Boot itself, to flash on the device')
+parser_flash.set_defaults(func = func_flash)
+parser_flash.add_argument('--work-dir', type=str,
+    help='The temporary directory used during operation')
+parser_flash.add_argument('--save-work-dir', action='store_true',
+    help='Don\'t delete the work-dir after execution')
+parser_flash.add_argument('--flash-image', type=str,
+    help='The flash image to write, instead of U-Boot itself')
+parser_flash.add_argument('--gen-only', action='store_true',
+    help='Just create the work-dir; don\'t actually flash the image')
+parser_flash.add_argument('configname', metavar='CONFIG', type=str,
+    help='The configuration name of the board')
+
 args = parser.parse_args()
 if args.debug: print args
 
@@ -246,7 +257,4 @@ if not args.data_dir:
 
 load_configs(os.path.join(args.data_dir, 'configs'))
 
-if args.list_confignames:
-    func_list_configs()
-else:
-    func_flash()
+args.func()
-- 
1.8.1.5
