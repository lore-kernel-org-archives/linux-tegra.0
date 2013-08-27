From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage PATCH] Implement --soc command-line option
Date: Tue, 27 Aug 2013 12:32:24 -0600
Message-ID: <1377628344-24984-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Implement command-line option "-s tegra20" and "--soc tegra20". These
mirror the existing -t/--tegra option, but require the full chip name
(tegra20) rather than an abbreviated name (-t20). This is more consistent
with just about everything else upstream.

Suggested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index 336b169..259e6e7 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -48,6 +48,7 @@ struct option cbootcmd[] = {
 	{"generate", 1, NULL, 'g'},
 	{"tegra", 1, NULL, 't'},
 	{"odmdata", 1, NULL, 'o'},
+	{"soc", 1, NULL, 's'},
 	{0, 0, 0, 0},
 };
 
@@ -68,9 +69,12 @@ usage(void)
 	printf("    -d, --debug           Output debugging information.\n");
 	printf("    -gbct                 Generate the new bct file.\n");
 	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
-	printf("    [-t20|-t30|-t114|-t124]\n");
-	printf("                          Select one of the possible target devices,\n");
-	printf("                          -t20 if unspecified.\n");
+	printf("    -t|--tegra NN         Select target device. Must be one of:\n");
+	printf("                          20, 30, 114, 124.\n");
+	printf("                          Default: 20. This option is deprecated\n");
+	printf("    -s|--soc tegraNN      Select target device. Must be one of:\n");
+	printf("                          tegra20, tegra30, tegra114, tegra124.\n");
+	printf("                          Default: tegra20.\n");
 	printf("    configfile            File with configuration information\n");
 	printf("    imagename             Output image name\n");
 }
@@ -82,7 +86,7 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 
 	context->generate_bct = 0;
 
-	while ((c = getopt_long(argc, argv, "hdg:t:o:", cbootcmd, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "hdg:t:o:s:", cbootcmd, NULL)) != -1) {
 		switch (c) {
 		case 'h':
 			help_only = 1;
@@ -100,6 +104,14 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 				return -EINVAL;
 			}
 			break;
+		case 's':
+			if (strncmp("tegra", optarg, 5)) {
+				printf("Unsupported chipname!\n");
+				usage();
+				return -EINVAL;
+			}
+			optarg += 5;
+			/* Deliberate all-through */
 		case 't':
 			/* Assign the soc_config based on the chip. */
 			if (!strcasecmp("20", optarg)) {
-- 
1.8.1.5
