From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v2 1/4] Enable -u | --update option support for t210
Date: Fri, 2 Oct 2015 13:56:57 -0700
Message-ID: <1443819420-26562-2-git-send-email-jimmzhang@nvidia.com>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443819420-26562-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index 1dfb719c819b..b62cedc47ec0 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -79,7 +79,7 @@ usage(void)
 	printf("                          Default: tegra20.\n");
 	printf("    -u|--update           Copy input image data and update bct\n");
 	printf("                          configs into new image file.\n");
-	printf("                          This feature is only for tegra114/124.\n");
+	printf("                          This feature is currently not supported on tegra20/30.\n");
 	printf("    configfile            File with configuration information\n");
 	printf("    inputimage            Input image name. This is required\n");
 	printf("                          if -u|--update option is used.\n");
@@ -169,9 +169,10 @@ process_command_line(int argc, char *argv[], build_image_context *context)
 	/* Record the input image filename if update_image is necessary */
 	if (context->update_image)
 	{
-		if (context->boot_data_version != BOOTDATA_VERSION_T114 &&
-			context->boot_data_version != BOOTDATA_VERSION_T124) {
-			printf("Update image feature is only for Tegra114 and Tegra124.\n");
+		if (context->boot_data_version == BOOTDATA_VERSION_T20 ||
+			context->boot_data_version == BOOTDATA_VERSION_T30) {
+			printf("Update image feature is not supported on"
+				" Tegra20/30.\n");
 			return -EINVAL;
 		}
 
-- 
1.8.1.5
