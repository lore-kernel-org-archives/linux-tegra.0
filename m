From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/9] ARM: tegra: collection of enhancements/fixes
Date: Fri, 10 Apr 2015 23:35:55 +0200
Message-ID: <cover.1428700856.git.marcel.ziswiler@toradex.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>

This series is a set of patches accumulated over Easter ultimately
bringing HDA audio to Tegra30 devices.

Marcel Ziswiler (9):
  ARM: tegra: Cardhu device-tree comment spelling fix
  ARM: tegra: fix hda2codec_2x clock name for Tegra30
  Documentation: DT bindings: fix hda2codec_2x clock name for
    tegra30-hda
  ARM: tegra: add Tegra30 HDA support
  ARM: tegra: fix hda2codec_2x clock name in Tegra124 device tree
  ARM: tegra: enable watchdog in defconfig
  ARM: tegra: enable HDA in defconfig
  ARM: tegra: colibri t30: activate stmpe811 touch controller
  ARM: tegra: apalis t30: fix pin muxing and add HDA in device tree

 .../bindings/sound/nvidia,tegra30-hda.txt          |  8 ++--
 arch/arm/boot/dts/tegra124.dtsi                    |  4 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts          |  5 +++
 arch/arm/boot/dts/tegra30-apalis.dtsi              | 46 ++++++++++++++++------
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts      |  4 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             | 44 ++++++++++++++++++++-
 arch/arm/boot/dts/tegra30.dtsi                     | 15 +++++++
 arch/arm/configs/tegra_defconfig                   | 10 +++++
 drivers/clk/tegra/clk-tegra30.c                    |  2 +-
 10 files changed, 117 insertions(+), 23 deletions(-)

-- 
1.9.3
