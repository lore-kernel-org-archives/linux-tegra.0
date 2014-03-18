From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] ASoC: tegra: Use flat regcache.
Date: Mon, 17 Mar 2014 22:08:49 -0700
Message-ID: <1395119329-30721-1-git-send-email-dgreid@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When using an rbtree cache, there can be allocations the first time a
register is accessed.  This can cause an attempt to schedule while
atomic in the case that the regmap is using a spinlock.  This could be
fixed by either initializing all the registers or using a flat cache.
The register maps for tegra30_ahub and tegra30_i2s are dense and don't
save much from using a tree so convert them to flat.

Tegra30 changes tested on Norrin, Tegra20 changes compile.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes v1 to v2:
   Fix Tegra20 fix as well.

 sound/soc/tegra/tegra20_ac97.c  | 2 +-
 sound/soc/tegra/tegra20_das.c   | 2 +-
 sound/soc/tegra/tegra20_i2s.c   | 2 +-
 sound/soc/tegra/tegra20_spdif.c | 2 +-
 sound/soc/tegra/tegra30_ahub.c  | 4 ++--
 sound/soc/tegra/tegra30_i2s.c   | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index cf5e1cf..0a59e23 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -306,7 +306,7 @@ static const struct regmap_config tegra20_ac97_regmap_config = {
 	.readable_reg = tegra20_ac97_wr_rd_reg,
 	.volatile_reg = tegra20_ac97_volatile_reg,
 	.precious_reg = tegra20_ac97_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_FLAT,
 };
 
 static int tegra20_ac97_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index e723929..a634f13 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -128,7 +128,7 @@ static const struct regmap_config tegra20_das_regmap_config = {
 	.max_register = LAST_REG(DAC_INPUT_DATA_CLK_SEL),
 	.writeable_reg = tegra20_das_wr_rd_reg,
 	.readable_reg = tegra20_das_wr_rd_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_FLAT,
 };
 
 static int tegra20_das_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 42c1f6b..79a9932 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -333,7 +333,7 @@ static const struct regmap_config tegra20_i2s_regmap_config = {
 	.readable_reg = tegra20_i2s_wr_rd_reg,
 	.volatile_reg = tegra20_i2s_volatile_reg,
 	.precious_reg = tegra20_i2s_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_FLAT,
 };
 
 static int tegra20_i2s_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 8c7c102..a0ce924 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -259,7 +259,7 @@ static const struct regmap_config tegra20_spdif_regmap_config = {
 	.readable_reg = tegra20_spdif_wr_rd_reg,
 	.volatile_reg = tegra20_spdif_volatile_reg,
 	.precious_reg = tegra20_spdif_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_FLAT,
 };
 
 static int tegra20_spdif_platform_probe(struct platform_device *pdev)
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d6f4c99..0db68f4 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -471,7 +471,7 @@ static const struct regmap_config tegra30_ahub_apbif_regmap_config = {
 	.readable_reg = tegra30_ahub_apbif_wr_rd_reg,
 	.volatile_reg = tegra30_ahub_apbif_volatile_reg,
 	.precious_reg = tegra30_ahub_apbif_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_FLAT,
 };
 
 static bool tegra30_ahub_ahub_wr_rd_reg(struct device *dev, unsigned int reg)
@@ -490,7 +490,7 @@ static const struct regmap_config tegra30_ahub_ahub_regmap_config = {
 	.max_register = LAST_REG(AUDIO_RX),
 	.writeable_reg = tegra30_ahub_ahub_wr_rd_reg,
 	.readable_reg = tegra30_ahub_ahub_wr_rd_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_FLAT,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra30 = {
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 49ad936..f146c41 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -357,7 +357,7 @@ static const struct regmap_config tegra30_i2s_regmap_config = {
 	.writeable_reg = tegra30_i2s_wr_rd_reg,
 	.readable_reg = tegra30_i2s_wr_rd_reg,
 	.volatile_reg = tegra30_i2s_volatile_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_FLAT,
 };
 
 static const struct tegra30_i2s_soc_data tegra30_i2s_config = {
-- 
1.8.1.3.605.g02339dd
