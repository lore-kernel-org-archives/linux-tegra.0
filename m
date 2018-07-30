From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: tegra: i2s: Fix typo/broken macro" to
	the asoc tree
Date: Mon, 30 Jul 2018 12:04:45 +0100 (BST)
Message-ID: <20180730110445.5F46B1124216@debutante.sirena.org.uk>
References: <20180727125931.9794-2-jorge.sanjuan@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180727125931.9794-2-jorge.sanjuan@codethink.co.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Edward Cragg <edward.cragg@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>, broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: i2s: Fix typo/broken macro

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 279fef50b607f9cee94f10bae84f6730e97ccd7c Mon Sep 17 00:00:00 2001
From: Edward Cragg <edward.cragg@codethink.co.uk>
Date: Fri, 27 Jul 2018 13:59:28 +0100
Subject: [PATCH] ASoC: tegra: i2s: Fix typo/broken macro

Fix typo in macro TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK.

Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
Signed-off-by: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra30_i2s.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
index 774fc6ad2026..2e561e946de2 100644
--- a/sound/soc/tegra/tegra30_i2s.h
+++ b/sound/soc/tegra/tegra30_i2s.h
@@ -173,7 +173,7 @@
 /* Number of slots in frame, minus 1 */
 #define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT		16
 #define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK_US	7
-#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK		(TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOT_MASK_US << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOT_SHIFT)
+#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK		(TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK_US << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT)
 
 /* TDM mode slot enable bitmask */
 #define TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT	8
-- 
2.18.0
