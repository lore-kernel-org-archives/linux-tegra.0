From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage PATCH] bct_dump: don't crash on devices without RSA support
Date: Thu, 28 Jul 2016 11:44:05 -0600
Message-ID: <20160728174405.16136-1-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

format_rsa_param() currently crashes on chips that don't implement
soc_config->get_value_size(); that is, on all chips before T124. Fix the
function not to crash. Better might be to avoid even dumping RSA
parameters on chips which don't support RSA, but that's a larger change
that needs much more work.

Fixes: 3c3b992a6814 ("Add support to dump rsa related fields for t210")
Cc: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index 4f50fa261e6e..b4ca9fcff0ef 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -133,10 +133,14 @@ static void format_rsa_param(parse_token id, char const * message, void * data)
 {
 #define MAX_BYTE_NUMBER_PER_LINE	16
 	u_int8_t *rsa = (u_int8_t *)data;
-	int size = g_soc_config->get_value_size(id);
-	int byte_index;
+	int size, byte_index;
 
 	printf("%s", message);
+
+	if (!g_soc_config->get_value_size)
+		return;
+
+	size = g_soc_config->get_value_size(id);
 	for (byte_index = 0; byte_index < size; ++byte_index) {
 		printf(" %02x", *rsa++);
 
-- 
2.9.2
