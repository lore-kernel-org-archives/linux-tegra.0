From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/5] Implement wake event support on Tegra186 and later
Date: Thu, 29 Nov 2018 18:03:07 +0100
Message-ID: <20181129170312.23625-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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

Changes in v2:
- dropped the Tegra PMC specific patches to simplify the series
- drop wakeup-parent usage, lookup up PMC by compatible
- convert Tegra186 GPIO driver to use valid mask
- move hierarchy support code into gpiolib core

Linus, this contains the conversion patch to use a valid mask instead of
the sparse number space that you requested. I've kept it in a separate
commit because I'm still hoping that you may decide that it's okay to
have the sparse number space. The delta is just 53 lines of code, which
I think is small enough to warrant the extra code. But if you insist on
having the core take care of everything and that the Tegra GPIO driver
should be over-allocating GPIO and IRQ descriptors in order to make it
look more like other drivers, then so be it. In either case, the series
now has gpiolib core support for hierarchies and Tegra works with it in
both the sparse number space and valid mask cases.

Thomas, patch 2 is required in order to avoid build failures when the
Tegra186 GPIO driver is built as a module. Since there's a build
dependency on that from patch 4, I think it'd be easiest if this could
go in via Linus' tree with your Acked-by. Would you mind providing one?

Thierry

Thierry Reding (5):
  gpio: Add support for hierarchical IRQ domains
  genirq: Export irq_chip_set_wake_parent()
  gpio: tegra186: Rename flow variable to type
  gpio: tegra186: Implement wake event support
  gpio: tegra186: Use valid mask instead of sparse number space

 drivers/gpio/Kconfig         |   2 +-
 drivers/gpio/gpio-tegra186.c | 220 ++++++++++++++++++++---------------
 drivers/gpio/gpiolib.c       |  33 +++++-
 include/linux/gpio/driver.h  |   6 +
 kernel/irq/chip.c            |   1 +
 5 files changed, 161 insertions(+), 101 deletions(-)

-- 
2.19.1
