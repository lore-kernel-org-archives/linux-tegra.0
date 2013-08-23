From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage PATCH 2/2] crypto: produce consistent hash for zero-length data
Date: Fri, 23 Aug 2013 12:56:02 -0600
Message-ID: <1377284162-7700-2-git-send-email-swarren@wwwdotorg.org>
References: <1377284162-7700-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377284162-7700-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In real-world use-cases, hashing zero-length data likely never happens.
However, it is relevant when testing cbootimage with a dummy zero-length
bootloader binary, e.g.:

touch u-boot.bin
cbootimage -t30 ../tamonten-ng/tegra30.img.cfg tegra30-tec-ng.img

In this scenario, it's useful to create a consistent hash, so that one
can compare the resultant images before and after applying patches, to
check for regressions.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/crypto.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/crypto.c b/src/crypto.c
index 88de357..9741785 100644
--- a/src/crypto.c
+++ b/src/crypto.c
@@ -183,6 +183,9 @@ sign_objext(
 	if (enable_debug_crypto)
 		print_vector("K1", KEY_LENGTH, k1);
 
+	if (!num_aes_blocks)
+		memset(dst, 0, 4 * NVAES_STATECOLS);
+
 	/* compute the AES-CMAC value */
 	for (i = 0; i < num_aes_blocks; i++) {
 		/* Apply the chain data */
-- 
1.8.1.5
