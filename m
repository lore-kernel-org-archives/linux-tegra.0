From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/3] ASoC/ARM: tegra: apalis/colibri t30: sgtl5000 audio
Date: Sat,  4 Oct 2014 02:15:42 +0200
Message-ID: <cover.1412381377.git.marcel@ziswiler.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series adds/integrates Freescale SGTL5000 analogue audio codec
support.

Changes in v3:
- Revert to not using simple-audio-card being incompatible with tegra.
- Rebased to for-next.

Changes in v2:
- Using simple-audio-card as suggested by Fabio.

Marcel Ziswiler (3):
  ASoC: tegra: add tegra sgtl5000 machine driver
  ARM: tegra: apalis/colibri t30: integrate audio support
  ARM: tegra: enable sgtl5000 audio

 .../bindings/sound/nvidia,tegra-audio-sgtl5000.txt |  45 +++++
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  49 +++++
 arch/arm/boot/dts/tegra30-colibri.dtsi             |  49 +++++
 arch/arm/configs/tegra_defconfig                   |   1 +
 sound/soc/tegra/Kconfig                            |  10 +
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_sgtl5000.c                   | 216 +++++++++++++++++++++
 7 files changed, 372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
 create mode 100644 sound/soc/tegra/tegra_sgtl5000.c

-- 
1.9.3
