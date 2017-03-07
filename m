From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: tegra: Add blank line after
	declarations" to the asoc tree
Date: Tue, 07 Mar 2017 14:33:24 +0100
Message-ID: <E1clFEy-0005Zf-Hu@finisterre>
References: <1488049157-6535-1-git-send-email-codrut.cristian.grosu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1488049157-6535-1-git-send-email-codrut.cristian.grosu@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
Cc: gnurou@gmail.com, alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, swarren@wwwdotorg.org, lgirdwood@gmail.com, tiwai@suse.com, Codrut GROSU <codrut.cristian.grosu@gmail.com>, Julia.Lawall@lip6.fr, broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: Add blank line after declarations

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From bf3c6ef7f5b1e43739ad0356a5afee5127c86465 Mon Sep 17 00:00:00 2001
From: Codrut Grosu <codrut.cristian.grosu@gmail.com>
Date: Sat, 25 Feb 2017 20:59:17 +0200
Subject: [PATCH] ASoC: tegra: Add blank line after declarations

This was reported by checkpatch.pl

Signed-off-by: Codrut GROSU <codrut.cristian.grosu@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra20_das.c  | 1 +
 sound/soc/tegra/tegra30_ahub.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 6d4a2774135e..4024e3abbeed 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -41,6 +41,7 @@ static inline void tegra20_das_write(u32 reg, u32 val)
 static inline u32 tegra20_das_read(u32 reg)
 {
 	u32 val;
+
 	regmap_read(das->regmap, reg, &val);
 	return val;
 }
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d7494c0e9053..8c10ae7982ba 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -41,6 +41,7 @@ static inline void tegra30_apbif_write(u32 reg, u32 val)
 static inline u32 tegra30_apbif_read(u32 reg)
 {
 	u32 val;
+
 	regmap_read(ahub->regmap_apbif, reg, &val);
 	return val;
 }
-- 
2.11.0
