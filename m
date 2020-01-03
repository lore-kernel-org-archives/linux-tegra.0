From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v5 0/5] add Tegra194 XUSB host and pad controller support
Date: Fri, 3 Jan 2020 16:18:09 +0800
Message-ID: <20200103081814.9848-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, robh@kernel.org, jonathanh@nvidia.com, kishon@ti.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series introduces support for Tegra194 XUSB host and pad
controller. Tegra194 XUSB host and pad controller are highly
similar to the controllers found on Tegra186. Therefore, it's
possible to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.

Changelog:
v5:
  phy: tegra: xusb: Protect Tegra186 soc with config
   - no change

  phy: tegra: xusb: Add Tegra194 support
   - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"

  dt-bindings: phy: tegra: Add Tegra194 support
   - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"

  arm64: tegra: Add XUSB and pad controller on Tegra194
   - no change

  arm64: tegra: Enable XUSB host in P2972-0000 board
   - no change

v4:
  xhci: tegra: Parameterize mailbox register addresses
   - removed from v4 as it has been accepted in v3
  
  usb: host: xhci-tegra: Add Tegra194 XHCI support
   - removed from v4 as it has been accepted in v3

  phy: tegra: xusb: Add Tegra194 support
   - no change

  dt-bindings: phy: tegra: Add Tegra194 support
   - no change

  arm64: tegra: Add XUSB and pad controller on Tegra194
   - no change

  arm64: tegra: Enable XUSB host in P2972-0000 board
   - no change

v3:
  add change log to cover latter

v2:
  xhci: tegra: Parameterize mailbox register addresses
   - no change

  usb: host: xhci-tegra: Add Tegra194 XHCI support
   - no change

  phy: tegra: xusb: Protect Tegra186 soc with config
   - new patch to protect Tegra186 soc data with config

  phy: tegra: xusb: Add Tegra194 support
   - removed unnecessary #if/#endif pairs
   - introduce new soc->supports_gen2 flag which indicate whether or not
     a soc supports USB 3.1 Gen 2 speed

  dt-bindings: phy: tegra: Add Tegra194 support
   - fix a typo

  arm64: tegra: Add XUSB and pad controller on Tegra194
   - renamed xhci@3610000 with usb@3610000
   - moved padctl@3520000 and usb@3610000 inside /cbb
   - cleaned up "clocks" property of usb@3610000 node
   - added blanks lines to visually separate blocks

  arm64: tegra: Enable XUSB host in P2972-0000 board
   - use capitalization of regulator names
   - fix gpio property of VDD_5V_SATA regulator

JC Kuo (5):
  phy: tegra: xusb: Protect Tegra186 soc with config
  phy: tegra: xusb: Add Tegra194 support
  dt-bindings: phy: tegra: Add Tegra194 support
  arm64: tegra: Add XUSB and pad controller on Tegra194
  arm64: tegra: Enable XUSB host in P2972-0000 board

 .../phy/nvidia,tegra124-xusb-padctl.txt       |  18 +++
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  36 ++++-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  63 ++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 139 +++++++++++++++++
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             | 143 +++++++++++++-----
 drivers/phy/tegra/xusb.c                      |  17 +++
 drivers/phy/tegra/xusb.h                      |   5 +
 8 files changed, 387 insertions(+), 35 deletions(-)

-- 
2.17.1
