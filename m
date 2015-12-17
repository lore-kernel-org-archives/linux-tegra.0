From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH V2 0/8] Add support for Tegra210 AGIC
Date: Thu, 17 Dec 2015 10:48:21 +0000
Message-ID: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra210 AGIC interrupt controller is a 2nd level interrupt controller
located in a separate power domain to the main GIC interrupt controller.
It can route interrupts to the main CPU cluster or an Audio DSP slave.

Ideally we would like to re-use the existing ARM GIC driver because the
AGIC is a GIC-400. However, in order to do so this requires a few
significant changes to the exisiting GIC driver for power management
reasons.

The purpose of this RFC-V2 is to get some feedback on the approach and see
if we can support the AGIC in this way or if a separate driver is
warranted for this device.

Please note that this RFC does not address the issue of interrupt routing.
Ideally I was thinking that having a mechanism/API to migrate an interrupt
from the CPU cluster to the DSP would make sense, however, I don't believe
this is supported today in the kernel. Would such an approach be acceptable
or if not, is there a better way to handle this?

Changes from V1:
- Prevent IRQ mapping from setting the IRQ type and only program the
  type when allocating the IRQ.
- Resolved some __init section conflicts found with V1 series.


Jon Hunter (8):
  irqdomain: Ensure type settings match for an existing mapping
  irqdomain: Don't set type when mapping an IRQ
  genirq: Add runtime power management support for IRQ chips
  irqchip/gic: Don't initialise chip if mapping IO space fails
  irqchip/gic: Return an error if GIC initialisation fails
  irqchip/gic: Assign irqchip dynamically
  irqchip/gic: Prepare for adding platform driver
  irqchip/gic: Add support for tegra AGIC interrupt controller

 drivers/irqchip/irq-gic-common.c |   4 +-
 drivers/irqchip/irq-gic.c        | 473 ++++++++++++++++++++++++++++-----------
 include/linux/irq.h              |   4 +
 kernel/irq/internals.h           |  24 ++
 kernel/irq/irqdomain.c           |  76 +++++--
 kernel/irq/manage.c              |  14 ++
 6 files changed, 447 insertions(+), 148 deletions(-)

-- 
2.1.4
