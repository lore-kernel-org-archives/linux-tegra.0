From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 0/2] Implement wake event support on Tegra186 and later
Date: Wed, 29 May 2019 16:53:20 +0200
Message-ID: <20190529145322.20630-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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

Changes in v3:
- use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
- drop preparatory patch exporting irq_domain_alloc_irqs()
- properly set GPIO instance on Tegra186

Changes in v2:
- dropped the Tegra PMC specific patches to simplify the series
- drop wakeup-parent usage, lookup up PMC by compatible
- convert Tegra186 GPIO driver to use valid mask
- move hierarchy support code into gpiolib core

Linus, this is a new revision based on our previous discussion. Sorry it
took so long to get back to this. I also verified that with this series
I can make things work with gpio-keys whether I use the "gpios" property
or the "interrupts" property, which was your primary concern.

I'm also adding Lina to the thread since she's been basing her QCOM
series on top of this patch. Lina, it'd be great if you could confirm
that the changes I made in this version continue to work for you.

Thierry

Thierry Reding (2):
  gpio: Add support for hierarchical IRQ domains
  gpio: tegra186: Implement wake event support

 drivers/gpio/Kconfig         |   1 +
 drivers/gpio/gpio-tegra186.c | 120 +++++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib.c       |  33 ++++++++--
 include/linux/gpio/driver.h  |   8 +++
 4 files changed, 144 insertions(+), 18 deletions(-)

-- 
2.21.0
