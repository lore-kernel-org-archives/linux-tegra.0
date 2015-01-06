From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 0/4] Add support for nyan-blaze
Date: Tue,  6 Jan 2015 11:37:25 +0100
Message-ID: <1420540653-14816-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

the nyan-blaze board is the HP Chromebook 14. This series reuses the DTS that we currently have for nyan-big and also contains two fixes needed to get it to feature parity.

Cheers,

Tomeu

Tomeu Vizoso (4):
  ARM: tegra: rely on bootloader pinmux programming on nyan-big
  ARM: tegra: Move out nyan-generic parts out from the nyan-big DT
  ARM: tegra: Add DTS for the nyan-blaze board
  ARM: tegra: remove wp-gpios from the generic nyan dtsi

 arch/arm/boot/dts/Makefile                |    1 +
 arch/arm/boot/dts/tegra124-nyan-big.dts   | 1127 +---------------------------
 arch/arm/boot/dts/tegra124-nyan-blaze.dts |   12 +
 arch/arm/boot/dts/tegra124-nyan.dtsi      | 1132 +++++++++++++++++++++++++++++
 4 files changed, 1148 insertions(+), 1124 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra124-nyan-blaze.dts
 create mode 100644 arch/arm/boot/dts/tegra124-nyan.dtsi

-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
