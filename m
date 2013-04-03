From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/7] Tegra USB PHY driver series
Date: Wed, 3 Apr 2013 14:11:35 +0530
Message-ID: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

delta from v1:
This patch is prepared as follow up patch of TEGRA USB PHY driver
patch series being discussed at:
http://marc.info/?l=linux-tegra&m=136361016003625&w=2 

Venu Byravarasu (7):
  ARM: tegra: finalize USB EHCI and PHY bindings
  ARM: tegra: update device trees for USB binding rework
  usb: phy: tegra: Get PHY mode using DT
  usb: phy: tegra: Return correct error value provided by clk_get_sys
  usb: phy: tegra: get ULPI reset GPIO info using DT.
  usb: phy: tegra: Add error handling & clean up.
  usb: phy: registering Tegra USB PHY as platform driver

 .../bindings/usb/nvidia,tegra20-ehci.txt           |   27 +--
 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |   39 +++-
 arch/arm/boot/dts/tegra20-colibri-512.dtsi         |    4 +
 arch/arm/boot/dts/tegra20-harmony.dts              |    8 +-
 arch/arm/boot/dts/tegra20-iris-512.dts             |    4 +
 arch/arm/boot/dts/tegra20-paz00.dts                |    8 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |   22 ++-
 arch/arm/boot/dts/tegra20-trimslice.dts            |   21 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |    7 +-
 arch/arm/boot/dts/tegra20.dtsi                     |   46 +++-
 drivers/usb/host/ehci-tegra.c                      |   95 +++----
 drivers/usb/phy/phy-tegra-usb.c                    |  309 ++++++++++++--------
 include/linux/usb/tegra_usb_phy.h                  |    5 +-
 13 files changed, 364 insertions(+), 231 deletions(-)
