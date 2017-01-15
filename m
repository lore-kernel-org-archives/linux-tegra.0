From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] ASoC: tegra: constify tegra30_ahub_soc_data structures
Date: Sun, 15 Jan 2017 23:09:29 +0530
Message-ID: <1484501969-7945-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: julia.lawall@lip6.fr, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, gnurou@gmail.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-Id: linux-tegra@vger.kernel.org

The tegra30_ahub_soc_data structures are only stored in the data field
of of_device_id structures. This field is of type const, so
tegra30_ahub_soc_data structures having the same property can be
declared const too.

File size before: sound/soc/tegra/tegra30_ahub.o
   text	   data	    bss	    dec	    hex	filename
   7079	    240	      8	   7327	   1c9f	sound/soc/tegra/tegra30_ahub.o

File size after: sound/soc/tegra/tegra30_ahub.o
   text	   data	    bss	    dec	    hex	filename
   7143	    192	      8	   7343	   1caf	sound/soc/tegra/tegra30_ahub.o

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index fef3b9a..e63ef8d 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -493,17 +493,17 @@ static bool tegra30_ahub_ahub_wr_rd_reg(struct device *dev, unsigned int reg)
 	.cache_type = REGCACHE_FLAT,
 };
 
-static struct tegra30_ahub_soc_data soc_data_tegra30 = {
+static const struct tegra30_ahub_soc_data soc_data_tegra30 = {
 	.mod_list_mask = MOD_LIST_MASK_TEGRA30,
 	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
-static struct tegra30_ahub_soc_data soc_data_tegra114 = {
+static const struct tegra30_ahub_soc_data soc_data_tegra114 = {
 	.mod_list_mask = MOD_LIST_MASK_TEGRA114,
 	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
-static struct tegra30_ahub_soc_data soc_data_tegra124 = {
+static const struct tegra30_ahub_soc_data soc_data_tegra124 = {
 	.mod_list_mask = MOD_LIST_MASK_TEGRA124,
 	.set_audio_cif = tegra124_ahub_set_cif,
 };
-- 
1.9.1
