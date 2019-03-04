From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: soc-core: Fix probe deferral following prelink failure" to the asoc tree
Date: Mon,  4 Mar 2019 15:32:05 +0000 (GMT)
Message-ID: <20190304153205.4F5D71128814@debutante.sirena.org.uk>
References: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.orgalsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: soc-core: Fix probe deferral following prelink failure

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

From c342febcde452f817cbd3896dc40953ab17c309d Mon Sep 17 00:00:00 2001
From: Jonathan Hunter <jonathanh@nvidia.com>
Date: Mon, 4 Mar 2019 13:31:14 +0000
Subject: [PATCH] ASoC: soc-core: Fix probe deferral following prelink failure

Commit 78a24e10cd94 ("ASoC: soc-core: clear platform pointers on error")
re-worked the clean-up of any platform pointers that may have been
initialised by the function snd_soc_init_platform(). This commit missed
one error path where if any of the prelinks for a soundcard failed to
initialise, then these platform pointers would not be cleaned-up. This
then prevents the soundcard from being initialised following a probe
deferral when any of the soundcard prelinks cannot be found.

Fix this by ensuring that soc_cleanup_platform() is called when
initialising the soundcard prelinks fails.

Fixes: 78a24e10cd94 ("ASoC: soc-core: clear platform pointers on error")

Signed-off-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 93d316d5bf8e..5a5764dba147 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2797,6 +2797,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 		ret = soc_init_dai_link(card, link);
 		if (ret) {
+			soc_cleanup_platform(card);
 			dev_err(card->dev, "ASoC: failed to init link %s\n",
 				link->name);
 			mutex_unlock(&client_mutex);
-- 
2.20.1
