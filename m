From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [cbootimage PATCH 1/3] Fix the error reporting of get_bct_size_from_image()
Date: Thu,  5 Nov 2015 17:03:20 +0100
Message-ID: <1446739402-14238-2-git-send-email-alban.bedel@avionic-design.de>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446739402-14238-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

get_bct_size_from_image() should return negative error codes, so add
the missing minus signs. Also fix the return value check on
get_bct_size_from_image(), a negative value indicate an error not zero.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 src/cbootimage.c  | 2 +-
 src/data_layout.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index da1d1a5..fc99af2 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -239,7 +239,7 @@ main(int argc, char *argv[])
 
 		/* Get BCT_SIZE from input image file  */
 		bct_size = get_bct_size_from_image(&context);
-		if (!bct_size) {
+		if (bct_size < 0) {
 			printf("Error: Invalid input image file %s\n",
 			context.input_image_filename);
 			goto fail;
diff --git a/src/data_layout.c b/src/data_layout.c
index 5d3fe10..e91d13c 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -1050,11 +1050,11 @@ int get_bct_size_from_image(build_image_context *context)
 
 	fp = fopen(context->input_image_filename, "r");
 	if (!fp)
-		return ENODATA;
+		return -ENODATA;
 
 	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) != NVBOOT_CONFIG_TABLE_SIZE_MAX) {
 		fclose(fp);
-		return ENODATA;
+		return -ENODATA;
 	}
 
 	context->bct = buffer;
-- 
2.6.2
