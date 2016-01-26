From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: tegra: Enable high speed UARTs of the Jetson TK1
Date: Tue, 26 Jan 2016 17:59:16 +0100
Message-ID: <1453827558-10954-1-git-send-email-ralf@ramses-pyramidenbau.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi everyone,

this one enables the high speed UARTs of the Jetson TK1 (and corrects
a not noteworthy typo). Those additional UARTs are exposed on the
expansion connector of the TK1.

So far, they were only enabled in NVidia's official BSP.

  Ralf

Ralf Ramsauer (2):
  ARM: tegra: Fixed typo
  ARM: tegra: Add high speed UARTs to Jetson TK1 device tree

 arch/arm/boot/dts/tegra114.dtsi           |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi           |  2 +-
 arch/arm/boot/dts/tegra20.dtsi            |  2 +-
 arch/arm/boot/dts/tegra30.dtsi            |  2 +-
 5 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.4.10
