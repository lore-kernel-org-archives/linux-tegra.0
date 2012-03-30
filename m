From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 13/17] ASoC: tegra: set a sensible initial clock rate
Date: Fri, 30 Mar 2012 17:07:28 -0600
Message-ID: <1333148852-17806-14-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Initialize the audio clock tree appropriately for some reasonable rate.
This makes sure the PLLs etc. are actually programmed to something
reasonable when the audio driver is loaded.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_asoc_utils.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
index 7e5c412..22397d4 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -152,8 +152,14 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 		goto err_put_pll_a_out0;
 	}
 
+	ret = tegra_asoc_utils_set_rate(data, 48000, 256 * 48000);
+	if (ret)
+		goto err_put_cdev1;
+
 	return 0;
 
+err_put_cdev1:
+	clk_put(data->clk_cdev1);
 err_put_pll_a_out0:
 	clk_put(data->clk_pll_a_out0);
 err_put_pll_a:
-- 
1.7.0.4
