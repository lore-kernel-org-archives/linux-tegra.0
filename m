From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/8] Introduce customized regulators coupling
Date: Tue,  4 Jun 2019 02:58:56 +0300
Message-ID: <20190603235904.19097-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series introduces a way of specifying a customized regulators coupler
which is necessary for cases like a non-trivial DVFS implementation. For
now I'm primarily targeting the CPUFreq driver of NVIDIA Tegra20 and Tegra30
SoC's to get into a better shape, such that things like CPU voltage scaling
could be supported. Both these SoC's have voltage-coupled regulators, one of
the coupled regulators powers CPU and other(s) power SoC peripherals. CPU and
each of the SoC's peripherals have it's own demand for a minimal voltage
(which basically depends on the clock rate), hence regulators voltage shall
not get lower than the minimum value required by one of peripherals (or CPU).
Right now none of peripheral drivers support voltage scaling in the upstream
kernel and voltages are statically specified in board device-trees via
minimum voltage values of the regulators. In order to implement a full-featured
DVFS, all drivers should gain support for voltage scaling and then there should
be some solution for having disabled drivers and hardware that is left in
enabled state by bootloader. That is not an easy problem to solve, so I'm
trying to start easy by getting some basics to work at first.

NVIDIA Tegra20 SoC's have a quite straight-forward voltage coupling between 3
regulators and the customized coupler is needed to address the missing
support of a full-featured system-wide DVFS, support for coupling of more than
2 regulators and support for a "min-spread" voltage. Probably it should be
possible to switch to a generic coupler later on, but for now it will be
much easier to start with a custom coupler that has all necessary features
in a simplified form.

NVIDIA Tegra30 SoC's have a bit more complicated coupling rules due to
variable dependency between the regulators (min-spread value depends on
a voltage of one of the coupled regulators).

This series has been tested on multiple devices by different people without
any known issues. CPUFreq voltage scaling works perfectly well with it and
voltage of peripherals is maintained at a good level. In a result thermal
sensors show that SoC package is a less warm by few degrees during of CPU
idling.

Changelog:

v2: The coupler's registration is now done in a more generic fashion and
    allow multiple couplers to be registered in a system.

    Added device-tree binding document for NVIDIA Tegra20/30 SoC's that
    describes hardware specifics of these SoC's in regards to regulators
    voltage coupling. In a result coupled regulators that are dedicated to
    SoC could be distinguished from each other, which in turns is also useful
    for the customized couplers implementation.

    The customized couplers got some more polish and now have a bit more
    stricter checkings for coupling rules violation.

The initial v1 of this series could be found here:

	https://lore.kernel.org/patchwork/project/lkml/list/?series=390439

This series, along with CPUFreq and other "in-progress" patches, could be
found here:

	https://github.com/grate-driver/linux/commits/master

Dmitry Osipenko (8):
  regulator: core: Introduce API for regulators coupling customization
  regulator: core: Parse max-spread value per regulator couple
  regulator: core: Expose some of core functions
  regulator: core Bump MAX_COUPLED to 3
  dt-bindings: regulator: Document regulators coupling of NVIDIA
    Tegra20/30 SoC's
  regulator: core: Don't attach generic coupler to Tegra SoC regulators
  soc/tegra: regulators: Add regulators coupler for Tegra20
  soc/tegra: regulators: Add regulators coupler for Tegra30

 .../nvidia,tegra-regulators-coupling.txt      |  65 ++++
 drivers/regulator/core.c                      | 143 +++++--
 drivers/regulator/of_regulator.c              |  49 ++-
 drivers/soc/tegra/Kconfig                     |  12 +
 drivers/soc/tegra/Makefile                    |   2 +
 drivers/soc/tegra/regulators-tegra20.c        | 348 ++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c        | 300 +++++++++++++++
 include/linux/regulator/driver.h              |  46 ++-
 include/linux/regulator/machine.h             |   3 +-
 9 files changed, 916 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
 create mode 100644 drivers/soc/tegra/regulators-tegra20.c
 create mode 100644 drivers/soc/tegra/regulators-tegra30.c

-- 
2.21.0
