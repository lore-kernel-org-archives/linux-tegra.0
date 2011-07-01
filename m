From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ASoC: Tegra: I2S: s/clk_get_sys/clk_get/
Date: Fri,  1 Jul 2011 13:56:14 -0600
Message-ID: <1309550175-30551-3-git-send-email-swarren@nvidia.com>
References: <1309550175-30551-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1309550175-30551-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The clock needed by the I2S driver is associated with the I2S device name
in the standard fashion. Hence, use clk_get(dev) instead of clk_get_sys(clk_name).

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_i2s.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 95f03c1..f36b996 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -354,7 +354,6 @@ struct snd_soc_dai_driver tegra_i2s_dai[] = {
 static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 {
 	struct tegra_i2s * i2s;
-	char clk_name[12]; /* tegra-i2s.0 */
 	struct resource *mem, *memregion, *dmareq;
 	int ret;
 
@@ -389,8 +388,7 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, i2s);
 
-	snprintf(clk_name, sizeof(clk_name), DRV_NAME ".%d", pdev->id);
-	i2s->clk_i2s = clk_get_sys(clk_name, NULL);
+	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2s->clk_i2s)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
 		ret = PTR_ERR(i2s->clk_i2s);
-- 
1.7.0.4
