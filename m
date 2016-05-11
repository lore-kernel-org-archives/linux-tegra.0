From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drivers/of: Fix depth when unflattening devicetree
Date: Wed, 11 May 2016 13:36:57 -0400
Message-ID: <1462988217-29314-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When the implementation for unflatten_dt_node() changed from being
recursive to being non-recursive, it had a side effect of increasing the
depth passed to fdt_next_node() by 1. This is fine most of the time, but
it seems that when the end of the dtb is being parsed, it will cause the
FDT_END condition in fdt_next_node() to return a different value
(returning nextoffset instead of -FDT_ERR_NOTFOUND). This ends up passing
an FDT_ERR_TRUNCATED error back to the unflatten_dt_node() which then
sees that and complains "Error -8 processing FDT" causing boot to fail.

This patch simply avoids incrementing depth and uses modified accesses
for local array indices so that the depth is the same as it was before
the change as far as fdt_next_node() is concerned.

This problem was discovered trying to boot Tegra210-Smaug platforms.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Fixes: 9ffa9eb41763 ("drivers/of: Avoid recursively calling unflatten_dt_node()")
Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/fdt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index df9f4e8dfa00..becb025702d7 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -407,24 +407,24 @@ static int unflatten_dt_nodes(const void *blob,
 
 	root = dad;
 	fpsizes[depth] = dad ? strlen(of_node_full_name(dad)) : 0;
-	nps[depth++] = dad;
+	nps[depth+1] = dad;
 	for (offset = 0;
 	     offset >= 0;
 	     offset = fdt_next_node(blob, offset, &depth)) {
 		if (WARN_ON_ONCE(depth >= FDT_MAX_DEPTH))
 			continue;
 
-		fpsizes[depth] = populate_node(blob, offset, &mem,
-					       nps[depth - 1],
-					       fpsizes[depth - 1],
-					       &nps[depth], dryrun);
-		if (!fpsizes[depth])
+		fpsizes[depth+1] = populate_node(blob, offset, &mem,
+						 nps[depth],
+						 fpsizes[depth],
+						 &nps[depth+1], dryrun);
+		if (!fpsizes[depth+1])
 			return mem - base;
 
 		if (!dryrun && nodepp && !*nodepp)
-			*nodepp = nps[depth];
+			*nodepp = nps[depth+1];
 		if (!dryrun && !root)
-			root = nps[depth];
+			root = nps[depth+1];
 	}
 
 	if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
-- 
1.9.1
