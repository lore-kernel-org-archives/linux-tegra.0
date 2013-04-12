From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH cbootimage] Fix assert with help output only
Date: Fri, 12 Apr 2013 11:53:00 +0200
Message-ID: <100595c7fe767c0766358d59896d28f4a1239d82.1365760185.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This moves an assert down if only "-h" and not SOC is given on the
command line.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 src/cbootimage.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index fad4d6a..937bac9 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -154,11 +154,11 @@ main(int argc, char *argv[])
 	if (process_command_line(argc, argv, &context) != 0)
 		return -EINVAL;
 
-	assert(g_soc_config != NULL);
-
 	if (help_only)
 		return 1;
 
+	assert(g_soc_config != NULL);
+
 	g_soc_config->get_value(token_bct_size,
 					&context.bct_size,
 					context.bct);
-- 
1.7.9.5
