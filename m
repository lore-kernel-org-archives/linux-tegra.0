From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: [PATCH] Revert part of "ASoC: tegra: Convert to managed resources"
Date: Tue, 18 Aug 2015 17:26:45 +0530
Message-ID: <20150818115645.GA3345@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Revert the problematic part of commit 470805eb9f31 ("ASoC: tegra:
Convert to managed resources"). Before this commit, PM cleanup was
performed after the component was unregistered. But returning
directly will skip PM cleanup. So, to be on safe side it is better
to use snd_soc_register_component instead of
devm_snd_soc_register_component.

Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index a814da0..66237bc 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -329,9 +329,8 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &tegra20_spdif_component,
-					      &tegra20_spdif_dai, 1);
+	ret = snd_soc_register_component(&pdev->dev, &tegra20_spdif_component,
+					 &tegra20_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
@@ -341,11 +340,13 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	ret = tegra_pcm_platform_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
-		return ret;
+		goto err_unregister_component;
 	}
 
 	return 0;
 
+err_unregister_component:
+	snd_soc_unregister_component(&pdev->dev);
 err_suspend:
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra20_spdif_runtime_suspend(&pdev->dev);
@@ -364,6 +365,7 @@ static int tegra20_spdif_platform_remove(struct platform_device *pdev)
 		tegra20_spdif_runtime_suspend(&pdev->dev);
 
 	tegra_pcm_platform_unregister(&pdev->dev);
+	snd_soc_unregister_component(&pdev->dev);
 
 	return 0;
 }
-- 
1.9.1
