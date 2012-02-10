From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] regmap: add regmap_bulk_write() for register write
Date: Fri, 10 Feb 2012 18:37:18 +0530
Message-ID: <1328879238-9290-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The bulk_write() supports the data transfer to multi
register which takes the data into cpu_endianness format
and does formatting of data to device format before
sending to device.
The transfer can be completed in single transfer or multiple
transfer based on data formatting.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from V1:
- Change commit message.
- Byte swapping in input data packet.
 drivers/base/regmap/regmap.c |   53 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/regmap.h       |    2 +
 2 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index b4f4455..875e381 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -482,6 +482,59 @@ int regmap_raw_write(struct regmap *map, unsigned int reg,
 }
 EXPORT_SYMBOL_GPL(regmap_raw_write);
 
+/*
+ * regmap_bulk_write(): Write multiple registers to the device
+ *
+ * @map: Register map to write to
+ * @reg: First register to be write from
+ * @val: Block of data to be written, in native register size for device
+ * @val_count: Number of registers to write
+ *
+ * This function is intended to be used for writing a large block of
+ * data to be device either in single transfer or multiple transfer.
+ *
+ * A value of zero will be returned on success, a negative errno will
+ * be returned in error cases.
+ */
+int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
+		     size_t val_count)
+{
+	int ret = 0, i;
+	unsigned int ival;
+	size_t val_bytes = map->format.val_bytes;
+
+	mutex_lock(&map->lock);
+
+	if (map->format.parse_val) {
+		void *wptr = kmemdup(val, val_count, GFP_KERNEL);
+		if (!wptr) {
+			mutex_unlock(&map->lock);
+			dev_err(map->dev, "Error in memory allocation\n");
+			return -ENOMEM;
+		}
+		for (i = 0; i < val_count * val_bytes; i += val_bytes)
+			map->format.parse_val(wptr + i);
+		ret = _regmap_raw_write(map, reg, wptr, val_bytes * val_count);
+
+		kfree(wptr);
+	} else {
+		for (i = 0; i < val_count; i++) {
+			memcpy(&ival, val + (i * val_bytes), val_bytes);
+			ret = _regmap_write(map, reg + i, ival);
+			if (ret) {
+				dev_err(map->dev,
+				    "Error in register %u write, ret %d\n",
+						reg + i, ret);
+				break;
+			}
+		}
+	}
+
+	mutex_unlock(&map->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(regmap_bulk_write);
+
 static int _regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 			    unsigned int val_len)
 {
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index a6ed6e6..0925e24 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -135,6 +135,8 @@ int regmap_reinit_cache(struct regmap *map,
 int regmap_write(struct regmap *map, unsigned int reg, unsigned int val);
 int regmap_raw_write(struct regmap *map, unsigned int reg,
 		     const void *val, size_t val_len);
+int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
+			size_t val_count);
 int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val);
 int regmap_raw_read(struct regmap *map, unsigned int reg,
 		    void *val, size_t val_len);
-- 
1.7.1.1
