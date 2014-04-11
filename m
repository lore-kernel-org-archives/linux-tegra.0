From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V3 7/7] Add update BCT configs feature
Date: Fri, 11 Apr 2014 17:50:43 +0800
Message-ID: <1397209843-31275-8-git-send-email-pchiu@nvidia.com>
References: <1397209843-31275-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397209843-31275-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This feature reads the BCT data from BCT or BCT with bootloader
appended binary, updates the BCT data based on config file, then
writes to new image file.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.c         | 103 ++++++++++++++++++++++++++++++++++++++++-------
 src/cbootimage.h         |   6 ++-
 src/data_layout.c        |  72 +++++++++++++++++++++++++++------
 src/data_layout.h        |   9 +++++
 src/parse.h              |   7 ++++
 src/set.c                |  28 +++++++++----
 src/set.h                |   2 +
 src/t114/nvbctlib_t114.c |   6 +++
 src/t124/nvbctlib_t124.c |   6 +++
 src/t20/nvbctlib_t20.c   |   6 +++
 src/t30/nvbctlib_t30.c   |   6 +++
 11 files changed, 214 insertions(+), 37 deletions(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index 1332c5f..2fdb0f2 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -49,6 +49,7 @@ struct option cbootcmd[] = {
 	{"tegra", 1, NULL, 't'},
 	{"odmdata", 1, NULL, 'o'},
 	{"soc", 1, NULL, 's'},
+	{"update", 0, NULL, 'u'},
 	{0, 0, 0, 0},
 };
 
@@ -63,7 +64,7 @@ write_image_file(build_image_context *context)
 static void
 usage(void)
 {
-	printf("Usage: cbootimage [options] configfile imagename\n");
+	printf("Usage: cbootimage [options] configfile [inputimage] outputimage\n");
 	printf("    options:\n");
 	printf("    -h, --help, -?        Display this message.\n");
 	printf("    -d, --debug           Output debugging information.\n");
@@ -75,18 +76,23 @@ usage(void)
 	printf("    -s|--soc tegraNN      Select target device. Must be one of:\n");
 	printf("                          tegra20, tegra30, tegra114, tegra124.\n");
 	printf("                          Default: tegra20.\n");
+	printf("    -u|--update           Copy input image data and update bct\n");
+	printf("                          configs into new image file.\n");
+	printf("                          This feature is only for tegra114/124.\n");
 	printf("    configfile            File with configuration information\n");
-	printf("    imagename             Output image name\n");
+	printf("    inputimage            Input image name. This is required\n");
+	printf("                          if -u|--update option is used.\n");
+	printf("    outputimage           Output image name\n");
 }
 
 static int
 process_command_line(int argc, char *argv[], build_image_context *context)
 {
-	int c;
+	int c, num_filenames = 2;
 
 	context->generate_bct = 0;
 
-	while ((c = getopt_long(argc, argv, "hdg:t:o:s:", cbootcmd, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "hdg:t:o:s:u", cbootcmd, NULL)) != -1) {
 		switch (c) {
 		case 'h':
 			help_only = 1;
@@ -131,10 +137,14 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 		case 'o':
 			context->odm_data = strtoul(optarg, NULL, 16);
 			break;
+		case 'u':
+			context->update_image = 1;
+			num_filenames = 3;
+			break;
 		}
 	}
 
-	if (argc - optind != 2) {
+	if (argc - optind != num_filenames) {
 		printf("Missing configuration and/or image file name.\n");
 		usage();
 		return -EINVAL;
@@ -145,14 +155,26 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 		t20_get_soc_config(context, &g_soc_config);
 
 	/* Open the configuration file. */
-	context->config_file = fopen(argv[optind], "r");
+	context->config_file = fopen(argv[optind++], "r");
 	if (context->config_file == NULL) {
 		printf("Error opening config file.\n");
 		return -ENODATA;
 	}
 
+	/* Record the input image filename if update_image is necessary */
+	if (context->update_image)
+	{
+		if (context->boot_data_version != BOOTDATA_VERSION_T114 &&
+			context->boot_data_version != BOOTDATA_VERSION_T124) {
+			printf("Update image feature is only for Tegra114 and Tegra124.\n");
+			return -EINVAL;
+		}
+
+		context->input_image_filename = argv[optind++];
+	}
+
 	/* Record the output filename */
-	context->image_filename = argv[optind + 1];
+	context->output_image_filename = argv[optind++];
 
 	return 0;
 }
@@ -190,18 +212,69 @@ main(int argc, char *argv[])
 	}
 
 	/* Open the raw output file. */
-	context.raw_file = fopen(context.image_filename,
-		                 "w+");
+	context.raw_file = fopen(context.output_image_filename, "w+");
 	if (context.raw_file == NULL) {
 		printf("Error opening raw file %s.\n",
-			context.image_filename);
+			context.output_image_filename);
 		goto fail;
 	}
 
-	/* first, if we aren't generating the bct, read in config file */
-	if (context.generate_bct == 0) {
-		process_config_file(&context, 1);
+	/* Read the bct data from image if bct configs needs to be updated */
+	if (context.update_image) {
+		u_int32_t offset = 0, bct_size, actual_size;
+		u_int8_t *data_block;
+		struct stat stats;
+
+		if (stat(context.input_image_filename, &stats) != 0) {
+			printf("Error: Unable to query info on input file path %s\n",
+			context.input_image_filename);
+			goto fail;
+		}
+
+		/* Get BCT_SIZE from input image file  */
+		bct_size = get_bct_size_from_image(&context);
+		if (!bct_size) {
+			printf("Error: Invalid input image file %s\n",
+			context.input_image_filename);
+			goto fail;
+		}
+
+		while (stats.st_size > offset) {
+			/* Read a block of data into memory */
+			if (read_from_image(context.input_image_filename, offset, bct_size,
+					&data_block, &actual_size, file_type_bct)) {
+				printf("Error reading image file %s.\n", context.input_image_filename);
+				goto fail;
+			}
+
+			/* Check if memory data is valid BCT */
+			context.bct = data_block;
+			if (data_is_valid_bct(&context)) {
+				fseek(context.config_file, 0, SEEK_SET);
+				process_config_file(&context, 0);
+				e = sign_bct(&context, context.bct);
+				if (e != 0) {
+					printf("Signing BCT failed, error: %d.\n", e);
+					goto fail;
+				}
+			}
+
+			/* Write the block of data to file */
+			if (actual_size != write_data_block(context.raw_file, offset, actual_size, data_block)) {
+				printf("Error writing image file %s.\n", context.output_image_filename);
+				goto fail;
+			}
+
+			offset += bct_size;
+		}
+
+		printf("Image file %s has been successfully generated!\n",
+			context.output_image_filename);
+		goto fail;
 	}
+	/* If we aren't generating the bct, read in config file */
+	else if (context.generate_bct == 0)
+		process_config_file(&context, 1);
 	/* Generate the new bct file */
 	else {
 		/* Initialize the bct memory */
@@ -218,7 +291,7 @@ main(int argc, char *argv[])
 		fwrite(context.bct, 1, context.bct_size,
 			context.raw_file);
 		printf("New BCT file %s has been successfully generated!\n",
-			context.image_filename);
+			context.output_image_filename);
 		goto fail;
 	}
 
@@ -234,7 +307,7 @@ main(int argc, char *argv[])
 		printf("Error writing image file.\n");
 	else
 		printf("Image file %s has been successfully generated!\n",
-				context.image_filename);
+				context.output_image_filename);
 
  fail:
 	/* Close the file(s). */
diff --git a/src/cbootimage.h b/src/cbootimage.h
index ed3b2f9..6def766 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -45,6 +45,8 @@
 #define BOOTDATA_VERSION_T114		NVBOOT_BOOTDATA_VERSION(0x35, 0x1)
 #define BOOTDATA_VERSION_T124		NVBOOT_BOOTDATA_VERSION(0x40, 0x1)
 
+#define NVBOOT_CONFIG_TABLE_SIZE_MAX 8192
+
 /*
  * Enumerations
  */
@@ -61,7 +63,8 @@ typedef enum
 typedef struct build_image_context_rec
 {
 	FILE *config_file;
-	char *image_filename;
+	char *output_image_filename;
+	char *input_image_filename;
 	FILE *raw_file;
 	u_int32_t block_size;
 	u_int32_t block_size_log2;
@@ -99,6 +102,7 @@ typedef struct build_image_context_rec
 	u_int32_t odm_data; /* The odm data value */
 	u_int8_t unique_chip_id[16]; /* The unique chip uid */
 	u_int8_t secure_jtag_control; /* The flag for enabling jtag control */
+	u_int8_t update_image; /* The flag for updating image */
 } build_image_context;
 
 /* Function prototypes */
diff --git a/src/data_layout.c b/src/data_layout.c
index 0a64ec2..c848a61 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -451,6 +451,8 @@ write_bootloaders(build_image_context *context)
 
 	/* Read the BL into memory. */
 	if (read_from_image(context->newbl_filename,
+		0,
+		MAX_BOOTLOADER_SIZE,
 		&bl_storage,
 		&bl_actual_size,
 		bl_filetype) == 1) {
@@ -670,12 +672,15 @@ read_bct_file(struct build_image_context_rec *context)
 	int err = 0;
 
 	if (read_from_image(context->bct_filename,
-		&bct_storage,
-		&bct_actual_size,
-		bct_filetype) == 1) {
+			0,
+			NVBOOT_CONFIG_TABLE_SIZE_MAX,
+			&bct_storage,
+			&bct_actual_size,
+			bct_filetype) == 1) {
 		printf("Error reading bct file %s.\n", context->bct_filename);
 		exit(1);
 	}
+
 	context->bct_size = bct_actual_size;
 	if (context->bct_init != 1)
 		err = init_bct(context);
@@ -686,18 +691,12 @@ read_bct_file(struct build_image_context_rec *context)
 	memcpy(context->bct, bct_storage, context->bct_size);
 	free(bct_storage);
 
-	/* get proper soc_config pointer by polling each supported chip */
-	if (if_bct_is_t20_get_soc_config(context, &g_soc_config))
-		return 0;
-	if (if_bct_is_t30_get_soc_config(context, &g_soc_config))
-		return 0;
-	if (if_bct_is_t114_get_soc_config(context, &g_soc_config))
-		return 0;
-	if (if_bct_is_t124_get_soc_config(context, &g_soc_config))
-		return 0;
+	if (!data_is_valid_bct(context))
+		return ENODATA;
 
-	return ENODATA;
+	return err;
 }
+
 /*
  * Update the next_bct_blk and make it point to the next
  * new blank block according to bct_copy given.
@@ -898,3 +897,50 @@ write_block_raw(build_image_context *context)
 	free(empty_blk);
 	return 0;
 }
+
+int write_data_block(FILE *fp, u_int32_t offset, u_int32_t size, u_int8_t *buffer)
+{
+	if (fseek(fp, offset, 0))
+		return -1;
+
+	return fwrite(buffer, 1, size, fp);
+}
+
+int data_is_valid_bct(build_image_context *context)
+{
+	/* get proper soc_config pointer by polling each supported chip */
+	if (if_bct_is_t20_get_soc_config(context, &g_soc_config))
+		return 1;
+	if (if_bct_is_t30_get_soc_config(context, &g_soc_config))
+		return 1;
+	if (if_bct_is_t114_get_soc_config(context, &g_soc_config))
+		return 1;
+	if (if_bct_is_t124_get_soc_config(context, &g_soc_config))
+		return 1;
+
+	return 0;
+}
+
+int get_bct_size_from_image(build_image_context *context)
+{
+	u_int8_t buffer[NVBOOT_CONFIG_TABLE_SIZE_MAX];
+	u_int32_t bct_size = 0;
+	FILE *fp;
+
+	fp = fopen(context->input_image_filename, "r");
+	if (!fp)
+		return ENODATA;
+
+	if (!fread(buffer, 1, NVBOOT_CONFIG_TABLE_SIZE_MAX, fp)) {
+		fclose(fp);
+		return ENODATA;
+	}
+
+	context->bct = buffer;
+	if (data_is_valid_bct(context) && g_soc_config->get_bct_size)
+		bct_size = g_soc_config->get_bct_size();
+
+	fclose(fp);
+	context->bct = 0;
+	return bct_size;
+}
diff --git a/src/data_layout.h b/src/data_layout.h
index 9ee8267..12da165 100644
--- a/src/data_layout.h
+++ b/src/data_layout.h
@@ -50,6 +50,15 @@ int
 write_block_raw(struct build_image_context_rec *context);
 
 int
+write_data_block(FILE *fp, u_int32_t offset, u_int32_t size, u_int8_t *buffer);
+
+int
+data_is_valid_bct(build_image_context *context);
+
+int
+get_bct_size_from_image(build_image_context *context);
+
+int
 begin_update(build_image_context *context);
 
 #endif /* #ifndef INCLUDED_DATA_LAYOUT_H */
diff --git a/src/parse.h b/src/parse.h
index 114168c..64d0a65 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -753,6 +753,13 @@ typedef struct cbootimage_soc_config_rec {
 			u_int8_t *bct);
 
 	/*
+	 * Get the BCT structure size
+	 *
+	 * @return BCT size
+	 */
+	int (*get_bct_size)();
+
+	/*
 	 * Check if the token is supported to dump
 	 *
 	 * @param id  	The parse token value
diff --git a/src/set.c b/src/set.c
index 0419505..130c451 100644
--- a/src/set.c
+++ b/src/set.c
@@ -43,6 +43,8 @@
 
 int
 read_from_image(char	*filename,
+		u_int32_t	offset,
+		u_int32_t	max_size,
 		u_int8_t	**image,
 		u_int32_t	*actual_size,
 		file_type	f_type)
@@ -57,6 +59,8 @@ read_from_image(char	*filename,
 		return result;
 	}
 
+	fseek(fp, offset, SEEK_SET);
+
 	if (stat(filename, &stats) != 0) {
 		printf("Error: Unable to query info on bootloader path %s\n",
 			filename);
@@ -64,14 +68,21 @@ read_from_image(char	*filename,
 		goto cleanup;
 	}
 
-	*actual_size  = (u_int32_t)stats.st_size;
-
-	if (f_type == file_type_bl && *actual_size > MAX_BOOTLOADER_SIZE) {
-		printf("Error: Bootloader file %s is too large.\n",
-			filename);
-		result = 1;
-		goto cleanup;
+	if (f_type == file_type_bl) {
+		if ((stats.st_size - offset) > max_size) {
+			printf("Error: Bootloader file %s is too large.\n",
+				filename);
+			result = 1;
+			goto cleanup;
+		}
+		*actual_size = (u_int32_t)stats.st_size;
+	} else {
+		if ((stats.st_size - offset) < max_size)
+			*actual_size = stats.st_size - offset;
+		else
+			*actual_size = max_size;
 	}
+
 	*image = malloc(*actual_size);
 	if (*image == NULL) {
 		result = 1;
@@ -80,7 +91,8 @@ read_from_image(char	*filename,
 
 	memset(*image, 0, *actual_size);
 
-	if (fread(*image, 1, (size_t)stats.st_size, fp) != stats.st_size) {
+	if (fread(*image, 1, (size_t)(*actual_size), fp) !=
+		(size_t)(*actual_size)) {
 		result = 1;
 		goto cleanup;
 	}
diff --git a/src/set.h b/src/set.h
index 754ed7a..97ecc76 100644
--- a/src/set.h
+++ b/src/set.h
@@ -42,6 +42,8 @@ context_set_value(build_image_context	*context,
 
 int
 read_from_image(char *filename,
+		u_int32_t	offset,
+		u_int32_t	max_size,
 		u_int8_t	**Image,
 		u_int32_t	*actual_size,
 		file_type	f_type);
diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c
index 5b1f28b..dad8f4f 100644
--- a/src/t114/nvbctlib_t114.c
+++ b/src/t114/nvbctlib_t114.c
@@ -1064,6 +1064,11 @@ t114_bct_set_data(parse_token id,
 	return 0;
 }
 
+int t114_get_bct_size()
+{
+	return sizeof(nvboot_config_table);
+}
+
 int t114_bct_token_supported(parse_token token)
 {
 	int index;
@@ -1108,6 +1113,7 @@ cbootimage_soc_config tegra114_config = {
 	.set_value					= t114_bct_set_value,
 	.get_value					= t114_bct_get_value,
 	.set_data					= t114_bct_set_data,
+	.get_bct_size				= t114_get_bct_size,
 	.token_supported			= t114_bct_token_supported,
 
 	.devtype_table				= s_devtype_table_t114,
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index 5f2c440..5df93cd 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -1077,6 +1077,11 @@ t124_bct_set_data(parse_token id,
 	return 0;
 }
 
+int t124_get_bct_size()
+{
+	return sizeof(nvboot_config_table);
+}
+
 int t124_bct_token_supported(parse_token token)
 {
 	int index;
@@ -1121,6 +1126,7 @@ cbootimage_soc_config tegra124_config = {
 	.set_value					= t124_bct_set_value,
 	.get_value					= t124_bct_get_value,
 	.set_data					= t124_bct_set_data,
+	.get_bct_size				= t124_get_bct_size,
 	.token_supported			= t124_bct_token_supported,
 
 	.devtype_table				= s_devtype_table_t124,
diff --git a/src/t20/nvbctlib_t20.c b/src/t20/nvbctlib_t20.c
index 30a95a3..4e07bf2 100644
--- a/src/t20/nvbctlib_t20.c
+++ b/src/t20/nvbctlib_t20.c
@@ -645,6 +645,11 @@ t20_bct_set_data(parse_token id,
 	return 0;
 }
 
+int t20_get_bct_size()
+{
+	return sizeof(nvboot_config_table);
+}
+
 int t20_bct_token_supported(parse_token token)
 {
 	int index;
@@ -689,6 +694,7 @@ cbootimage_soc_config tegra20_config = {
 	.set_value					= t20_bct_set_value,
 	.get_value					= t20_bct_get_value,
 	.set_data					= t20_bct_set_data,
+	.get_bct_size				= t20_get_bct_size,
 	.token_supported			= t20_bct_token_supported,
 
 	.devtype_table				= s_devtype_table_t20,
diff --git a/src/t30/nvbctlib_t30.c b/src/t30/nvbctlib_t30.c
index 1e9697b..df3bef0 100644
--- a/src/t30/nvbctlib_t30.c
+++ b/src/t30/nvbctlib_t30.c
@@ -852,6 +852,11 @@ t30_bct_set_data(parse_token id,
 	return 0;
 }
 
+int t30_get_bct_size()
+{
+	return sizeof(nvboot_config_table);
+}
+
 int t30_bct_token_supported(parse_token token)
 {
 	int index;
@@ -896,6 +901,7 @@ cbootimage_soc_config tegra30_config = {
 	.set_value					= t30_bct_set_value,
 	.get_value					= t30_bct_get_value,
 	.set_data					= t30_bct_set_data,
+	.get_bct_size				= t30_get_bct_size,
 	.token_supported			= t30_bct_token_supported,
 
 	.devtype_table				= s_devtype_table_t30,
-- 
1.9.1
