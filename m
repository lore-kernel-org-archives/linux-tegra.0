From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] ASoC/ARM: tegra: apalis/colibri t30: sgtl5000 audio
Date: Wed, 10 Sep 2014 22:54:54 +0200
Message-ID: <cover.1410362950.git.marcel@ziswiler.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series adds/integrates Freescale SGTL5000 analogue audio codec
support.

Changes in v2:
- Using simple-audio-card as suggested by Fabio.

Marcel Ziswiler (2):
  ARM: tegra: apalis/colibri t30: integrate audio support
  ARM: tegra: enable sgtl5000 audio

 arch/arm/boot/dts/tegra30-apalis.dtsi  | 65 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra30-colibri.dtsi | 65 ++++++++++++++++++++++++++++++++++
 arch/arm/configs/tegra_defconfig       |  2 ++
 3 files changed, 132 insertions(+)

-- 
1.9.3
