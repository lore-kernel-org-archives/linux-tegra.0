From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 04/17] ASoC: tegra: add description to a couple Kconfig options
Date: Fri, 30 Mar 2012 17:07:19 -0600
Message-ID: <1333148852-17806-5-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Even though these options are typically only selected by other options,
it's still useful to give them a brief description.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/Kconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index ce1b773..634734e 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -5,7 +5,7 @@ config SND_SOC_TEGRA
 	  Say Y or M here if you want support for SoC audio on Tegra.
 
 config SND_SOC_TEGRA_I2S
-	tristate
+	tristate "Tegra I2S driver"
 	depends on SND_SOC_TEGRA
 	help
 	  Say Y or M if you want to add support for codecs attached to the
@@ -13,7 +13,7 @@ config SND_SOC_TEGRA_I2S
 	  machine drivers to support below.
 
 config SND_SOC_TEGRA_SPDIF
-	tristate
+	tristate "Tegra SPDIF driver"
 	depends on SND_SOC_TEGRA
 	default m
 	help
-- 
1.7.0.4
