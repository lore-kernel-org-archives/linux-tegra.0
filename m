From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 0/5] Introduce customized regulators coupling
Date: Mon, 24 Jun 2019 00:08:30 +0300
Message-ID: <20190623210835.26281-1-digetx@gmail.com>
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

v3: Addressed review comments that were made by Mark Brown to the v2 by

      - Extending doc-comments of the new Regulator Coupler API with
        more details about what couplers are expected to do and what's
        the context of callbacks execution (locking, etc).

      - The Coupler API is now factored out into a standalone header
        file and thus likely that further changes to the API won't touch
        other headers related to regulator's core, avoiding unnecessary
        re-compilations.

      - All required resources are allocated dynamically now and static
        MAX_COUPLED constant is gone.

      - The attach_regulator callback now supports the return code 1,
        which tells that customized coupler didn't fail, but doesn't want
        to handle the given regulator. This allows to have multiple couplers
        in a system.

      - SPDX comment-style now matches to the rest of the header in the
        newly added source files of this series.

      - Corrected spellings, added COMPILE_TEST for the Tegra-couplers.

      - Coupler's initialization now doesn't fail if regulator can't change
        voltage, i.e. REGULATOR_CHANGE_VOLTAGE flag is unset. This allows
        coupled regulators to not fail theirs registration and thus may
        allow kernel to bootup properly if the voltage change isn't crucial
        for the booting process. This problem was spotted during of a more
        broad testing, in particular this caused TPS6586x driver to fail
        the probe because one of the coupled regulators had a fixed voltage
        defined in a device-tree. Now the driver is probing successfully
        and the regulator's voltage change is what is failing instead.
        This also allows customized couplers to support handling of a
        fixed regulators if required.

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

	https://lore.kernel.org/lkml/20190414175939.12368-1-digetx@gmail.com/

This series, along with CPUFreq and other "in-progress" patches, could be
found here:

	https://github.com/grate-driver/linux/commits/master

Dmitry Osipenko (5):
  regulator: core: Introduce API for regulators coupling customization
  regulator: core: Expose some of core functions needed by couplers
  dt-bindings: regulator: Document regulators coupling of NVIDIA
    Tegra20/30 SoCs
  soc/tegra: regulators: Add regulators coupler for Tegra20
  soc/tegra: regulators: Add regulators coupler for Tegra30

 .../nvidia,tegra-regulators-coupling.txt      |  65 ++++
 drivers/regulator/core.c                      | 194 +++++++---
 drivers/regulator/of_regulator.c              |  63 +++-
 drivers/soc/tegra/Kconfig                     |  10 +
 drivers/soc/tegra/Makefile                    |   2 +
 drivers/soc/tegra/regulators-tegra20.c        | 350 ++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c        | 302 +++++++++++++++
 include/linux/regulator/coupler.h             |  97 +++++
 include/linux/regulator/driver.h              |   6 +-
 include/linux/regulator/machine.h             |   2 +-
 10 files changed, 1016 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
 create mode 100644 drivers/soc/tegra/regulators-tegra20.c
 create mode 100644 drivers/soc/tegra/regulators-tegra30.c
 create mode 100644 include/linux/regulator/coupler.h

-- 
2.22.0
