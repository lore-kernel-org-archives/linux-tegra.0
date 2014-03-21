From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH 2/2] Add update BCT configs feature
Date: Fri, 21 Mar 2014 17:41:26 +0800
Message-ID: <1395394886-8145-3-git-send-email-pchiu@nvidia.com>
References: <1395394886-8145-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395394886-8145-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This feature reads the BCT data from BCT or BCT with bootloader
appended binary, updates the BCT data based on config file, then
writes to new image file.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c    |  4 ++--
 src/cbootimage.c  | 70 ++++++++++++++++++++++++++++++++++++++++++++-----------
 src/cbootimage.h  |  5 +++-
 src/data_layout.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++-------
 src/data_layout.h |  8 ++++++-
 src/parse.c       |  4 +++-
 src/set.c         | 29 ++++++++++++++++-------
 src/set.h         |  1 +
 8 files changed, 155 insertions(+), 35 deletions(-)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index fa3fdb7..288c0e1 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -148,9 +148,9 @@ int main(int argc, char *argv[])
 		usage();
 
 	memset(&context, 0, sizeof(build_image_context));
-	context.bct_filename = argv[1];
+	context.input_image_filename = argv[1];
 
-	e = read_bct_file(&context);
+	e = read_bct_file(&context, 0);
 	if (e != 0)
 		return e;
 
diff --git a/src/cbootimage.c b/src/cbootimage.c
index 1332c5f..b447c19 100644
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
@@ -75,18 +76,22 @@ usage(void)
 	printf("    -s|--soc tegraNN      Select target device. Must be one of:\n");
 	printf("                          tegra20, tegra30, tegra114, tegra124.\n");
 	printf("                          Default: tegra20.\n");
+	printf("    -u|--update           Copy input image data and update bct\n");
+	printf("                          configs into new image file.\n");
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
+	int c, num_of_filenames = 2;
 
 	context->generate_bct = 0;
 
-	while ((c = getopt_long(argc, argv, "hdg:t:o:s:", cbootcmd, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "hdg:t:o:s:u", cbootcmd, NULL)) != -1) {
 		switch (c) {
 		case 'h':
 			help_only = 1;
@@ -131,10 +136,14 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 		case 'o':
 			context->odm_data = strtoul(optarg, NULL, 16);
 			break;
+		case 'u':
+			context->update_bct = 1;
+			num_of_filenames = 3;
+			break;
 		}
 	}
 
-	if (argc - optind != 2) {
+	if (argc - optind != num_of_filenames) {
 		printf("Missing configuration and/or image file name.\n");
 		usage();
 		return -EINVAL;
@@ -145,14 +154,19 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 		t20_get_soc_config(context, &g_soc_config);
 
 	/* Open the configuration file. */
-	context->config_file = fopen(argv[optind], "r");
+	context->config_file = fopen(argv[optind++], "r");
+
 	if (context->config_file == NULL) {
 		printf("Error opening config file.\n");
 		return -ENODATA;
 	}
 
+	/* Record the input image filename if update_bct is necessary */
+	if (context->update_bct)
+		context->input_image_filename = argv[optind++];
+
 	/* Record the output filename */
-	context->image_filename = argv[optind + 1];
+	context->output_image_filename = argv[optind++];
 
 	return 0;
 }
@@ -190,18 +204,46 @@ main(int argc, char *argv[])
 	}
 
 	/* Open the raw output file. */
-	context.raw_file = fopen(context.image_filename,
+	context.raw_file = fopen(context.output_image_filename,
 		                 "w+");
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
+	if (context.update_bct) {
+		u_int32_t offset = 0;
+		struct stat stats;
+
+		if (stat(context.input_image_filename, &stats) != 0) {
+			printf("Error: Unable to query info on input file path %s\n",
+			context.input_image_filename);
+			goto fail;
+		}
+
+		while (stats.st_size > offset) {
+			if (!read_bct_file(&context, offset)) {
+				process_config_file(&context, 0);
+				e = sign_bct(&context, context.bct);
+				if (e != 0) {
+					printf("Signing BCT failed, error: %d.\n", e);
+					goto fail;
+				}
+				write_bct_raw(&context);
+			} else
+				write_data_raw(&context, offset, NVBOOT_CONFIG_TABLE_SIZE);
+
+			offset += NVBOOT_CONFIG_TABLE_SIZE;
+		}
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
@@ -218,7 +260,7 @@ main(int argc, char *argv[])
 		fwrite(context.bct, 1, context.bct_size,
 			context.raw_file);
 		printf("New BCT file %s has been successfully generated!\n",
-			context.image_filename);
+			context.output_image_filename);
 		goto fail;
 	}
 
@@ -234,7 +276,7 @@ main(int argc, char *argv[])
 		printf("Error writing image file.\n");
 	else
 		printf("Image file %s has been successfully generated!\n",
-				context.image_filename);
+				context.output_image_filename);
 
  fail:
 	/* Close the file(s). */
diff --git a/src/cbootimage.h b/src/cbootimage.h
index 252c41e..d8a77d9 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -37,6 +37,7 @@
 #define MAX_BOOTLOADER_SIZE (16 * 1024 * 1024)
 #define NVBOOT_BOOTDATA_VERSION(a, b) ((((a)&0xffff) << 16) | ((b)&0xffff))
 #define NVBOOT_BAD_BLOCK_TABLE_SIZE 4096
+#define NVBOOT_CONFIG_TABLE_SIZE 8192
 #define NV_MAX(a, b) (((a) > (b)) ? (a) : (b))
 
 #define BOOTDATA_VERSION_T20		NVBOOT_BOOTDATA_VERSION(0x2, 0x1)
@@ -60,7 +61,8 @@ typedef enum
 typedef struct build_image_context_rec
 {
 	FILE *config_file;
-	char *image_filename;
+	char *output_image_filename;
+	char *input_image_filename;
 	FILE *raw_file;
 	u_int32_t block_size;
 	u_int32_t block_size_log2;
@@ -98,6 +100,7 @@ typedef struct build_image_context_rec
 	u_int32_t odm_data; /* The odm data value */
 	u_int8_t unique_chip_id[16]; /* The unique chip uid */
 	u_int8_t secure_jtag_control; /* The flag for enabling jtag control */
+	u_int8_t update_bct;
 } build_image_context;
 
 /* Function prototypes */
diff --git a/src/data_layout.c b/src/data_layout.c
index ba3361a..c3ccbb4 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -450,6 +450,7 @@ write_bootloaders(build_image_context *context)
 
 	/* Read the BL into memory. */
 	if (read_from_image(context->newbl_filename,
+		0,
 		&bl_storage,
 		&bl_actual_size,
 		bl_filetype) == 1) {
@@ -657,23 +658,38 @@ init_bct(struct build_image_context_rec *context)
  *   according to the boot data version in bct file.
  *
  * @param context		The main context pointer
+ * @param offset		Begin offset for file read
  * @return 0 for success
  */
 int
-read_bct_file(struct build_image_context_rec *context)
+read_bct_file(struct build_image_context_rec *context, u_int32_t offset)
 {
 	u_int8_t  *bct_storage; /* Holds the Bl after reading */
 	u_int32_t  bct_actual_size; /* In bytes */
-	file_type bct_filetype = file_type_bct;
 	int err = 0;
 
-	if (read_from_image(context->bct_filename,
-		&bct_storage,
-		&bct_actual_size,
-		bct_filetype) == 1) {
-		printf("Error reading bct file %s.\n", context->bct_filename);
-		exit(1);
+	if (context->generate_bct) {
+		if (read_from_image(context->bct_filename,
+			offset,
+			&bct_storage,
+			&bct_actual_size,
+			file_type_bct) == 1) {
+			printf("Error reading bct file %s.\n",
+				context->bct_filename);
+			goto fail;
+		}
+	} else {
+		if (read_from_image(context->input_image_filename,
+			offset,
+			&bct_storage,
+			&bct_actual_size,
+			file_type_bct) == 1) {
+			printf("Error reading image file %s.\n",
+				context->input_image_filename);
+			goto fail;
+		}
 	}
+
 	context->bct_size = bct_actual_size;
 	if (context->bct_init != 1)
 		err = init_bct(context);
@@ -694,6 +710,7 @@ read_bct_file(struct build_image_context_rec *context)
 	if (if_bct_is_t124_get_soc_config(context, &g_soc_config))
 		return 0;
 
+fail:
 	return ENODATA;
 }
 /*
@@ -896,3 +913,39 @@ write_block_raw(build_image_context *context)
 	free(empty_blk);
 	return 0;
 }
+
+int write_bct_raw(build_image_context *context)
+{
+	/* write out the raw bct */
+	if (fwrite(context->bct, 1, NVBOOT_CONFIG_TABLE_SIZE,
+				context->raw_file) != NVBOOT_CONFIG_TABLE_SIZE)
+		return -1;
+
+	return 0;
+}
+
+int write_data_raw(build_image_context *context,
+	u_int32_t offset, u_int32_t size)
+{
+	FILE *fp_input;
+	u_int8_t *bytes;
+	u_int32_t read_size;
+
+	fp_input = fopen(context->input_image_filename, "r");
+	if (!fp_input)
+		return -1;
+
+	bytes = malloc(size);
+
+	/* write out the remained raw image data */
+	if (fseek(fp_input, offset, 0))
+		return -1;
+
+	read_size = fread(bytes, 1, size, fp_input);
+	fwrite(bytes, 1, read_size, context->raw_file);
+
+	free(bytes);
+	fclose(fp_input);
+
+	return 0;
+}
diff --git a/src/data_layout.h b/src/data_layout.h
index 9ee8267..797e465 100644
--- a/src/data_layout.h
+++ b/src/data_layout.h
@@ -41,7 +41,7 @@ void
 update_context(struct build_image_context_rec *context);
 
 int
-read_bct_file(struct build_image_context_rec *context);
+read_bct_file(struct build_image_context_rec *context, u_int32_t offset);
 
 int
 init_bct(struct build_image_context_rec *context);
@@ -50,6 +50,12 @@ int
 write_block_raw(struct build_image_context_rec *context);
 
 int
+write_bct_raw(build_image_context *context);
+
+int
+write_data_raw(build_image_context *context, u_int32_t offset, u_int32_t size);
+
+int
 begin_update(build_image_context *context);
 
 #endif /* #ifndef INCLUDED_DATA_LAYOUT_H */
diff --git a/src/parse.c b/src/parse.c
index 90d37e7..ebc47e9 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -580,7 +580,7 @@ parse_bct_file(build_image_context *context, parse_token token, char *rest)
 	/* Parsing has finished - set the bctfile */
 	context->bct_filename = filename;
 	/* Read the bct file to buffer */
-	if (read_bct_file(context))
+	if (read_bct_file(context, 0))
 		return 1;
 
 	update_context(context);
@@ -782,6 +782,8 @@ void process_config_file(build_image_context *context, u_int8_t simple_parse)
 	assert(context != NULL);
 	assert(context->config_file != NULL);
 
+	fseek(context->config_file, 0, SEEK_SET);
+
 	while ((current = fgetc(context->config_file)) != EOF) {
 		if (space >= (MAX_BUFFER-1)) {
 			/* if we exceeded the max buffer size, it is likely
diff --git a/src/set.c b/src/set.c
index 99b242c..19580e2 100644
--- a/src/set.c
+++ b/src/set.c
@@ -43,6 +43,7 @@
 
 int
 read_from_image(char	*filename,
+		u_int32_t	offset,
 		u_int8_t	**image,
 		u_int32_t	*actual_size,
 		file_type	f_type)
@@ -57,6 +58,8 @@ read_from_image(char	*filename,
 		return result;
 	}
 
+	fseek(fp, offset, SEEK_SET);
+
 	if (stat(filename, &stats) != 0) {
 		printf("Error: Unable to query info on bootloader path %s\n",
 			filename);
@@ -64,13 +67,22 @@ read_from_image(char	*filename,
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
+		if ((stats.st_size - offset) > MAX_BOOTLOADER_SIZE) {
+			printf("Error: Bootloader file %s is too large.\n",
+				filename);
+			result = 1;
+			goto cleanup;
+		}
+		*actual_size = (u_int32_t)stats.st_size;
+	} else {
+		if ((stats.st_size - offset) < NVBOOT_CONFIG_TABLE_SIZE) {
+			printf("Error: Image file %s is too small.\n",
+				filename);
+			result = 1;
+			goto cleanup;
+		}
+		*actual_size = NVBOOT_CONFIG_TABLE_SIZE;
 	}
 	*image = malloc(*actual_size);
 	if (*image == NULL) {
@@ -80,7 +92,8 @@ read_from_image(char	*filename,
 
 	memset(*image, 0, *actual_size);
 
-	if (fread(*image, 1, (size_t)stats.st_size, fp) != stats.st_size) {
+	if (fread(*image, 1, (size_t)(*actual_size), fp) !=
+		(size_t)(*actual_size)) {
 		result = 1;
 		goto cleanup;
 	}
diff --git a/src/set.h b/src/set.h
index dbde479..b2c77ec 100644
--- a/src/set.h
+++ b/src/set.h
@@ -46,6 +46,7 @@ context_set_chipuid(build_image_context	*context,
 
 int
 read_from_image(char *filename,
+		u_int32_t	offset,
 		u_int8_t	**Image,
 		u_int32_t	*actual_size,
 		file_type	f_type);
-- 
1.9.0
