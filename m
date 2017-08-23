From: Peng Donglin <dolinux.peng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 09/10] ASoC: tegra: Remove unnecessary function call
Date: Wed, 23 Aug 2017 05:21:29 -0700
Message-ID: <6b03e980e52002d0127c648e96b96a6d267ead8e.1503484313.git.dolinux.peng@gmail.com>
References: <cover.1503484313.git.dolinux.peng@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1503484313.git.dolinux.peng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peng Donglin <dolinux.peng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The work of the function platform_set_drvdata is done by
devm_snd_soc_register_card.

Signed-off-by: Peng Donglin <dolinux.peng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
2.14.1
