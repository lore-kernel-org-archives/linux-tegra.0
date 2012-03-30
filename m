From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 09/17] ASoC: tegra: sort Makefile into common and per-SoC files
Date: Fri, 30 Mar 2012 17:07:24 -0600
Message-ID: <1333148852-17806-10-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The DAS, I2S, and SPDIF drivers are Tegra20-specific. Group these
together so that when Tegra30-specific equivalents are added later, the
file ordering makes sense.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 6d5d81e..714d360 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -1,13 +1,13 @@
 # Tegra platform Support
-snd-soc-tegra-das-objs := tegra_das.o
 snd-soc-tegra-pcm-objs := tegra_pcm.o
+snd-soc-tegra-utils-objs += tegra_asoc_utils.o
+snd-soc-tegra-das-objs := tegra_das.o
 snd-soc-tegra-i2s-objs := tegra_i2s.o
 snd-soc-tegra-spdif-objs := tegra_spdif.o
-snd-soc-tegra-utils-objs += tegra_asoc_utils.o
 
+obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
 obj-$(CONFIG_SND_SOC_TEGRA_DAS) += snd-soc-tegra-das.o
-obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA_I2S) += snd-soc-tegra-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA_SPDIF) += snd-soc-tegra-spdif.o
 
-- 
1.7.0.4
