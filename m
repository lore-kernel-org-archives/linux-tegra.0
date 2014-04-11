From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V3 3/7] Accept void pointer as input data type for get/set_value functions
Date: Fri, 11 Apr 2014 17:50:39 +0800
Message-ID: <1397209843-31275-4-git-send-email-pchiu@nvidia.com>
References: <1397209843-31275-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397209843-31275-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This change uses void * as input data type for
cbootimage_soc_config.get/set_value and context_set_value functions.
This makes the functions can accept various data types based on
different tokens.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/context.c            | 10 +++++++---
 src/data_layout.c        |  8 +++++---
 src/parse.c              |  2 +-
 src/parse.h              |  6 +++---
 src/set.c                | 34 +++++++++++++++++-----------------
 src/set.h                |  2 +-
 src/t114/nvbctlib_t114.c | 20 ++++++++++----------
 src/t124/nvbctlib_t124.c | 22 +++++++++++-----------
 src/t20/nvbctlib_t20.c   | 20 ++++++++++----------
 src/t30/nvbctlib_t30.c   | 20 ++++++++++----------
 10 files changed, 75 insertions(+), 69 deletions(-)

diff --git a/src/context.c b/src/context.c
index 25b322f..f485334 100644
--- a/src/context.c
+++ b/src/context.c
@@ -31,12 +31,16 @@ cleanup_context(build_image_context *context)
 int
 init_context(build_image_context *context)
 {
+	u_int32_t value;
+
 	/* Set defaults */
 	context->memory = new_block_list();
 	context->next_bct_blk = 0; /* Default to block 0 */
-	context_set_value(context, token_redundancy, 1);
-	context_set_value(context, token_version, 1);
-	context_set_value(context, token_bct_copy, 2);
+	value = 1;
+	context_set_value(context, token_redundancy, &value);
+	context_set_value(context, token_version, &value);
+	value = 2;
+	context_set_value(context, token_bct_copy, &value);
 
 	return 0;
 }
diff --git a/src/data_layout.c b/src/data_layout.c
index ba3361a..0a64ec2 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -366,6 +366,7 @@ write_bootloaders(build_image_context *context)
 	u_int32_t current_blk;
 	u_int32_t current_page;
 	u_int32_t  pages_in_bl;
+	u_int32_t bootloader_used;
 	u_int8_t  *bl_storage; /* Holds the Bl after reading */
 	u_int8_t  *buffer;	/* Holds the Bl for writing */
 	u_int8_t  *src;	/* Scans through the Bl during writing */
@@ -554,8 +555,9 @@ write_bootloaders(build_image_context *context)
 		free(buffer);
 	}
 
+	bootloader_used = context->redundancy + bl_move_count;
 	g_soc_config->set_value(token_bootloader_used,
-			context->redundancy + bl_move_count,
+			&bootloader_used,
 			context->bct);
 
 	if (enable_debug) {
@@ -752,7 +754,7 @@ begin_update(build_image_context *context)
 	}
 
 	g_soc_config->set_value(token_boot_data_version,
-			context->boot_data_version, context->bct);
+			&(context->boot_data_version), context->bct);
 	g_soc_config->get_value(token_hash_size,
 			&hash_size, context->bct);
 	g_soc_config->get_value(token_reserved_size,
@@ -761,7 +763,7 @@ begin_update(build_image_context *context)
 			&reserved_offset, context->bct);
 	/* Set the odm data */
 	g_soc_config->set_value(token_odm_data,
-			context->odm_data, context->bct);
+			&(context->odm_data), context->bct);
 
 	/* Initialize the bad block table field. */
 	g_soc_config->init_bad_block_table(context);
diff --git a/src/parse.c b/src/parse.c
index 464ee8f..f82c008 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -482,7 +482,7 @@ static int parse_value_u32(build_image_context *context,
 	if (rest == NULL)
 		return 1;
 
-	return context_set_value(context, token, value);
+	return context_set_value(context, token, &value);
 }
 
 /*
diff --git a/src/parse.h b/src/parse.h
index 80f42c4..18c2a87 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -717,12 +717,12 @@ typedef struct cbootimage_soc_config_rec {
 	 * Set the specified bct value stored in context bct data structure.
 	 *
 	 * @param id  	The parse token value
-	 * @param data	Value to set
+	 * @param data	Pointer of value to set
 	 * @param bct 	Bct pointer
 	 * @return 0 and -ENODATA for success and failure
 	 */
 	int (*set_value)(parse_token id,
-			u_int32_t  data,
+			void *data,
 			u_int8_t *bct);
 	/*
 	 * Get the specified bct value or some constant value of clocks and
@@ -734,7 +734,7 @@ typedef struct cbootimage_soc_config_rec {
 	 * @return 0 and -ENODATA for success and failure
 	 */
 	int (*get_value)(parse_token id,
-			u_int32_t *data,
+			void *data,
 			u_int8_t *bct);
 	/*
 	 * Set the bct crypto hash data.
diff --git a/src/set.c b/src/set.c
index b2872a6..a092014 100644
--- a/src/set.c
+++ b/src/set.c
@@ -122,37 +122,37 @@ set_bootloader(build_image_context	*context,
  *
  * @param context	The main context pointer
  * @param token  	The parse token value
- * @param value  	The value to set
+ * @param value  	The pointer of value to set
  * @return 0 for success
  */
 int context_set_value(build_image_context *context,
 		parse_token token,
-		u_int32_t value)
+		void *value)
 {
 	assert(context != NULL);
 
 	switch (token) {
 	case token_attribute:
-		context->newbl_attr = value;
+		context->newbl_attr = *((u_int32_t *)value);
 		break;
 
 	case token_block_size:
-		context->block_size = value;
-		context->block_size_log2 = log2(value);
+		context->block_size = *((u_int32_t *)value);
+		context->block_size_log2 = log2(*((u_int32_t *)value));
 
 		if (context->memory != NULL) {
 			printf("Error: Too late to change block size.\n");
 			return 1;
 		}
 
-		if (value != (u_int32_t)(1 << context->block_size_log2)) {
+		if (context->block_size != (u_int32_t)(1 << context->block_size_log2)) {
 			printf("Error: Block size must be a power of 2.\n");
 			return 1;
 		}
 		context->pages_per_blk= 1 << (context->block_size_log2- 
 				context->page_size_log2);
 		g_soc_config->set_value(token_block_size_log2,
-			context->block_size_log2, context->bct);
+			&(context->block_size_log2), context->bct);
 		break;
 
 	case token_partition_size:
@@ -161,16 +161,16 @@ int context_set_value(build_image_context *context,
 			return 1;
 		}
 
-		context->partition_size= value;
+		context->partition_size= *((u_int32_t *)value);
 		g_soc_config->set_value(token_partition_size,
 			value, context->bct);
 		break;
 
 	case token_page_size:
-		context->page_size = value;
-		context->page_size_log2 = log2(value);
+		context->page_size = *((u_int32_t *)value);
+		context->page_size_log2 = log2(*((u_int32_t *)value));
 
-		if (value != (u_int32_t)(1 << context->page_size_log2)) {
+		if (context->page_size != (u_int32_t)(1 << context->page_size_log2)) {
 			printf("Error: Page size must be a power of 2.\n");
 			return 1;
 		}
@@ -178,22 +178,22 @@ int context_set_value(build_image_context *context,
 			context->page_size_log2);
 
 		g_soc_config->set_value(token_page_size_log2,
-			context->page_size_log2, context->bct);
+			&(context->page_size_log2), context->bct);
 		break;
 	case token_redundancy:
-		context->redundancy = value;
+		context->redundancy = *((u_int32_t *)value);
 		break;
 
 	case token_version:
-		context->version = value;
+		context->version = *((u_int32_t *)value);
 		break;
 
 	case token_bct_copy:
-		context->bct_copy = value;
+		context->bct_copy = *((u_int32_t *)value);
 		break;
 
 	case token_odm_data:
-		context->odm_data = value;
+		context->odm_data = *((u_int32_t *)value);
 		break;
 
 	case token_pre_bct_pad_blocks:
@@ -201,7 +201,7 @@ int context_set_value(build_image_context *context,
 			printf("Error: Too late to pre-BCT pad.\n");
 			return 1;
 		}
-		context->pre_bct_pad_blocks = value;
+		context->pre_bct_pad_blocks = *((u_int32_t *)value);
 		break;
 
 	DEFAULT();
diff --git a/src/set.h b/src/set.h
index 1515fcd..754ed7a 100644
--- a/src/set.h
+++ b/src/set.h
@@ -38,7 +38,7 @@ set_bootloader(build_image_context	*context,
 int
 context_set_value(build_image_context	*context,
 		parse_token	token,
-		u_int32_t	value);
+		void		*value);
 
 int
 read_from_image(char *filename,
diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c
index f7e449a..29878c1 100644
--- a/src/t114/nvbctlib_t114.c
+++ b/src/t114/nvbctlib_t114.c
@@ -59,22 +59,22 @@ case token_bl_##x:\
 #define CASE_GET_NVU32(id) \
 case token_##id:\
 	if (bct == NULL) return -ENODATA; \
-	*data = bct_ptr->id; \
+	*((u_int32_t *)data) = bct_ptr->id; \
 	break
 
 #define CASE_GET_CONST(id, val) \
 case token_##id:\
-	*data = val; \
+	*((u_int32_t *)data) = val; \
 	break
 
 #define CASE_GET_CONST_PREFIX(id, val_prefix) \
 case token_##id:\
-	*data = val_prefix##_##id; \
+	*((u_int32_t *)data) = val_prefix##_##id; \
 	break
 
 #define CASE_SET_NVU32(id) \
 case token_##id:\
-	bct_ptr->id = data; \
+	bct_ptr->id = *((u_int32_t *)data); \
 	break
 
 #define CASE_GET_DATA(id, size) \
@@ -901,7 +901,7 @@ t114_setbl_param(u_int32_t set,
 }
 
 int
-t114_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
+t114_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
 	nvboot_config_table  samplebct; /* Used for computing offsets. */
@@ -940,25 +940,25 @@ t114_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 		break;
 
 	case token_reserved_offset:
-		*data = (u_int8_t *)&(samplebct.reserved)
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
 		break;
 
 	case token_bct_size:
-		*data = sizeof(nvboot_config_table);
+		*((u_int32_t *)data) = sizeof(nvboot_config_table);
 		break;
 
 	CASE_GET_CONST(hash_size, sizeof(nvboot_hash));
 
 	case token_crypto_offset:
 		/* Offset to region in BCT to encrypt & sign */
-		*data = (u_int8_t *)&(samplebct.random_aes_blk)
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.random_aes_blk)
 				- (u_int8_t *)&samplebct;
 		break;
 
 	case token_crypto_length:
 		/* size of region in BCT to encrypt & sign */
-		*data = (u_int8_t *)bct_ptr + sizeof(nvboot_config_table)
+		*((u_int32_t *)data) = (u_int8_t *)bct_ptr + sizeof(nvboot_config_table)
 				- (u_int8_t *)&(bct_ptr->random_aes_blk);
 		break;
 
@@ -985,7 +985,7 @@ t114_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 }
 
 int
-t114_bct_set_value(parse_token id, u_int32_t data, u_int8_t *bct)
+t114_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
 
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index 27e5a62..ec5c3a2 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -60,22 +60,22 @@ case token_bl_##x:\
 case token_##id:\
 	if (bct == NULL) \
 		return -ENODATA; \
-	*data = bct_ptr->id; \
+	*((u_int32_t *)data) = bct_ptr->id; \
 	break
 
 #define CASE_GET_CONST(id, val) \
 case token_##id:\
-	*data = val; \
+	*((u_int32_t *)data) = val; \
 	break
 
 #define CASE_GET_CONST_PREFIX(id, val_prefix) \
 case token_##id:\
-	*data = val_prefix##_##id; \
+	*((u_int32_t *)data) = val_prefix##_##id; \
 	break
 
 #define CASE_SET_NVU32(id) \
 case token_##id:\
-	bct_ptr->id = data; \
+	bct_ptr->id = *((u_int32_t *)data); \
 	break
 
 #define CASE_GET_DATA(id, size) \
@@ -902,7 +902,7 @@ t124_setbl_param(u_int32_t set,
 }
 
 int
-t124_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
+t124_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
 	nvboot_config_table  samplebct; /* Used for computing offsets. */
@@ -941,25 +941,25 @@ t124_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 		break;
 
 	case token_reserved_offset:
-		*data = (u_int8_t *)&(samplebct.reserved)
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
 		break;
 
 	case token_bct_size:
-		*data = sizeof(nvboot_config_table);
+		*((u_int32_t *)data) = sizeof(nvboot_config_table);
 		break;
 
 	CASE_GET_CONST(hash_size, sizeof(nvboot_hash));
 
 	case token_crypto_offset:
 		/* Offset to region in BCT to encrypt & sign */
-		*data = (u_int8_t *)&(samplebct.random_aes_blk)
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.random_aes_blk)
 				- (u_int8_t *)&samplebct;
 		break;
 
 	case token_crypto_length:
 		/* size of region in BCT to encrypt & sign */
-		*data = (u_int8_t *)bct_ptr + sizeof(nvboot_config_table)
+		*((u_int32_t *)data) = (u_int8_t *)bct_ptr + sizeof(nvboot_config_table)
 				- (u_int8_t *)&(bct_ptr->random_aes_blk);
 		break;
 
@@ -986,11 +986,11 @@ t124_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 }
 
 int
-t124_bct_set_value(parse_token id, u_int32_t data, u_int8_t *bct)
+t124_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
 
-	if (bct == NULL)
+	if (data == NULL || bct == NULL)
 		return -ENODATA;
 
 	switch (id) {
diff --git a/src/t20/nvbctlib_t20.c b/src/t20/nvbctlib_t20.c
index c145d6d..91fe9e6 100644
--- a/src/t20/nvbctlib_t20.c
+++ b/src/t20/nvbctlib_t20.c
@@ -59,22 +59,22 @@ case token_bl_##x:\
 #define CASE_GET_NVU32(id) \
 case token_##id:\
 	if (bct == NULL) return -ENODATA; \
-	*data = bct_ptr->id; \
+	*((u_int32_t *)data) = bct_ptr->id; \
 	break
 
 #define CASE_GET_CONST(id, val) \
 case token_##id:\
-	*data = val; \
+	*((u_int32_t *)data) = val; \
 	break
 
 #define CASE_GET_CONST_PREFIX(id, val_prefix) \
 case token_##id:\
-	*data = val_prefix##_##id; \
+	*((u_int32_t *)data) = val_prefix##_##id; \
 	break
 
 #define CASE_SET_NVU32(id) \
 case token_##id:\
-	bct_ptr->id = data; \
+	bct_ptr->id = *((u_int32_t *)data); \
 	break
 
 #define CASE_GET_DATA(id, size) \
@@ -490,7 +490,7 @@ t20_setbl_param(u_int32_t set,
 }
 
 int
-t20_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
+t20_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
 	nvboot_config_table  samplebct; /* Used for computing offsets. */
@@ -523,25 +523,25 @@ t20_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 	CASE_GET_CONST(reserved_size,     NVBOOT_BCT_RESERVED_SIZE);
 
 	case token_reserved_offset:
-		*data = (u_int8_t *)&(samplebct.reserved)
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
 		break;
 
 	case token_bct_size:
-		*data = sizeof(nvboot_config_table);
+		*((u_int32_t *)data) = sizeof(nvboot_config_table);
 		break;
 
 	CASE_GET_CONST(hash_size, sizeof(nvboot_hash));
 
 	case token_crypto_offset:
 		/* Offset to region in BCT to encrypt & sign */
-		*data = (u_int8_t *)&(samplebct.random_aes_blk)
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.random_aes_blk)
 				- (u_int8_t *)&samplebct;
 		break;
 
 	case token_crypto_length:
 		/* size   of region in BCT to encrypt & sign */
-		*data = sizeof(nvboot_config_table) - sizeof(nvboot_hash);
+		*((u_int32_t *)data) = sizeof(nvboot_config_table) - sizeof(nvboot_hash);
 	break;
 
 	CASE_GET_CONST(max_bct_search_blks, NVBOOT_MAX_BCT_SEARCH_BLOCKS);
@@ -569,7 +569,7 @@ t20_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 }
 
 int
-t20_bct_set_value(parse_token id, u_int32_t  data, u_int8_t *bct)
+t20_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
 
diff --git a/src/t30/nvbctlib_t30.c b/src/t30/nvbctlib_t30.c
index 59b0246..a84b7c7 100644
--- a/src/t30/nvbctlib_t30.c
+++ b/src/t30/nvbctlib_t30.c
@@ -59,22 +59,22 @@ case token_bl_##x:\
 #define CASE_GET_NVU32(id) \
 case token_##id:\
 	if (bct == NULL) return -ENODATA; \
-	*data = bct_ptr->id; \
+	*((u_int32_t *)data) = bct_ptr->id; \
 	break
 
 #define CASE_GET_CONST(id, val) \
 case token_##id:\
-	*data = val; \
+	*((u_int32_t *)data) = val; \
 	break
 
 #define CASE_GET_CONST_PREFIX(id, val_prefix) \
 case token_##id:\
-	*data = val_prefix##_##id; \
+	*((u_int32_t *)data) = val_prefix##_##id; \
 	break
 
 #define CASE_SET_NVU32(id) \
 case token_##id:\
-	bct_ptr->id = data; \
+	bct_ptr->id = *((u_int32_t *)data); \
 	break
 
 #define CASE_GET_DATA(id, size) \
@@ -697,7 +697,7 @@ t30_setbl_param(u_int32_t set,
 }
 
 int
-t30_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
+t30_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
 	nvboot_config_table  samplebct; /* Used for computing offsets. */
@@ -730,25 +730,25 @@ t30_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 	CASE_GET_CONST(reserved_size,     NVBOOT_BCT_RESERVED_SIZE);
 
 	case token_reserved_offset:
-		*data = (u_int8_t *)&(samplebct.reserved)
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
 		break;
 
 	case token_bct_size:
-		*data = sizeof(nvboot_config_table);
+		*((u_int32_t *)data) = sizeof(nvboot_config_table);
 		break;
 
 	CASE_GET_CONST(hash_size, sizeof(nvboot_hash));
 
 	case token_crypto_offset:
 		/* Offset to region in BCT to encrypt & sign */
-		*data = (u_int8_t *)&(samplebct.random_aes_blk)
+		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.random_aes_blk)
 				- (u_int8_t *)&samplebct;
 		break;
 
 	case token_crypto_length:
 		/* size   of region in BCT to encrypt & sign */
-		*data = sizeof(nvboot_config_table) - sizeof(nvboot_hash);
+		*((u_int32_t *)data) = sizeof(nvboot_config_table) - sizeof(nvboot_hash);
 	break;
 
 	CASE_GET_CONST(max_bct_search_blks, NVBOOT_MAX_BCT_SEARCH_BLOCKS);
@@ -776,7 +776,7 @@ t30_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 }
 
 int
-t30_bct_set_value(parse_token id, u_int32_t  data, u_int8_t *bct)
+t30_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
 
-- 
1.9.1
