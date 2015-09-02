From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 6/8] Add new configuration keyword "ReSignBl"
Date: Wed, 2 Sep 2015 14:19:18 -0700
Message-ID: <1441228760-26042-7-git-send-email-jimmzhang@nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In case an image is updated after initial signing, use "ReSignBl"
to re-generate aes hash and pkc pss signatures if PkcKey is present.

For example:

Define re-sign.cfg as below:
   PkcKey = rsa_priv.pem, --save;
   ReSignBl;

Run command below to re-sign image:
   $ cbootimage -s tegra210 --update re-sign.cfg image image-re-signed

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.h  |  1 +
 src/crypto.c      | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 src/crypto.h      |  6 ++++++
 src/data_layout.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 src/data_layout.h |  1 +
 src/parse.c       |  9 +++++++++
 src/parse.h       |  1 +
 src/set.c         |  2 +-
 8 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/src/cbootimage.h b/src/cbootimage.h
index 8b0faa1e327f..afb72741c8d8 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -65,6 +65,7 @@ typedef enum
 	file_type_mts,
 	file_type_bin,
 	file_type_key,
+	file_type_blocks,
 } file_type;
 
 typedef enum
diff --git a/src/crypto.c b/src/crypto.c
index cc123c79d4ad..c88573208ec6 100644
--- a/src/crypto.c
+++ b/src/crypto.c
@@ -361,12 +361,59 @@ sign_bct(build_image_context *context,
 	return e;
 }
 
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
 		goto fail;
 
+	/* pkc signing? */
+	if (context->pkckey) {
+		u_int8_t *sign;
+
+		if ((e = pkc_sign_buffer(context->pkckey,
+					bootloader,
+					length,
+					&sign)) != 0)
+			goto fail;
+
+		/* save bl sig to file bl.sig */
+		pkc_savefile(BL_FILENAME, (u_int8_t *)sign,
+				RSA_KEY_BYTE_SIZE, EXT_SIGNATURE);
+
+		e = g_soc_config->set_value(token_rsa_pss_sig_bl,
+						sign,
+						context->bct);
+	}
+
  fail:
 	free(hash_buffer);
 	return e;
 }
+
 void
 SwapEndianness(
 	const void *pInData,
diff --git a/src/crypto.h b/src/crypto.h
index 75f961ad63b4..53a0d20f3441 100644
--- a/src/crypto.h
+++ b/src/crypto.h
@@ -101,6 +101,12 @@ pkc_sign_buffer(void *key,
 		u_int8_t **pSign);
 
 int
+sign_bl(build_image_context *context,
+	u_int8_t *bootloader,
+	u_int32_t length,
+	u_int32_t image_instance);
+
+int
 pkc_savefile(const char *pFilename,
 		u_int8_t *buffer,
 		size_t bytes,
diff --git a/src/data_layout.c b/src/data_layout.c
index 21d03c2f507e..ce3739ac67d9 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -1083,3 +1083,54 @@ int get_bct_size_from_image(build_image_context *context)
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
diff --git a/src/data_layout.h b/src/data_layout.h
index c6e53e61be83..3b2cfb58f3e9 100644
--- a/src/data_layout.h
+++ b/src/data_layout.h
@@ -64,4 +64,5 @@ get_bct_size_from_image(build_image_context *context);
 int
 begin_update(build_image_context *context);
 
+int resign_bl(build_image_context *context);
 #endif /* #ifndef INCLUDED_DATA_LAYOUT_H */
diff --git a/src/parse.c b/src/parse.c
index 218ac27d3b33..d37a442030c0 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -82,6 +82,8 @@ static int
 parse_dev_param(build_image_context *context, parse_token token, char *rest);
 static int
 parse_sdram_param(build_image_context *context, parse_token token, char *rest);
+static int
+parse_sign_bl(build_image_context *context, parse_token token, char *rest);
 
 static int process_statement(build_image_context *context,
 				char *str,
@@ -125,6 +127,7 @@ static parse_item s_top_level_items[] = {
 	{ "RsaKeyModulus=", token_pub_key_modulus,	parse_rsa_param },
 	{ "RsaPssSigBl=",   token_rsa_pss_sig_bl,	parse_rsa_param },
 	{ "RsaPssSigBct=",  token_rsa_pss_sig_bct,	parse_rsa_param },
+	{ "ReSignBl",        token_sign_bl,		parse_sign_bl },
 	{ NULL, 0, NULL } /* Must be last */
 };
 
@@ -724,6 +727,12 @@ parse_pkckey_file(build_image_context *context, parse_token token, char *rest)
 	return set_rsa_key(context, filename, save_key);
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
index 15dcadfc3814..26618edf9c87 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -118,6 +118,7 @@ typedef enum
 	token_pub_key_modulus,
 	token_rsa_pss_sig_bl,
 	token_rsa_pss_sig_bct,
+	token_sign_bl,
 
 	token_nand_clock_divider,
 	token_nand_nand_timing,
diff --git a/src/set.c b/src/set.c
index f023c7e94f3b..27fa7691357e 100644
--- a/src/set.c
+++ b/src/set.c
@@ -84,7 +84,7 @@ read_from_image(char	*filename,
 		}
 		*actual_size = (u_int32_t)stats.st_size;
 	} else {
-		if ((stats.st_size - offset) < max_size)
+		if ((max_size == 0) || ((stats.st_size - offset) < max_size))
 			*actual_size = stats.st_size - offset;
 		else
 			*actual_size = max_size;
-- 
1.8.1.5
