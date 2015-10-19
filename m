From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v7 1/5] Add support for update pubkey and rsa-pss signatures
Date: Mon, 19 Oct 2015 16:01:54 -0700
Message-ID: <1445295718-19146-2-git-send-email-jimmzhang@nvidia.com>
References: <1445295718-19146-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445295718-19146-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Create new configuration keywords:
   RsaKeyModulusFile: pubkey modulus
   RsaPssSigBlFile:   bootloader rsa pss signature
   RsaPssSigBctFile:  bct rsa pss signature

Sample Configuration file update_bl_sig.cfg
   RsaKeyModulusFile = pubkey.mod;
   RsaPssSigBlFile = bl.sig;

where pubkey.mod and bl.sig are files that contain the public key
modulus and bootloader's rsa-pss signature respectively.

public key modulus and signature are created through utilities
outside cbootimage.

Command line example:
 $ cbootimage -s tegra210 -u update_bl_sig.cfg image.bin image.bin-bl-signed

Above three new keywords added in this CL are only implemented to support
for T210.

Changes in V7:
1) Redefine parameter "u_int8_t *in" as "const u_int8_t *in" for function
   reverse_byte_order()
2) Clean up compiler warnings from nvbctlib_t210.c

Changes in V6:
1) Rename function swap_endianness() to reverse_byte_order()
2) Put "size - 1 - i" to a variable to avoid double calculation
3) Remove checking NULL pointer of get_value_size() in function set_rsa_param()
4) Change function prototype for get_value_size()

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.h         |  1 +
 src/crypto.c             | 29 +++++++++++++++++++++++++++++
 src/crypto.h             |  5 +++++
 src/parse.c              | 40 ++++++++++++++++++++++++++++++++++++++++
 src/parse.h              | 17 +++++++++++++++++
 src/set.c                | 44 ++++++++++++++++++++++++++++++++++++++++++++
 src/set.h                |  5 +++++
 src/t114/nvbctlib_t114.c |  1 +
 src/t124/nvbctlib_t124.c |  1 +
 src/t210/nvbctlib_t210.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 10 files changed, 190 insertions(+), 1 deletion(-)

diff --git a/src/cbootimage.h b/src/cbootimage.h
index 9706b2c1edb8..63f0ee97e12e 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -60,6 +60,7 @@ typedef enum
 	file_type_bl = 0,
 	file_type_bct,
 	file_type_mts,
+	file_type_bin,
 } file_type;
 
 /*
diff --git a/src/crypto.c b/src/crypto.c
index 99e9f085763c..039be0a8a611 100644
--- a/src/crypto.c
+++ b/src/crypto.c
@@ -297,3 +297,32 @@ sign_bct(build_image_context *context,
 	free(hash_buffer);
 	return e;
 }
+
+/*
+ * reverse_byte_order
+ *
+ * Reverse the order of bytes pointed by 'in' and place the results
+ * to location pointed by 'out'. If 'out' is the same as 'in', then
+ * order of bytes pointed by 'in' is reversed.
+ */
+void
+reverse_byte_order(
+	u_int8_t *out,
+	const u_int8_t *in,
+	const u_int32_t size)
+{
+	u_int32_t i, j;
+	u_int8_t b1, b2;
+
+	for (i = 0; i < size / 2; i++) {
+		j = size - 1 - i;
+		b1 = in[i];
+		b2 = in[j];
+		out[i] = b2;
+		out[j] = b1;
+	}
+
+	/* In case odd number of bytes */
+	if (size % 2)
+		out[size / 2] = in[size / 2];
+}
diff --git a/src/crypto.h b/src/crypto.h
index d7151e0cd191..f56b67d983f3 100644
--- a/src/crypto.h
+++ b/src/crypto.h
@@ -44,4 +44,9 @@ sign_data_block(u_int8_t *source,
 		u_int32_t length,
 		u_int8_t *signature);
 
+void
+reverse_byte_order(
+	u_int8_t *out,
+	const u_int8_t *in,
+	const u_int32_t size);
 #endif /* #ifndef INCLUDED_CRYPTO_H */
diff --git a/src/parse.c b/src/parse.c
index 8c9824437393..667895c4dd54 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -65,6 +65,8 @@ parse_bootloader(build_image_context *context, parse_token token, char *rest);
 static int
 parse_mts_image(build_image_context *context, parse_token token, char *rest);
 static int
+parse_rsa_param(build_image_context *context, parse_token token, char *rest);
+static int
 parse_value_u32(build_image_context *context, parse_token token, char *rest);
 static int
 parse_value_chipuid(build_image_context *context,
@@ -116,6 +118,9 @@ static parse_item s_top_level_items[] = {
 	{ "ChipUid=",       token_unique_chip_id,	parse_value_chipuid },
 	{ "JtagCtrl=",	    token_secure_jtag_control,	parse_value_u32 },
 	{ "DebugCtrl=",	    token_secure_debug_control,	parse_value_u32 },
+	{ "RsaKeyModulusFile=", token_rsa_key_modulus,	parse_rsa_param },
+	{ "RsaPssSigBlFile=",   token_rsa_pss_sig_bl,	parse_rsa_param },
+	{ "RsaPssSigBctFile=",  token_rsa_pss_sig_bct,	parse_rsa_param },
 	{ NULL, 0, NULL } /* Must be last */
 };
 
@@ -480,6 +485,36 @@ static int parse_mts_image(build_image_context *context,
 }
 
 /*
+ * Parse the given rsa modulus/key/signature file name
+ * then call set_rsa_settings to set proper rsa field.
+ *
+ * @param context	The main context pointer
+ * @param token  	The parse token value
+ * @param rest   	String to parse
+ * @return 0 and 1 for success and failure
+ */
+static int parse_rsa_param(build_image_context *context,
+			parse_token token,
+			char *rest)
+{
+	char filename[MAX_BUFFER];
+
+	assert(context != NULL);
+	assert(rest != NULL);
+
+	if (context->generate_bct != 0)
+		return 0;
+
+	/* Parse the file name. */
+	rest = parse_filename(rest, filename, MAX_BUFFER);
+	if (rest == NULL)
+		return 1;
+
+	/* Parsing has finished - set the bootloader */
+	return set_rsa_param(context, token, filename);
+}
+
+/*
  * Parse the given string and find the array items in config file.
  *
  * @param context	The main context pointer
@@ -939,3 +974,8 @@ void process_config_file(build_image_context *context, u_int8_t simple_parse)
 	printf("Error parsing: %s\n", buffer);
 	exit(1);
 }
+
+int bct_get_unsupported(parse_token id)
+{
+	return -ENODATA;
+}
diff --git a/src/parse.h b/src/parse.h
index ce3f21fb8a31..f2e28b306709 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -114,6 +114,10 @@ typedef enum
 	token_secure_jtag_control,
 	token_secure_debug_control,
 
+	token_rsa_key_modulus,
+	token_rsa_pss_sig_bl,
+	token_rsa_pss_sig_bct,
+
 	token_nand_clock_divider,
 	token_nand_nand_timing,
 	token_nand_nand_timing2,
@@ -1109,6 +1113,14 @@ typedef struct cbootimage_soc_config_rec {
 			void *data,
 			u_int8_t *bct);
 	/*
+	 * Get the size of specified bct field
+	 *
+	 * @param id  	The parse token
+	 * @return size or 0/-ENODATA for failure
+	 */
+	int (*get_value_size)(parse_token id);
+
+	/*
 	 * Set the bct crypto hash data.
 	 *
 	 * @param id    	The parse token value
@@ -1339,6 +1351,11 @@ u_int32_t ceil_log2(u_int32_t a);
 extern cbootimage_soc_config *g_soc_config;
 
 /*
+ * Dummy function for unsupported token
+ */
+int bct_get_unsupported(parse_token id);
+
+/*
  * Provide access to enum and field tables.  These tables are useful when
  * pretty printing a BCT file using bct_dump.
  */
diff --git a/src/set.c b/src/set.c
index 73af52111360..388bc1acb5c4 100644
--- a/src/set.c
+++ b/src/set.c
@@ -147,6 +147,50 @@ set_mts_image(build_image_context	*context,
 	context->mts_entry_point = entry_point;
 	return update_mts_image(context);
 }
+
+int
+set_rsa_param(build_image_context *context, parse_token token,
+		char *filename)
+{
+	int	result;
+	u_int8_t *rsa_storage;	/* Holds the rsa param after reading */
+	int32_t size;		/* Bytes to read */
+	u_int32_t actual_size;	/* In bytes */
+
+	if ((size = g_soc_config->get_value_size(token)) <= 0)  {
+		printf("Error: Unsupported token %d for value size.\n", token);
+		exit(1);
+	}
+
+	/* Read the image into memory. */
+	result = read_from_image(filename,
+				0,
+				(u_int32_t)size,
+				&rsa_storage,
+				&actual_size,
+				file_type_bin);
+
+	if (result) {
+		printf("Error reading file %s.\n", filename);
+		exit(1);
+	}
+
+	if (actual_size != size) {
+		printf("Error: invalid size, file %s.\n", filename);
+		exit(1);
+	}
+
+	if (enable_debug)
+		printf("Updating token %d with file %s\n", (int)token, filename);
+
+	/* set to appropriate bct field */
+	result = g_soc_config->set_value(token,
+			rsa_storage, context->bct);
+
+	free(rsa_storage);
+	return result;
+}
+
 #define DEFAULT()                                                     \
 	default:                                                      \
 		printf("Unexpected token %d at line %d\n",            \
diff --git a/src/set.h b/src/set.h
index 8b9a69b2a950..b38d4cefcb4f 100644
--- a/src/set.h
+++ b/src/set.h
@@ -42,6 +42,11 @@ set_mts_image(build_image_context	*context,
 		u_int32_t	entry_point);
 
 int
+set_rsa_param(build_image_context	*context,
+		parse_token	token,
+		char	*filename);
+
+int
 context_set_value(build_image_context	*context,
 		parse_token	token,
 		void		*value);
diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c
index dad8f4f8f07d..9e764fb547ad 100644
--- a/src/t114/nvbctlib_t114.c
+++ b/src/t114/nvbctlib_t114.c
@@ -1112,6 +1112,7 @@ cbootimage_soc_config tegra114_config = {
 	.getbl_param				= t114_getbl_param,
 	.set_value					= t114_bct_set_value,
 	.get_value					= t114_bct_get_value,
+	.get_value_size					= bct_get_unsupported,
 	.set_data					= t114_bct_set_data,
 	.get_bct_size				= t114_get_bct_size,
 	.token_supported			= t114_bct_token_supported,
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index 5df93cdcdb91..5b760ad0eeec 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -1125,6 +1125,7 @@ cbootimage_soc_config tegra124_config = {
 	.getbl_param				= t124_getbl_param,
 	.set_value					= t124_bct_set_value,
 	.get_value					= t124_bct_get_value,
+	.get_value_size					= bct_get_unsupported,
 	.set_data					= t124_bct_set_data,
 	.get_bct_size				= t124_get_bct_size,
 	.token_supported			= t124_bct_token_supported,
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
index 9921bbbe0d2d..3380411c131c 100644
--- a/src/t210/nvbctlib_t210.c
+++ b/src/t210/nvbctlib_t210.c
@@ -113,7 +113,10 @@ parse_token t210_root_token_list[] = {
 	token_crypto_length,
 	token_max_bct_search_blks,
 	token_unique_chip_id,
-	token_secure_debug_control
+	token_secure_debug_control,
+	token_rsa_key_modulus,
+	token_rsa_pss_sig_bl,
+	token_rsa_pss_sig_bct
 };
 
 int
@@ -2174,6 +2177,28 @@ t210_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 }
 
 int
+t210_bct_get_value_size(parse_token id)
+{
+	switch (id) {
+	case token_rsa_key_modulus:
+		return sizeof(nvboot_rsa_key_modulus);
+
+	case token_rsa_pss_sig_bl:
+		return sizeof(nvboot_rsa_pss_sig);
+
+	case token_rsa_pss_sig_bct:
+		return sizeof(nvboot_rsa_pss_sig);
+
+	/*
+	 * Other bct fields can be added in when needed
+	 */
+	default:
+		return -ENODATA;
+	}
+	return 0;
+}
+
+int
 t210_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
@@ -2198,6 +2223,26 @@ t210_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 		memcpy(&bct_ptr->unique_chip_id, data, sizeof(nvboot_ecid));
 		break;
 
+	case token_rsa_key_modulus:
+		reverse_byte_order((u_int8_t *)&bct_ptr->key, data,
+					sizeof(nvboot_rsa_key_modulus));
+		break;
+
+	case token_rsa_pss_sig_bl:
+		/*
+		 * Update bootloader 0 since there is only one copy
+		 * of bootloader being built in.
+		 */
+		reverse_byte_order(
+			(u_int8_t *)&bct_ptr->bootloader[0].signature.rsa_pss_sig,
+			data, sizeof(nvboot_rsa_pss_sig));
+		break;
+
+	case token_rsa_pss_sig_bct:
+		reverse_byte_order((u_int8_t *)&bct_ptr->signature.rsa_pss_sig,
+			data, sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	default:
 		return -ENODATA;
 	}
@@ -2279,6 +2324,7 @@ cbootimage_soc_config tegra210_config = {
 	.getbl_param				= t210_getbl_param,
 	.set_value					= t210_bct_set_value,
 	.get_value					= t210_bct_get_value,
+	.get_value_size					= t210_bct_get_value_size,
 	.set_data					= t210_bct_set_data,
 	.get_bct_size				= t210_get_bct_size,
 	.token_supported			= t210_bct_token_supported,
-- 
1.8.1.5
