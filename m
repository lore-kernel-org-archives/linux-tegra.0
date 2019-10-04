From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v2 0/7] add Tegra194 XUSB host and pad controller support
Date: Fri, 4 Oct 2019 16:19:34 +0800
Message-ID: <20191004081941.4831-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi,

This series introduces support for Tegra194 XUSB host and pad
controller. Tegra194 XUSB host and pad controller are highly
similar to the controllers found on Tegra186. Therefore, it's
possible to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.

JC Kuo (7):
  xhci: tegra: Parameterize mailbox register addresses
  usb: host: xhci-tegra: Add Tegra194 XHCI support
  phy: tegra: xusb: Protect Tegra186 soc with config
  phy: tegra: xusb: Add Tegra194 support
  dt-bindings: phy: tegra: Add Tegra194 support
  arm64: tegra: Add XUSB and pad controller on Tegra194
  arm64: tegra: Enable XUSB host in P2972-0000 board

 .../phy/nvidia,tegra124-xusb-padctl.txt       |  16 ++
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  36 ++++-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  62 ++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 139 +++++++++++++++++
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             | 144 +++++++++++++-----
 drivers/phy/tegra/xusb.c                      |   7 +
 drivers/phy/tegra/xusb.h                      |   6 +
 drivers/usb/host/xhci-tegra.c                 |  88 +++++++++--
 9 files changed, 448 insertions(+), 51 deletions(-)

-- 
2.17.1
