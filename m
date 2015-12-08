From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v3 1/2] Fix the error reporting of get_bct_size_from_image() and read_bct_file()
Date: Tue,  8 Dec 2015 15:32:12 +0100
Message-ID: <1449585133-9384-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

get_bct_size_from_image() and read_bct_file() should return negative
error codes, so add the missing minus signs. Also fix the return value
check on get_bct_size_from_image(), a negative value indicate an error
not zero.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changelog:
v2: * Fixed the same bug in read_bct_file()
---
 src/cbootimage.c  | 2 +-
 src/data_layout.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index 5d3fe10..460310d 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -792,7 +792,7 @@ read_bct_file(struct build_image_context_rec *context)
 	free(bct_storage);
 
 	if (!data_is_valid_bct(context))
-		return ENODATA;
+		return -ENODATA;
 
 	return err;
 }
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
2.6.3
