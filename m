From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: tegra: fix device_node refcounting" to the asoc tree
Date: Mon, 18 Jun 2018 12:59:39 +0100
Message-ID: <E1fUsot-0008Lr-UI@debutante>
References: <1529101378-5543-1-git-send-email-khoroshilov@ispras.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529101378-5543-1-git-send-email-khoroshilov@ispras.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ldv-project@linuxtesting.org, alsa-devel@alsa-project.org, sil2review@lists.osadl.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-tegra@vger.kernel.orgalsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: fix device_node refcounting

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

From 7c5dfd549617b87db8e891ff4ecaa4a582b6c4cc Mon Sep 17 00:00:00 2001
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Date: Sat, 16 Jun 2018 01:22:58 +0300
Subject: [PATCH] ASoC: tegra: fix device_node refcounting

tegra_rt5677_probe() gets a couple of device nodes with of_parse_phandle(),
but there is no release of them.

The patch adds the release to tegra_rt5677_remove() and
to error handling paths in the probe.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Reviewed-by: Nicholas Mc Guire <der.herr@hofr.at>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra_rt5677.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index 0e4805c7b4ca..7081f15302cc 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -264,13 +264,13 @@ static int tegra_rt5677_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
 		ret = -EINVAL;
-		goto err;
+		goto err_put_codec_of_node;
 	}
 	tegra_rt5677_dai.platform_of_node = tegra_rt5677_dai.cpu_of_node;
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-		goto err;
+		goto err_put_cpu_of_node;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
@@ -283,6 +283,13 @@ static int tegra_rt5677_probe(struct platform_device *pdev)
 
 err_fini_utils:
 	tegra_asoc_utils_fini(&machine->util_data);
+err_put_cpu_of_node:
+	of_node_put(tegra_rt5677_dai.cpu_of_node);
+	tegra_rt5677_dai.cpu_of_node = NULL;
+	tegra_rt5677_dai.platform_of_node = NULL;
+err_put_codec_of_node:
+	of_node_put(tegra_rt5677_dai.codec_of_node);
+	tegra_rt5677_dai.codec_of_node = NULL;
 err:
 	return ret;
 }
@@ -296,6 +303,12 @@ static int tegra_rt5677_remove(struct platform_device *pdev)
 
 	tegra_asoc_utils_fini(&machine->util_data);
 
+	tegra_rt5677_dai.platform_of_node = NULL;
+	of_node_put(tegra_rt5677_dai.codec_of_node);
+	tegra_rt5677_dai.codec_of_node = NULL;
+	of_node_put(tegra_rt5677_dai.cpu_of_node);
+	tegra_rt5677_dai.cpu_of_node = NULL;
+
 	return 0;
 }
 
-- 
2.17.1
