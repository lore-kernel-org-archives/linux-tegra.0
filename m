From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2 2/2] Fix image update with image smaller than 10KiB
Date: Mon,  7 Dec 2015 12:52:30 +0100
Message-ID: <1449489150-5732-2-git-send-email-alban.bedel@avionic-design.de>
References: <1449489150-5732-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449489150-5732-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The BCT size check assume a quiet large image, however if the image
doesn't contains a bootloader it won't be that large. Change the size
check to check for the smallest possible BCT size which is currently
the T20 BCT.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
--
Changelog:
v2: * Add a comment to explain the value of NVBOOT_CONFIG_TABLE_SIZE_MIN
---
 src/cbootimage.h  | 14 ++++++++++++++
 src/data_layout.c |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/src/cbootimage.h b/src/cbootimage.h
index 63f0ee9..ba2d997 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -49,6 +49,20 @@
 
 #define MAX_MTS_SIZE (4 * 1024 * 1024)
 
+/* Minimum size to read to at least be able to validate a BCT, it must
+ * include the boot_data_version field with any BCT version while not
+ * beeing larger than the smallest possible BCT. The currently supported
+ * BCT are as follow:
+ *
+ * Chip		Version offset	Total size
+ * T20		32		4080
+ * T30		32		6128
+ * T114		1792		8192
+ * T124		1744		8192
+ * T132		1744		8704
+ * T210		1328		10240
+ */
+#define NVBOOT_CONFIG_TABLE_SIZE_MIN 4080
 #define NVBOOT_CONFIG_TABLE_SIZE_MAX (10 * 1024)
 
 /*
diff --git a/src/data_layout.c b/src/data_layout.c
index 460310d..59b5afd 100644
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
2.6.3
