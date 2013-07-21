From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 0/4] Colibri T20 fixes for 3.11
Date: Sun, 21 Jul 2013 23:28:48 +0200
Message-ID: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some fixes for the Colibri T20 board and to AC97 audio. With
this applied 3.11 should be the first kernel with all parts
of AC97 audio support in place and working.

Lucas Stach (4):
  ASOC: tegra: move AC97 clock defines to the controller node
  ASOC: tegra: fix matching of AC97 components
  ARM: tegra: enable ULPI phy on Colibri T20
  ARM: tegra: correct Colibri T20 regulator settings

 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 39 +++++++++++++++---------------
 arch/arm/boot/dts/tegra20.dtsi             |  6 ++++-
 sound/soc/tegra/tegra20_ac97.c             |  2 +-
 sound/soc/tegra/tegra_wm9712.c             |  1 -
 4 files changed, 25 insertions(+), 23 deletions(-)

-- 
1.8.3.1
