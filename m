From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/9] Implement wake event support on Tegra186 and later
Date: Fri, 21 Sep 2018 12:25:37 +0200
Message-ID: <20180921102546.12745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

The following is a set of patches that allow certain interrupts to be
used as wakeup sources on Tegra186 and later. To implement this, each
of the GPIO controllers' IRQ domain needs to become hierarchical, and
parented to the PMC domain. The PMC domain in turn implements a new
IRQ domain that is a child to the GIC IRQ domain.

The above ensures that the interrupt chip implementation of the PMC is
called at the correct time. The ->irq_set_type() and ->irq_set_wake()
implementations program the PMC wake registers in a way to enable the
given interrupts as wakeup sources.

This is based on a suggestion from Thomas Gleixner that resulted from
the following thread:

	https://lkml.org/lkml/2018/9/13/1042

Linus, I'm sending this as one series, but both the GPIO and PMC patches
should be applicable separately. There are no build-time dependencies in
the series. So once this has been duly reviewed, I think patches 1-5 can
go through the Tegra tree, while patches 6-9 should go through the GPIO
tree.

Thierry

Thierry Reding (9):
  dt-bindings: tegra186-pmc: Add interrupt controller properties
  soc/tegra: pmc: Add Tegra194 support
  soc/tegra: pmc: Add wake event support
  soc/tegra: pmc: Add initial Tegra186 wake events
  soc/tegra: pmc: Add initial Tegra194 wake events
  gpio: Add support for hierarchical IRQ domains
  dt-bindings: tegra186-gpio: Add wakeup parent support
  gpio: tegra186: Rename flow variable to type
  gpio: tegra186: Implement wake event support

 .../arm/tegra/nvidia,tegra186-pmc.txt         |   3 +
 .../bindings/gpio/nvidia,tegra186-gpio.txt    |   7 +
 drivers/gpio/gpio-tegra186.c                  | 109 +++++-
 drivers/gpio/gpiolib.c                        |  15 +-
 drivers/soc/tegra/pmc.c                       | 312 +++++++++++++++++-
 include/linux/gpio/driver.h                   |   6 +
 include/soc/tegra/pmc.h                       |  21 ++
 7 files changed, 451 insertions(+), 22 deletions(-)

-- 
2.19.0
