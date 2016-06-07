From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 0/9] Add support for Tegra210 AGIC
Date: Tue, 7 Jun 2016 16:12:25 +0100
Message-ID: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra210 has a 2nd level interrupt controller located in a separate
power domain to the main GIC interrupt controller and hence requires
runtime-pm support.

Add a platform driver for the GICs that require runtime-pm and make the
necessary changes to the genirq and irqdomain core to support IRQ chips
that require runtime-pm.

This series is based upon Marc Z's irq/irqchip-v4.7-rc1 branch [0].

Changes since V5:
- Add call to pm_runtime_put_noidle() if irq-chip pm_runtime_get_sync()
  fails.
- Removed unnecessary whitespace that was added incorrectly.

Changes since V4:
- Removed header file drivers/irqchip/irq-gic.h.
- Avoid exporting gic_handle_cascade_irq entry point.
- Renamed of_gic_init() to gic_of_init_child() to distinguish it from the
  existing gic_of_int().
- Corrected preprocessor directive for CONFIG_ARM_GIC_PM.

Changes since V3:
- Split the series into two, placing the clean-up/fixes patches into
  another series [1]. The remaining patches in this series are for
  adding runtime-pm support for irqchips and adding a platform driver
  of second level GICs.
- Dropped the patch to prevent early init of GICs if 'clocks' or
  'power-domains' properties are present and re-added the patch to add
  the compatibilty string for the Tegra210 AGIC.

Changes since V2:
- Corrected RPM support for irqchips in genirq core as pointed out by
  Kevin Hilman.
- Corrected patch to save the irq type when mapping the interrupt.
- Dropped changes to DT binding documentation and added patch to prevent
  early init of GICs if the 'clocks' and/or 'power-domains' DT
  properties are present (as we have discussed).
- Moved platform driver code into it's own source file.
- Separate changes for preparing for the platform driver into 3 patches
  in an attempt to make it more readable!
- Added fix for checking an interrupt descriptor is valid during IRQ
  setup.

Changes since V1:
- Updated GIC to only WARN and not return an error if configuring a PPI
  fails but will still return an error if an SPI fails (per discussion
  with Marc).
- Dropped change to mask sense bits for GIC-v3 (as this is not
  necessary)
- Split patch to avoid setting interrupt type when mapping the IRQ into
  two patches per TGLX's feedback.
- Changed name of irqchip device structure to "parent_device"
- Moved call to irq_chip_pm_get() outside of chip_bus_lock().
- Dropped patch to remove clock names from GIC DT documentation and
  added AGIC clock names.
- Update GIC platform driver to look-up clocks names from static list.

[0] http://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/irqchip-4.7-rc1
[1] http://marc.info/?l=linux-tegra&m=146289329915585&w=2

Jon Hunter (9):
  irqdomain: Fix handling of type settings for existing mappings
  genirq: Look-up trigger type if not specified by caller
  irqdomain: Don't set type when mapping an IRQ
  genirq: Add runtime power management support for IRQ chips
  irqchip/gic: Isolate early GIC initialisation code
  irqchip/gic: Add helper function for chip initialisation
  irqchip/gic: Prepare for adding platform driver
  dt-bindings: arm-gic: Add documentation for Tegra210 AGIC
  irqchip/gic: Add platform driver for non-root GICs that require RPM

 .../bindings/interrupt-controller/arm,gic.txt      |   3 +-
 drivers/irqchip/Kconfig                            |   6 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-gic-common.c                   |   4 +-
 drivers/irqchip/irq-gic-pm.c                       | 184 +++++++++++++++++++++
 drivers/irqchip/irq-gic.c                          | 132 ++++++++++-----
 include/linux/irq.h                                |   4 +
 include/linux/irqchip/arm-gic.h                    |  11 ++
 include/linux/irqdomain.h                          |   3 +
 kernel/irq/chip.c                                  |  40 +++++
 kernel/irq/internals.h                             |   1 +
 kernel/irq/irqdomain.c                             |  58 ++++++-
 kernel/irq/manage.c                                |  38 ++++-
 13 files changed, 433 insertions(+), 52 deletions(-)
 create mode 100644 drivers/irqchip/irq-gic-pm.c

-- 
2.1.4
