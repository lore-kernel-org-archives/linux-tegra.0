From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/6] ASoC: tegra_wm9712: assume CONFIG_OF
Date: Fri, 15 Feb 2013 17:07:32 -0700
Message-ID: <1360973255-344-3-git-send-email-swarren@wwwdotorg.org>
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

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm9712.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index 68d4240..ce98e5b 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -79,11 +79,6 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 	struct tegra_wm9712 *machine;
 	int ret;
 
-	if (!pdev->dev.of_node) {
-		dev_err(&pdev->dev, "No platform data supplied\n");
-		return -EINVAL;
-	}
-
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm9712),
 			       GFP_KERNEL);
 	if (!machine) {
-- 
1.7.10.4
