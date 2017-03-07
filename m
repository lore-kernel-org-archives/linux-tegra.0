From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "ASoC: tegra: Remove unnecessary 'out of memory' message" to the asoc tree
Date: Tue, 07 Mar 2017 13:57:11 +0100
Message-ID: <E1clEfv-0004bl-NZ@finisterre>
References: <1488021488-17847-1-git-send-email-codrut.cristian.grosu@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488021488-17847-1-git-send-email-codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Codrut GROSU <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.orgbroonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.orgalsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: Remove unnecessary 'out of memory' message

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

From e2c187a689b4a717024ba90c67a6ecd8ff36a23e Mon Sep 17 00:00:00 2001
From: Codrut Grosu <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sat, 25 Feb 2017 13:18:08 +0200
Subject: [PATCH] ASoC: tegra: Remove unnecessary 'out of memory' message

This was reported by checkpatch.pl

Signed-off-by: Codrut GROSU <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 sound/soc/tegra/tegra20_ac97.c   | 1 -
 sound/soc/tegra/tegra20_das.c    | 1 -
 sound/soc/tegra/tegra20_i2s.c    | 1 -
 sound/soc/tegra/tegra20_spdif.c  | 5 ++---
 sound/soc/tegra/tegra30_ahub.c   | 4 +---
 sound/soc/tegra/tegra30_i2s.c    | 1 -
 sound/soc/tegra/tegra_alc5632.c  | 4 +---
 sound/soc/tegra/tegra_max98090.c | 4 +---
 sound/soc/tegra/tegra_rt5640.c   | 4 +---
 sound/soc/tegra/tegra_sgtl5000.c | 4 +---
 sound/soc/tegra/tegra_wm8753.c   | 4 +---
 sound/soc/tegra/tegra_wm8903.c   | 4 +---
 sound/soc/tegra/tegra_wm9712.c   | 4 +---
 sound/soc/tegra/trimslice.c      | 4 +---
 14 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index a68368edab9c..affad46bf188 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -318,7 +318,6 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97 = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_ac97),
 			    GFP_KERNEL);
 	if (!ac97) {
-		dev_err(&pdev->dev, "Can't allocate tegra20_ac97\n");
 		ret = -ENOMEM;
 		goto err;
 	}
diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 89add13c31cf..6d4a2774135e 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -142,7 +142,6 @@ static int tegra20_das_probe(struct platform_device *pdev)
 
 	das = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_das), GFP_KERNEL);
 	if (!das) {
-		dev_err(&pdev->dev, "Can't allocate tegra20_das\n");
 		ret = -ENOMEM;
 		goto err;
 	}
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 14106fa82bca..26253c2849e7 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -345,7 +345,6 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_i2s), GFP_KERNEL);
 	if (!i2s) {
-		dev_err(&pdev->dev, "Can't allocate tegra20_i2s\n");
 		ret = -ENOMEM;
 		goto err;
 	}
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index a0c3640572b9..767c0491e11a 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -271,10 +271,9 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	spdif = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_spdif),
 			     GFP_KERNEL);
-	if (!spdif) {
-		dev_err(&pdev->dev, "Can't allocate tegra20_spdif\n");
+	if (!spdif)
 		return -ENOMEM;
-	}
+
 	dev_set_drvdata(&pdev->dev, spdif);
 
 	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index fef3b9a21a66..d7494c0e9053 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -560,10 +560,8 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
-	if (!ahub) {
-		dev_err(&pdev->dev, "Can't allocate tegra30_ahub\n");
+	if (!ahub)
 		return -ENOMEM;
-	}
 	dev_set_drvdata(&pdev->dev, ahub);
 
 	ahub->soc_data = soc_data;
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 8e55583aa104..b2b279c96029 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -385,7 +385,6 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_i2s), GFP_KERNEL);
 	if (!i2s) {
-		dev_err(&pdev->dev, "Can't allocate tegra30_i2s\n");
 		ret = -ENOMEM;
 		goto err;
 	}
diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index eead6e7f205b..0509902512cc 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -169,10 +169,8 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 
 	alc5632 = devm_kzalloc(&pdev->dev,
 			sizeof(struct tegra_alc5632), GFP_KERNEL);
-	if (!alc5632) {
-		dev_err(&pdev->dev, "Can't allocate tegra_alc5632\n");
+	if (!alc5632)
 		return -ENOMEM;
-	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index a403db6d563e..c34a54d6e812 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -225,10 +225,8 @@ static int tegra_max98090_probe(struct platform_device *pdev)
 
 	machine = devm_kzalloc(&pdev->dev,
 			sizeof(struct tegra_max98090), GFP_KERNEL);
-	if (!machine) {
-		dev_err(&pdev->dev, "Can't allocate tegra_max98090\n");
+	if (!machine)
 		return -ENOMEM;
-	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 25b9fc03ba62..93a356802345 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -170,10 +170,8 @@ static int tegra_rt5640_probe(struct platform_device *pdev)
 
 	machine = devm_kzalloc(&pdev->dev,
 			sizeof(struct tegra_rt5640), GFP_KERNEL);
-	if (!machine) {
-		dev_err(&pdev->dev, "Can't allocate tegra_rt5640\n");
+	if (!machine)
 		return -ENOMEM;
-	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 4bbab098f50b..6dda01f69983 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -120,10 +120,8 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_sgtl5000),
 			       GFP_KERNEL);
-	if (!machine) {
-		dev_err(&pdev->dev, "Can't allocate tegra_sgtl5000 struct\n");
+	if (!machine)
 		return -ENOMEM;
-	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index bdedd1028569..d0ab0026a4cd 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -128,10 +128,8 @@ static int tegra_wm8753_driver_probe(struct platform_device *pdev)
 
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm8753),
 			       GFP_KERNEL);
-	if (!machine) {
-		dev_err(&pdev->dev, "Can't allocate tegra_wm8753 struct\n");
+	if (!machine)
 		return -ENOMEM;
-	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 2013e9c4bba0..dbfb49298ae8 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -248,10 +248,8 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm8903),
 			       GFP_KERNEL);
-	if (!machine) {
-		dev_err(&pdev->dev, "Can't allocate tegra_wm8903 struct\n");
+	if (!machine)
 		return -ENOMEM;
-	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index 6492f8143ff1..c9cd22432627 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -77,10 +77,8 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm9712),
 			       GFP_KERNEL);
-	if (!machine) {
-		dev_err(&pdev->dev, "Can't allocate tegra_wm9712 struct\n");
+	if (!machine)
 		return -ENOMEM;
-	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 870f84ab5005..c9dcad9bb931 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -123,10 +123,8 @@ static int tegra_snd_trimslice_probe(struct platform_device *pdev)
 
 	trimslice = devm_kzalloc(&pdev->dev, sizeof(struct tegra_trimslice),
 				 GFP_KERNEL);
-	if (!trimslice) {
-		dev_err(&pdev->dev, "Can't allocate tegra_trimslice\n");
+	if (!trimslice)
 		return -ENOMEM;
-	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
-- 
2.11.0
