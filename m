From: Dylan Reid <dgreid@chromium.org>
Subject: [PATCH] ASoC: tegra: Use flat regcache.
Date: Mon, 17 Mar 2014 20:58:59 -0700
Message-ID: <1395115139-22243-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org, abrestic@chromium.org, Dylan Reid <dgreid@chromium.org>, broonie@kernel.org, swarren@wwwdotorg.org
List-Id: linux-tegra@vger.kernel.org

When using an rbtree cache, there can be allocations the first time a
register is accessed.  This can cause an attempt to schedule while
atomic in the case that the regmap is using a spinlock.  This could be
fixed by either initializing all the registers or using a flat cache.
The register maps for tegra30_ahub and tegra30_i2s are dense and don't
save much from using a tree so convert them to flat.

Signed-off-by: Dylan Reid <dgreid@chromium.org>
---
 sound/soc/tegra/tegra30_ahub.c | 4 ++--
 sound/soc/tegra/tegra30_i2s.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
