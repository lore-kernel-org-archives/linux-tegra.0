From: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 2/2] remgap: Fix possible sleep-in-atomic in regmap_register_patch()
Date: Tue, 18 Mar 2014 12:58:34 +0100
Message-ID: <1395143914-26929-2-git-send-email-tiwai@suse.de>
References: <1395143914-26929-1-git-send-email-tiwai@suse.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395143914-26929-1-git-send-email-tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Just like the previous, fix the possible sleep-in-atomic in
regmap_register_patch() by moving the allocation out of the lock.

This makes the function unsafe for concurrent access as map->patch and
map->patch_regs are changed without lock now.  But such a use case
must be very rare, thus we take rather simplicity over complexity, and
add a note in the function description mentioning this restriction.

Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
---
 drivers/base/regmap/regmap.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 6d134a3cbfd3..e6827cee29a3 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2174,6 +2174,10 @@ EXPORT_SYMBOL_GPL(regmap_async_complete);
  * apply them immediately.  Typically this is used to apply
  * corrections to be applied to the device defaults on startup, such
  * as the updates some vendors provide to undocumented registers.
+ *
+ * Note that the function gives no protection over concurrent access
+ * to map->patch and map->patch_regs.  If needed, apply some lock in
+ * the caller side.
  */
 int regmap_register_patch(struct regmap *map, const struct reg_default *regs,
 			  int num_regs)
@@ -2186,6 +2190,16 @@ int regmap_register_patch(struct regmap *map, const struct reg_default *regs,
 	    num_regs))
 		return 0;
 
+	p = krealloc(map->patch,
+		     sizeof(struct reg_default) * (map->patch_regs + num_regs),
+		     GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	memcpy(p + map->patch_regs, regs, num_regs * sizeof(*regs));
+	map->patch = p;
+	map->patch_regs += num_regs;
+
 	map->lock(map->lock_arg);
 
 	bypass = map->cache_bypass;
@@ -2203,17 +2217,6 @@ int regmap_register_patch(struct regmap *map, const struct reg_default *regs,
 		}
 	}
 
-	p = krealloc(map->patch,
-		     sizeof(struct reg_default) * (map->patch_regs + num_regs),
-		     GFP_KERNEL);
-	if (p) {
-		memcpy(p + map->patch_regs, regs, num_regs * sizeof(*regs));
-		map->patch = p;
-		map->patch_regs += num_regs;
-	} else {
-		ret = -ENOMEM;
-	}
-
 out:
 	map->async = false;
 	map->cache_bypass = bypass;
-- 
1.9.0
