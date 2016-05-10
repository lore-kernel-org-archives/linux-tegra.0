From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/11] Various IRQ and GIC fixes and clean-ups
Date: Tue, 10 May 2016 16:14:34 +0100
Message-ID: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Most of these patches were originally part of the series to add support
for the Tegra210 AGIC [0]. However, given that series has grown and some
of the changes to the IRQ core needed some more review/testing, per an
offline discussion with Marc Z, I have split out the more trivial fixes
and clean-up patches from the core changes.

[0] http://marc.info/?l=linux-tegra&m=146237957525813&w=2

Jon Hunter (11):
  genirq: Ensure IRQ descriptor is valid when setting-up the IRQ
  irqdomain: Warn if we fail to set the IRQ type
  irqchip: Mask the non-type/sense bits when translating an IRQ
  irqchip/gic: Don't unnecessarily write the IRQ configuration
  irqchip/gic: WARN if setting the interrupt type for a PPI fails
  irqchip/gic: Don't initialise chip if mapping IO space fails
  irqchip/gic: Remove static irq_chip definition for eoimode1
  irqchip/gic: Return an error if GIC initialisation fails
  irqchip/gic: Pass GIC pointer to save/restore functions
  irqchip/gic: Store GIC configuration parameters
  irqchip/gic: Add helper functions for GIC setup and teardown

 drivers/irqchip/irq-crossbar.c   |   2 +-
 drivers/irqchip/irq-gic-common.c |  20 ++-
 drivers/irqchip/irq-gic.c        | 315 +++++++++++++++++++++++++--------------
 drivers/irqchip/irq-tegra.c      |   2 +-
 kernel/irq/irqdomain.c           |   3 +-
 kernel/irq/manage.c              |   2 +-
 6 files changed, 221 insertions(+), 123 deletions(-)

-- 
2.1.4
