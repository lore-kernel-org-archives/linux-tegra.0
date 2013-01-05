From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 0/3] Tegra AC97 v2
Date: Sat,  5 Jan 2013 02:18:42 +0100
Message-ID: <1357348725-32139-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

v2 of the Tegra AC97 series. Unmerged ASoC related patches only.

The machine driver now instantiates the codec driver by itself,
without usage of DT. Other fixups for review feedback also included.

I'll post a patch for the AC97 clock once Prashant patches land
in a branch.

Lucas Stach (3):
  ASoC: tegra: add ac97 host driver
  ASoC: tegra:  add ac97 host controller to device tree
  ASoC: tegra: add tegra machine driver using wm9712 codec

 .../bindings/sound/nvidia,tegra-audio-wm9712.txt   |  51 +++
 .../bindings/sound/nvidia,tegra20-ac97.txt         |  22 +
 arch/arm/boot/dts/tegra20.dtsi                     |   9 +
 sound/soc/tegra/Kconfig                            |  19 +
 sound/soc/tegra/Makefile                           |   4 +
 sound/soc/tegra/tegra20_ac97.c                     | 480 +++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.h                     |  95 ++++
 sound/soc/tegra/tegra_wm9712.c                     | 179 ++++++++
 8 files changed, 859 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
 create mode 100644 sound/soc/tegra/tegra20_ac97.c
 create mode 100644 sound/soc/tegra/tegra20_ac97.h
 create mode 100644 sound/soc/tegra/tegra_wm9712.c

-- 
1.8.0.1
