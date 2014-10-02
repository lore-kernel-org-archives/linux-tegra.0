From: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Subject: [PATCH 3/5] data_layout: improve memory handling
Date: Thu,  2 Oct 2014 10:16:26 +0200
Message-ID: <1412237788-20611-3-git-send-email-patrick@georgi-clan.de>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412237788-20611-1-git-send-email-patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

- free empty_blk if it's allocated and there's an error
- only free empty_blk if it's non-NULL. While POSIX
  requests such free()s to be safe, some implementations
  (eg Solaris) aren't compliant.

Found-by: Coverity Scan
Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
---
 src/data_layout.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/data_layout.c b/src/data_layout.c
index 01f00ab..db0a0f0 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -1004,12 +1004,14 @@ write_block_raw(build_image_context *context)
 		{
 			size_t bytes = pages_to_write * context->page_size;
 
-			if (fwrite(data, 1, bytes, context->raw_file) != bytes)
+			if (fwrite(data, 1, bytes, context->raw_file) != bytes) {
+				if (empty_blk) free(empty_blk);
 				return -1;
+			}
 		}
 	}
 
-	free(empty_blk);
+	if (empty_blk) free(empty_blk);
 	return 0;
 }
 
-- 
1.9.1
