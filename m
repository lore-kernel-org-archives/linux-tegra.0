From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 1/8] Enable --update | -u option support for t210
Date: Wed, 2 Sep 2015 14:19:13 -0700
Message-ID: <1441228760-26042-2-git-send-email-jimmzhang@nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Added routines to allow updating pkc pubkey and rsa pss signatures.

Specifically, added following configuration keywords:

   RsaKeyModulus: set pubkey
   RsaPssSigBl:   set bootloader rsa pss signature
   RsaPssSigBct:  set bct rsa pss signature

Sample Configuration file update_bl_sig.cfg
   RsaKeyModulus = pubkey.mod;
   RsaPssSigBl = bl.sig;

Commandline example:
   $ cbootimage -s tegra210 -u update_bl_sig.cfg image.bin image.bin-bl-signed

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.c           |  8 +++++---
 src/cbootimage.h           |  5 +++++
 src/parse.c                | 35 +++++++++++++++++++++++++++++++++++
 src/parse.h                |  4 ++++
 src/set.c                  | 38 ++++++++++++++++++++++++++++++++++++++
 src/set.h                  |  5 +++++
 src/t210/nvbctlib_t210.c   | 20 +++++++++++++++++++-
 src/t210/nvboot_bct_t210.h |  2 --
 8 files changed, 111 insertions(+), 6 deletions(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index 1dfb719c819b..9b696519377a 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -79,7 +79,7 @@ usage(void)
 	printf("                          Default: tegra20.\n");
 	printf("    -u|--update           Copy input image data and update bct\n");
 	printf("                          configs into new image file.\n");
-	printf("                          This feature is only for tegra114/124.\n");
+	printf("                          This feature is only for tegra114/124/210.\n");
 	printf("    configfile            File with configuration information\n");
 	printf("    inputimage            Input image name. This is required\n");
 	printf("                          if -u|--update option is used.\n");
@@ -170,8 +170,10 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 	if (context->update_image)
 	{
 		if (context->boot_data_version != BOOTDATA_VERSION_T114 &&
-			context->boot_data_version != BOOTDATA_VERSION_T124) {
-			printf("Update image feature is only for Tegra114 and Tegra124.\n");
+			context->boot_data_version != BOOTDATA_VERSION_T124 &&
+			context->boot_data_version != BOOTDATA_VERSION_T210) {
+			printf("Update image feature is only for Tegra114, Tegra124"
+				" and Tegra210.\n");
 			return -EINVAL;
 		}
 
diff --git a/src/cbootimage.h b/src/cbootimage.h
index 9706b2c1edb8..2b609eda50f9 100644
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
@@ -105,6 +109,7 @@ typedef struct build_image_context_rec
 	u_int32_t mts_attr;
 
 	char *bct_filename;
+	char *rsa_filename;
 	u_int32_t last_blk;
 	u_int32_t bct_size; /* The BCT file size */
 	u_int32_t boot_data_version; /* The boot data version of BCT */
diff --git a/src/parse.c b/src/parse.c
index 8c9824437393..974eec7844ff 100644
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
+	{ "RsaKeyModulus=", token_pub_key_modulus,	parse_rsa_param },
+	{ "RsaPssSigBl=",   token_rsa_pss_sig_bl,	parse_rsa_param },
+	{ "RsaPssSigBct=",  token_rsa_pss_sig_bct,	parse_rsa_param },
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
index ce3f21fb8a31..c7035d590ed2 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -114,6 +114,10 @@ typedef enum
 	token_secure_jtag_control,
 	token_secure_debug_control,
 
+	token_pub_key_modulus,
+	token_rsa_pss_sig_bl,
+	token_rsa_pss_sig_bct,
+
 	token_nand_clock_divider,
 	token_nand_nand_timing,
 	token_nand_nand_timing2,
diff --git a/src/set.c b/src/set.c
index 73af52111360..474554b2ed58 100644
--- a/src/set.c
+++ b/src/set.c
@@ -147,6 +147,44 @@ set_mts_image(build_image_context	*context,
 	context->mts_entry_point = entry_point;
 	return update_mts_image(context);
 }
+
+int
+set_rsa_param(build_image_context *context, parse_token token,
+		const char *filename)
+{
+	int	result;
+	u_int8_t *rsa_storage;	/* Holds the rsa param after reading */
+	u_int32_t actual_size;	/* In bytes */
+	file_type rsa_filetype = file_type_bin;
+
+        /* Read the image into memory. */
+	result = read_from_image(filename,
+				0,
+				ARSE_RSA_PARAM_MAX_BYTES,
+				&rsa_storage,
+				&actual_size,
+				rsa_filetype);
+
+	if (result || (actual_size != ARSE_RSA_PARAM_MAX_BYTES)) {
+		if (result)
+			printf("Error reading file %s.\n", filename);
+		else
+			printf("Error: invalid size, file %s.\n", filename);
+		exit(1);
+        }
+
+	if (enable_debug) {
+		printf("Updating token %d with file %s\n", (int)token, filename);
+	}
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
index 8b9a69b2a950..5fc4061b7e4d 100644
--- a/src/set.h
+++ b/src/set.h
@@ -42,6 +42,11 @@ set_mts_image(build_image_context	*context,
 		u_int32_t	entry_point);
 
 int
+set_rsa_param(build_image_context	*context,
+		parse_token	token,
+		const char	*filename);
+
+int
 context_set_value(build_image_context	*context,
 		parse_token	token,
 		void		*value);
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
index 9921bbbe0d2d..f48ff66d4c18 100644
--- a/src/t210/nvbctlib_t210.c
+++ b/src/t210/nvbctlib_t210.c
@@ -113,7 +113,10 @@ parse_token t210_root_token_list[] = {
 	token_crypto_length,
 	token_max_bct_search_blks,
 	token_unique_chip_id,
-	token_secure_debug_control
+	token_secure_debug_control,
+	token_pub_key_modulus,
+	token_rsa_pss_sig_bl,
+	token_rsa_pss_sig_bct
 };
 
 int
@@ -2198,6 +2201,21 @@ t210_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 		memcpy(&bct_ptr->unique_chip_id, data, sizeof(nvboot_ecid));
 		break;
 
+	case token_pub_key_modulus:
+		memcpy(&bct_ptr->key, data, sizeof(nvboot_rsa_key_modulus));
+		break;
+
+	case token_rsa_pss_sig_bl:
+		/* ONLY support one bl */
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
