From: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] regmap: Fix possible sleep-in-atomic in fast io mode
Date: Tue, 18 Mar 2014 12:20:00 +0100
Message-ID: <1395141600-24558-1-git-send-email-tiwai@suse.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

regmap deploys the spinlock for the protection when set up in fast_io
mode.  But some places are still left with possible sleep in the lock,
typically allocating memory with GFP_KERNEL.  This patch fixes these
calls by moving the allocations out of the lock.

The krealloc() call in regmap_register_patch() makes it unsafe for
concurrent accesses, however.  But such a use case must be very rare,
thus we take rather simplicity over complexity, and add a note in the
function description mentioning this restriction.

Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
---
Only compile tested.

 drivers/base/regmap/regmap.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 6a19515f8a45..e6827cee29a3 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1520,12 +1520,12 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 	if (reg % map->reg_stride)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
 	/*
 	 * Some devices don't support bulk write, for
 	 * them we have a series of single write operations.
 	 */
 	if (!map->bus || map->use_single_rw) {
+		map->lock(map->lock_arg);
 		for (i = 0; i < val_count; i++) {
 			unsigned int ival;
 
@@ -1554,24 +1554,25 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 			if (ret != 0)
 				goto out;
 		}
+out:
+		map->unlock(map->lock_arg);
 	} else {
 		void *wval;
 
 		wval = kmemdup(val, val_count * val_bytes, GFP_KERNEL);
 		if (!wval) {
-			ret = -ENOMEM;
 			dev_err(map->dev, "Error in memory allocation\n");
-			goto out;
+			return -ENOMEM;
 		}
+		map->lock(map->lock_arg);
 		for (i = 0; i < val_count * val_bytes; i += val_bytes)
 			map->format.parse_inplace(wval + i);
 
 		ret = _regmap_raw_write(map, reg, wval, val_bytes * val_count);
+		map->unlock(map->lock_arg);
 
 		kfree(wval);
 	}
-out:
-	map->unlock(map->lock_arg);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_bulk_write);
@@ -2173,6 +2174,10 @@ EXPORT_SYMBOL_GPL(regmap_async_complete);
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
@@ -2185,6 +2190,16 @@ int regmap_register_patch(struct regmap *map, const struct reg_default *regs,
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
@@ -2202,17 +2217,6 @@ int regmap_register_patch(struct regmap *map, const struct reg_default *regs,
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
