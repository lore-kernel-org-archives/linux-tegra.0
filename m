From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: tegra: improve goto error label" to the asoc tree
Date: Fri, 20 Jul 2018 13:19:16 +0100
Message-ID: <E1fgUNQ-0006A3-Lc@debutante>
References: <20180720080424.31505-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720080424.31505-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: improve goto error label

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

From 2ec42486358f63c4a426514c395d13f4b9de5da8 Mon Sep 17 00:00:00 2001
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Date: Fri, 20 Jul 2018 10:04:23 +0200
Subject: [PATCH] ASoC: tegra: improve goto error label

While the two error labels "err" and "err_clk_put" goto the same place
it is rather confusing that the earlier one is certainly used later
again.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra20_ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index affad46bf188..682ef33afb5f 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -377,7 +377,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(ac97->clk_ac97);
 	if (ret) {
 		dev_err(&pdev->dev, "clk_enable failed: %d\n", ret);
-		goto err;
+		goto err_clk_put;
 	}
 
 	ret = snd_soc_set_ac97_ops(&tegra20_ac97_ops);
-- 
2.18.0
