From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 00/10] Tegra USB PHY driver series
Date: Fri, 10 May 2013 19:24:01 +0530
Message-ID: <1368194051-4925-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

delta from v2:
This patch is prepared as follow up patch of TEGRA USB PHY driver
patch series discussed at:
http://marc.info/?l=linux-tegra&m=136497946026787&w=2

Venu Byravarasu (10):
  ARM: tegra: finalize USB EHCI and PHY bindings
  arm: dt: Tegra20: Modify ULPI reset GPIO properties
  ARM: tegra: update device trees for USB binding rework
  Revert "usb: phy: tegra: don't call into tegra-ehci directly"
  usb: phy: tegra: Get PHY mode using DT
  usb: phy: tegra: Return correct error value provided by clk_get_sys
  usb: phy: tegra: get ULPI reset GPIO info using DT.
  usb: phy: tegra: Add error handling & clean up.
  usb: phy: registering Tegra USB PHY as platform driver
  Usb: Move PORTSC access to PHY

 .../bindings/usb/nvidia,tegra20-ehci.txt           |   27 +--
 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |   40 ++-
 arch/arm/boot/dts/tegra20-colibri-512.dtsi         |    6 +-
 arch/arm/boot/dts/tegra20-harmony.dts              |   10 +-
 arch/arm/boot/dts/tegra20-iris-512.dts             |    1 -
 arch/arm/boot/dts/tegra20-paz00.dts                |   10 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |   24 +-
 arch/arm/boot/dts/tegra20-trimslice.dts            |   23 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |   10 +-
 arch/arm/boot/dts/tegra20-whistler.dts             |   26 ++
 arch/arm/boot/dts/tegra20.dtsi                     |   46 ++-
 drivers/usb/host/ehci-tegra.c                      |  143 +++------
 drivers/usb/phy/phy-tegra-usb.c                    |  349 +++++++++++++-------
 include/linux/usb/tegra_usb_phy.h                  |    9 +-
 14 files changed, 424 insertions(+), 300 deletions(-)
