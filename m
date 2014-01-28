From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH 3/3] Implement the utility gen_sdram_array
Date: Tue, 28 Jan 2014 15:24:17 +0800
Message-ID: <1390893857-18716-3-git-send-email-vinceh@nvidia.com>
References: <1390893857-18716-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390893857-18716-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch implemtns the ubility to generate a header file from
multiple sdram config files which each has one set of sdram
parameters inside only.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/Makefile.am       |  34 +++++-
 src/gen_sdram_array.c | 305 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 338 insertions(+), 1 deletion(-)
 create mode 100644 src/gen_sdram_array.c

diff --git a/src/Makefile.am b/src/Makefile.am
index a0b95a90750a..c16ae84609eb 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
 
 AM_CFLAGS = -Wall -std=c99
 
-bin_PROGRAMS = cbootimage bct_dump
+bin_PROGRAMS = cbootimage bct_dump gen_sdram_array
 cbootimage_SOURCES = \
 	cbootimage.c \
 	data_layout.c \
@@ -68,3 +68,35 @@ bct_dump_SOURCES = \
 	t114/nvboot_sdram_param_t114.h \
 	t124/nvboot_bct_t124.h \
 	t124/nvboot_sdram_param_t124.h
+
+gen_sdram_array_SOURCES = \
+	gen_sdram_array.c \
+	data_layout.c \
+	set.c \
+	crypto.c \
+	aes_ref.c \
+	context.c \
+	parse.c \
+	t124/parse_t124.c \
+	t114/parse_t114.c \
+	t30/parse_t30.c \
+	t20/parse_t20.c \
+	t124/nvbctlib_t124.c \
+	t114/nvbctlib_t114.c \
+	t30/nvbctlib_t30.c \
+	t20/nvbctlib_t20.c \
+	cbootimage.h \
+	context.h \
+	crypto.h \
+	data_layout.h \
+	nvaes_ref.h \
+	parse.h \
+	set.h \
+	t20/nvboot_bct_t20.h \
+	t20/nvboot_sdram_param_t20.h \
+	t30/nvboot_bct_t30.h \
+	t30/nvboot_sdram_param_t30.h \
+	t114/nvboot_bct_t114.h \
+	t114/nvboot_sdram_param_t114.h \
+	t124/nvboot_bct_t124.h \
+	t124/nvboot_sdram_param_t124.h
diff --git a/src/gen_sdram_array.c b/src/gen_sdram_array.c
new file mode 100644
index 000000000000..6e055387018b
--- /dev/null
+++ b/src/gen_sdram_array.c
@@ -0,0 +1,305 @@
+/*
+ * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ */
+
+#include "cbootimage.h"
+#include "crypto.h"
+#include "data_layout.h"
+#include "context.h"
+#include "parse.h"
+#include "t20/nvboot_bct_t20.h"
+#include <string.h>
+#include <strings.h>
+#include <getopt.h>
+
+#define MAX_SDRAM_NUM	16
+
+struct sdram_config_file {
+	FILE *file;
+	char file_name[MAX_STR_LEN];
+};
+
+static int help_only; /* Only print help & exit */
+static struct sdram_config_file input_file[MAX_SDRAM_NUM];
+static int input_file_num;
+static FILE *output_file;
+static char output_file_name[MAX_STR_LEN];
+
+int enable_debug;
+cbootimage_soc_config * g_soc_config;
+
+static int parse_sdram(build_image_context *context, parse_token token,
+		char *rest);
+
+struct option cmd[] = {
+	{"help", 0, NULL, 'h'},
+	{"debug", 0, NULL, 'd'},
+	{"soc", 1, NULL, 's'},
+	{"input", 1, NULL, 'i'},
+	{"output", 1, NULL, 'o'},
+	{0, 0, 0, 0},
+};
+
+/* Only care about SDRAM items */
+static parse_item parse_sdram_items[] =
+{
+	{ "SDRAM[",         token_sdram,		parse_sdram },
+	{ NULL, 0, NULL } /* Must be last */
+};
+
+static void usage(void)
+{
+	printf("Usage: gen_sdram_array [options] configfile imagename\n");
+	printf("    options:\n");
+	printf("    -h, --help, -?        Display this message.\n");
+	printf("    -d, --debug           Output debugging information.\n");
+	printf("    -s|--soc tegraNN      Select target device. Must be one of:\n");
+	printf("                          tegra20, tegra30, tegra114, tegra124.\n");
+	printf("                          Default: tegra20.\n");
+	printf("    -i configfile         File with configuration information\n");
+	printf("    -o output file        Output file name\n");
+}
+
+static int process_command_line(int argc, char *argv[],
+		build_image_context *context)
+{
+	int c;
+
+	while ((c = getopt_long(argc, argv, "hds:i:o:", cmd, NULL)) != -1) {
+		switch (c) {
+		case 'h':
+			help_only = 1;
+			usage();
+			return 0;
+		case 's':
+			if (strncmp("tegra", optarg, 5)) {
+				printf("Unsupported chipname!\n");
+				usage();
+				return -EINVAL;
+			}
+			optarg += 5;
+
+			/* Assign the soc_config based on the chip. */
+			if (!strcasecmp("20", optarg)) {
+				t20_get_soc_config(context, &g_soc_config);
+			} else if (!strcasecmp("30", optarg)) {
+				t30_get_soc_config(context, &g_soc_config);
+			} else if (!strcasecmp("114", optarg)) {
+				t114_get_soc_config(context, &g_soc_config);
+			} else if (!strcasecmp("124", optarg)) {
+				t124_get_soc_config(context, &g_soc_config);
+			} else {
+				printf("Unsupported chipname!\n");
+				usage();
+				return -EINVAL;
+			}
+			break;
+		case 'i':
+			if (input_file_num >= MAX_SDRAM_NUM) {
+				printf("Only support at most 16 input files\n");
+				return -EINVAL;
+			}
+			if (strlen(optarg) > MAX_STR_LEN - 1) {
+				printf("File name is limited to %d characters\n",
+						MAX_STR_LEN - 1);
+				return -EINVAL;
+			}
+			strncpy(input_file[input_file_num].file_name, optarg,
+					strlen(optarg));
+			input_file[input_file_num].file_name[strlen(optarg) + 1] = '\0';
+			input_file_num++;
+			break;
+		case 'o':
+			if (strlen(optarg) > MAX_STR_LEN - 1) {
+				printf("File name is limited to %d characters\n",
+						MAX_STR_LEN - 1);
+				return -EINVAL;
+			}
+			strncpy(output_file_name, optarg, strlen(optarg));
+			output_file_name[strlen(optarg) + 1] = '\0';
+			break;
+		}
+	}
+
+	if (!input_file_num || !strlen(output_file_name)) {
+		usage();
+		return -EINVAL;
+	}
+
+	/* If SoC is not specified, make the default soc_config to t20. */
+	if (!context->boot_data_version)
+		t20_get_soc_config(context, &g_soc_config);
+
+	return 0;
+}
+
+/*
+ * Parse the given string and find sdram parameter and value in config
+ * file. If match, call the corresponding function set the sdram parameter.
+ *
+ * @param context	The main context pointer
+ * @param token  	The parse token value
+ * @param rest   	String to parse
+ * @return 0 and 1 for success and failure
+ */
+static int parse_sdram(build_image_context *context, parse_token token,
+		char *rest)
+{
+	u_int32_t value;
+	field_item *field;
+	u_int32_t index;
+
+	assert(context != NULL);
+	assert(rest != NULL);
+
+	/* Parse the index. */
+	rest = parse_u32(rest, &index);
+	if (rest == NULL)
+		return 1;
+
+	/* Parse the closing bracket. */
+	if (*rest != ']')
+		return 1;
+	rest++;
+
+	/* Parse the following '.' */
+	if (*rest != '.')
+		return 1;
+	rest++;
+
+	/* Parse the field name. */
+	rest = parse_field_name(rest, g_soc_config->sdram_field_table, &field);
+
+	if (rest == NULL)
+		return 1;
+
+	/* Parse the equals sign.*/
+	if (*rest != '=')
+		return 1;
+	rest++;
+
+	/* Parse the value based on the field table. */
+	rest = parse_field_value(context, rest, field, &value);
+	if (rest == NULL)
+		return 1;
+
+	fprintf(output_file, "\t.%s\t= 0x%08x,\n", field->name, value);
+
+	return 0;
+}
+
+static int process_sdram_config(build_image_context *context, char *str)
+{
+	int i;
+	char *rest;
+	parse_item *cfg_parse_item;
+
+	cfg_parse_item = parse_sdram_items;
+
+	for (i = 0; cfg_parse_item[i].prefix != NULL; i++) {
+		if (!strncmp(cfg_parse_item[i].prefix, str,
+			strlen(cfg_parse_item[i].prefix))) {
+			rest = str + strlen(cfg_parse_item[i].prefix);
+
+			return cfg_parse_item[i].process(context,
+						cfg_parse_item[i].token,
+						rest);
+		}
+	}
+
+	/* If this point was reached, there was a processing error. */
+	return 1;
+}
+
+static int init_files()
+{
+	int i;
+	FILE *file;
+
+	for (i = 0; i < input_file_num; i++) {
+		char *name = input_file[i].file_name;
+		if (strlen(name)) {
+			file = fopen(name, "r");
+			if (!file) {
+				printf("Failed to open file %s\n", name);
+				return -EINVAL;
+			}
+			input_file[i].file = file;
+		}
+	}
+
+	output_file = fopen(output_file_name, "w+");
+	if (!output_file) {
+		printf("Failed to open file %s\n", output_file_name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void cleanup_files()
+{
+	int i;
+
+	for (i = 0; i < input_file_num; i++)
+		if (input_file[i].file)
+			fclose(input_file[i].file);
+
+	if (output_file)
+		fclose(output_file);
+}
+
+int main(int argc, char *argv[])
+{
+	int e;
+	build_image_context context;
+	int i;
+
+	memset(&context, 0, sizeof(build_image_context));
+
+	/* Process command line arguments. */
+	if (process_command_line(argc, argv, &context) != 0)
+		return -EINVAL;
+
+	if (help_only)
+		return 0;
+
+	assert(g_soc_config != NULL);
+
+	e = init_context(&context);
+	if (e != 0) {
+		printf("context initialization failed.  Aborting.\n");
+		return e;
+	}
+
+	e = init_files();
+	if (e != 0)
+		goto fail;
+
+	for (i = 0; i < input_file_num; i++) {
+		context.config_file = input_file[i].file;
+		fprintf(output_file, "{\n");
+		process_config_file(&context, 0, process_sdram_config);
+		fprintf(output_file, "},\n");
+	}
+
+fail:
+	cleanup_files();
+
+	return e;
+}
-- 
1.8.1.5
