From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage PATCH V2] crypto: produce consistent hash for zero-length data
Date: Mon, 26 Aug 2013 16:12:50 -0600
Message-ID: <1377555170-6841-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

Hence, zero out the hash data so it has consistent content if it isn't
written to.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: clear region using calloc at allocation time, rather than memset
    at hash-calculation time.
---
 src/crypto.c      | 2 +-
 src/data_layout.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/crypto.c b/src/crypto.c
index 88de357..99e9f08 100644
--- a/src/crypto.c
+++ b/src/crypto.c
@@ -280,7 +280,7 @@ sign_bct(build_image_context *context,
 					bct) != 0)
 		return -ENODATA;
 
-	hash_buffer = malloc(hash_size);
+	hash_buffer = calloc(1, hash_size);
 	if (hash_buffer == NULL)
 		return -ENOMEM;
 	e = sign_data_block(bct + Offset, length, hash_buffer);
diff --git a/src/data_layout.c b/src/data_layout.c
index ae62126..cae4c37 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -391,7 +391,7 @@ write_bootloaders(build_image_context *context)
 	g_soc_config->get_value(token_bootloaders_max,
 			&bootloaders_max, context->bct);
 
-	hash_buffer = malloc(hash_size);
+	hash_buffer = calloc(1, hash_size);
 	if (hash_buffer == NULL)
 		return -ENOMEM;
 
-- 
1.8.1.5
