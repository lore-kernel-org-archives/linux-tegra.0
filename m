From: Mikko Perttunen <mikko.perttunen@kapsi.fi>
Subject: [PATCH v5 0/3] Thermal reset support in PMC
Date: Fri, 14 Nov 2014 13:50:34 +0200
Message-ID: <1415965837-29331-1-git-send-email-mikko.perttunen@kapsi.fi>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, wni@nvidia.com, Mikko Perttunen <mikko.perttunen@kapsi.fi>
List-Id: linux-tegra@vger.kernel.org

Hi,

this series adds support for hardware-triggered thermal reset to the PMC
driver. Namely, it adds device tree properties for specifying the I2C
command to be sent when thermtrip is triggered.

The soctherm driver has now been acked and will be taken into 3.19, so we
can move forward with this. Note that there are no compile time dependencies
between the two series; it's just that this series is no-op without the
soctherm driver being present.

The series is also available at
  git://github.com/cyndis/linux pmc-thermtrip-v5

Changes in v5:
- Dropped id property for I2C controllers
- Use integer field instead of phandle for thermtrip i2c controller id
- Rearrange pmc.c using a forward declaration to prevent huge patch

Mikko Perttunen (3):
  of: Add descriptions of thermtrip properties to Tegra PMC bindings
  ARM: tegra: Add PMC thermtrip programming to Jetson TK1 device tree
  ARM: tegra: Add thermal reset (thermtrip) support to PMC

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |  26 +++++
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   7 ++
 drivers/soc/tegra/pmc.c                            | 107 +++++++++++++++++++++
 3 files changed, 140 insertions(+)

-- 
2.1.3
