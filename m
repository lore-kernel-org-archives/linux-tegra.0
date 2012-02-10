From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] regmap: Support for caching in reg_raw_write()
Date: Fri, 10 Feb 2012 17:02:52 +0530
Message-ID: <1328873572-12603-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Adding support for caching of data into the
non-volatile register from the call of reg_raw_write().

This will allow the larger block of data write into multiple
register without worrying whether register is cached or not
through reg_raw_write().

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/base/regmap/regmap.c |   25 ++++++++++++++++++++-----
 1 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 80129c0..e5986ab 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -323,6 +323,25 @@ static int _regmap_raw_write(struct regmap *map, unsigned int reg,
 			if (!map->writeable_reg(map->dev, reg + i))
 				return -EINVAL;
 
+	if (!map->cache_bypass && map->format.parse_val) {
+		int val_bytes = map->format.val_bytes;
+		unsigned int ival;
+		for (i = 0; i < val_len / map->format.val_bytes; i++) {
+			memcpy(map->work_buf, val + (i * val_bytes), val_bytes);
+			ival = map->format.parse_val(map->work_buf);
+			ret = regcache_write(map, reg + i, ival);
+			if (ret) {
+				dev_warn(map->dev,
+					"Error in caching of register\n");
+				return ret;
+			}
+		}
+		if (map->cache_only) {
+			map->cache_dirty = true;
+			return 0;
+		}
+	}
+
 	map->format.format_reg(map->work_buf, reg);
 
 	u8[0] |= map->write_flag_mask;
@@ -373,7 +392,7 @@ int _regmap_write(struct regmap *map, unsigned int reg,
 	int ret;
 	BUG_ON(!map->format.format_write && !map->format.format_val);
 
-	if (!map->cache_bypass) {
+	if (!map->cache_bypass && map->format.format_write) {
 		ret = regcache_write(map, reg, val);
 		if (ret != 0)
 			return ret;
@@ -450,12 +469,8 @@ EXPORT_SYMBOL_GPL(regmap_write);
 int regmap_raw_write(struct regmap *map, unsigned int reg,
 		     const void *val, size_t val_len)
 {
-	size_t val_count = val_len / map->format.val_bytes;
 	int ret;
 
-	WARN_ON(!regmap_volatile_range(map, reg, val_count) &&
-		map->cache_type != REGCACHE_NONE);
-
 	mutex_lock(&map->lock);
 
 	ret = _regmap_raw_write(map, reg, val, val_len);
-- 
1.7.1.1
