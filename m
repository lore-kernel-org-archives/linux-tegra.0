From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] regmap: Bypassing cache when initializing cache
Date: Fri, 17 Feb 2012 18:57:26 +0530
Message-ID: <1329485246-14226-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

During regcache_init, if client has not passed the
default data of cached register then it is directly
read from the hw to initialize cache. This hw register
read happens before cache ops are initialized and hence
avoiding register read to check for the data available
on cache or not by enabling flag of cache_bypass.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Observed that regcache_hw_init() is gettign called before
cache->ops->init() hapens. The function regcache_hw_init()
is calling the regmap_bulk_read() which internally calls the
regcache-read() and ending with cache->ops->read() and this
cause of system crash as the cache ops are not initialized.
With this patch, avoiding the regcache-read() from
regmap_bulk_read() by enabling cache bypass.


 drivers/base/regmap/regcache.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index a10e81c..853dfff 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -35,12 +35,17 @@ static int regcache_hw_init(struct regmap *map)
 		return -EINVAL;
 
 	if (!map->reg_defaults_raw) {
+		u32 cache_bypass = map->cache_bypass;
 		dev_warn(map->dev, "No cache defaults, reading back from HW\n");
+
+		/* Bypass the cache access till data read from HW*/
+		map->cache_bypass = 1;
 		tmp_buf = kmalloc(map->cache_size_raw, GFP_KERNEL);
 		if (!tmp_buf)
 			return -EINVAL;
 		ret = regmap_bulk_read(map, 0, tmp_buf,
 				       map->num_reg_defaults_raw);
+		map->cache_bypass = cache_bypass;
 		if (ret < 0) {
 			kfree(tmp_buf);
 			return ret;
-- 
1.7.1.1
