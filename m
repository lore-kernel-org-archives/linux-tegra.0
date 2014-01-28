From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH 1/3] Allow users to specify the handler to process special configuration
Date: Tue, 28 Jan 2014 15:24:15 +0800
Message-ID: <1390893857-18716-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.c |  4 ++--
 src/parse.c      | 13 +++++++++----
 src/parse.h      |  3 ++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index 1332c5f118b5..0fe164fa5421 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -200,14 +200,14 @@ main(int argc, char *argv[])
 
 	/* first, if we aren't generating the bct, read in config file */
 	if (context.generate_bct == 0) {
-		process_config_file(&context, 1);
+		process_config_file(&context, 1, NULL);
 	}
 	/* Generate the new bct file */
 	else {
 		/* Initialize the bct memory */
 		init_bct(&context);
 		/* Parse & process the contents of the config file. */
-		process_config_file(&context, 0);
+		process_config_file(&context, 0, NULL);
 		/* Update the BCT */
 		begin_update(&context);
 		/* Signing the bct. */
diff --git a/src/parse.c b/src/parse.c
index 464ee8ff40e4..92490b8c5768 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -698,7 +698,8 @@ process_statement(build_image_context *context,
  * @param context     	The main context pointer
  * @param simple_parse	Simple parse flag
  */
-void process_config_file(build_image_context *context, u_int8_t simple_parse)
+void process_config_file(build_image_context *context, u_int8_t simple_parse,
+		int (*special_handler)(build_image_context *context, char *buffer))
 {
 	char buffer[MAX_BUFFER];
 	int  space = 0;
@@ -707,6 +708,7 @@ void process_config_file(build_image_context *context, u_int8_t simple_parse)
 	u_int8_t comment = 0;
 	u_int8_t string = 0;
 	u_int8_t equal_encounter = 0;
+	int e;
 
 	assert(context != NULL);
 	assert(context->config_file != NULL);
@@ -737,11 +739,14 @@ void process_config_file(build_image_context *context, u_int8_t simple_parse)
 		case ';':
 			if (!string && !comment) {
 				buffer[space++] = '\0';
+				if (special_handler)
+					e = special_handler(context, buffer);
+				else
+					e = process_statement(context, buffer, simple_parse);
 
-				if (process_statement(context,
-							buffer,
-							simple_parse))
+				if (e)
 					goto error;
+
 				space = 0;
 				equal_encounter = 0;
 			} else if (string)
diff --git a/src/parse.h b/src/parse.h
index 80f42c4269b1..239946c7fa7a 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -763,7 +763,8 @@ typedef struct cbootimage_soc_config_rec {
 	parse_subfield_item *device_type_table;
 } cbootimage_soc_config;
 
-void process_config_file(build_image_context *context, u_int8_t simple_parse);
+void process_config_file(build_image_context *context, u_int8_t simple_parse,
+		int (*special_handler)(build_image_context *context, char *buffer));
 
 void t124_get_soc_config(build_image_context *context,
 	cbootimage_soc_config **soc_config);
-- 
1.8.1.5
