From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] tegrarcm: Add help command to man page
Date: Mon, 17 Jun 2013 20:24:56 -0700
Message-ID: <1371525896-2631-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a description of the "--help" command to the man page.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/tegrarcm.1.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 5264216..4b9200d 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -62,6 +62,9 @@ is omitted it is assumed to be the same as the load address.
 .TP
 .B \-\-version
 Print the version number and exit.
+.TP
+.B \-\-help
+Print help text and exit.
 
 .SH EXAMPLE
 To download u-boot firmware to a Tegra20 seaboard:
-- 
1.8.1.5
