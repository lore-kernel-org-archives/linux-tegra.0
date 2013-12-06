From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH V2 3/4] Allow overriding environment variables during flashing
Date: Fri,  6 Dec 2013 10:35:34 -0700
Message-ID: <1386351334-25766-2-git-send-email-swarren@wwwdotorg.org>
References: <1386351334-25766-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386351334-25766-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The flashing process resets the U-Boot environment to the built-in
default. Allow the user to specify some non-default values to be set
before saving the environment. This can be useful e.g. to set up the
default boot target:

./tegra-uboot-flasher flash --env boot_targets dhcp beaver

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
* Don't fail if no --env cmdline options are used.
* Enhance help text to:
  - Explicitly mention that the option can be used multiple times.
    (in --help output only, not the short help)
  - Say "--env VAR VALUE" not "--env ENV ENV" so the syntax is clear.
---
 tegra-uboot-flasher | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index c9eb811db937..ea36ba1efd7a 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -195,6 +195,9 @@ def func_flash():
         # Perhaps U-Boot should set $boardname based on the ID EEPROM; then we wouldn't need this
         if config['dtbfn-extra'] != '':
             bootcmd += 'setenv board ' + boardname + config['dtbfn-extra'] + ' ; '
+        if args.env:
+            for (var, value) in args.env:
+                bootcmd += 'setenv %s %s ; ' % (var, value)
         bootcmd += 'saveenv ; '
         # To update the bootloader, reset.
         # If wanting to run installer, set installer_args.configname in environment, 'run bootcmd'
@@ -283,6 +286,10 @@ parser_flash.add_argument('--flash-image', type=str,
     help='The flash image to write, instead of U-Boot itself')
 parser_flash.add_argument('--gen-only', action='store_true',
     help='Just create the work-dir; don\'t actually flash the image')
+parser_flash.add_argument('--env', type=str, nargs=2, action='append',
+    metavar=("VAR", "VALUE"),
+    help='Set a U-Boot environment variable after flashing. This option ' +
+        'may be given multiple times')
 
 parser_exec = subparsers.add_parser('exec',
     help='Download and execute an unmodified bootloader binary, named ' +
-- 
1.8.1.5
