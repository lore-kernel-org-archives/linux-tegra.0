From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 0/6] Add Tegra194 XUSB host and pad controller support
Date: Wed, 2 Oct 2019 16:00:45 +0800
Message-ID: <20191002080051.11142-1-jckuo@nvidia.com>
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
similar to the controllers found on Tegra186. Therefore, we
decided to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.

JC Kuo (6):
  xhci: tegra: Parameterize mailbox register addresses
  usb: host: xhci-tegra: Add Tegra194 XHCI support
  phy: tegra: xusb: Add Tegra194 support
  dt-bindings: phy: tegra: Add Tegra194 support
  arm64: tegra: Add XUSB and pad controller on Tegra194
  arm64: tegra: Enable XUSB host in P2972-0000 board

 .../phy/nvidia,tegra124-xusb-padctl.txt       |  16 +++
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  31 ++++-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  59 ++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 130 ++++++++++++++++++
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             |  77 +++++++++++
 drivers/phy/tegra/xusb.c                      |  13 ++
 drivers/phy/tegra/xusb.h                      |   4 +
 drivers/usb/host/xhci-tegra.c                 |  88 +++++++++---
 9 files changed, 402 insertions(+), 17 deletions(-)

-- 
2.17.1
