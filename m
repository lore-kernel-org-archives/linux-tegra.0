From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/3] usb: tegra: Replace nvidia,vbus-gpio property with vbus-supply
Date: Wed, 17 Jul 2013 10:37:48 +0300
Message-ID: <1374046671-21134-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset removes the ehci-tegra device tree property nvidia,vbus-gpio
and adds support for the vbus-supply property to phy-tegra-usb.

v3:
Change commit messages, fix one >80 character line

Mikko Perttunen (3):
  usb: tegra: Use regulators instead of GPIOs for USB PHY VBUS
  usb: tegra: Add vbus-supply property for host mode PHYs
  ARM: tegra: Remove obsolete nvidia,vbus-gpio properties

 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |  1 -
 arch/arm/boot/dts/tegra20-trimslice.dts            |  1 -
 arch/arm/boot/dts/tegra20-whistler.dts             |  2 --
 drivers/usb/host/ehci-tegra.c                      | 34 +---------------------
 drivers/usb/phy/phy-tegra-usb.c                    | 24 +++++++++++++++
 include/linux/usb/tegra_usb_phy.h                  |  1 +
 7 files changed, 27 insertions(+), 38 deletions(-)

-- 
1.8.1.5
