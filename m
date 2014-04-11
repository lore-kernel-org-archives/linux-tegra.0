From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V3 2/7] Add page_size validation when setting page_size value
Date: Fri, 11 Apr 2014 17:50:38 +0800
Message-ID: <1397209843-31275-3-git-send-email-pchiu@nvidia.com>
References: <1397209843-31275-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397209843-31275-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The valid page_size value should be a power of two, so add this
check when setting page_size value.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/set.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/set.c b/src/set.c
index 08c9fb6..b2872a6 100644
--- a/src/set.c
+++ b/src/set.c
@@ -169,6 +169,11 @@ int context_set_value(build_image_context *context,
 	case token_page_size:
 		context->page_size = value;
 		context->page_size_log2 = log2(value);
+
+		if (value != (u_int32_t)(1 << context->page_size_log2)) {
+			printf("Error: Page size must be a power of 2.\n");
+			return 1;
+		}
 		context->pages_per_blk= 1 << (context->block_size_log2- 
 			context->page_size_log2);
 
-- 
1.9.1
