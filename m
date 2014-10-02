From: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Subject: [PATCH 4/5] set: check seek success
Date: Thu,  2 Oct 2014 10:16:27 +0200
Message-ID: <1412237788-20611-4-git-send-email-patrick@georgi-clan.de>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412237788-20611-1-git-send-email-patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This could silently fail which leads to surprising behaviour.

Found-by: Coverity Scan
Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
---
 src/set.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/src/set.c b/src/set.c
index ff32b53..907d640 100644
--- a/src/set.c
+++ b/src/set.c
@@ -59,7 +59,11 @@ read_from_image(char	*filename,
 		return result;
 	}
 
-	fseek(fp, offset, SEEK_SET);
+	if (!fseek(fp, offset, SEEK_SET)) {
+		printf("Error: Couldn't seek to %s(%d)\n", filename, offset);
+		result = 1;
+		goto cleanup;
+	}
 
 	if (stat(filename, &stats) != 0) {
 		printf("Error: Unable to query info on bootloader path %s\n",
-- 
1.9.1
