From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: tegra: Remove unnecessary function call" to the asoc tree
Date: Mon, 21 Aug 2017 18:16:29 +0100
Message-ID: <E1djqJR-0003wk-9I@debutante>
References: <1503208937-4377-1-git-send-email-dolinux.peng@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503208937-4377-1-git-send-email-dolinux.peng@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Peng Donglin <dolinux.peng@gmail.com>, Mark Brown <broonie@kernel.org>, lgirdwood@gmail.combroonie@kernel.org, perex@perex.cz, tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.orgPeng Donglin <dolinux.peng@gmail.com>alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: Remove unnecessary function call

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

From e4eabf75ad9a0d4afb4a35c8c4fac7e437d5da06 Mon Sep 17 00:00:00 2001
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Sun, 20 Aug 2017 14:02:17 +0800
Subject: [PATCH] ASoC: tegra: Remove unnecessary function call

First of all,the address of pdev->dev is assigned to card->dev,then
the function platform_set_drvdata copies the value the variable card
to pdev->dev.driver_data, but when calling snd_soc_register_card,the
function dev_set_drvdata(card->dev, card) will also do the same copy
operation,so i think that the former copy operation can be removed.

Signed-off-by: Peng Donglin <dolinux.peng@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra_alc5632.c  | 1 -
 sound/soc/tegra/tegra_max98090.c | 1 -
 sound/soc/tegra/tegra_rt5640.c   | 1 -
 sound/soc/tegra/tegra_rt5677.c   | 1 -
 sound/soc/tegra/tegra_sgtl5000.c | 1 -
 sound/soc/tegra/tegra_wm8753.c   | 1 -
 sound/soc/tegra/tegra_wm8903.c   | 1 -
 sound/soc/tegra/tegra_wm9712.c   | 1 -
 sound/soc/tegra/trimslice.c      | 1 -
 9 files changed, 9 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 0509902512cc..053fe4c5ed4c 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -173,7 +173,6 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, alc5632);
 
 	alc5632->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index c34a54d6e812..41feee9beb12 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -229,7 +229,6 @@ static int tegra_max98090_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
 	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 93a356802345..02f27fe14324 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -174,7 +174,6 @@ static int tegra_rt5640_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
 	machine->gpio_hp_det = of_get_named_gpio_flags(
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index ebf58d0e0f10..3dbf0e1350c1 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -222,7 +222,6 @@ static int tegra_rt5677_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
 	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 6dda01f69983..45a4aa9d2a47 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -124,7 +124,6 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
 	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index d0ab0026a4cd..23a810e3bacc 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -132,7 +132,6 @@ static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
 	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index dbfb49298ae8..d4a4a2be8b42 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -252,7 +252,6 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
 	machine->gpio_spkr_en = of_get_named_gpio(np, "nvidia,spkr-en-gpios",
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index c9cd22432627..864a3345972e 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -81,7 +81,6 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
 	machine->codec = platform_device_alloc("wm9712-codec", -1);
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index c9dcad9bb931..99bcdd979eb2 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -127,7 +127,6 @@ static int tegra_snd_trimslice_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, trimslice);
 
 	trimslice_tlv320aic23_dai.codec_of_node = of_parse_phandle(np,
-- 
2.13.3
