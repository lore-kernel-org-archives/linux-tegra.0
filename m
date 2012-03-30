From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 05/17] ASoC: tegra: fix Kconfig SND_SOC_TEGRA_ALC5632 indentation
Date: Fri, 30 Mar 2012 17:07:20 -0600
Message-ID: <1333148852-17806-6-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Indent with TABs to be consistent with the rest of the file.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/Kconfig |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 634734e..e42ca2e 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -49,10 +49,10 @@ config SND_SOC_TEGRA_TRIMSLICE
 	  TrimSlice platform.
 
 config SND_SOC_TEGRA_ALC5632
-       tristate "SoC Audio support for Tegra boards using an ALC5632 codec"
-       depends on SND_SOC_TEGRA && I2C
-       select SND_SOC_TEGRA_I2S
-       select SND_SOC_ALC5632
-       help
-         Say Y or M here if you want to add support for SoC audio on the
-         Toshiba AC100 netbook.
+	tristate "SoC Audio support for Tegra boards using an ALC5632 codec"
+	depends on SND_SOC_TEGRA && I2C
+	select SND_SOC_TEGRA_I2S
+	select SND_SOC_ALC5632
+	help
+	  Say Y or M here if you want to add support for SoC audio on the
+	  Toshiba AC100 netbook.
-- 
1.7.0.4
