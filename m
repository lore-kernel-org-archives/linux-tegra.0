From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 4/6] ASoC: tegra_alc5632: assume CONFIG_OF, and other cleanup
Date: Fri, 15 Feb 2013 17:07:33 -0700
Message-ID: <1360973255-344-4-git-send-email-swarren@wwwdotorg.org>
References: <1360973255-344-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360973255-344-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra only supports, and always enables, device tree. Remove all runtime
checks for DT support from the driver.

Also, various minor cleanups so that the probe() body more closely
resembles other drivers, for easier comparison.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c |   15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index c80adb9..48d05d9 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -161,20 +161,13 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 			sizeof(struct tegra_alc5632), GFP_KERNEL);
 	if (!alc5632) {
 		dev_err(&pdev->dev, "Can't allocate tegra_alc5632\n");
-		ret = -ENOMEM;
-		goto err;
+		return -ENOMEM;
 	}
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, alc5632);
 
-	if (!(pdev->dev.of_node)) {
-		dev_err(&pdev->dev, "Must be instantiated using device tree\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
 	alc5632->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
 	if (alc5632->gpio_hp_det == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
@@ -197,11 +190,11 @@ static int tegra_alc5632_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	tegra_alc5632_dai.cpu_of_node = of_parse_phandle(
-			pdev->dev.of_node, "nvidia,i2s-controller", 0);
+	tegra_alc5632_dai.cpu_of_node = of_parse_phandle(np,
+			"nvidia,i2s-controller", 0);
 	if (!tegra_alc5632_dai.cpu_of_node) {
 		dev_err(&pdev->dev,
-		"Property 'nvidia,i2s-controller' missing or invalid\n");
+			"Property 'nvidia,i2s-controller' missing or invalid\n");
 		ret = -EINVAL;
 		goto err;
 	}
-- 
1.7.10.4
