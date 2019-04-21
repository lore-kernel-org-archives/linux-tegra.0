From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/5] Add support for Maxim 77663 MFD
Date: Sun, 21 Apr 2019 20:48:29 +0300
Message-ID: <20190421174834.9366-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series adds support for the Maxim 77663 chip that provides PMIC, RTC,
GPIO and watchdog timer functionality. The hardware is very similar to the
Maxim 77620/20024 hardware units that are already supported by the kernel,
hence we will reuse the existing drivers for 77663. The GPIO, regulator,
RTC and watchdog timer functionality was tested on a Nexus 7 tablet that
has the Max77663 chip, everything is working perfectly fine. I'm looking
at upstreaming support for that tablet device and Max77663 is one of the
core components that are currently missing in the upstream kernel.

Dmitry Osipenko (5):
  mfd: max77620: Fix swapped FPS_PERIOD_MAX_US values
  mfd: max77620: Support Maxim 77663
  regulator: max77620: Support Maxim 77663
  dt-bindings: mfd: max77620: Add compatible for Maxim 77663
  mfd: max77620: Support device-tree properly

 .../devicetree/bindings/mfd/max77620.txt      |  4 +-
 drivers/mfd/max77620.c                        | 99 +++++++++++++++++--
 drivers/regulator/max77620-regulator.c        | 26 ++++-
 include/linux/mfd/max77620.h                  |  5 +-
 4 files changed, 123 insertions(+), 11 deletions(-)

-- 
2.21.0
