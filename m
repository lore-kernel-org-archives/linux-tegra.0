From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ASoC: Tegra: Suspend/resume support
Date: Tue,  5 Apr 2011 19:35:30 -0600
Message-ID: <1302053730-1658-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

ASoC machine drivers that are their own platform_driver (as opposed to
those using the soc-audio platform_driver) need to explicitly set up
power-management operation callbacks.

To avoid cut/paste, snd_soc_pm_ops also needs to be exported.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Export and use snd_soc_pm_ops directly instead of lazily cut and
    pasting it.

 sound/soc/soc-core.c      |    1 +
 sound/soc/tegra/harmony.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0cf6997..1c7e82a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2060,6 +2060,7 @@ const struct dev_pm_ops snd_soc_pm_ops = {
 	.resume = snd_soc_resume,
 	.poweroff = snd_soc_poweroff,
 };
+EXPORT_SYMBOL_GPL(snd_soc_pm_ops);
 
 /* ASoC platform driver */
 static struct platform_driver soc_driver = {
diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index 8585957..556a571 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -370,6 +370,7 @@ static struct platform_driver tegra_snd_harmony_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
+		.pm = &snd_soc_pm_ops,
 	},
 	.probe = tegra_snd_harmony_probe,
 	.remove = __devexit_p(tegra_snd_harmony_remove),
-- 
1.7.1
