From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V2 3/5] Add token_supported function
Date: Tue, 8 Apr 2014 22:30:20 +0800
Message-ID: <1396967422-6018-4-git-send-email-pchiu@nvidia.com>
References: <1396967422-6018-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396967422-6018-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
 src/parse.h              |  8 ++++++++
 src/t114/nvbctlib_t114.c | 27 +++++++++++++++++++++++++++
 src/t124/nvbctlib_t124.c | 27 +++++++++++++++++++++++++++
 src/t20/nvbctlib_t20.c   | 27 +++++++++++++++++++++++++++
 src/t30/nvbctlib_t30.c   | 27 +++++++++++++++++++++++++++
 6 files changed, 119 insertions(+)

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
index 29878c1..56051d2 100644
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
+	for (index = 0; index < sizeof(t114_root_token_list)/sizeof(t114_root_token_list[0]); index++)
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
index ec5c3a2..b1ec445 100644
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
+	for (index = 0; index < sizeof(t124_root_token_list)/sizeof(t124_root_token_list[0]); index++)
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
index 91fe9e6..2f54173 100644
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
+	for (index = 0; index < sizeof(t20_root_token_list)/sizeof(t20_root_token_list[0]); index++)
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
index a84b7c7..e0a7d0d 100644
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
+	for (index = 0; index < sizeof(t30_root_token_list)/sizeof(t30_root_token_list[0]); index++)
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
