From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: [PATCH 0/2] ARM: tegra: Enable high speed UARTs of the Jetson TK1
Date: Tue, 19 Jan 2016 14:12:33 +0100
Message-ID: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi everyone,

this one enables the high speed UARTs of the Jetson TK1 (and a not
noteworthy typo). Those additional UARTs are located at the
expansion port of the board.

So far, they were only enabled in NVidia's official BSP.

  Ralf

Ralf Ramsauer (2):
  ARM: tegra: Fixed typo
  ARM: tegra: Add high speed UARTs to Jetson TK1 device tree

 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 23 +++++++++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi           |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.4.10
