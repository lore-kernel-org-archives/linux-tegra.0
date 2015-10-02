From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v2 4/4] Add new configuration keyword "ReSignBl"
Date: Fri, 2 Oct 2015 13:57:00 -0700
Message-ID: <1443819420-26562-5-git-send-email-jimmzhang@nvidia.com>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443819420-26562-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This feature is needed in case an image is updated at later stage
after it has been created.

How to use:
  Add keyword "ReSignBl" to configuration file, for example resign.cfg:
    ReSignBl;

  Invoke cbootimage to resign image, for example bootloader.bin:
    $ cbootimage -s tegra210 --update resign.cfg bootloader.bin bootloader.bin-resigned

  Where bootloader.bin-resigned is the resigned bootloader.bin

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.h  |  1 +
 src/crypto.c      | 34 ++++++++++++++++++++++++++++++++++
 src/crypto.h      |  6 ++++++
 src/data_layout.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 src/data_layout.h |  2 ++
 src/parse.c       |  9 +++++++++
 src/parse.h       |  1 +
 7 files changed, 104 insertions(+)

diff --git a/src/cbootimage.h b/src/cbootimage.h
index 1ce8af6f6584..98aa8f16d8f1 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -64,6 +64,7 @@ typedef enum
 	file_type_bct,
 	file_type_mts,
 	file_type_bin,
+	file_type_blocks,
 } file_type;
 
 /*
diff --git a/src/crypto.c b/src/crypto.c
index 99e9f085763c..d6889cb602c9 100644
--- a/src/crypto.c
+++ b/src/crypto.c
@@ -297,3 +297,37 @@ sign_bct(build_image_context *context,
 	free(hash_buffer);
 	return e;
 }
+
+int
+sign_bl(build_image_context *context,
+	u_int8_t *bootloader,
+	u_int32_t length,
+	u_int32_t image_instance)
+{
+	int e = 0;
+	u_int8_t  *hash_buffer;
+	u_int32_t  hash_size;
+
+	g_soc_config->get_value(token_hash_size,
+			&hash_size, context->bct);
+
+	hash_buffer = calloc(1, hash_size);
+	if (hash_buffer == NULL)
+		return -ENOMEM;
+
+	/* Encrypt and compute hash */
+	if ((e = sign_data_block(bootloader,
+			length,
+			hash_buffer)) != 0)
+		goto fail;
+
+	if ((e = g_soc_config->setbl_param(image_instance,
+				token_bl_crypto_hash,
+				(u_int32_t*)hash_buffer,
+				context->bct)) != 0)
+		goto fail;
+
+ fail:
+	free(hash_buffer);
+	return e;
+}
diff --git a/src/crypto.h b/src/crypto.h
index d7151e0cd191..936ca9c4c0eb 100644
--- a/src/crypto.h
+++ b/src/crypto.h
@@ -44,4 +44,10 @@ sign_data_block(u_int8_t *source,
 		u_int32_t length,
 		u_int8_t *signature);
 
+int
+sign_bl(build_image_context *context,
+	u_int8_t *bootloader,
+	u_int32_t length,
+	u_int32_t image_instance);
+
 #endif /* #ifndef INCLUDED_CRYPTO_H */
diff --git a/src/data_layout.c b/src/data_layout.c
index 082609236724..fe5380ac94bb 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -1065,3 +1065,54 @@ int get_bct_size_from_image(build_image_context *context)
 	context->bct = 0;
 	return bct_size;
 }
+
+int resign_bl(build_image_context *context)
+{
+	int ret;
+	u_int8_t  *buffer, *image;
+	u_int32_t  image_instance = 0;	/* support only one instance */
+	u_int32_t  image_actual_size; /* In bytes */
+	u_int32_t  bl_length;
+	u_int32_t  pages_in_image;
+	u_int32_t  blk_size, page_size, current_blk, current_page;
+	u_int32_t  offset;
+
+	/* read in bl from image */
+	g_soc_config->get_value(token_block_size, &blk_size, context->bct);
+	g_soc_config->get_value(token_page_size, &page_size, context->bct);
+
+	GET_BL_FIELD(image_instance, start_blk, &current_blk);
+	GET_BL_FIELD(image_instance, start_page,  &current_page);
+	GET_BL_FIELD(image_instance, length,  &bl_length);
+
+	offset = current_blk * blk_size +
+			current_page * page_size;
+
+	if (read_from_image(context->input_image_filename,
+				offset, bl_length,
+				&image, &image_actual_size, file_type_blocks)) {
+		printf("Error reading image file %s.\n",
+				context->input_image_filename);
+		return -ENOMEM;
+	}
+
+	pages_in_image = ICEIL(image_actual_size, page_size);
+
+	/* Create a local copy of the bl */
+	if ((buffer = malloc(pages_in_image * page_size)) == NULL) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	memset(buffer, 0, pages_in_image * page_size);
+	memcpy(buffer, image, image_actual_size);
+
+	insert_padding(buffer, image_actual_size);
+
+	/* sign bl */
+	ret = sign_bl(context, buffer, image_actual_size, image_instance);
+	free (buffer);
+ fail:
+	free (image);
+	return ret;
+}
\ No newline at end of file
diff --git a/src/data_layout.h b/src/data_layout.h
index c6e53e61be83..0e6e41fcb24c 100644
--- a/src/data_layout.h
+++ b/src/data_layout.h
@@ -64,4 +64,6 @@ get_bct_size_from_image(build_image_context *context);
 int
 begin_update(build_image_context *context);
 
+int
+resign_bl(build_image_context *context);
 #endif /* #ifndef INCLUDED_DATA_LAYOUT_H */
diff --git a/src/parse.c b/src/parse.c
index d2f4016effd8..55d4125b7cb2 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -80,6 +80,8 @@ static int
 parse_dev_param(build_image_context *context, parse_token token, char *rest);
 static int
 parse_sdram_param(build_image_context *context, parse_token token, char *rest);
+static int
+parse_sign_bl(build_image_context *context, parse_token token, char *rest);
 
 static int process_statement(build_image_context *context,
 				char *str,
@@ -121,6 +123,7 @@ static parse_item s_top_level_items[] = {
 	{ "RsaKeyModulusFile=", token_rsa_key_modulus,	parse_rsa_param },
 	{ "RsaPssSigBlFile=",   token_rsa_pss_sig_bl,	parse_rsa_param },
 	{ "RsaPssSigBctFile=",  token_rsa_pss_sig_bct,	parse_rsa_param },
+	{ "ReSignBl",       token_sign_bl,		parse_sign_bl },
 	{ NULL, 0, NULL } /* Must be last */
 };
 
@@ -689,6 +692,12 @@ parse_bct_file(build_image_context *context, parse_token token, char *rest)
 	return 0;
 }
 
+static int
+parse_sign_bl(build_image_context *context, parse_token token, char *rest)
+{
+	return resign_bl(context);
+}
+
 static char *
 parse_end_state(char *str, char *uname, int chars_remaining)
 {
diff --git a/src/parse.h b/src/parse.h
index 16242a5c2701..69f7abe1d405 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -117,6 +117,7 @@ typedef enum
 	token_rsa_key_modulus,
 	token_rsa_pss_sig_bl,
 	token_rsa_pss_sig_bct,
+	token_sign_bl,
 
 	token_nand_clock_divider,
 	token_nand_nand_timing,
-- 
1.8.1.5
