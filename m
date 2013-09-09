From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/11] tegrarcm: Clean up usage info
Date: Mon, 9 Sep 2013 13:15:57 -0700
Message-ID: <1378757761-20939-8-git-send-email-amartin@nvidia.com>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Added --help and --version commands to usage.  Made it more clear that
--entryaddr is optional.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/src/main.c b/src/main.c
index 926a35d..d32f41b 100644
--- a/src/main.c
+++ b/src/main.c
@@ -87,9 +87,16 @@ static void print_version(char *progname)
 
 static void usage(char *progname)
 {
-	fprintf(stderr, "usage: %s --bct=bctfile --bootloader=blfile --loadaddr=<loadaddr> --entryaddr=<entryaddr>\n", progname);
+	fprintf(stderr, "usage: %s [options] --bct=bctfile --bootloader=blfile --loadaddr=<loadaddr>\n", progname);
 	fprintf(stderr, "\n");
-	fprintf(stderr, "\tIf entryaddr is not specified, it's assumed to be the same as loadaddr\n");
+	fprintf(stderr, "Options:\n");
+	fprintf(stderr, "\t--entryaddr=<entryaddr>\n");
+	fprintf(stderr, "\t\tSpecify the entry point for the bootloader, if this option is\n");
+	fprintf(stderr, "\t\tnot provided, it is assumed to be loadaddr\n");
+	fprintf(stderr, "\t--help\n");
+	fprintf(stderr, "\t\tPrint this help information\n");
+	fprintf(stderr, "\t--version\n");
+	fprintf(stderr, "\t\tPrint version information and exit\n");
 	fprintf(stderr, "\n");
 }
 
-- 
1.8.1.5
