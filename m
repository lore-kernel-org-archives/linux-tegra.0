From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ASoC: Tegra: Suspend/resume support
Date: Tue,  5 Apr 2011 14:27:36 -0600
Message-ID: <1302035256-26301-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

ASoC machine drivers that are their own platform_driver (as opposed to
those using the soc-audio platform_driver) need to explicitly set up
power-management operation callbacks.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note: This has been tested in the ChromeOS-2.6.37 kernel, with a backport
of ASoC for-2.6.39, on Seaboard. I have not tested it in mainline (I'm not
sure whether mainline has PM support for the Tegra platform yet), although
I did at least compile-test it.

 sound/soc/tegra/harmony.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index 8585957..a67d521 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -366,10 +366,17 @@ static int __devexit tegra_snd_harmony_remove(struct platform_device *pdev)
 	return 0;
 }
 
+const struct dev_pm_ops harmony_pm_ops = {
+	.suspend = snd_soc_suspend,
+	.resume = snd_soc_resume,
+	.poweroff = snd_soc_poweroff,
+};
+
 static struct platform_driver tegra_snd_harmony_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
+		.pm = &harmony_pm_ops,
 	},
 	.probe = tegra_snd_harmony_probe,
 	.remove = __devexit_p(tegra_snd_harmony_remove),
-- 
1.7.1
