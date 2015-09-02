From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 7/8] Add new command line option "--sign | -n" to sign binary image
Date: Wed, 2 Sep 2015 14:19:19 -0700
Message-ID: <1441228760-26042-8-git-send-email-jimmzhang@nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This option allows cbootimage to run as signing utility.

Command line option "--sign" syntax:

   $ cbootimage --sign <sign.cfg> <input_image> <output_image>

Where sign.cfg is the configuration file. Keyword "RsaSign" specifies
signing details such as signing sections starting offset, length, and
the location to store signature and pubkey.

Keyword "RsaSign" syntax:

    RsaSign = <sign_offset>, <sign_length>, <signature_loc>, [modulus_loc,] Complete;

If no values are specified, default values are assigned as:
    sign_offset: 0
    sign_length: input_image_size - sign_offset
    signature_loc: 0
    modulus_loc: 0

Parameter <modulus_loc> is optional.

A sample configuration file sign.cfg:
    PkcKey = rsa_priv.txt;
    RsaSign = 0x220,, 288, 16, Complete;

Command line example:

    $ cbootimage --sign sign.cfg image.bin image.bin-signed

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.c  |  29 ++++++-
 src/cbootimage.h  |  12 +++
 src/crypto.c      |   8 +-
 src/crypto.h      |   3 +
 src/data_layout.c | 232 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/data_layout.h |   9 ++-
 src/parse.c       |  63 +++++++++++++++
 src/parse.h       |   1 +
 8 files changed, 353 insertions(+), 4 deletions(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index 9b696519377a..4ff4ce52a490 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -50,6 +50,7 @@ struct option cbootcmd[] = {
 	{"odmdata", 1, NULL, 'o'},
 	{"soc", 1, NULL, 's'},
 	{"update", 0, NULL, 'u'},
+	{"sign", 0, NULL, 'n'},
 	{0, 0, 0, 0},
 };
 
@@ -80,9 +81,13 @@ usage(void)
 	printf("    -u|--update           Copy input image data and update bct\n");
 	printf("                          configs into new image file.\n");
 	printf("                          This feature is only for tegra114/124/210.\n");
+	printf("    -n|--sign             Sign input image data on specified\n");
+	printf("			  offset and length. Then save image\n");
+	printf("			  along with signature to output file\n");
 	printf("    configfile            File with configuration information\n");
 	printf("    inputimage            Input image name. This is required\n");
-	printf("                          if -u|--update option is used.\n");
+	printf("                          if either -u|--update option or \n");
+	printf("                                    -n|--sign option is used.\n");
 	printf("    outputimage           Output image name\n");
 }
 
@@ -93,7 +98,7 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 
 	context->generate_bct = 0;
 
-	while ((c = getopt_long(argc, argv, "hdg:t:o:s:u", cbootcmd, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "hdg:t:o:s:un", cbootcmd, NULL)) != -1) {
 		switch (c) {
 		case 'h':
 			help_only = 1;
@@ -146,6 +151,10 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 			context->update_image = 1;
 			num_filenames = 3;
 			break;
+		case 'n':
+			context->sign_image = 1;
+			num_filenames = 3;
+			break;
 		}
 	}
 
@@ -180,6 +189,12 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 		context->input_image_filename = argv[optind++];
 	}
 
+	/* Record the input image filename if signing image */
+	if (context->sign_image)
+	{
+		context->input_image_filename = argv[optind++];
+	}
+
 	/* Record the output filename */
 	context->output_image_filename = argv[optind++];
 
@@ -279,6 +294,16 @@ main(int argc, char *argv[])
 			context.output_image_filename);
 		goto fail;
 	}
+	else if (context.sign_image) {
+		process_config_file(&context, 1);
+		if (save_rsa_signed_image(&context))
+			printf("Error writing image file %s.\n",
+				context.output_image_filename);
+		else
+			printf("Image file %s has been successfully generated!\n",
+				context.output_image_filename);
+		goto fail;
+	}
 	/* If we aren't generating the bct, read in config file */
 	else if (context.generate_bct == 0)
 		process_config_file(&context, 1);
diff --git a/src/cbootimage.h b/src/cbootimage.h
index afb72741c8d8..a8ed07ce3e4e 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -54,6 +54,12 @@
 
 #define NVBOOT_CONFIG_TABLE_SIZE_MAX (10 * 1024)
 
+#define INVALID_VALUE	(0x01 << 31)
+#define DATA_BLOCK_SIZE 0x8000
+
+#define is_overlapping(s1, l1, s2, l2)	\
+		(((s1 + l1) > s2) && (s1 < (s2 + l2)))
+
 /*
  * Enumerations
  */
@@ -128,6 +134,12 @@ typedef struct build_image_context_rec
 	u_int8_t secure_jtag_control; /* The flag for enabling jtag control */
 	u_int32_t secure_debug_control; /* The flag for enabling jtag control */
 	u_int8_t update_image; /* The flag for updating image */
+	u_int8_t sign_image; /* The flag for sign image */
+	u_int32_t sign_offset;
+	u_int32_t sign_length;
+	u_int32_t signature_offset;
+	u_int32_t modulus_offset;
+	void *rsa_signature;
 } build_image_context;
 
 /* Function prototypes */
diff --git a/src/crypto.c b/src/crypto.c
index c88573208ec6..6dadda10030c 100644
--- a/src/crypto.c
+++ b/src/crypto.c
@@ -258,7 +258,8 @@ sign_data_block(u_int8_t *source,
 				signature);
 }
 
-static u_int8_t *pkc_get_pubkey(void *key)
+u_int8_t
+*pkc_get_pubkey(void *key)
 {
 	NvTegraPkcKey *pPkcKey = (NvTegraPkcKey *)key;
 	return (u_int8_t *)pPkcKey->Modulus.Number;
@@ -273,6 +274,11 @@ pkc_sign_buffer(void *key, u_int8_t *buffer, u_int32_t size, u_int8_t **pSign)
 
 	NvTegraPkcKey *pPkcKey = (NvTegraPkcKey *)key;
 
+	if (pPkcKey == NULL) {
+		printf("Error: No valid pkc keys found\n");
+		return -ENODATA;
+	}
+
 	/* TODO: define constant for ssk.len */
 	ssk.len = (UINT)pPkcKey->Modulus.Digits; /* length in digits of modulus in term of 32 bits */
 	ssk.modulus = malloc(NBYTE(ssk.len));
diff --git a/src/crypto.h b/src/crypto.h
index 53a0d20f3441..c8ea0b66efaf 100644
--- a/src/crypto.h
+++ b/src/crypto.h
@@ -94,6 +94,9 @@ int pkckey_set(u_int8_t *key_buffer,
 		void **pkckey,
 		int save);
 
+u_int8_t
+*pkc_get_pubkey(void *key);
+
 int
 pkc_sign_buffer(void *key,
 		u_int8_t *buffer,
diff --git a/src/data_layout.c b/src/data_layout.c
index ce3739ac67d9..050f2bb9d2d1 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -1134,3 +1134,235 @@ int resign_bl(build_image_context *context)
 	free (image);
 	return ret;
 }
+
+int rsa_sign_image(build_image_context *context)
+{
+	int ret;
+	struct stat stats;
+	u_int8_t   *image = NULL;
+	u_int32_t  image_actual_size; /* In bytes */
+	u_int8_t   *sign;
+
+	if (stat(context->input_image_filename, &stats) != 0) {
+		printf("Error: Unable to query info on input file %s\n",
+			context->input_image_filename);
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	if (enable_debug) {
+		printf("       image size %#x\n"
+			"       sign_offset %#x, sign_length %#x\n"
+			"       signature location %#x\n",
+				(unsigned int)stats.st_size,
+				context->sign_offset,
+				context->sign_length,
+				context->signature_offset);
+
+		if (context->modulus_offset != INVALID_VALUE)
+			printf("       rsa key modulus location %#x\n",
+				context->modulus_offset);
+	}
+
+	/* check signing section and signature location */
+	if (((context->sign_offset + context->sign_length) > stats.st_size) ||
+	    ((context->signature_offset + RSA_KEY_BYTE_SIZE) >
+		 stats.st_size)) {
+		printf("Error: Incorrect parameters are specified:\n"
+			"       image size %#x\n"
+			"       sign_offset %#x, sign_length %#x\n"
+			"       signature location %#x\n",
+				(unsigned int)stats.st_size,
+				context->sign_offset,
+				context->sign_length,
+				context->signature_offset);
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	/* check modulus location if specified */
+	if ((context->modulus_offset != INVALID_VALUE) &&
+	    ((context->modulus_offset + RSA_KEY_BYTE_SIZE) > stats.st_size)) {
+		printf("Error: Incorrect modulus location specified: "
+				"%#x in file %s\n",
+				context->modulus_offset,
+				context->input_image_filename);
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	/* update sign_length if default value is given */
+	if (context->sign_length == 0)
+		context->sign_length = stats.st_size - context->sign_offset;
+
+	/* check overlapping between signing section and signature location */
+	if (is_overlapping(context->signature_offset, RSA_KEY_BYTE_SIZE,
+				context->sign_offset, context->sign_length)) {
+		printf("Error: signature overlaps signed sections: "
+			"signed offset %#x length %#x, signature location %#x\n",
+			context->sign_offset,
+			context->sign_length,
+			context->signature_offset);
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	/*
+	 * check overlapping between modulus location and signature location
+	 * and overlapping between modulus location and signing section
+	 */
+	if (context->modulus_offset != INVALID_VALUE) {
+		if (is_overlapping(context->modulus_offset, RSA_KEY_BYTE_SIZE,
+			context->signature_offset, RSA_KEY_BYTE_SIZE)) {
+			printf("Error: modulus overlaps signature: "
+				"signature location %#x length %#x, modulus "
+				"location %#x length %#x\n",
+			context->signature_offset, RSA_KEY_BYTE_SIZE,
+			context->modulus_offset, RSA_KEY_BYTE_SIZE);
+			ret = -EINVAL;
+			goto fail;
+		}
+
+		if (is_overlapping(context->modulus_offset, RSA_KEY_BYTE_SIZE,
+				context->sign_offset, context->sign_length)) {
+			printf("Error: modulus overlaps signed sections: "
+				"signed offset %#x length %#x, modulus "
+				"location %#x length %#x\n",
+			context->sign_offset,
+			context->sign_length,
+			context->modulus_offset, RSA_KEY_BYTE_SIZE);
+			ret = -EINVAL;
+			goto fail;
+		}
+	}
+
+	ret = read_from_image(context->input_image_filename,
+				context->sign_offset,
+				context->sign_length,
+				&image, &image_actual_size, file_type_blocks);
+
+	if (ret || (image_actual_size != context->sign_length)) {
+		printf("Error reading image file %s: offset %#x, length %#x\n",
+			context->input_image_filename,
+			context->sign_offset,
+			context->sign_length);
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	/* sign image */
+	if ((ret = pkc_sign_buffer(context->pkckey,
+					image,
+					image_actual_size,
+					&sign)) != 0)
+		goto fail;
+
+	/* return signature location */
+	context->rsa_signature = sign;
+
+ fail:
+	if (image)
+		free(image);
+
+	return ret;
+}
+
+/*
+ * To write output image:
+ *   Loop over all blocks:
+ *	read in a block (adjust size if necessary)
+ *	if signature section is in, fill in signature
+ *	save data block
+ * 	then loop
+ *
+ * @param context		The main context pointer
+ * @return 0 for success
+ */
+int
+save_rsa_signed_image(build_image_context *context)
+{
+	int ret = 0;
+	u_int32_t offset = 0, req_size, actual_size;
+	u_int8_t *data_block;
+	struct stat stats;
+
+	if (stat(context->input_image_filename, &stats) != 0) {
+		printf("Error: Unable to query info on input file path %s\n",
+			context->input_image_filename);
+		ret = -1;
+		goto fail;
+	}
+
+	while (stats.st_size > offset) {
+		if ((stats.st_size - offset) > DATA_BLOCK_SIZE)
+			req_size = DATA_BLOCK_SIZE;
+		else
+			req_size = stats.st_size - offset;
+
+		/* make sure signature's completion */
+		if (((offset + req_size) > context->signature_offset) &&
+			((offset + req_size) <
+			(context->signature_offset + RSA_KEY_BYTE_SIZE))) {
+			req_size = context->signature_offset + RSA_KEY_BYTE_SIZE
+					- offset;
+		}
+
+		/* if modulus is needed, make sure mudulus's completion */
+		if ((context->modulus_offset != INVALID_VALUE) &&
+		    (((offset + req_size) > context->modulus_offset) &&
+			((offset + req_size) <
+			(context->modulus_offset + RSA_KEY_BYTE_SIZE)))) {
+			req_size = context->modulus_offset + RSA_KEY_BYTE_SIZE
+					- offset;
+		}
+
+		/* Read a block of data into memory */
+		ret = read_from_image(context->input_image_filename,
+					offset,
+					req_size,
+					&data_block,
+					&actual_size,
+					file_type_blocks);
+		if (ret || (req_size != actual_size)) {
+			printf("Error reading image file %s.\n",
+				context->input_image_filename);
+			ret = -1;
+			goto fail;
+		}
+
+		/* fill in signature section */
+		if ((offset <= context->signature_offset) &&
+			((offset + req_size) >=
+			(context->signature_offset + RSA_KEY_BYTE_SIZE))) {
+			memcpy(data_block + (context->signature_offset - offset),
+				context->rsa_signature,
+				RSA_KEY_BYTE_SIZE);
+		}
+
+		/* if modulus is needed, fill in mudulus section */
+		if ((context->modulus_offset != INVALID_VALUE) &&
+		    ((offset <= context->modulus_offset) &&
+			((offset + req_size) >=
+			(context->modulus_offset + RSA_KEY_BYTE_SIZE)))) {
+			memcpy(data_block + (context->modulus_offset - offset),
+				pkc_get_pubkey(context->pkckey),
+				RSA_KEY_BYTE_SIZE);
+		}
+
+		/* Write the block of data to file */
+		if (actual_size != write_data_block(context->raw_file, offset,
+						 actual_size, data_block)) {
+			printf("Error writing image file %s.\n",
+				context->output_image_filename);
+			goto fail;
+		}
+
+		offset += actual_size;
+		free(data_block);
+		data_block = NULL;
+	}
+ fail:
+	if (data_block)
+		free(data_block);
+	return ret;
+}
diff --git a/src/data_layout.h b/src/data_layout.h
index 3b2cfb58f3e9..eb38bfab27b8 100644
--- a/src/data_layout.h
+++ b/src/data_layout.h
@@ -64,5 +64,12 @@ get_bct_size_from_image(build_image_context *context);
 int
 begin_update(build_image_context *context);
 
-int resign_bl(build_image_context *context);
+int
+resign_bl(build_image_context *context);
+
+int
+rsa_sign_image(build_image_context *context);
+
+int
+save_rsa_signed_image(build_image_context *context);
 #endif /* #ifndef INCLUDED_DATA_LAYOUT_H */
diff --git a/src/parse.c b/src/parse.c
index d37a442030c0..d21387943f28 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -76,6 +76,8 @@ static int
 parse_bct_file(build_image_context *context, parse_token token, char *rest);
 static int
 parse_pkckey_file(build_image_context *context, parse_token token, char *rest);
+static int
+parse_rsa_sign_image(build_image_context *context, parse_token token, char *rest);
 static char
 *parse_end_state(char *str, char *uname, int chars_remaining);
 static int
@@ -96,6 +98,7 @@ static parse_item parse_simple_items[] =
 	{ "Redundancy=",    token_redundancy,		parse_value_u32 },
 	{ "Bctcopy=",       token_bct_copy,		parse_value_u32 },
 	{ "PkcKey=",        token_pkckey_file,		parse_pkckey_file},
+	{ "RsaSign=",       token_rsa_sign_image,	parse_rsa_sign_image},
 	{ "MtsPreboot=",    token_mts_preboot,		parse_mts_image},
 	{ "Mts=",           token_mts,			parse_mts_image},
 	{ "Version=",       token_version,		parse_value_u32 },
@@ -437,6 +440,66 @@ static int parse_bootloader(build_image_context *context,
 }
 
 /*
+ * Parse the given string and find signing offset, length and signature location
+ *
+ * @param context	The main context pointer
+ * @param token  	The parse token value
+ * @param rest   	String to parse
+ * @return 0 and 1 for success and failure
+ */
+static int parse_rsa_sign_image(build_image_context *context,
+			parse_token token,
+			char *rest)
+{
+	char e_state[MAX_STR_LEN];
+
+	assert(context != NULL);
+	assert(rest != NULL);
+
+	/* Parse the sign section starting address. */
+	rest = parse_u32(rest, &context->sign_offset);
+	if (rest == NULL)
+		return 1;
+
+	PARSE_COMMA(1);
+
+	/* Parse the sign section length. */
+	rest = parse_u32(rest, &context->sign_length);
+	if (rest == NULL)
+		return 1;
+
+	PARSE_COMMA(1);
+
+	/* Parse the signature store location. */
+	rest = parse_u32(rest, &context->signature_offset);
+	if (rest == NULL)
+		return 1;
+
+	PARSE_COMMA(1);
+
+	/* parse the optional modulus location */
+	rest = parse_u32(rest, &context->modulus_offset);
+	if (rest == NULL)
+		return 1;
+
+	if (*rest == ',') {
+		/* modulus location is specified */
+		++rest;
+	} else
+		context->modulus_offset = INVALID_VALUE;
+
+	/* Parse the end state. */
+	rest = parse_end_state(rest, e_state, MAX_STR_LEN);
+	if (rest == NULL)
+		return 1;
+	if (strncmp(e_state, "Complete", strlen("Complete")))
+		return 1;
+
+	/* Parsing has finished - sign on specified image sections */
+	return rsa_sign_image(context);
+}
+
+/*
  * Parse the given string and find the MTS file name, load address and
  * entry point information then call set_mts_image function.
  *
diff --git a/src/parse.h b/src/parse.h
index 26618edf9c87..133d8ab4ae29 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -42,6 +42,7 @@ typedef enum
 	token_attribute,
 	token_bootloader,
 	token_pkckey_file,
+	token_rsa_sign_image,
 	token_mts_preboot,
 	token_mts,
 	token_block_size,
-- 
1.8.1.5
