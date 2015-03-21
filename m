From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v3 2/3] Remove misleading message "deprecated"
Date: Fri, 20 Mar 2015 17:20:20 -0700
Message-ID: <1426897221-20307-3-git-send-email-jimmzhang@nvidia.com>
References: <1426897221-20307-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426897221-20307-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Since option "-t" is still fully supported, correct the
help messages.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/cbootimage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cbootimage.c b/src/cbootimage.c
index 790d795b8e78..f0516dd256ee 100644
--- a/src/cbootimage.c
+++ b/src/cbootimage.c
@@ -72,7 +72,7 @@ usage(void)
 	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
 	printf("    -t|--tegra NN         Select target device. Must be one of:\n");
 	printf("                          20, 30, 114, 124, 132, 210.\n");
-	printf("                          Default: 20. This option is deprecated\n");
+	printf("                          Default: 20.\n");
 	printf("    -s|--soc tegraNN      Select target device. Must be one of:\n");
 	printf("                          tegra20, tegra30, tegra114, tegra124,\n");
 	printf("                          tegra132, tegra210.\n");
-- 
1.8.1.5
