From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/16] gpio: Tight IRQ chip integration and banked infrastructure
Date: Fri,  1 Sep 2017 20:57:20 +0200
Message-ID: <20170901185736.28051-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Linus,

here's the latest series of patches that implement the tighter IRQ chip
integration as well as the banked GPIO infrastructure that we had
discussed a couple of weeks/months back.

The first couple of patches are mostly preparatory work in order to
consolidate all IRQ chip related fields in a new structure and create
the base functionality for adding IRQ chips.

After that, I've added the Tegra186 GPIO support patch that makes use of
the new tight integration.

To round things off the new banked GPIO infrastructure is added (along
with some more preparatory work), followed by the conversion of the two
Tegra GPIO drivers to the new infrastructure.

Any thoughts on this? I'd like to target 4.15 with this, unless you'd be
willing to take this into 4.14, which I doubt at this point. The absence
of a GPIO driver has been hampering Tegra186 support upstream for a
while now, so it'd be good to make progress on this.

All of the patches are bisectible, at least to the point where I was
able to compile (there are a couple of odd users of linux/gpio/driver.h
that I either couldn't figure out the right Kconfig options to enable or
didn't have a cross-compiler for). I've carried these patches in my
development tree for a couple of weeks now, though, and the 0-day
builder hasn't had any complaints in a while. I also have a local cocci
patch for the move of fields to struct gpio_irq_chip and it gives an
empty patch when run on top of these patches on top of linux-next, so I
am fairly confident that this is all good to go.

Thierry

Thierry Reding (16):
  gpio: Implement tighter IRQ chip integration
  gpio: Move irqchip into struct gpio_irq_chip
  gpio: Move irqdomain into struct gpio_irq_chip
  gpio: Move irq_base to struct gpio_irq_chip
  gpio: Move irq_handler to struct gpio_irq_chip
  gpio: Move irq_default_type to struct gpio_irq_chip
  gpio: Move irq_chained_parent to struct gpio_irq_chip
  gpio: Move irq_nested into struct gpio_irq_chip
  gpio: Move irq_valid_mask into struct gpio_irq_chip
  gpio: Move lock_key into struct gpio_irq_chip
  gpio: Add Tegra186 support
  gpio: omap: Fix checkpatch warnings
  gpio: omap: Rename struct gpio_bank to struct omap_gpio_bank
  gpio: Add support for banked GPIO controllers
  gpio: tegra: Use banked GPIO infrastructure
  gpio: tegra186: Use banked GPIO infrastructure

 Documentation/gpio/driver.txt               |   6 +-
 drivers/bcma/driver_gpio.c                  |   2 +-
 drivers/gpio/Kconfig                        |  10 +
 drivers/gpio/Makefile                       |   1 +
 drivers/gpio/gpio-104-dio-48e.c             |   2 +-
 drivers/gpio/gpio-104-idi-48.c              |   2 +-
 drivers/gpio/gpio-104-idio-16.c             |   2 +-
 drivers/gpio/gpio-adnp.c                    |   2 +-
 drivers/gpio/gpio-altera.c                  |   4 +-
 drivers/gpio/gpio-aspeed.c                  |   6 +-
 drivers/gpio/gpio-ath79.c                   |   2 +-
 drivers/gpio/gpio-brcmstb.c                 |   2 +-
 drivers/gpio/gpio-crystalcove.c             |   2 +-
 drivers/gpio/gpio-dln2.c                    |   2 +-
 drivers/gpio/gpio-ftgpio010.c               |   2 +-
 drivers/gpio/gpio-ingenic.c                 |   2 +-
 drivers/gpio/gpio-intel-mid.c               |   2 +-
 drivers/gpio/gpio-lynxpoint.c               |   2 +-
 drivers/gpio/gpio-max732x.c                 |   2 +-
 drivers/gpio/gpio-merrifield.c              |   2 +-
 drivers/gpio/gpio-omap.c                    | 222 ++++++-----
 drivers/gpio/gpio-pca953x.c                 |   2 +-
 drivers/gpio/gpio-pcf857x.c                 |   2 +-
 drivers/gpio/gpio-pci-idio-16.c             |   2 +-
 drivers/gpio/gpio-pl061.c                   |   2 +-
 drivers/gpio/gpio-rcar.c                    |   2 +-
 drivers/gpio/gpio-reg.c                     |   4 +-
 drivers/gpio/gpio-stmpe.c                   |   6 +-
 drivers/gpio/gpio-tc3589x.c                 |   2 +-
 drivers/gpio/gpio-tegra.c                   | 203 +++++-----
 drivers/gpio/gpio-tegra186.c                | 571 ++++++++++++++++++++++++++++
 drivers/gpio/gpio-vf610.c                   |   2 +-
 drivers/gpio/gpio-wcove.c                   |   2 +-
 drivers/gpio/gpio-ws16c48.c                 |   2 +-
 drivers/gpio/gpio-xgene-sb.c                |   2 +-
 drivers/gpio/gpio-xlp.c                     |   2 +-
 drivers/gpio/gpio-zx.c                      |   2 +-
 drivers/gpio/gpio-zynq.c                    |   2 +-
 drivers/gpio/gpiolib-of.c                   | 101 +++++
 drivers/gpio/gpiolib.c                      | 320 ++++++++++++++--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c       |   4 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    |   2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c    |   6 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c  |   6 +-
 drivers/pinctrl/intel/pinctrl-intel.c       |   2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |   4 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c   |   4 +-
 drivers/pinctrl/pinctrl-amd.c               |   2 +-
 drivers/pinctrl/pinctrl-at91.c              |   2 +-
 drivers/pinctrl/pinctrl-coh901.c            |   2 +-
 drivers/pinctrl/pinctrl-mcp23s08.c          |   2 +-
 drivers/pinctrl/pinctrl-oxnas.c             |   2 +-
 drivers/pinctrl/pinctrl-pic32.c             |   2 +-
 drivers/pinctrl/pinctrl-pistachio.c         |   2 +-
 drivers/pinctrl/pinctrl-st.c                |   2 +-
 drivers/pinctrl/pinctrl-sx150x.c            |   2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c          |   2 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c       |   2 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c         |   2 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c      |   2 +-
 drivers/platform/x86/intel_int0002_vgpio.c  |   6 +-
 include/linux/gpio/driver.h                 | 272 +++++++++++--
 include/linux/of_gpio.h                     |  10 +
 63 files changed, 1504 insertions(+), 348 deletions(-)
 create mode 100644 drivers/gpio/gpio-tegra186.c

-- 
2.13.3
