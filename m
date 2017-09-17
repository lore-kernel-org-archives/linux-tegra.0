From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: [PATCH] sound: tegra20-spdif: remove "default m"
Date: Sun, 17 Sep 2017 17:15:04 +0200
Message-ID: <c765842d4cc6af91ae0d6977922e6ae6f6e1dfa8.1505661134.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Default != n for drivers is frowned upon. This is the only one among
tegra sound drivers that was different.

Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
---
 sound/soc/tegra/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 6875fc39a575..6c893c677110 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -38,7 +38,6 @@ config SND_SOC_TEGRA20_I2S
 config SND_SOC_TEGRA20_SPDIF
 	tristate "Tegra20 SPDIF interface"
 	depends on SND_SOC_TEGRA
-	default m
 	help
 	  Say Y or M if you want to add support for the Tegra20 SPDIF interface.
 	  You will also need to select the individual machine drivers to support
-- 
2.11.0
