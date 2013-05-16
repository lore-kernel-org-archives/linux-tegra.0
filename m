From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: [PATCH v4 0/8] Tegra USB PHY driver series
Date: Thu, 16 May 2013 19:42:54 +0530
Message-ID: <1368713582-29038-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, swarren@wwwdotorg.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Venu Byravarasu <vbyravarasu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

delta from v3:
This patch series is prepared as follow up of TEGRA USB PHY driver patch series
discussed at: https://lkml.org/lkml/2013/5/10/241

Venu Byravarasu (8):
  ARM: tegra: finalize USB EHCI and PHY bindings
  arm: dt: Tegra20: Modify ULPI reset GPIO properties
  ARM: tegra: update device trees for USB binding rework
  usb: phy: tegra: Return correct error value provided by clk_get_sys
  usb: phy: tegra: Get PHY mode using DT
  usb: phy: tegra: get ULPI reset GPIO info using DT.
  usb: phy: tegra: Add error handling & clean up.
  usb: phy: registering Tegra USB PHY as platform driver

 .../bindings/usb/nvidia,tegra20-ehci.txt           |   27 +--
 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |   41 +++-
 arch/arm/boot/dts/tegra20-colibri-512.dtsi         |    6 +-
 arch/arm/boot/dts/tegra20-harmony.dts              |   15 +-
 arch/arm/boot/dts/tegra20-iris-512.dts             |    9 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |   15 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |   26 ++-
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |    4 +
 arch/arm/boot/dts/tegra20-trimslice.dts            |   25 ++-
 arch/arm/boot/dts/tegra20-ventana.dts              |   15 +-
 arch/arm/boot/dts/tegra20-whistler.dts             |   28 ++
 arch/arm/boot/dts/tegra20.dtsi                     |   49 +++-
 drivers/usb/host/ehci-tegra.c                      |  105 +++----
 drivers/usb/phy/phy-tegra-usb.c                    |  318 ++++++++++++--------
 include/linux/usb/tegra_usb_phy.h                  |   13 +-
 15 files changed, 451 insertions(+), 245 deletions(-)
