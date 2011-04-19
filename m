From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] ASoC: Tegra: wm8903 probe: Don't call machine_is_*()
Date: Tue, 19 Apr 2011 12:46:13 -0600
Message-ID: <1303238777-14277-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This machine driver is a platform driver, and hence will only be
instantiated on the correct machines. Hence, there is no need to
check the current machine during probe.

(Applying Mark's TrimSlice review comments to the existing driver)

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 37f6010..1eb0632 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -391,13 +391,6 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	struct tegra_wm8903_platform_data *pdata;
 	int ret;
 
-	if (!machine_is_harmony() && !machine_is_ventana() &&
-	    !machine_is_seaboard() && !machine_is_kaen() &&
-	    !machine_is_aebl()) {
-		dev_err(&pdev->dev, "Not running on a supported board!\n");
-		return -ENODEV;
-	}
-
 	pdata = pdev->dev.platform_data;
 	if (!pdata) {
 		dev_err(&pdev->dev, "No platform data supplied\n");
-- 
1.7.1
