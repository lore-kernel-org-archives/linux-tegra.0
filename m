From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 3/4] gpio: tegra: Get rid of all file scoped global variables
Date: Mon, 25 Apr 2016 14:13:16 +0900
Message-ID: <CAAVeFuL_RLgxb_m1-ghRCQwSr+gBmOs8wgX159Qh7UFG9-pWTA@mail.gmail.com>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com> <1461319754-12040-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461319754-12040-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 22, 2016 at 7:09 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Move the file scoped multiple global variable from Tegra GPIO
> driver to the structure and make this as gpiochip data which
> can be referred from GPIO chip callbacks.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> ---
> This patch is reworked on top of earlier patch
> gpio: tegra: Remove the need of keeping device handle for gpio driver
>
> There was review comment that we should get for all variable and hence
> this is outcome of the discussion.
>
> Changes from V3:
> - Remove DBC/EN registers.
> - Remove non-required new lines.
> - Collected RB from Stephen.
>
>  drivers/gpio/gpio-tegra.c | 296 +++++++++++++++++++++++++++-------------------
>  1 file changed, 176 insertions(+), 120 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index cd69422..6af5eb2 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -35,24 +35,24 @@
>  #define GPIO_PORT(x)           (((x) >> 3) & 0x3)
>  #define GPIO_BIT(x)            ((x) & 0x7)
>
> -#define GPIO_REG(x)            (GPIO_BANK(x) * tegra_gpio_bank_stride + \
> +#define GPIO_REG(tgi, x)       (GPIO_BANK(x) * tgi->soc->bank_stride + \
>                                         GPIO_PORT(x) * 4)
>
> -#define GPIO_CNF(x)            (GPIO_REG(x) + 0x00)
> -#define GPIO_OE(x)             (GPIO_REG(x) + 0x10)
> -#define GPIO_OUT(x)            (GPIO_REG(x) + 0X20)
> -#define GPIO_IN(x)             (GPIO_REG(x) + 0x30)
> -#define GPIO_INT_STA(x)                (GPIO_REG(x) + 0x40)
> -#define GPIO_INT_ENB(x)                (GPIO_REG(x) + 0x50)
> -#define GPIO_INT_LVL(x)                (GPIO_REG(x) + 0x60)
> -#define GPIO_INT_CLR(x)                (GPIO_REG(x) + 0x70)
> -
> -#define GPIO_MSK_CNF(x)                (GPIO_REG(x) + tegra_gpio_upper_offset + 0x00)
> -#define GPIO_MSK_OE(x)         (GPIO_REG(x) + tegra_gpio_upper_offset + 0x10)
> -#define GPIO_MSK_OUT(x)                (GPIO_REG(x) + tegra_gpio_upper_offset + 0X20)
> -#define GPIO_MSK_INT_STA(x)    (GPIO_REG(x) + tegra_gpio_upper_offset + 0x40)
> -#define GPIO_MSK_INT_ENB(x)    (GPIO_REG(x) + tegra_gpio_upper_offset + 0x50)
> -#define GPIO_MSK_INT_LVL(x)    (GPIO_REG(x) + tegra_gpio_upper_offset + 0x60)
> +#define GPIO_CNF(t, x)         (GPIO_REG(t, x) + 0x00)
> +#define GPIO_OE(t, x)          (GPIO_REG(t, x) + 0x10)
> +#define GPIO_OUT(t, x)         (GPIO_REG(t, x) + 0X20)
> +#define GPIO_IN(t, x)          (GPIO_REG(t, x) + 0x30)
> +#define GPIO_INT_STA(t, x)     (GPIO_REG(t, x) + 0x40)
> +#define GPIO_INT_ENB(t, x)     (GPIO_REG(t, x) + 0x50)
> +#define GPIO_INT_LVL(t, x)     (GPIO_REG(t, x) + 0x60)
> +#define GPIO_INT_CLR(t, x)     (GPIO_REG(t, x) + 0x70)
> +
> +#define GPIO_MSK_CNF(t, x)     (GPIO_REG(t, x) + t->soc->upper_offset + 0x00)
> +#define GPIO_MSK_OE(t, x)      (GPIO_REG(t, x) + t->soc->upper_offset + 0x10)
> +#define GPIO_MSK_OUT(t, x)     (GPIO_REG(t, x) + t->soc->upper_offset + 0X20)
> +#define GPIO_MSK_INT_STA(t, x) (GPIO_REG(t, x) + t->soc->upper_offset + 0x40)
> +#define GPIO_MSK_INT_ENB(t, x) (GPIO_REG(t, x) + t->soc->upper_offset + 0x50)
> +#define GPIO_MSK_INT_LVL(t, x) (GPIO_REG(t, x) + t->soc->upper_offset + 0x60)
>
>  #define GPIO_INT_LVL_MASK              0x010101
>  #define GPIO_INT_LVL_EDGE_RISING       0x000101
> @@ -61,6 +61,8 @@
>  #define GPIO_INT_LVL_LEVEL_HIGH                0x000001
>  #define GPIO_INT_LVL_LEVEL_LOW         0x000000
>
> +struct tegra_gpio_info;
> +
>  struct tegra_gpio_bank {
>         int bank;
>         int irq;
> @@ -73,6 +75,7 @@ struct tegra_gpio_bank {
>         u32 int_lvl[4];
>         u32 wake_enb[4];
>  #endif
> +       struct tegra_gpio_info *tgi;
>  };
>
>  struct tegra_gpio_soc_config {
> @@ -80,22 +83,25 @@ struct tegra_gpio_soc_config {
>         u32 upper_offset;
>  };
>
> -static struct device *dev;
> -static struct irq_domain *irq_domain;
> -static void __iomem *regs;
> -static u32 tegra_gpio_bank_count;
> -static u32 tegra_gpio_bank_stride;
> -static u32 tegra_gpio_upper_offset;
> -static struct tegra_gpio_bank *tegra_gpio_banks;
> +struct tegra_gpio_info {

I think tegra_gpio_chip would be a better name for this structure
(especially if you make "struct gpio_chip gc" its first member to
highlight the fact that it inherits from it) and more in line with
what other GPIO drivers do.

You can then rename the former tegra_gpio_chip to something like
tegra_gpio_funcs since it would just be used to set the chip's
functions if you follow my comment on patch 4/4.

> +       struct device                           *dev;
> +       void __iomem                            *regs;
> +       struct irq_domain                       *irq_domain;
> +       struct tegra_gpio_bank                  *bank_info;
> +       const struct tegra_gpio_soc_config      *soc;
> +       struct gpio_chip                        *gc;
> +       u32                                     bank_count;
> +};
>
> -static inline void tegra_gpio_writel(u32 val, u32 reg)
> +static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
> +                                    u32 val, u32 reg)
>  {
> -       __raw_writel(val, regs + reg);
> +       __raw_writel(val, tgi->regs + reg);
>  }
>
> -static inline u32 tegra_gpio_readl(u32 reg)
> +static inline u32 tegra_gpio_readl(struct tegra_gpio_info *tgi, u32 reg)
>  {
> -       return __raw_readl(regs + reg);
> +       return __raw_readl(tgi->regs + reg);
>  }
>
>  static int tegra_gpio_compose(int bank, int port, int bit)
> @@ -103,24 +109,25 @@ static int tegra_gpio_compose(int bank, int port, int bit)
>         return (bank << 5) | ((port & 0x3) << 3) | (bit & 0x7);
>  }
>
> -static void tegra_gpio_mask_write(u32 reg, int gpio, int value)
> +static void tegra_gpio_mask_write(struct tegra_gpio_info *tgi, u32 reg,
> +                                 int gpio, int value)
>  {
>         u32 val;
>
>         val = 0x100 << GPIO_BIT(gpio);
>         if (value)
>                 val |= 1 << GPIO_BIT(gpio);
> -       tegra_gpio_writel(val, reg);
> +       tegra_gpio_writel(tgi, val, reg);
>  }
>
> -static void tegra_gpio_enable(int gpio)
> +static void tegra_gpio_enable(struct tegra_gpio_info *tgi, int gpio)
>  {
> -       tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 1);
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 1);
>  }
>
> -static void tegra_gpio_disable(int gpio)
> +static void tegra_gpio_disable(struct tegra_gpio_info *tgi, int gpio)
>  {
> -       tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 0);
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 0);
>  }
>
>  static int tegra_gpio_request(struct gpio_chip *chip, unsigned offset)
> @@ -130,44 +137,56 @@ static int tegra_gpio_request(struct gpio_chip *chip, unsigned offset)
>
>  static void tegra_gpio_free(struct gpio_chip *chip, unsigned offset)
>  {
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +
>         pinctrl_free_gpio(offset);
> -       tegra_gpio_disable(offset);
> +       tegra_gpio_disable(tgi, offset);
>  }
>
>  static void tegra_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>  {
> -       tegra_gpio_mask_write(GPIO_MSK_OUT(offset), offset, value);
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_OUT(tgi, offset), offset, value);
>  }
>
>  static int tegra_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +       int bval = BIT(GPIO_BIT(offset));
> +
>         /* If gpio is in output mode then read from the out value */
> -       if ((tegra_gpio_readl(GPIO_OE(offset)) >> GPIO_BIT(offset)) & 1)
> -               return (tegra_gpio_readl(GPIO_OUT(offset)) >>
> -                               GPIO_BIT(offset)) & 0x1;
> +       if (tegra_gpio_readl(tgi, GPIO_OE(tgi, offset)) & bval)
> +               return !!(tegra_gpio_readl(tgi, GPIO_OUT(tgi, offset)) & bval);
>
> -       return (tegra_gpio_readl(GPIO_IN(offset)) >> GPIO_BIT(offset)) & 0x1;
> +       return !!(tegra_gpio_readl(tgi, GPIO_IN(tgi, offset)) & bval);
>  }
>
>  static int tegra_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>  {
> -       tegra_gpio_mask_write(GPIO_MSK_OE(offset), offset, 0);
> -       tegra_gpio_enable(offset);
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, offset), offset, 0);
> +       tegra_gpio_enable(tgi, offset);
>         return 0;
>  }
>
>  static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>                                         int value)
>  {
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +
>         tegra_gpio_set(chip, offset, value);
> -       tegra_gpio_mask_write(GPIO_MSK_OE(offset), offset, 1);
> -       tegra_gpio_enable(offset);
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, offset), offset, 1);
> +       tegra_gpio_enable(tgi, offset);
>         return 0;
>  }
>
>  static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> -       return irq_find_mapping(irq_domain, offset);
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +
> +       return irq_find_mapping(tgi->irq_domain, offset);
>  }
>
>  static struct gpio_chip tegra_gpio_chip = {
> @@ -184,29 +203,36 @@ static struct gpio_chip tegra_gpio_chip = {
>
>  static void tegra_gpio_irq_ack(struct irq_data *d)
>  {
> +       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> +       struct tegra_gpio_info *tgi = bank->tgi;
>         int gpio = d->hwirq;
>
> -       tegra_gpio_writel(1 << GPIO_BIT(gpio), GPIO_INT_CLR(gpio));
> +       tegra_gpio_writel(tgi, 1 << GPIO_BIT(gpio), GPIO_INT_CLR(tgi, gpio));
>  }
>
>  static void tegra_gpio_irq_mask(struct irq_data *d)
>  {
> +       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> +       struct tegra_gpio_info *tgi = bank->tgi;
>         int gpio = d->hwirq;
>
> -       tegra_gpio_mask_write(GPIO_MSK_INT_ENB(gpio), gpio, 0);
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 0);
>  }
>
>  static void tegra_gpio_irq_unmask(struct irq_data *d)
>  {
> +       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> +       struct tegra_gpio_info *tgi = bank->tgi;
>         int gpio = d->hwirq;
>
> -       tegra_gpio_mask_write(GPIO_MSK_INT_ENB(gpio), gpio, 1);
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 1);
>  }
>
>  static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
>         int gpio = d->hwirq;
>         struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> +       struct tegra_gpio_info *tgi = bank->tgi;
>         int port = GPIO_PORT(gpio);
>         int lvl_type;
>         int val;
> @@ -238,23 +264,24 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                 return -EINVAL;
>         }
>
> -       ret = gpiochip_lock_as_irq(&tegra_gpio_chip, gpio);
> +       ret = gpiochip_lock_as_irq(tgi->gc, gpio);
>         if (ret) {
> -               dev_err(dev, "unable to lock Tegra GPIO %d as IRQ\n", gpio);
> +               dev_err(tgi->dev,
> +                       "unable to lock Tegra GPIO %d as IRQ\n", gpio);
>                 return ret;
>         }
>
>         spin_lock_irqsave(&bank->lvl_lock[port], flags);
>
> -       val = tegra_gpio_readl(GPIO_INT_LVL(gpio));
> +       val = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
>         val &= ~(GPIO_INT_LVL_MASK << GPIO_BIT(gpio));
>         val |= lvl_type << GPIO_BIT(gpio);
> -       tegra_gpio_writel(val, GPIO_INT_LVL(gpio));
> +       tegra_gpio_writel(tgi, val, GPIO_INT_LVL(tgi, gpio));
>
>         spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
>
> -       tegra_gpio_mask_write(GPIO_MSK_OE(gpio), gpio, 0);
> -       tegra_gpio_enable(gpio);
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
> +       tegra_gpio_enable(tgi, gpio);
>
>         if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
>                 irq_set_handler_locked(d, handle_level_irq);
> @@ -266,9 +293,11 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>
>  static void tegra_gpio_irq_shutdown(struct irq_data *d)
>  {
> +       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> +       struct tegra_gpio_info *tgi = bank->tgi;
>         int gpio = d->hwirq;
>
> -       gpiochip_unlock_as_irq(&tegra_gpio_chip, gpio);
> +       gpiochip_unlock_as_irq(tgi->gc, gpio);
>  }
>
>  static void tegra_gpio_irq_handler(struct irq_desc *desc)
> @@ -276,19 +305,24 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
>         int port;
>         int pin;
>         int unmasked = 0;
> +       int gpio;
> +       u32 lvl;
> +       unsigned long sta;

Why do you move these declarations here? They are not used outside of
the loop IIUC.

>         struct irq_chip *chip = irq_desc_get_chip(desc);
>         struct tegra_gpio_bank *bank = irq_desc_get_handler_data(desc);
> +       struct tegra_gpio_info *tgi = bank->tgi;
>
>         chained_irq_enter(chip, desc);
>
>         for (port = 0; port < 4; port++) {
> -               int gpio = tegra_gpio_compose(bank->bank, port, 0);
> -               unsigned long sta = tegra_gpio_readl(GPIO_INT_STA(gpio)) &
> -                       tegra_gpio_readl(GPIO_INT_ENB(gpio));
> -               u32 lvl = tegra_gpio_readl(GPIO_INT_LVL(gpio));
> +               gpio = tegra_gpio_compose(bank->bank, port, 0);
> +               sta = tegra_gpio_readl(tgi, GPIO_INT_STA(tgi, gpio)) &
> +                       tegra_gpio_readl(tgi, GPIO_INT_ENB(tgi, gpio));
> +               lvl = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
>
>                 for_each_set_bit(pin, &sta, 8) {
> -                       tegra_gpio_writel(1 << pin, GPIO_INT_CLR(gpio));
> +                       tegra_gpio_writel(tgi, 1 << pin,
> +                                         GPIO_INT_CLR(tgi, gpio));
>
>                         /* if gpio is edge triggered, clear condition
>                          * before executing the handler so that we don't
> @@ -311,22 +345,29 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
>  #ifdef CONFIG_PM_SLEEP
>  static int tegra_gpio_resume(struct device *dev)
>  {
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct tegra_gpio_info *tgi = platform_get_drvdata(pdev);
>         unsigned long flags;
>         int b;
>         int p;
>
>         local_irq_save(flags);
>
> -       for (b = 0; b < tegra_gpio_bank_count; b++) {
> -               struct tegra_gpio_bank *bank = &tegra_gpio_banks[b];
> +       for (b = 0; b < tgi->bank_count; b++) {
> +               struct tegra_gpio_bank *bank = &tgi->bank_info[b];
>
>                 for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
>                         unsigned int gpio = (b<<5) | (p<<3);
> -                       tegra_gpio_writel(bank->cnf[p], GPIO_CNF(gpio));
> -                       tegra_gpio_writel(bank->out[p], GPIO_OUT(gpio));
> -                       tegra_gpio_writel(bank->oe[p], GPIO_OE(gpio));
> -                       tegra_gpio_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
> -                       tegra_gpio_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
> +                       tegra_gpio_writel(tgi, bank->cnf[p],
> +                                         GPIO_CNF(tgi, gpio));
> +                       tegra_gpio_writel(tgi, bank->out[p],
> +                                         GPIO_OUT(tgi, gpio));
> +                       tegra_gpio_writel(tgi, bank->oe[p],
> +                                         GPIO_OE(tgi, gpio));
> +                       tegra_gpio_writel(tgi, bank->int_lvl[p],
> +                                         GPIO_INT_LVL(tgi, gpio));
> +                       tegra_gpio_writel(tgi, bank->int_enb[p],
> +                                         GPIO_INT_ENB(tgi, gpio));
>                 }
>         }
>
> @@ -336,25 +377,32 @@ static int tegra_gpio_resume(struct device *dev)
>
>  static int tegra_gpio_suspend(struct device *dev)
>  {
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct tegra_gpio_info *tgi = platform_get_drvdata(pdev);
>         unsigned long flags;
>         int b;
>         int p;
>
>         local_irq_save(flags);
> -       for (b = 0; b < tegra_gpio_bank_count; b++) {
> -               struct tegra_gpio_bank *bank = &tegra_gpio_banks[b];
> +       for (b = 0; b < tgi->bank_count; b++) {
> +               struct tegra_gpio_bank *bank = &tgi->bank_info[b];
>
>                 for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
>                         unsigned int gpio = (b<<5) | (p<<3);
> -                       bank->cnf[p] = tegra_gpio_readl(GPIO_CNF(gpio));
> -                       bank->out[p] = tegra_gpio_readl(GPIO_OUT(gpio));
> -                       bank->oe[p] = tegra_gpio_readl(GPIO_OE(gpio));
> -                       bank->int_enb[p] = tegra_gpio_readl(GPIO_INT_ENB(gpio));
> -                       bank->int_lvl[p] = tegra_gpio_readl(GPIO_INT_LVL(gpio));
> +                       bank->cnf[p] = tegra_gpio_readl(tgi,
> +                                                       GPIO_CNF(tgi, gpio));
> +                       bank->out[p] = tegra_gpio_readl(tgi,
> +                                                       GPIO_OUT(tgi, gpio));
> +                       bank->oe[p] = tegra_gpio_readl(tgi,
> +                                                      GPIO_OE(tgi, gpio));
> +                       bank->int_enb[p] = tegra_gpio_readl(tgi,
> +                                               GPIO_INT_ENB(tgi, gpio));
> +                       bank->int_lvl[p] = tegra_gpio_readl(tgi,
> +                                               GPIO_INT_LVL(tgi, gpio));
>
>                         /* Enable gpio irq for wake up source */
> -                       tegra_gpio_writel(bank->wake_enb[p],
> -                                         GPIO_INT_ENB(gpio));
> +                       tegra_gpio_writel(tgi, bank->wake_enb[p],
> +                                         GPIO_INT_ENB(tgi, gpio));
>                 }
>         }
>         local_irq_restore(flags);
> @@ -387,22 +435,23 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
>
>  static int dbg_gpio_show(struct seq_file *s, void *unused)
>  {
> +       struct tegra_gpio_info *tgi = s->private;
>         int i;
>         int j;
>
> -       for (i = 0; i < tegra_gpio_bank_count; i++) {
> +       for (i = 0; i < tgi->bank_count; i++) {
>                 for (j = 0; j < 4; j++) {
>                         int gpio = tegra_gpio_compose(i, j, 0);
>                         seq_printf(s,
>                                 "%d:%d %02x %02x %02x %02x %02x %02x %06x\n",
>                                 i, j,
> -                               tegra_gpio_readl(GPIO_CNF(gpio)),
> -                               tegra_gpio_readl(GPIO_OE(gpio)),
> -                               tegra_gpio_readl(GPIO_OUT(gpio)),
> -                               tegra_gpio_readl(GPIO_IN(gpio)),
> -                               tegra_gpio_readl(GPIO_INT_STA(gpio)),
> -                               tegra_gpio_readl(GPIO_INT_ENB(gpio)),
> -                               tegra_gpio_readl(GPIO_INT_LVL(gpio)));
> +                               tegra_gpio_readl(tgi, GPIO_CNF(tgi, gpio)),
> +                               tegra_gpio_readl(tgi, GPIO_OE(tgi, gpio)),
> +                               tegra_gpio_readl(tgi, GPIO_OUT(tgi, gpio)),
> +                               tegra_gpio_readl(tgi, GPIO_IN(tgi, gpio)),
> +                               tegra_gpio_readl(tgi, GPIO_INT_STA(tgi, gpio)),
> +                               tegra_gpio_readl(tgi, GPIO_INT_ENB(tgi, gpio)),
> +                               tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio)));
>                 }
>         }
>         return 0;
> @@ -410,7 +459,7 @@ static int dbg_gpio_show(struct seq_file *s, void *unused)
>
>  static int dbg_gpio_open(struct inode *inode, struct file *file)
>  {
> -       return single_open(file, dbg_gpio_show, &inode->i_private);
> +       return single_open(file, dbg_gpio_show, inode->i_private);
>  }
>
>  static const struct file_operations debug_fops = {
> @@ -420,15 +469,15 @@ static const struct file_operations debug_fops = {
>         .release        = single_release,
>  };
>
> -static void tegra_gpio_debuginit(void)
> +static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
>  {
>         (void) debugfs_create_file("tegra_gpio", S_IRUGO,
> -                                       NULL, NULL, &debug_fops);
> +                                       NULL, tgi, &debug_fops);
>  }
>
>  #else
>
> -static inline void tegra_gpio_debuginit(void)
> +static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
>  {
>  }
>
> @@ -458,6 +507,7 @@ static struct lock_class_key gpio_lock_class;
>  static int tegra_gpio_probe(struct platform_device *pdev)
>  {
>         const struct tegra_gpio_soc_config *config;
> +       struct tegra_gpio_info *tgi;
>         struct resource *res;
>         struct tegra_gpio_bank *bank;
>         int ret;
> @@ -465,79 +515,85 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>         int i;
>         int j;
>
> -       dev = &pdev->dev;
> -
>         config = of_device_get_match_data(&pdev->dev);
>         if (!config) {
>                 dev_err(&pdev->dev, "Error: No device match found\n");
>                 return -ENODEV;
>         }
>
> -       tegra_gpio_bank_stride = config->bank_stride;
> -       tegra_gpio_upper_offset = config->upper_offset;
> +       tgi = devm_kzalloc(&pdev->dev, sizeof(*tgi), GFP_KERNEL);
> +       if (!tgi)
> +               return -ENODEV;
> +
> +       tgi->soc = config;
> +       tgi->dev = &pdev->dev;
>
>         for (;;) {
> -               res = platform_get_resource(pdev, IORESOURCE_IRQ, tegra_gpio_bank_count);
> +               res = platform_get_resource(pdev, IORESOURCE_IRQ,
> +                                           tgi->bank_count);
>                 if (!res)
>                         break;
> -               tegra_gpio_bank_count++;
> +               tgi->bank_count++;
>         }
> -       if (!tegra_gpio_bank_count) {
> +       if (!tgi->bank_count) {
>                 dev_err(&pdev->dev, "Missing IRQ resource\n");
>                 return -ENODEV;
>         }
>
> -       tegra_gpio_chip.ngpio = tegra_gpio_bank_count * 32;
> +       tgi->gc = &tegra_gpio_chip;
> +       tgi->gc->ngpio = tgi->bank_count * 32;
> +       tgi->gc->parent = &pdev->dev;
> +       tgi->gc->of_node = pdev->dev.of_node;

As said in 4/4, I really think gc should not be a pointer so several
instances can coexist. Most other GPIO drivers follow this model.

With these small details fixed, I believe this looks good!

Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
