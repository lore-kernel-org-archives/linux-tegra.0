From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 13/17] ASoC: Tegra TrimSlice machine: Use devm_ APIs and module_platform_driver
Date: Tue, 22 Nov 2011 18:21:21 -0700
Message-ID: <1322011285-4002-14-git-send-email-swarren@nvidia.com>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322011285-4002-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

module_platform_drive saves some boiler-plate code.

The devm_ APIs remove the need to manually clean up allocations,
thus removing some code.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/trimslice.c |   26 +++++++-------------------
 1 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 2699a6f..d564b40 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -170,15 +170,17 @@ static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
 	struct tegra_trimslice *trimslice;
 	int ret;
 
-	trimslice = kzalloc(sizeof(struct tegra_trimslice), GFP_KERNEL);
+	trimslice = devm_kzalloc(&pdev->dev, sizeof(struct tegra_trimslice),
+				 GFP_KERNEL);
 	if (!trimslice) {
 		dev_err(&pdev->dev, "Can't allocate tegra_trimslice\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err;
 	}
 
 	ret = tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
 	if (ret)
-		goto err_free_trimslice;
+		goto err;
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
@@ -195,8 +197,7 @@ static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
 
 err_fini_utils:
 	tegra_asoc_utils_fini(&trimslice->util_data);
-err_free_trimslice:
-	kfree(trimslice);
+err:
 	return ret;
 }
 
@@ -209,8 +210,6 @@ static int __devexit tegra_snd_trimslice_remove(struct platform_device *pdev)
 
 	tegra_asoc_utils_fini(&trimslice->util_data);
 
-	kfree(trimslice);
-
 	return 0;
 }
 
@@ -222,18 +221,7 @@ static struct platform_driver tegra_snd_trimslice_driver = {
 	.probe = tegra_snd_trimslice_probe,
 	.remove = __devexit_p(tegra_snd_trimslice_remove),
 };
-
-static int __init snd_tegra_trimslice_init(void)
-{
-	return platform_driver_register(&tegra_snd_trimslice_driver);
-}
-module_init(snd_tegra_trimslice_init);
-
-static void __exit snd_tegra_trimslice_exit(void)
-{
-	platform_driver_unregister(&tegra_snd_trimslice_driver);
-}
-module_exit(snd_tegra_trimslice_exit);
+module_platform_driver(tegra_snd_trimslice_driver);
 
 MODULE_AUTHOR("Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>");
 MODULE_DESCRIPTION("Trimslice machine ASoC driver");
-- 
1.7.0.4
