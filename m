From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 0/6] Add support for Maxim 77663 MFD
Date: Sun,  5 May 2019 18:43:19 +0300
Message-ID: <20190505154325.30026-1-digetx@gmail.com>
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

Changelog:

v4: Addressed review comments from Rob Herring to v3 by making use of
    generic "system-power-controller" property and making couple other
    minor cosmetic changes. Added Mark's Brown a-b to the regulator-patch.

v3: Dropped "Support device-tree properly" patch since turned out that
    I2C core takes care of the device-tree matching and I wasn't aware of
    it.

v2: Added PINCTRL sub-device to Max77663 MFD as it looks compatible with
    77620.

    Added new "maxim,system-power-controller" OF property.

    Patch "Support device-tree properly" now doesn't remove driver's
    "id_table" since potentially it could have some use in the downstream
    kernel forks and it doesn't hurt to keep it around.

Dmitry Osipenko (6):
  dt-bindings: mfd: max77620: Add compatible for Maxim 77663
  dt-bindings: mfd: max77620: Add system-power-controller property
  mfd: max77620: Fix swapped FPS_PERIOD_MAX_US values
  mfd: max77620: Support Maxim 77663
  mfd: max77620: Provide system power-off functionality
  regulator: max77620: Support Maxim 77663

 .../devicetree/bindings/mfd/max77620.txt      |  9 +-
 drivers/mfd/max77620.c                        | 87 ++++++++++++++++++-
 drivers/regulator/max77620-regulator.c        | 26 +++++-
 include/linux/mfd/max77620.h                  |  5 +-
 4 files changed, 122 insertions(+), 5 deletions(-)

-- 
2.21.0
