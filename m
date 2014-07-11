From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/12] misc: fuse: fix dummy functions
Date: Fri, 11 Jul 2014 14:16:07 +0200
Message-ID: <1405080971-7609-9-git-send-email-thierry.reding@gmail.com>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405080971-7609-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra fuse header's dummy functions for the case where Tegra20 is
disabled are inconsistent with the correct prototypes, and have some
syntax errors. Fix these. While at it, fix the indentation level of
the dummy function bodies.

Fixes: 3aa9ba4b265b ("soc/tegra: Add efuse driver for Tegra")
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index b3442770df09..3a398bf3572c 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -38,14 +38,14 @@ void tegra20_init_fuse_early(void);
 u32 tegra20_fuse_early(const unsigned int offset);
 #else
 static inline void tegra20_init_speedo_data(struct tegra_sku_info *sku_info) {}
-static inline bool tegra20_spare_fuse_early(int spare_bit, void *fuse_base)
+static inline bool tegra20_spare_fuse_early(int spare_bit)
 {
-			return false;
+	return false;
 }
-static inline void tegra20_init_fuse_early(void);
-static inline tegra20_fuse_early(const unsigned int offset);
+static inline void tegra20_init_fuse_early(void) {}
+static inline u32 tegra20_fuse_early(const unsigned int offset)
 {
-			return 0;
+	return 0;
 }
 #endif
 
-- 
2.0.1
