From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v3 2/5] Add support for update pubkey and rsa-pss signatures
Date: Wed, 7 Oct 2015 17:40:42 -0700
Message-ID: <1444264845-16741-3-git-send-email-jimmzhang@nvidia.com>
References: <1444264845-16741-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444264845-16741-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

Above three new keywords added in this CL are only implemented support
for T210.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.h           |  4 ++++
 src/parse.c                | 35 +++++++++++++++++++++++++++++++++++
 src/parse.h                |  4 ++++
 src/set.c                  | 38 ++++++++++++++++++++++++++++++++++++++
 src/set.h                  |  5 +++++
 src/t210/nvbctlib_t210.c   | 23 ++++++++++++++++++++++-
 src/t210/nvboot_bct_t210.h |  2 --
 7 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/src/cbootimage.h b/src/cbootimage.h
index 9706b2c1edb8..1ce8af6f6584 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -49,6 +49,9 @@
 
 #define MAX_MTS_SIZE (4 * 1024 * 1024)
 
+#define ARSE_RSA_MAX_MODULUS_SIZE	2048
+#define ARSE_RSA_PARAM_MAX_BYTES	(ARSE_RSA_MAX_MODULUS_SIZE / 8)
+
 #define NVBOOT_CONFIG_TABLE_SIZE_MAX (10 * 1024)
 
 /*
@@ -60,6 +63,7 @@ typedef enum
 	file_type_bl = 0,
 	file_type_bct,
 	file_type_mts,
+	file_type_bin,
 } file_type;
 
 /*
diff --git a/src/parse.c b/src/parse.c
index 8c9824437393..d2f4016effd8 100644
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
diff --git a/src/parse.h b/src/parse.h
index ce3f21fb8a31..16242a5c2701 100644
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
diff --git a/src/set.c b/src/set.c
index 73af52111360..6dec0bc8755e 100644
--- a/src/set.c
+++ b/src/set.c
@@ -147,6 +147,44 @@ set_mts_image(build_image_context	*context,
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
+	u_int32_t actual_size;	/* In bytes */
+
+        /* Read the image into memory. */
+	result = read_from_image(filename,
+				0,
+				ARSE_RSA_PARAM_MAX_BYTES,
+				&rsa_storage,
+				&actual_size,
+				file_type_bin);
+
+	if (result) {
+		printf("Error reading file %s.\n", filename);
+		exit(1);
+	}
+
+	if (actual_size != ARSE_RSA_PARAM_MAX_BYTES) {
+		printf("Error: invalid size, file %s.\n", filename);
+		exit(1);
+        }
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
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
index 9921bbbe0d2d..91a42ec8367f 100644
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
@@ -2198,6 +2201,24 @@ t210_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 		memcpy(&bct_ptr->unique_chip_id, data, sizeof(nvboot_ecid));
 		break;
 
+	case token_rsa_key_modulus:
+		memcpy(&bct_ptr->key, data, sizeof(nvboot_rsa_key_modulus));
+		break;
+
+	case token_rsa_pss_sig_bl:
+		/*
+		 * Update bootloader 0 since there is only one copy
+		 * of bootloader being built in.
+		 */
+		memcpy(&bct_ptr->bootloader[0].signature.rsa_pss_sig,
+			data, sizeof(nvboot_rsa_pss_sig));
+		break;
+
+	case token_rsa_pss_sig_bct:
+		memcpy(&bct_ptr->signature.rsa_pss_sig,
+			data, sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	default:
 		return -ENODATA;
 	}
diff --git a/src/t210/nvboot_bct_t210.h b/src/t210/nvboot_bct_t210.h
index 90841f63feb6..c790ee97106d 100644
--- a/src/t210/nvboot_bct_t210.h
+++ b/src/t210/nvboot_bct_t210.h
@@ -94,8 +94,6 @@
  */
 #define NVBOOT_MAX_BCT_SEARCH_BLOCKS	64
 
-#define ARSE_RSA_MAX_MODULUS_SIZE	2048
-
 /**
  * Defines the RSA modulus length in bits and bytes used for PKC secure boot.
  */
-- 
1.8.1.5
