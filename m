From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] usb: tegra: Replace nvidia,vbus-gpio property with vbus-supply
Date: Wed, 26 Jun 2013 12:59:37 +0300
Message-ID: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset removes the ehci-tegra device tree property nvidia,vbus-gpio
and adds support for the vbus-supply property to phy-tegra-usb.

Mikko Perttunen (4):
  usb: phy: tegra: Add support for device tree-based vbus regulator
    control
  usb: host: tegra: Remove direct vbus regulator control using GPIOs
  Documentation: devicetree: phy-tegra-usb: Add vbus-supply property for
    host mode PHYs
  ARM: dts: tegra20: Remove obsolete vbus-gpio properties

 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |  3 ++
 arch/arm/boot/dts/tegra20-seaboard.dts             |  1 -
 arch/arm/boot/dts/tegra20-trimslice.dts            |  1 -
 arch/arm/boot/dts/tegra20-whistler.dts             |  2 --
 drivers/usb/host/ehci-tegra.c                      | 34 +---------------------
 drivers/usb/phy/phy-tegra-usb.c                    | 24 +++++++++++++++
 include/linux/usb/tegra_usb_phy.h                  |  1 +
 7 files changed, 29 insertions(+), 37 deletions(-)

-- 
1.8.1.5
