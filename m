From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] tegrarcm: Add version command
Date: Mon, 17 Jun 2013 20:24:27 -0700
Message-ID: <1371525867-2551-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add command line option "--version" that prints the version number and
exits.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c        | 11 +++++++++++
 src/tegrarcm.1.in |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/src/main.c b/src/main.c
index bc81cd2..002d897 100644
--- a/src/main.c
+++ b/src/main.c
@@ -46,6 +46,7 @@
 #include "aes-cmac.h"
 #include "rcm.h"
 #include "debug.h"
+#include "config.h"
 
 // tegra20 miniloader
 #include "tegra20-miniloader.h"
@@ -71,9 +72,15 @@ enum cmdline_opts {
 	OPT_LOADADDR,
 	OPT_ENTRYADDR,
 	OPT_HELP,
+	OPT_VERSION,
 	OPT_END,
 };
 
+static void print_version(char *progname)
+{
+	fprintf(stderr, "%s %s\n", PACKAGE_NAME, PACKAGE_VERSION);
+}
+
 static void usage(char *progname)
 {
 	fprintf(stderr, "usage: %s --bct=bctfile --bootloader=blfile --loadaddr=<loadaddr> --entryaddr=<entryaddr>\n", progname);
@@ -111,6 +118,7 @@ int main(int argc, char **argv)
 		[OPT_LOADADDR]   = {"loadaddr", 1, 0, 0},
 		[OPT_ENTRYADDR]  = {"entryaddr", 1, 0, 0},
 		[OPT_HELP]       = {"help", 0, 0, 0},
+		[OPT_VERSION]    = {"version", 0, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -136,6 +144,9 @@ int main(int argc, char **argv)
 			case OPT_ENTRYADDR:
 				entryaddr = strtoul(optarg, NULL, 0);
 				break;
+			case OPT_VERSION:
+				print_version(argv[0]);
+				exit(0);
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 4d1e1d6..5264216 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -59,6 +59,9 @@ specified in hex and is typically 0x108000 for a Tegra20 device or
 Specify the entry address that control will be passed to after the
 firmware is loaded.  This should be specified in hex.  If this option
 is omitted it is assumed to be the same as the load address.
+.TP
+.B \-\-version
+Print the version number and exit.
 
 .SH EXAMPLE
 To download u-boot firmware to a Tegra20 seaboard:
-- 
1.8.1.5
