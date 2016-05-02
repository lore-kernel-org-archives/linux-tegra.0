From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/6] soc/tegra: Add support for IO pads control via pinctrl interface
Date: Mon, 2 May 2016 17:47:08 +0530
Message-ID: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The IO pins of Tegra SoCs are grouped for common control of IO
interface like setting voltage signal levels and power state of
the interface. The group is generally referred as IO pads. The 
power state and voltage control of IO pins can be done at IO pads
level.

Before Tegra210, the voltage level of IO rails are auto detected and
configure IO pads accordingly but on T210, it is require to set
explicitly by SW.

This series:
- add public APIs from Tegra PMC interface for io pads control
  for power state and voltage levels.
- Add pincontrol driver to use these APIs to configure the IO
  pads voltage and power state.

---
Changes from V1: 
- Use pinconfig generic property for power enable/disable.
- Rename power-source-voltage properties.
- Make all register read/write value to u32.
- Add IO pads macros and APIs which is nearest definiton of HW blocks.

Laxman Dewangan (6):
  soc/tegra: pmc: Use BIT macro for register field definition
  soc/tegra: pmc: Correct type of variable for tegra_pmc_readl()
  soc/tegra: pmc: Add support for IO pads power state and voltage
  soc/tegra: pmc: Register PMC child devices as platform device
  pinctrl: tegra: Add DT binding for io pads control
  pinctrl: tegra: Add driver to configure voltage and power state of io
    pads

 .../bindings/pinctrl/nvidia,tegra210-io-pad.txt    |  88 ++++++
 drivers/pinctrl/tegra/Makefile                     |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c    | 301 +++++++++++++++++++++
 drivers/soc/tegra/pmc.c                            | 284 +++++++++++++++++--
 .../dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h  |  20 ++
 include/soc/tegra/pmc.h                            |  87 ++++++
 6 files changed, 757 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-io-pad.txt
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra210-io-pad.h

-- 
2.1.4

