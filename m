From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V3 5/7] Use block_size and page_size tokens when dump BCT data
Date: Fri, 11 Apr 2014 17:50:41 +0800
Message-ID: <1397209843-31275-6-git-send-email-pchiu@nvidia.com>
References: <1397209843-31275-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397209843-31275-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Change to use block_size and page_size tokens instead of
block_size_log2 and page_size_log2 tokens when dump BCT
data.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c           |  7 ++-----
 src/t114/nvbctlib_t114.c | 16 ++++++++++++++--
 src/t124/nvbctlib_t124.c | 16 ++++++++++++++--
 src/t20/nvbctlib_t20.c   | 16 ++++++++++++++--
 src/t30/nvbctlib_t30.c   | 16 ++++++++++++++--
 5 files changed, 58 insertions(+), 13 deletions(-)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index a8e3479..40ab3b4 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -40,8 +40,8 @@ typedef struct {
 
 static value_data const values[] = {
 	{ token_boot_data_version,   "Version       = ", format_u32_hex8 },
-	{ token_block_size_log2,     "BlockSize     = ", format_u32_hex8 },
-	{ token_page_size_log2,      "PageSize      = ", format_u32_hex8 },
+	{ token_block_size,          "BlockSize     = ", format_u32_hex8 },
+	{ token_page_size,           "PageSize      = ", format_u32_hex8 },
 	{ token_partition_size,      "PartitionSize = ", format_u32_hex8 },
 	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
 	{ token_bootloader_used,     "# Bootloader used       = ", format_u32 },
@@ -180,9 +180,6 @@ int main(int argc, char *argv[])
 
 		if (e != 0)
 			data = -1;
-		else if (values[i].id == token_block_size_log2 ||
-			 values[i].id == token_page_size_log2)
-			data = 1 << data;
 
 		values[i].format(values[i].message, &data);
 	}
diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c
index 2f45cc1..5b1f28b 100644
--- a/src/t114/nvbctlib_t114.c
+++ b/src/t114/nvbctlib_t114.c
@@ -98,8 +98,8 @@ default :                                           \
 
 parse_token t114_root_token_list[] = {
 	token_boot_data_version,
-	token_block_size_log2,
-	token_page_size_log2,
+	token_block_size,
+	token_page_size,
 	token_partition_size,
 	token_odm_data,
 	token_bootloader_used,
@@ -941,6 +941,18 @@ t114_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 	CASE_GET_NVU32(bootloader_used);
 	CASE_GET_NVU32(odm_data);
 
+	case token_block_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->block_size_log2;
+		break;
+
+	case token_page_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->page_size_log2;
+		break;
+
 	/*
 	 * Constants.
 	 */
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index d44f3df..ad0c365 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -101,8 +101,8 @@ default :                                           \
 
 parse_token t124_root_token_list[] = {
 	token_boot_data_version,
-	token_block_size_log2,
-	token_page_size_log2,
+	token_block_size,
+	token_page_size,
 	token_partition_size,
 	token_odm_data,
 	token_bootloader_used,
@@ -942,6 +942,18 @@ t124_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 	CASE_GET_NVU32(bootloader_used);
 	CASE_GET_NVU32(odm_data);
 
+	case token_block_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->block_size_log2;
+		break;
+
+	case token_page_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->page_size_log2;
+		break;
+
 	/*
 	 * Constants.
 	 */
diff --git a/src/t20/nvbctlib_t20.c b/src/t20/nvbctlib_t20.c
index 6576011..30a95a3 100644
--- a/src/t20/nvbctlib_t20.c
+++ b/src/t20/nvbctlib_t20.c
@@ -98,8 +98,8 @@ default :                                                 \
 
 parse_token t20_root_token_list[] = {
 	token_boot_data_version,
-	token_block_size_log2,
-	token_page_size_log2,
+	token_block_size,
+	token_page_size,
 	token_partition_size,
 	token_odm_data,
 	token_bootloader_used,
@@ -530,6 +530,18 @@ t20_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 	CASE_GET_NVU32(bootloader_used);
 	CASE_GET_NVU32(odm_data);
 
+	case token_block_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->block_size_log2;
+		break;
+
+	case token_page_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->page_size_log2;
+		break;
+
 	/*
 	 * Constants.
 	 */
diff --git a/src/t30/nvbctlib_t30.c b/src/t30/nvbctlib_t30.c
index 8c72d69..1e9697b 100644
--- a/src/t30/nvbctlib_t30.c
+++ b/src/t30/nvbctlib_t30.c
@@ -98,8 +98,8 @@ default :                                           \
 
 parse_token t30_root_token_list[] = {
 	token_boot_data_version,
-	token_block_size_log2,
-	token_page_size_log2,
+	token_block_size,
+	token_page_size,
 	token_partition_size,
 	token_odm_data,
 	token_bootloader_used,
@@ -737,6 +737,18 @@ t30_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 	CASE_GET_NVU32(bootloader_used);
 	CASE_GET_NVU32(odm_data);
 
+	case token_block_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->block_size_log2;
+		break;
+
+	case token_page_size:
+		if (bct == NULL)
+			return -ENODATA;
+		*((u_int32_t *)data) = 1 << bct_ptr->page_size_log2;
+		break;
+
 	/*
 	 * Constants.
 	 */
-- 
1.9.1
