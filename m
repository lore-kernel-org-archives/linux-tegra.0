From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 00/11] Add support for Tegra DPAUX pinctrl
Date: Wed, 29 Jun 2016 10:17:46 +0100
Message-ID: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Display Port Auxiliary (DPAUX) channel pads can be shared with an
internal I2C controller. Add pinctrl support for these pads so that the
I2C controller can request and use these pads.

This series has been tested with Thierry's patches for correcting the
parent clock for the DPAUX devices [0].

Changes from V1:
- Updated dt node names to use '-' instead of '_' per Rob H's feedback.
- Updated commit message and dt-binding description for 'i2c-bus' node
  per Wolfram's feedback.
- Note the pinctrl patch to add a helper function for freeing mappings [1]
  is not included in this latest version of the series as this has already
  been picked up by Linus W.

Changes from initial RFC:
- Dropped patches for adding sor-safe clocks to DPAUX in favour of the
  patches from Thierry [0].
- Split the DPAUX function to enable the DPAUX pads into two functions:
  one for turning on and one for turning off the pads.
- Updated the description for the 'i2c-bus' node based upon Mark R's
  feedback.
- Dropped the second test if the i2c-core when checking for the presence
  of the 'i2c-bus' node based upon Thierry's feedback.
- Removed depedency on CONFIG_PINCTRL in the DPAUX driver in favour of
  using #ifdef's per Thierry's feedback (note by removing the dependency
  on CONFIG_PINCTRL I had to use #ifdefs as all the structures, function
  tables, and functions may not be defined).
- Updated SOR power partition device-tree node to include all clocks and
  resets as described in the Tegra210 TRM.

[0] http://marc.info/?l=linux-tegra&m=146667915802019&w=2
[1] http://marc.info/?l=linux-tegra&m=146669759407988&w=2

Jon Hunter (11):
  soc/tegra: pmc: Initialise resets associated with a power partition
  drm/tegra: Clean-up if probing DPAUX fails
  drm/tegra: Add helper functions for setting up DPAUX pads
  dt-bindings: display: Update Tegra DPAUX documentation
  drm/tegra: Prepare DPAUX for supporting generic PM domains
  dt-bindings: i2c: Add support for 'i2c-bus' subnode
  i2c: core: Add support for 'i2c-bus' subnode
  dt-bindings: Add bindings for Tegra DPAUX pinctrl driver
  drm/tegra: Add pinctrl support for DPAUX
  arm64: tegra: Add SOR power-domain node
  arm64: tegra: Add DPAUX pinctrl bindings

 .../display/tegra/nvidia,tegra20-host1x.txt        |  12 +-
 Documentation/devicetree/bindings/i2c/i2c.txt      |   8 +
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       |  60 ++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  78 +++++++
 drivers/gpu/drm/tegra/dpaux.c                      | 239 +++++++++++++++++----
 drivers/i2c/i2c-core.c                             |  10 +-
 drivers/soc/tegra/pmc.c                            |  18 +-
 7 files changed, 373 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt

-- 
2.1.4
