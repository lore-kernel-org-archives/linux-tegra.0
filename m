From: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Subject: [PATCH 2/5] cbootimage: simplify code
Date: Thu,  2 Oct 2014 10:16:25 +0200
Message-ID: <1412237788-20611-2-git-send-email-patrick@georgi-clan.de>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412237788-20611-1-git-send-email-patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Testing for e == 0 after exiting the function in any other
case a couple of lines earlier is useless.

Found-by: Coverity Scan
Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
---
 src/cbootimage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index 5f746e3..62328b4 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -211,7 +211,7 @@ main(int argc, char *argv[])
 
 	if (enable_debug) {
 		/* Debugging information... */
-		printf("bct size: %d\n", e == 0 ? context.bct_size : -1);
+		printf("bct size: %d\n", context.bct_size);
 	}
 
 	/* Open the raw output file. */
-- 
1.9.1
