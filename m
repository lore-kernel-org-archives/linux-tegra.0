From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V3 4/7] Add token_supported function
Date: Fri, 11 Apr 2014 17:50:40 +0800
Message-ID: <1397209843-31275-5-git-send-email-pchiu@nvidia.com>
References: <1397209843-31275-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397209843-31275-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a function called token_supported in cbootimage_soc_config.
It is used to check if the input token is supported in specific
tegra soc.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c           |  3 +++
 src/cbootimage.h         |  1 +
 src/parse.h              |  8 ++++++++
 src/t114/nvbctlib_t114.c | 27 +++++++++++++++++++++++++++
 src/t124/nvbctlib_t124.c | 27 +++++++++++++++++++++++++++
 src/t20/nvbctlib_t20.c   | 27 +++++++++++++++++++++++++++
 src/t30/nvbctlib_t30.c   | 27 +++++++++++++++++++++++++++
 7 files changed, 120 insertions(+)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index 6d99214..a8e3479 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -171,6 +171,9 @@ int main(int argc, char *argv[])
 
 	/* Display root values */
 	for (i = 0; i < sizeof(values) / sizeof(values[0]); ++i) {
+		if (!g_soc_config->token_supported(values[i].id))
+			continue;
+
 		e = g_soc_config->get_value(values[i].id,
 						&data,
 						context.bct);
diff --git a/src/cbootimage.h b/src/cbootimage.h
index 46e3b8b..8e9253c 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -38,6 +38,7 @@
 #define NVBOOT_BOOTDATA_VERSION(a, b) ((((a)&0xffff) << 16) | ((b)&0xffff))
 #define NVBOOT_BAD_BLOCK_TABLE_SIZE 4096
 #define NV_MAX(a, b) (((a) > (b)) ? (a) : (b))
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
 
 #define BOOTDATA_VERSION_T20		NVBOOT_BOOTDATA_VERSION(0x2, 0x1)
 #define BOOTDATA_VERSION_T30		NVBOOT_BOOTDATA_VERSION(0x3, 0x1)
diff --git a/src/parse.h b/src/parse.h
index 18c2a87..d9d873f 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -750,6 +750,14 @@ typedef struct cbootimage_soc_config_rec {
 			u_int32_t  length,
 			u_int8_t *bct);
 
+	/*
+	 * Check if the token is supported to dump
+	 *
+	 * @param id  	The parse token value
+	 * @return 0 and 1 for unsupported and supported
+	 */
+	int (*token_supported)(parse_token id);
+
 	void (*init_bad_block_table)(build_image_context *context);
 
 	enum_item *devtype_table;
diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c
index 29878c1..2f45cc1 100644
--- a/src/t114/nvbctlib_t114.c
+++ b/src/t114/nvbctlib_t114.c
@@ -96,6 +96,21 @@ default :                                           \
 		token, __LINE__);                   \
 	return 1
 
+parse_token t114_root_token_list[] = {
+	token_boot_data_version,
+	token_block_size_log2,
+	token_page_size_log2,
+	token_partition_size,
+	token_odm_data,
+	token_bootloader_used,
+	token_bootloaders_max,
+	token_bct_size,
+	token_hash_size,
+	token_crypto_offset,
+	token_crypto_length,
+	token_max_bct_search_blks
+};
+
 int
 t114_set_dev_param(build_image_context *context,
 	u_int32_t index,
@@ -1037,6 +1052,17 @@ t114_bct_set_data(parse_token id,
 	return 0;
 }
 
+int t114_bct_token_supported(parse_token token)
+{
+	int index;
+
+	for (index = 0; index < ARRAY_SIZE(t114_root_token_list); index++)
+		if (t114_root_token_list[index] == token)
+			return 1;
+
+	return 0;
+}
+
 void t114_init_bad_block_table(build_image_context *context)
 {
 	u_int32_t bytes_per_entry;
@@ -1070,6 +1096,7 @@ cbootimage_soc_config tegra114_config = {
 	.set_value					= t114_bct_set_value,
 	.get_value					= t114_bct_get_value,
 	.set_data					= t114_bct_set_data,
+	.token_supported			= t114_bct_token_supported,
 
 	.devtype_table				= s_devtype_table_t114,
 	.sdmmc_data_width_table		= s_sdmmc_data_width_table_t114,
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index ec5c3a2..d44f3df 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -99,6 +99,21 @@ default :                                           \
 		token, __LINE__);                   \
 	return 1
 
+parse_token t124_root_token_list[] = {
+	token_boot_data_version,
+	token_block_size_log2,
+	token_page_size_log2,
+	token_partition_size,
+	token_odm_data,
+	token_bootloader_used,
+	token_bootloaders_max,
+	token_bct_size,
+	token_hash_size,
+	token_crypto_offset,
+	token_crypto_length,
+	token_max_bct_search_blks
+};
+
 int
 t124_set_dev_param(build_image_context *context,
 	u_int32_t index,
@@ -1039,6 +1054,17 @@ t124_bct_set_data(parse_token id,
 	return 0;
 }
 
+int t124_bct_token_supported(parse_token token)
+{
+	int index;
+
+	for (index = 0; index < ARRAY_SIZE(t124_root_token_list); index++)
+		if (t124_root_token_list[index] == token)
+			return 1;
+
+	return 0;
+}
+
 void t124_init_bad_block_table(build_image_context *context)
 {
 	u_int32_t bytes_per_entry;
@@ -1072,6 +1098,7 @@ cbootimage_soc_config tegra124_config = {
 	.set_value					= t124_bct_set_value,
 	.get_value					= t124_bct_get_value,
 	.set_data					= t124_bct_set_data,
+	.token_supported			= t124_bct_token_supported,
 
 	.devtype_table				= s_devtype_table_t124,
 	.sdmmc_data_width_table		= s_sdmmc_data_width_table_t124,
diff --git a/src/t20/nvbctlib_t20.c b/src/t20/nvbctlib_t20.c
index 91fe9e6..6576011 100644
--- a/src/t20/nvbctlib_t20.c
+++ b/src/t20/nvbctlib_t20.c
@@ -96,6 +96,21 @@ default :                                                 \
 		token, __LINE__);                         \
 	return 1
 
+parse_token t20_root_token_list[] = {
+	token_boot_data_version,
+	token_block_size_log2,
+	token_page_size_log2,
+	token_partition_size,
+	token_odm_data,
+	token_bootloader_used,
+	token_bootloaders_max,
+	token_bct_size,
+	token_hash_size,
+	token_crypto_offset,
+	token_crypto_length,
+	token_max_bct_search_blks
+};
+
 int
 t20_set_dev_param(build_image_context *context,
 	u_int32_t index,
@@ -618,6 +633,17 @@ t20_bct_set_data(parse_token id,
 	return 0;
 }
 
+int t20_bct_token_supported(parse_token token)
+{
+	int index;
+
+	for (index = 0; index < ARRAY_SIZE(t20_root_token_list); index++)
+		if (t20_root_token_list[index] == token)
+			return 1;
+
+	return 0;
+}
+
 void t20_init_bad_block_table(build_image_context *context)
 {
 	u_int32_t bytes_per_entry;
@@ -651,6 +677,7 @@ cbootimage_soc_config tegra20_config = {
 	.set_value					= t20_bct_set_value,
 	.get_value					= t20_bct_get_value,
 	.set_data					= t20_bct_set_data,
+	.token_supported			= t20_bct_token_supported,
 
 	.devtype_table				= s_devtype_table_t20,
 	.sdmmc_data_width_table		= s_sdmmc_data_width_table_t20,
diff --git a/src/t30/nvbctlib_t30.c b/src/t30/nvbctlib_t30.c
index a84b7c7..8c72d69 100644
--- a/src/t30/nvbctlib_t30.c
+++ b/src/t30/nvbctlib_t30.c
@@ -96,6 +96,21 @@ default :                                           \
 		token, __LINE__);                   \
 	return 1
 
+parse_token t30_root_token_list[] = {
+	token_boot_data_version,
+	token_block_size_log2,
+	token_page_size_log2,
+	token_partition_size,
+	token_odm_data,
+	token_bootloader_used,
+	token_bootloaders_max,
+	token_bct_size,
+	token_hash_size,
+	token_crypto_offset,
+	token_crypto_length,
+	token_max_bct_search_blks
+};
+
 int
 t30_set_dev_param(build_image_context *context,
 	u_int32_t index,
@@ -825,6 +840,17 @@ t30_bct_set_data(parse_token id,
 	return 0;
 }
 
+int t30_bct_token_supported(parse_token token)
+{
+	int index;
+
+	for (index = 0; index < ARRAY_SIZE(t30_root_token_list); index++)
+		if (t30_root_token_list[index] == token)
+			return 1;
+
+	return 0;
+}
+
 void t30_init_bad_block_table(build_image_context *context)
 {
 	u_int32_t bytes_per_entry;
@@ -858,6 +884,7 @@ cbootimage_soc_config tegra30_config = {
 	.set_value					= t30_bct_set_value,
 	.get_value					= t30_bct_get_value,
 	.set_data					= t30_bct_set_data,
+	.token_supported			= t30_bct_token_supported,
 
 	.devtype_table				= s_devtype_table_t30,
 	.sdmmc_data_width_table		= s_sdmmc_data_width_table_t30,
-- 
1.9.1
