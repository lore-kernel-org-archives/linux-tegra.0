From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v7 00/15] gpio: Tight IRQ chip integration
Date: Tue, 7 Nov 2017 14:02:31 -0600
Message-ID: <5986dff3-448a-6a18-6f3f-c317a8376630@ti.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 11/07/2017 12:15 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi Linus,
> 
> here's the latest series of patches that implement the tighter IRQ chip
> integration. I've dropped the banked infrastructure for now as per the
> discussion with Grygorii.
> 
> The first couple of patches are mostly preparatory work in order to
> consolidate all IRQ chip related fields in a new structure and create
> the base functionality for adding IRQ chips.
> 
> After that, I've added the Tegra186 GPIO support patch that makes use of
> the new tight integration.

Thanks a lot.
Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

> 
> Changes in v7:
> - squashes in a few fixes pointed out by Grygorii
> - adds a couple of patches on top to support driver conversion
> 
> Changes in v6:
> - rebased on latest linux-gpio devel branch
> - one patch dropped due to rebase
> 
> Changes in v5:
> - dropped the banked infrastructure patches for now (Grygorii)
> - allocate interrupts on demand, rather than upfront (Grygorii)
> - split up the first patch further as requested by Grygorii
> 
> Not sure what happened in between here. Notes in commit logs indicate
> that this is actually version 5, but I can't find the cover letter for
> v3 and v4.
> 
> Changes in v2:
> - rename pins to lines for consistent terminology
> - rename gpio_irq_chip_banked_handler() to
>    gpio_irq_chip_banked_chained_handler()
> 
> Thierry
> 
> Thierry Reding (15):
>    gpio: Introduce struct gpio_irq_chip
>    gpio: Move irqchip into struct gpio_irq_chip
>    gpio: Move irqdomain into struct gpio_irq_chip
>    gpio: Move irq_handler to struct gpio_irq_chip
>    gpio: Move irq_default_type to struct gpio_irq_chip
>    gpio: Move irq_chained_parent to struct gpio_irq_chip
>    gpio: Move irq_nested into struct gpio_irq_chip
>    gpio: Move irq_valid_mask into struct gpio_irq_chip
>    gpio: Move lock_key into struct gpio_irq_chip
>    gpio: Implement tighter IRQ chip integration
>    gpio: Export gpiochip_irq_{map,unmap}()
>    gpio: Add Tegra186 support
>    gpio: Disambiguate struct gpio_irq_chip.nested
>    gpio: Introduce struct gpio_irq_chip.first
>    gpio: Automatically add lockdep keys
> 
>   Documentation/gpio/driver.txt               |   6 +-
>   drivers/bcma/driver_gpio.c                  |   2 +-
>   drivers/gpio/Kconfig                        |   9 +
>   drivers/gpio/Makefile                       |   1 +
>   drivers/gpio/gpio-104-dio-48e.c             |   2 +-
>   drivers/gpio/gpio-104-idi-48.c              |   2 +-
>   drivers/gpio/gpio-104-idio-16.c             |   2 +-
>   drivers/gpio/gpio-adnp.c                    |   2 +-
>   drivers/gpio/gpio-altera.c                  |   4 +-
>   drivers/gpio/gpio-aspeed.c                  |   6 +-
>   drivers/gpio/gpio-ath79.c                   |   2 +-
>   drivers/gpio/gpio-crystalcove.c             |   2 +-
>   drivers/gpio/gpio-dln2.c                    |   2 +-
>   drivers/gpio/gpio-ftgpio010.c               |   2 +-
>   drivers/gpio/gpio-ingenic.c                 |   2 +-
>   drivers/gpio/gpio-intel-mid.c               |   2 +-
>   drivers/gpio/gpio-lynxpoint.c               |   2 +-
>   drivers/gpio/gpio-max732x.c                 |   2 +-
>   drivers/gpio/gpio-merrifield.c              |   2 +-
>   drivers/gpio/gpio-omap.c                    |   2 +-
>   drivers/gpio/gpio-pca953x.c                 |   2 +-
>   drivers/gpio/gpio-pcf857x.c                 |   2 +-
>   drivers/gpio/gpio-pci-idio-16.c             |   2 +-
>   drivers/gpio/gpio-pl061.c                   |   2 +-
>   drivers/gpio/gpio-rcar.c                    |   2 +-
>   drivers/gpio/gpio-reg.c                     |   4 +-
>   drivers/gpio/gpio-stmpe.c                   |   6 +-
>   drivers/gpio/gpio-tc3589x.c                 |   2 +-
>   drivers/gpio/gpio-tegra186.c                | 623 ++++++++++++++++++++++++++++
>   drivers/gpio/gpio-vf610.c                   |   2 +-
>   drivers/gpio/gpio-wcove.c                   |   2 +-
>   drivers/gpio/gpio-ws16c48.c                 |   2 +-
>   drivers/gpio/gpio-xgene-sb.c                |   2 +-
>   drivers/gpio/gpio-xlp.c                     |   2 +-
>   drivers/gpio/gpio-zx.c                      |   2 +-
>   drivers/gpio/gpio-zynq.c                    |   2 +-
>   drivers/gpio/gpiolib.c                      | 241 +++++++----
>   drivers/pinctrl/bcm/pinctrl-bcm2835.c       |   5 +-
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    |   2 +-
>   drivers/pinctrl/intel/pinctrl-baytrail.c    |   6 +-
>   drivers/pinctrl/intel/pinctrl-cherryview.c  |   6 +-
>   drivers/pinctrl/intel/pinctrl-intel.c       |   2 +-
>   drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |   2 +-
>   drivers/pinctrl/nomadik/pinctrl-nomadik.c   |   4 +-
>   drivers/pinctrl/pinctrl-amd.c               |   2 +-
>   drivers/pinctrl/pinctrl-at91.c              |   2 +-
>   drivers/pinctrl/pinctrl-coh901.c            |   2 +-
>   drivers/pinctrl/pinctrl-mcp23s08.c          |   2 +-
>   drivers/pinctrl/pinctrl-oxnas.c             |   2 +-
>   drivers/pinctrl/pinctrl-pic32.c             |   2 +-
>   drivers/pinctrl/pinctrl-pistachio.c         |   2 +-
>   drivers/pinctrl/pinctrl-st.c                |   2 +-
>   drivers/pinctrl/pinctrl-sx150x.c            |   2 +-
>   drivers/pinctrl/qcom/pinctrl-msm.c          |   2 +-
>   drivers/pinctrl/sirf/pinctrl-atlas7.c       |   2 +-
>   drivers/pinctrl/sirf/pinctrl-sirf.c         |   2 +-
>   drivers/pinctrl/spear/pinctrl-plgpio.c      |   2 +-
>   drivers/platform/x86/intel_int0002_vgpio.c  |   6 +-
>   include/linux/gpio/driver.h                 | 200 +++++++--
>   59 files changed, 1046 insertions(+), 169 deletions(-)
>   create mode 100644 drivers/gpio/gpio-tegra186.c
> 

-- 
regards,
-grygorii
