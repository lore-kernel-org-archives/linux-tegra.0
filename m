From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/5] phy: tegra: xusb: Add Tegra186 support
Date: Thu, 21 Feb 2019 16:46:29 +0100
Message-ID: <20190221154634.10684-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This series adds support for Tegra186 to the XUSB pad controller driver.
Patch 1 extends the device tree bindings with support for Tegra186 while
patches 2-4 are preparatory work for the final patch 5 that adds the
Tegra186 specific programming for the UPHY blocks.

Changes in v2:
- address review comments from Kishon
- added Reviewed-by tags from JC

Thierry

JC Kuo (2):
  phy: tegra: xusb: Skip single function lane programming
  phy: tegra: xusb: Add Tegra186 support

Thierry Reding (3):
  dt-bindings: phy: tegra: Add Tegra186 support
  phy: tegra: xusb: Parse dual-role mode property
  phy: tegra: xusb: Add support for power supplies

 .../phy/nvidia,tegra124-xusb-padctl.txt       |   9 +
 MAINTAINERS                                   |   5 +
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             | 899 ++++++++++++++++++
 drivers/phy/tegra/xusb.c                      |  67 +-
 drivers/phy/tegra/xusb.h                      |  35 +
 6 files changed, 1014 insertions(+), 2 deletions(-)
 create mode 100644 drivers/phy/tegra/xusb-tegra186.c

-- 
2.20.1
