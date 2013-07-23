From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 25/27] sound/soc/tegra: don't check resource with devm_ioremap_resource
Date: Tue, 23 Jul 2013 20:01:58 +0200
Message-ID: <1374602524-3398-26-git-send-email-wsa@the-dreams.de>
References: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Stephen Warren <swarren@wwwdotorg.org>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
Please apply via the subsystem-tree.

 sound/soc/tegra/tegra20_ac97.c |    7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index e58233f..ef3d0e0 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -334,12 +334,6 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	}
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		dev_err(&pdev->dev, "No memory resource\n");
-		ret = -ENODEV;
-		goto err_clk_put;
-	}
-
 	regs = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
@@ -432,7 +426,6 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_unregister_pcm:
 	tegra_pcm_platform_unregister(&pdev->dev);
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
-- 
1.7.10.4
