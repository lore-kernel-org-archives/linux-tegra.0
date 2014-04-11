From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V3 6/7] Add Tegra124 bct data access for jtag control and chip uid
Date: Fri, 11 Apr 2014 17:50:42 +0800
Message-ID: <1397209843-31275-7-git-send-email-pchiu@nvidia.com>
References: <1397209843-31275-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397209843-31275-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for read secure_jtag_control and unique_chip_id from
cfg file and write them into BCT structure, and bct_dump can also
parse the two fields and show the data.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c           | 48 +++++++++++++++++++++---------
 src/cbootimage.h         |  2 ++
 src/parse.c              | 76 ++++++++++++++++++++++++++++++++++++++++++++++++
 src/parse.h              |  2 ++
 src/set.c                | 12 ++++++++
 src/t124/nvbctlib_t124.c | 13 ++++++++-
 6 files changed, 138 insertions(+), 15 deletions(-)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index 40ab3b4..6735c35 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -29,6 +29,7 @@ cbootimage_soc_config * g_soc_config;
 
 static void format_u32_hex8(char const * message, void * data);
 static void format_u32(char const * message, void * data);
+static void format_chipuid(char const * message, void * data);
 
 typedef void (*format_function)(char const * message, void * data);
 
@@ -38,12 +39,21 @@ typedef struct {
 	format_function format;
 } value_data;
 
+typedef union {
+	u_int32_t val;
+	u_int8_t uid[16];
+} param_types;
+
+#define MAX_PARAM_SIZE sizeof(param_types)
+
 static value_data const values[] = {
 	{ token_boot_data_version,   "Version       = ", format_u32_hex8 },
 	{ token_block_size,          "BlockSize     = ", format_u32_hex8 },
 	{ token_page_size,           "PageSize      = ", format_u32_hex8 },
 	{ token_partition_size,      "PartitionSize = ", format_u32_hex8 },
 	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
+	{ token_secure_jtag_control, "JtagCtrl      = ", format_u32_hex8 },
+	{ token_unique_chip_id,      "ChipUid       = ", format_chipuid },
 	{ token_bootloader_used,     "# Bootloader used       = ", format_u32 },
 	{ token_bootloaders_max,     "# Bootloaders max       = ", format_u32 },
 	{ token_bct_size,            "# BCT size              = ", format_u32 },
@@ -74,6 +84,19 @@ static void format_u32(char const * message, void * data)
 	printf("%s%d;\n", message, *((u_int32_t *) data));
 }
 
+static void format_chipuid(char const * message, void * data)
+{
+	u_int8_t *uid = (u_int8_t *)data;
+	int byte_index;
+	char uid_str[35] = "0x";
+	char *s = &uid_str[2];
+
+	for (byte_index = 15; byte_index >= 0; byte_index--, s += 2)
+		sprintf(s, "%02x", uid[byte_index]);
+
+	printf("%s%s;\n", message, uid_str);
+}
+
 /*****************************************************************************/
 static void usage(void)
 {
@@ -155,7 +178,7 @@ int main(int argc, char *argv[])
 	u_int32_t parameters_used;
 	u_int32_t sdram_used;
 	nvboot_dev_type type;
-	u_int32_t data;
+	param_types data;
 	int i;
 	int j;
 
@@ -174,12 +197,9 @@ int main(int argc, char *argv[])
 		if (!g_soc_config->token_supported(values[i].id))
 			continue;
 
-		e = g_soc_config->get_value(values[i].id,
-						&data,
-						context.bct);
-
-		if (e != 0)
-			data = -1;
+		e = g_soc_config->get_value(values[i].id, &data, context.bct);
+		if (e)
+			memset(&data, 0, MAX_PARAM_SIZE);
 
 		values[i].format(values[i].message, &data);
 	}
@@ -202,12 +222,12 @@ int main(int argc, char *argv[])
 			for (j = 0; j < bl_count; ++j) {
 				e = g_soc_config->getbl_param(i,
 							       bl_values[j].id,
-							       &data,
+							       &data.val,
 							       context.bct);
 				printf("# Bootloader[%d].", i);
 
-				if (e != 0)
-					data = -1;
+				if (e)
+					data.val = -1;
 
 				bl_values[j].format(bl_values[j].message, &data);
 			}
@@ -264,14 +284,14 @@ int main(int argc, char *argv[])
 			g_soc_config->get_dev_param(&context,
 							i,
 							item->token,
-							&data);
+							&data.val);
 			printf("DeviceParam[%d].%s.%-*s = ",
 			       i, prefix, width, item->name);
 
 			if (e != 0)
 				printf("<ERROR reading parameter (%d)>", e);
 			else
-				display_field_value(&context, item, data);
+				display_field_value(&context, item, data.val);
 
 			printf(";\n");
 		}
@@ -293,13 +313,13 @@ int main(int argc, char *argv[])
 			e = g_soc_config->get_sdram_param(&context,
 								i,
 								item->token,
-								&data);
+								&data.val);
 			printf("SDRAM[%d].%-*s = ", i, width, item->name);
 
 			if (e != 0)
 				printf("<ERROR reading parameter (%d)>", e);
 			else
-				display_field_value(&context, item, data);
+				display_field_value(&context, item, data.val);
 
 			printf(";\n");
 		}
diff --git a/src/cbootimage.h b/src/cbootimage.h
index 8e9253c..ed3b2f9 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -97,6 +97,8 @@ typedef struct build_image_context_rec
 	u_int32_t boot_data_version; /* The boot data version of BCT */
 	u_int8_t bct_init; /* The flag for the memory allocation of bct */
 	u_int32_t odm_data; /* The odm data value */
+	u_int8_t unique_chip_id[16]; /* The unique chip uid */
+	u_int8_t secure_jtag_control; /* The flag for enabling jtag control */
 } build_image_context;
 
 /* Function prototypes */
diff --git a/src/parse.c b/src/parse.c
index f82c008..7ccd594 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -45,6 +45,7 @@ set_array(build_image_context *context,
 			u_int32_t value);
 static char *parse_u32(char *str, u_int32_t *val);
 static char *parse_u8(char *str, u_int32_t *val);
+static char *parse_chipuid(char *str, u_int8_t *val);
 static char *parse_filename(char *str, char *name, int chars_remaining);
 static char *parse_enum(build_image_context *context,
 			char *str,
@@ -64,6 +65,10 @@ parse_bootloader(build_image_context *context, parse_token token, char *rest);
 static int
 parse_value_u32(build_image_context *context, parse_token token, char *rest);
 static int
+parse_value_chipuid(build_image_context *context,
+			parse_token token,
+			char *rest);
+static int
 parse_bct_file(build_image_context *context, parse_token token, char *rest);
 static char
 *parse_end_state(char *str, char *uname, int chars_remaining);
@@ -102,6 +107,8 @@ static parse_item s_top_level_items[] = {
 	{ "Bctcopy=",       token_bct_copy,		parse_value_u32 },
 	{ "Version=",       token_version,		parse_value_u32 },
 	{ "OdmData=",       token_odm_data,		parse_value_u32 },
+	{ "ChipUid=",       token_unique_chip_id,	parse_value_chipuid },
+	{ "JtagCtrl=",	    token_secure_jtag_control,	parse_value_u32 },
 	{ NULL, 0, NULL } /* Must be last */
 };
 
@@ -165,6 +172,51 @@ parse_u8(char *str, u_int32_t *val)
 	return retval;
 }
 
+/*
+ * Parse the given string and transfer to chip uid.
+ *
+ * @param str		String to parse
+ * @param chipuid	Returns chip uid that was parsed
+ * @return the remainder of the string after the number was parsed
+ */
+static char *
+parse_chipuid(char *str, u_int8_t *chipuid)
+{
+	int byte_index = 0;
+	int paddings = 0;
+	char byte_str[3];
+
+	if (*str++ != '0')
+		return NULL;
+
+	if (*str++ != 'x')
+		return NULL;
+
+	paddings = strlen(str) % 2;
+	byte_index = strlen(str) / 2 + paddings;
+
+	if (byte_index > 16)
+		return NULL;
+
+	memset(chipuid, 0, 16);
+
+	while (*str != '\0' && byte_index > 0) {
+		char *endptr;
+
+		strncpy(byte_str, str, 2 - paddings);
+		byte_str[2 - paddings] = '\0';
+		str += 2 - paddings;
+
+		chipuid[byte_index - 1] = strtoul(byte_str, &endptr, 16);
+		if (*endptr)
+			return NULL;
+
+		byte_index--;
+		paddings = 0;
+	}
+
+	return str;
+}
 
 /*
  * Parse the given string and find the file name then
@@ -486,6 +538,30 @@ static int parse_value_u32(build_image_context *context,
 }
 
 /*
+ * General handler for setting chip uid in config files.
+ *
+ * @param context	The main context pointer
+ * @param token		The parse token value
+ * @param rest		String to parse
+ * @return 0 and 1 for success and failure
+ */
+static int parse_value_chipuid(build_image_context *context,
+			parse_token token,
+			char *rest)
+{
+	u_int8_t value[16];
+
+	assert(context != NULL);
+	assert(rest != NULL);
+
+	rest = parse_chipuid(rest, value);
+	if (rest == NULL)
+		return 1;
+
+	return context_set_value(context, token, value);
+}
+
+/*
  * Parse the given string and find the bct file name.
  *
  * @param context	The main context pointer
diff --git a/src/parse.h b/src/parse.h
index d9d873f..114168c 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -108,6 +108,8 @@ typedef enum
 	token_dev_type_spi,
 	token_num_sdram_sets,
 	token_pre_bct_pad_blocks,
+	token_unique_chip_id,
+	token_secure_jtag_control,
 
 	token_nand_clock_divider,
 	token_nand_nand_timing,
diff --git a/src/set.c b/src/set.c
index a092014..0419505 100644
--- a/src/set.c
+++ b/src/set.c
@@ -204,6 +204,18 @@ int context_set_value(build_image_context *context,
 		context->pre_bct_pad_blocks = *((u_int32_t *)value);
 		break;
 
+	case token_secure_jtag_control:
+		context->secure_jtag_control = *((u_int32_t *)value);
+		g_soc_config->set_value(token_secure_jtag_control,
+			value, context->bct);
+		break;
+
+	case token_unique_chip_id:
+		memcpy(context->unique_chip_id, value, 16);
+		g_soc_config->set_value(token_unique_chip_id,
+			value, context->bct);
+		break;
+
 	DEFAULT();
 	}
 
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index ad0c365..5f2c440 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -111,7 +111,9 @@ parse_token t124_root_token_list[] = {
 	token_hash_size,
 	token_crypto_offset,
 	token_crypto_length,
-	token_max_bct_search_blks
+	token_max_bct_search_blks,
+	token_unique_chip_id,
+	token_secure_jtag_control
 };
 
 int
@@ -941,6 +943,7 @@ t124_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 	CASE_GET_NVU32(num_sdram_sets);
 	CASE_GET_NVU32(bootloader_used);
 	CASE_GET_NVU32(odm_data);
+	CASE_GET_NVU32(secure_jtag_control);
 
 	case token_block_size:
 		if (bct == NULL)
@@ -967,6 +970,10 @@ t124_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 		sizeof(nvboot_hash));
 		break;
 
+	case token_unique_chip_id:
+		memcpy(data, &(bct_ptr->unique_chip_id), sizeof(nvboot_ecid));
+		break;
+
 	case token_reserved_offset:
 		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
@@ -1032,6 +1039,10 @@ t124_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 	CASE_SET_NVU32(num_sdram_sets);
 	CASE_SET_NVU32(bootloader_used);
 	CASE_SET_NVU32(odm_data);
+	CASE_SET_NVU32(secure_jtag_control);
+	case token_unique_chip_id:
+		memcpy(&bct_ptr->unique_chip_id, data, sizeof(nvboot_ecid));
+		break;
 
 	default:
 		return -ENODATA;
-- 
1.9.1
