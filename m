From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 0/2] Add support for Tegra210 AGIC
Date: Tue, 10 Nov 2015 14:39:35 +0000
Message-ID: <1447166377-19707-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra210 AGIC interrupt controller is a 2nd level interrupt controller
located in a separate power domain to the main GIC interrupt controller.
It can route interrupts to the main CPU cluster or an Audio DSP slave.

Ideally we would like to re-use the existing ARM GIC driver because the
AGIC is a GIC-400. However, in order to do so this requires a few
significant changes to the exisiting GIC driver for power management
reasons.

The purpose of this RFC is to get some feedback on the approach and see
if we can support the AGIC in this way or if a separate driver is
warranted for this device.

Please note that this RFC does not address the issue of interrupt routing.
Ideally I was thinking that having a mechanism/API to migrate an interrupt
from the CPU cluster to the DSP would make sense, however, I don't believe
this is supported today in the kernel. Would such an approach be acceptable
or if not, is there a better way to handle this?

Jon Hunter (2):
  genirq: Add runtime resume/suspend support for IRQ chips
  irqchip/gic: Add support for tegra AGIC interrupt controller

 drivers/irqchip/irq-gic.c | 341 +++++++++++++++++++++++++++++++++++++++-------
 include/linux/irq.h       |   4 +
 kernel/irq/internals.h    |  17 +++
 kernel/irq/manage.c       |   7 +
 4 files changed, 319 insertions(+), 50 deletions(-)

-- 
2.1.4
