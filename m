From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/12] gpio: Tight IRQ chip integration and Tegra186 support
Date: Mon,  3 Apr 2017 18:05:20 +0200
Message-ID: <20170403160532.20282-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Linus,

here's a first draft of patches to make GPIOLIB_IRQCHIP flexible enough
to support the Tegra186 use-case. Instead of just fixing the bugs that I
had pointed out earlier, this goes one step further and completely
integrates IRQ chip registration into GPIO chip registration. The idea
is that drivers will initialize a set of fields (collected in a new
struct gpio_irq_chip) before calling gpiochip_add() (or derivatives) and
gpiolib will internally set up an IRQ domain and register the IRQ chip.

Currently this makes use of the new infrastructure only in the Tegra186
driver, but I plan to convert a couple of others once we can agree that
this is a direction that you're comfortable with.

Thierry

Thierry Reding (12):
  gpio: Use unsigned int for interrupt numbers
  gpio: Implement tighter IRQ chip integration
  gpio: Move irq_nested into struct gpio_irq_chip
  gpio: Move irqdomain into struct gpio_irq_chip
  gpio: Move irqchip into struct gpio_irq_chip
  gpio: Move irq_valid_mask into struct gpio_irq_chip
  gpio: Move lock_key into struct gpio_irq_chip
  gpio: Move irq_chained_parent to struct gpio_irq_chip
  gpio: Move irq_default_type to struct gpio_irq_chip
  gpio: Move irq_handler to struct gpio_irq_chip
  gpio: Move irq_base to struct gpio_irq_chip
  gpio: Add Tegra186 support

 Documentation/gpio/driver.txt              |   6 +-
 drivers/bcma/driver_gpio.c                 |   2 +-
 drivers/gpio/Kconfig                       |   9 +
 drivers/gpio/Makefile                      |   1 +
 drivers/gpio/gpio-104-dio-48e.c            |   2 +-
 drivers/gpio/gpio-104-idi-48.c             |   2 +-
 drivers/gpio/gpio-104-idio-16.c            |   2 +-
 drivers/gpio/gpio-adnp.c                   |   2 +-
 drivers/gpio/gpio-altera.c                 |   4 +-
 drivers/gpio/gpio-aspeed.c                 |   6 +-
 drivers/gpio/gpio-ath79.c                  |   2 +-
 drivers/gpio/gpio-brcmstb.c                |   2 +-
 drivers/gpio/gpio-crystalcove.c            |   2 +-
 drivers/gpio/gpio-dln2.c                   |   2 +-
 drivers/gpio/gpio-ftgpio010.c              |   2 +-
 drivers/gpio/gpio-intel-mid.c              |   2 +-
 drivers/gpio/gpio-lynxpoint.c              |   2 +-
 drivers/gpio/gpio-max732x.c                |   2 +-
 drivers/gpio/gpio-mcp23s08.c               |   2 +-
 drivers/gpio/gpio-merrifield.c             |   2 +-
 drivers/gpio/gpio-mockup.c                 |  10 +-
 drivers/gpio/gpio-omap.c                   |   2 +-
 drivers/gpio/gpio-pca953x.c                |   2 +-
 drivers/gpio/gpio-pcf857x.c                |   2 +-
 drivers/gpio/gpio-pci-idio-16.c            |   2 +-
 drivers/gpio/gpio-pl061.c                  |   2 +-
 drivers/gpio/gpio-rcar.c                   |   2 +-
 drivers/gpio/gpio-reg.c                    |   4 +-
 drivers/gpio/gpio-stmpe.c                  |   6 +-
 drivers/gpio/gpio-tc3589x.c                |   2 +-
 drivers/gpio/gpio-tegra186.c               | 625 +++++++++++++++++++++++++++++
 drivers/gpio/gpio-vf610.c                  |   2 +-
 drivers/gpio/gpio-wcove.c                  |   2 +-
 drivers/gpio/gpio-ws16c48.c                |   2 +-
 drivers/gpio/gpio-xgene-sb.c               |   2 +-
 drivers/gpio/gpio-xlp.c                    |   2 +-
 drivers/gpio/gpio-zx.c                     |   2 +-
 drivers/gpio/gpio-zynq.c                   |   2 +-
 drivers/gpio/gpiolib.c                     | 232 ++++++++---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c      |   4 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c   |   2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c   |   6 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c |   6 +-
 drivers/pinctrl/intel/pinctrl-intel.c      |   2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c  |   4 +-
 drivers/pinctrl/pinctrl-amd.c              |   2 +-
 drivers/pinctrl/pinctrl-at91.c             |   2 +-
 drivers/pinctrl/pinctrl-coh901.c           |   2 +-
 drivers/pinctrl/pinctrl-oxnas.c            |   2 +-
 drivers/pinctrl/pinctrl-pic32.c            |   2 +-
 drivers/pinctrl/pinctrl-pistachio.c        |   2 +-
 drivers/pinctrl/pinctrl-st.c               |   2 +-
 drivers/pinctrl/pinctrl-sx150x.c           |   2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c         |   2 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c      |   2 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c        |   2 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c     |   2 +-
 include/linux/gpio/driver.h                |  81 ++--
 58 files changed, 943 insertions(+), 147 deletions(-)
 create mode 100644 drivers/gpio/gpio-tegra186.c

-- 
2.12.0
