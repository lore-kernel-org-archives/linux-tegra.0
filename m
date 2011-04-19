From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] ASoC: Tegra: wm8903: Remove redundant drvdata clears
Date: Tue, 19 Apr 2011 12:46:14 -0600
Message-ID: <1303238777-14277-2-git-send-email-swarren@nvidia.com>
References: <1303238777-14277-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303238777-14277-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When the driver is not initialized/registered, nothing should be touching
these fields anyway, so there's no point clearing them out.

(Applying Mark's TrimSlice review comments to the existing driver)

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 1eb0632..b12b1fd 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -417,15 +417,12 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		goto err_clear_drvdata;
+		goto err_fini_utils;
 	}
 
 	return 0;
 
-err_clear_drvdata:
-	snd_soc_card_set_drvdata(card, NULL);
-	platform_set_drvdata(pdev, NULL);
-	card->dev = NULL;
+err_fini_utils:
 	tegra_asoc_utils_fini(&machine->util_data);
 err_free_machine:
 	kfree(machine);
@@ -440,10 +437,6 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_card(card);
 
-	snd_soc_card_set_drvdata(card, NULL);
-	platform_set_drvdata(pdev, NULL);
-	card->dev = NULL;
-
 	tegra_asoc_utils_fini(&machine->util_data);
 
 	if (machine->gpio_requested & GPIO_EXT_MIC_EN)
-- 
1.7.1
