From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 2/2] Wrap any env var settings in quotes
Date: Wed,  2 Jul 2014 11:32:43 -0600
Message-ID: <1404322363-11580-2-git-send-email-swarren@wwwdotorg.org>
References: <1404322363-11580-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404322363-11580-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This allows run user to pass the following to the flashing script:

    --env bootcmd 'usb start ; dhcp zImage'

rather than having to manually escape the commands for U-Boot:

    --env bootcmd 'usb start \; dhcp zImage'

(The quoting in both cases is for the shell invoking tegra-uboot-flasher,
not for U-Boot's command-line. The removed escaping was to work around
the lack of quoting/escaping when passing the user's command to U-Boot's
setenv command during flashing.)

This change will interact badly with the user wanting to use single
quotes in environment variable values, but hopefully that's less likely,
and can be fixed later if needed.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index c9adba607c69..ed2f2d91d336 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -213,7 +213,7 @@ def func_flash():
             bootcmd += 'setenv board ' + boardname + config['dtbfn-extra'] + ' ; '
         if args.env:
             for (var, value) in args.env:
-                bootcmd += 'setenv %s %s ; ' % (var, value)
+                bootcmd += 'setenv %s \'%s\' ; ' % (var, value)
         bootcmd += 'saveenv ; '
         bootcmd += 'echo >>> Flashing OK, rebooting... ; '
         # To update the bootloader, reset.
-- 
1.8.1.5
