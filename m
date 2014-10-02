From: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Subject: [PATCH 5/5] data_layout: fail better on file access errors
Date: Thu,  2 Oct 2014 10:16:28 +0200
Message-ID: <1412237788-20611-5-git-send-email-patrick@georgi-clan.de>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412237788-20611-1-git-send-email-patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

fread could return only a partial result
(eg. NVBOOT_CONFIG_TABLE_SIZE_MAX - 1 bytes),
which right now would be accepted and only
resolved by later code.

Found-by: Coverity Scan
Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
---
 src/data_layout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/data_layout.c b/src/data_layout.c
index db0a0f0..11a0761 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -1050,7 +1050,7 @@ int get_bct_size_from_image(build_image_context *context)
 	if (!fp)
 		return ENODATA;
 
-	if (!fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp)) {
+	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) != NVBOOT_CONFIG_TABLE_SIZE_MAX) {
 		fclose(fp);
 		return ENODATA;
 	}
-- 
1.9.1
