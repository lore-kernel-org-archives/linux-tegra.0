From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [cbootimage PATCH 2/3] Fix image update with image smaller than 10KiB
Date: Thu,  5 Nov 2015 17:03:21 +0100
Message-ID: <1446739402-14238-3-git-send-email-alban.bedel@avionic-design.de>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446739402-14238-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The BCT size check assume a quiet large image, however if the image
doesn't contains a bootloader it won't be that large. Change the size
check to check for the smallest possible BCT size which is currently
the T20 BCT.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 src/cbootimage.h  | 1 +
 src/data_layout.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/cbootimage.h b/src/cbootimage.h
index 63f0ee9..b94ed52 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -49,6 +49,7 @@
 
 #define MAX_MTS_SIZE (4 * 1024 * 1024)
 
+#define NVBOOT_CONFIG_TABLE_SIZE_MIN 4080
 #define NVBOOT_CONFIG_TABLE_SIZE_MAX (10 * 1024)
 
 /*
diff --git a/src/data_layout.c b/src/data_layout.c
index e91d13c..8ac7ddf 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -1052,7 +1052,7 @@ int get_bct_size_from_image(build_image_context *context)
 	if (!fp)
 		return -ENODATA;
 
-	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) != NVBOOT_CONFIG_TABLE_SIZE_MAX) {
+	if (fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp) < NVBOOT_CONFIG_TABLE_SIZE_MIN) {
 		fclose(fp);
 		return -ENODATA;
 	}
-- 
2.6.2
