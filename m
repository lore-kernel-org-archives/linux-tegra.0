From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH 1/2] Add Tegra124 bct data access for jtag control and chip uid
Date: Fri, 21 Mar 2014 17:41:25 +0800
Message-ID: <1395394886-8145-2-git-send-email-pchiu@nvidia.com>
References: <1395394886-8145-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395394886-8145-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for read secure_jtag_control and unique_chip_id from
cfg file and write them into BCT structure, and bct_dump can also
parse the two fields and show the data.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c           | 41 ++++++++++++++++++++--------
 src/cbootimage.h         |  2 ++
 src/parse.c              | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
 src/parse.h              |  2 ++
 src/set.c                | 25 +++++++++++++++++
 src/set.h                |  4 +++
 src/t124/nvbctlib_t124.c | 14 ++++++++++
 7 files changed, 148 insertions(+), 11 deletions(-)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index dbef913..fa3fdb7 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -37,7 +37,9 @@ static value_data const values[] = {
 	{ token_block_size_log2,     "BlockSize     = 0x%08x;\n" },
 	{ token_page_size_log2,      "PageSize      = 0x%08x;\n" },
 	{ token_partition_size,      "PartitionSize = 0x%08x;\n" },
-	{ token_odm_data,            "OdmData       = 0x%08x;\n\n" },
+	{ token_odm_data,            "OdmData       = 0x%08x;\n" },
+	{ token_secure_jtag_control, "JtagCtrl      = 0x%08x;\n" },
+	{ token_unique_chip_id,      "ChipUid       = %s;\n" },
 	{ token_bootloader_used,     "# Bootloader used       = %d;\n" },
 	{ token_bootloaders_max,     "# Bootloaders max       = %d;\n" },
 	{ token_bct_size,            "# BCT size              = %d;\n" },
@@ -154,17 +156,34 @@ int main(int argc, char *argv[])
 
 	/* Display root values */
 	for (i = 0; i < sizeof(values) / sizeof(values[0]); ++i) {
-		e = g_soc_config->get_value(values[i].id,
-						&data,
-						context.bct);
+		if (values[i].id == token_unique_chip_id) {
+			u_int8_t uid[16];
+			char uid_str[35] = "0x";
 
-		if (e != 0)
-			data = -1;
-		else if (values[i].id == token_block_size_log2 ||
-			 values[i].id == token_page_size_log2)
-			data = 1 << data;
-
-		printf(values[i].message, data);
+			e = g_soc_config->get_value(values[i].id,
+							(u_int32_t *)uid,
+							context.bct);
+			if (e != 0)
+				continue;
+
+			for (j = 15; j >= 0; j--)
+				sprintf(uid_str, "%s%02x", uid_str, uid[j]);
+			printf(values[i].message, uid_str);
+		} else {
+			e = g_soc_config->get_value(values[i].id,
+							&data,
+							context.bct);
+
+			if (e != 0) {
+				if (values[i].id == token_secure_jtag_control)
+					continue;
+				data = -1;
+			} else if (values[i].id == token_block_size_log2 ||
+				 values[i].id == token_page_size_log2)
+				data = 1 << data;
+
+			printf(values[i].message, data);
+		}
 	}
 
 	/* Display bootloader values */
diff --git a/src/cbootimage.h b/src/cbootimage.h
index 46e3b8b..252c41e 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -96,6 +96,8 @@ typedef struct build_image_context_rec
 	u_int32_t boot_data_version; /* The boot data version of BCT */
 	u_int8_t bct_init; /* The flag for the memory allocation of bct */
 	u_int32_t odm_data; /* The odm data value */
+	u_int8_t unique_chip_id[16]; /* The unique chip uid */
+	u_int8_t secure_jtag_control; /* The flag for enabling jtag control */
 } build_image_context;
 
 /* Function prototypes */
diff --git a/src/parse.c b/src/parse.c
index 464ee8f..90d37e7 100644
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
 
@@ -165,6 +172,45 @@ parse_u8(char *str, u_int32_t *val)
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
+	while (*str == '0')
+		str++;
+
+	if (tolower(*str) == 'x') {
+		int byte_index = 0;
+		int paddings = 0;
+		char byte_str[3];
+
+		str++;
+		paddings = strlen(str) % 2;
+		byte_index = strlen(str) / 2 + paddings;
+
+		while (*str != '\0' && byte_index > 0) {
+			u_int32_t value = 0;
+
+			strncpy(byte_str, str, 2 - paddings);
+			byte_str[2-paddings] = '\0';
+			str = str + 2 - paddings;
+
+			sscanf(byte_str, "%x", &value);
+			*(chipuid + byte_index - 1) = value;
+
+			byte_index--;
+			paddings = 0;
+		}
+	}
+
+	return str;
+}
 
 /*
  * Parse the given string and find the file name then
@@ -486,6 +532,31 @@ static int parse_value_u32(build_image_context *context,
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
+	memset(value, 0, sizeof(value));
+	rest = parse_chipuid(rest, value);
+	if (rest == NULL)
+		return 1;
+
+	return context_set_chipuid(context, value);
+}
+
+/*
  * Parse the given string and find the bct file name.
  *
  * @param context	The main context pointer
diff --git a/src/parse.h b/src/parse.h
index 80f42c4..ffa9c17 100644
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
index 08c9fb6..99b242c 100644
--- a/src/set.c
+++ b/src/set.c
@@ -199,8 +199,33 @@ int context_set_value(build_image_context *context,
 		context->pre_bct_pad_blocks = value;
 		break;
 
+	case token_secure_jtag_control:
+		context->secure_jtag_control = value;
+		g_soc_config->set_value(token_secure_jtag_control,
+			value, context->bct);
+		break;
+
 	DEFAULT();
 	}
 
 	return 0;
 }
+
+/*
+ * General handler for setting chip uid in config files.
+ *
+ * @param context	The main context pointer
+ * @param data		The value to set
+ * @return 0 for success
+ */
+int context_set_chipuid(build_image_context *context,
+		u_int8_t *data)
+{
+	assert(context != NULL);
+
+	memcpy(context->unique_chip_id, data, 16);
+	g_soc_config->set_data(token_unique_chip_id, data,
+		16, context->bct);
+
+	return 0;
+}
diff --git a/src/set.h b/src/set.h
index 1515fcd..dbde479 100644
--- a/src/set.h
+++ b/src/set.h
@@ -41,6 +41,10 @@ context_set_value(build_image_context	*context,
 		u_int32_t	value);
 
 int
+context_set_chipuid(build_image_context	*context,
+		u_int8_t	*data);
+
+int
 read_from_image(char *filename,
 		u_int8_t	**Image,
 		u_int32_t	*actual_size,
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index 27e5a62..bb83f53 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -926,6 +926,7 @@ t124_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 	CASE_GET_NVU32(num_sdram_sets);
 	CASE_GET_NVU32(bootloader_used);
 	CASE_GET_NVU32(odm_data);
+	CASE_GET_NVU32(secure_jtag_control);
 
 	/*
 	 * Constants.
@@ -940,6 +941,12 @@ t124_bct_get_value(parse_token id, u_int32_t *data, u_int8_t *bct)
 		sizeof(nvboot_hash));
 		break;
 
+	case token_unique_chip_id:
+		memcpy(data,
+		&(bct_ptr->unique_chip_id),
+		sizeof(nvboot_ecid));
+		break;
+
 	case token_reserved_offset:
 		*data = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
@@ -1005,6 +1012,7 @@ t124_bct_set_value(parse_token id, u_int32_t data, u_int8_t *bct)
 	CASE_SET_NVU32(num_sdram_sets);
 	CASE_SET_NVU32(bootloader_used);
 	CASE_SET_NVU32(odm_data);
+	CASE_SET_NVU32(secure_jtag_control);
 
 	default:
 		return -ENODATA;
@@ -1032,6 +1040,12 @@ t124_bct_set_data(parse_token id,
 		memcpy(&bct_ptr->signature.crypto_hash, data, sizeof(nvboot_hash));
 		break;
 
+	case token_unique_chip_id:
+		if (length > sizeof(nvboot_ecid))
+			return -ENODATA;
+		memcpy(&bct_ptr->unique_chip_id, data, length);
+		break;
+
 	default:
 		return -ENODATA;
 	}
-- 
1.9.0
