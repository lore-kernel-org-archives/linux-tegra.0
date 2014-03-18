From: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 1/2] remgap: Fix possible sleep-in-atomic in regmap_bulk_write()
Date: Tue, 18 Mar 2014 12:58:33 +0100
Message-ID: <1395143914-26929-1-git-send-email-tiwai@suse.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

regmap deploys the spinlock for the protection when set up in fast_io
mode.  This may lead to sleep-in-atomic by memory allocation with
GFP_KERNEL in regmap_bulk_write().  This patch fixes it by moving the
allocation out of the lock.

Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
---
 drivers/base/regmap/regmap.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 6a19515f8a45..6d134a3cbfd3 100644
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
-- 
1.9.0
