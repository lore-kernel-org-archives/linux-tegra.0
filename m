From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] gpio: tegra: use new gpio_lock_as_irq() API
Date: Thu, 17 Oct 2013 05:25:17 +0200
Message-ID: <CABxcv=m6DAo_HT=rKE56gAwtZ04N5RVDwB9DPwAsakj-xjOJWw@mail.gmail.com>
References: <1381951533-18179-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1381951533-18179-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 16, 2013 at 9:25 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> From: Stephen Warren <swarren@nvidia.com>
>
> Whenever an IRQ is claimed or freed, call gpio_lock_as_irq() or
> gpio_unlock_as_irq() on the associated GPIO, to prevent that GPIO from
> being configured in a manner incompatible with an interrupt.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 9a62672..cfd3b90 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -75,6 +75,7 @@ struct tegra_gpio_bank {
>  #endif
>  };
>
> +static struct device *dev;
>  static struct irq_domain *irq_domain;
>  static void __iomem *regs;
>  static u32 tegra_gpio_bank_count;
> @@ -205,6 +206,7 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>         int lvl_type;
>         int val;
>         unsigned long flags;
> +       int ret;
>
>         switch (type & IRQ_TYPE_SENSE_MASK) {
>         case IRQ_TYPE_EDGE_RISING:
> @@ -231,6 +233,12 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                 return -EINVAL;
>         }
>
> +       ret = gpio_lock_as_irq(&tegra_gpio_chip, gpio);
> +       if (ret) {
> +               dev_err(dev, "unable to lock Tegra GPIO %d as IRQ\n", gpio);
> +               return ret;
> +       }
> +
>         spin_lock_irqsave(&bank->lvl_lock[port], flags);
>
>         val = tegra_gpio_readl(GPIO_INT_LVL(gpio));
> @@ -251,6 +259,13 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>         return 0;
>  }
>
> +static void tegra_gpio_irq_shutdown(struct irq_data *d)
> +{
> +       int gpio = d->hwirq;
> +
> +       gpio_unlock_as_irq(&tegra_gpio_chip, gpio);
> +}
> +
>  static void tegra_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
>  {
>         struct tegra_gpio_bank *bank;
> @@ -368,6 +383,7 @@ static struct irq_chip tegra_gpio_irq_chip = {
>         .irq_mask       = tegra_gpio_irq_mask,
>         .irq_unmask     = tegra_gpio_irq_unmask,
>         .irq_set_type   = tegra_gpio_irq_set_type,
> +       .irq_shutdown   = tegra_gpio_irq_shutdown,
>  #ifdef CONFIG_PM_SLEEP
>         .irq_set_wake   = tegra_gpio_irq_set_wake,
>  #endif
> @@ -413,6 +429,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>         int i;
>         int j;
>
> +       dev = &pdev->dev;
> +
>         match = of_match_device(tegra_gpio_of_match, &pdev->dev);
>         if (!match) {
>                 dev_err(&pdev->dev, "Error: No device match found\n");
> --

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
