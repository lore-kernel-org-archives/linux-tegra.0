From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4 3/4] gpio: tegra: Get rid of all file scoped global
 variables
Date: Mon, 25 Apr 2016 14:06:20 +0530
Message-ID: <571DD704.3030400@nvidia.com>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com> <1461319754-12040-3-git-send-email-ldewangan@nvidia.com> <CAAVeFuL_RLgxb_m1-ghRCQwSr+gBmOs8wgX159Qh7UFG9-pWTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuL_RLgxb_m1-ghRCQwSr+gBmOs8wgX159Qh7UFG9-pWTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Monday 25 April 2016 10:43 AM, Alexandre Courbot wrote:
> On Fri, Apr 22, 2016 at 7:09 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> -static struct tegra_gpio_bank *tegra_gpio_banks;
>> +struct tegra_gpio_info {
> I think tegra_gpio_chip would be a better name for this structure
> (especially if you make "struct gpio_chip gc" its first member to
> highlight the fact that it inherits from it) and more in line with
> what other GPIO drivers do.

The gpio library has struct gpio_chip and it is better to have the 
variable name matching with it.
So the struct gpio_chp tegra_gpio_chip is better way here.
For gpio library, the driver specific data is called as treated as drvdata.
I will keep with tegra_gpio_info here.

>
> You can then rename the former tegra_gpio_chip to something like
> tegra_gpio_funcs since it would just be used to set the chip's
> functions if you follow my comment on patch 4/4.
>
>> +       struct device                           *dev;
>> +       void __iomem                            *regs;
>> +       struct irq_domain                       *irq_domain;
>> +       struct tegra_gpio_bank                  *bank_info;
>> +       const struct tegra_gpio_soc_config      *soc;
>> +       struct gpio_chip                        *gc;
>> +       u32                                     bank_count;
>> +};
>>
>> -static inline void tegra_gpio_writel(u32 val, u32 reg)
>> +static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
>> +                                    u32 val, u32 reg)
>>   {
>> -       __raw_writel(val, regs + reg);
>> +       __raw_writel(val, tgi->regs + reg);
>>   }
>>
>> -static inline u32 tegra_gpio_readl(u32 reg)
>> +static inline u32 tegra_gpio_readl(struct tegra_gpio_info *tgi, u32 reg)
>>   {
>> -       return __raw_readl(regs + reg);
>> +       return __raw_readl(tgi->regs + reg);
>>   }
>>
>>   static int tegra_gpio_compose(int bank, int port, int bit)
>> @@ -103,24 +109,25 @@ static int tegra_gpio_compose(int bank, int port, int bit)
>>          return (bank << 5) | ((port & 0x3) << 3) | (bit & 0x7);
>>   }
>>
>> -static void tegra_gpio_mask_write(u32 reg, int gpio, int value)
>> +static void tegra_gpio_mask_write(struct tegra_gpio_info *tgi, u32 reg,
>> +                                 int gpio, int value)
>>   {
>>          u32 val;
>>
>>          val = 0x100 << GPIO_BIT(gpio);
>>          if (value)
>>                  val |= 1 << GPIO_BIT(gpio);
>> -       tegra_gpio_writel(val, reg);
>> +       tegra_gpio_writel(tgi, val, reg);
>>   }
>>
>> -static void tegra_gpio_enable(int gpio)
>> +static void tegra_gpio_enable(struct tegra_gpio_info *tgi, int gpio)
>>   {
>> -       tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 1);
>> +       tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 1);
>>   }
>>
>> -static void tegra_gpio_disable(int gpio)
>> +static void tegra_gpio_disable(struct tegra_gpio_info *tgi, int gpio)
>>   {
>> -       tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 0);
>> +       tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 0);
>>   }
>>
>>   static int tegra_gpio_request(struct gpio_chip *chip, unsigned offset)
>> @@ -130,44 +137,56 @@ static int tegra_gpio_request(struct gpio_chip *chip, unsigned offset)
>>
>>   static void tegra_gpio_free(struct gpio_chip *chip, unsigned offset)
>>   {
>> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
>> +
>>          pinctrl_free_gpio(offset);
>> -       tegra_gpio_disable(offset);
>> +       tegra_gpio_disable(tgi, offset);
>>   }
>>
>>   static void tegra_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>>   {
>> -       tegra_gpio_mask_write(GPIO_MSK_OUT(offset), offset, value);
>> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
>> +
>> +       tegra_gpio_mask_write(tgi, GPIO_MSK_OUT(tgi, offset), offset, value);
>>   }
>>
>>   static int tegra_gpio_get(struct gpio_chip *chip, unsigned offset)
>>   {
>> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
>> +       int bval = BIT(GPIO_BIT(offset));
>> +
>>          /* If gpio is in output mode then read from the out value */
>> -       if ((tegra_gpio_readl(GPIO_OE(offset)) >> GPIO_BIT(offset)) & 1)
>> -               return (tegra_gpio_readl(GPIO_OUT(offset)) >>
>> -                               GPIO_BIT(offset)) & 0x1;
>> +       if (tegra_gpio_readl(tgi, GPIO_OE(tgi, offset)) & bval)
>> +               return !!(tegra_gpio_readl(tgi, GPIO_OUT(tgi, offset)) & bval);
>>
>> -       return (tegra_gpio_readl(GPIO_IN(offset)) >> GPIO_BIT(offset)) & 0x1;
>> +       return !!(tegra_gpio_readl(tgi, GPIO_IN(tgi, offset)) & bval);
>>   }
>>
>>   static int tegra_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>>   {
>> -       tegra_gpio_mask_write(GPIO_MSK_OE(offset), offset, 0);
>> -       tegra_gpio_enable(offset);
>> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
>> +
>> +       tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, offset), offset, 0);
>> +       tegra_gpio_enable(tgi, offset);
>>          return 0;
>>   }
>>
>>   static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>>                                          int value)
>>   {
>> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
>> +
>>          tegra_gpio_set(chip, offset, value);
>> -       tegra_gpio_mask_write(GPIO_MSK_OE(offset), offset, 1);
>> -       tegra_gpio_enable(offset);
>> +       tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, offset), offset, 1);
>> +       tegra_gpio_enable(tgi, offset);
>>          return 0;
>>   }
>>
>>   static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>>   {
>> -       return irq_find_mapping(irq_domain, offset);
>> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
>> +
>> +       return irq_find_mapping(tgi->irq_domain, offset);
>>   }
>>
>>   static struct gpio_chip tegra_gpio_chip = {
>> @@ -184,29 +203,36 @@ static struct gpio_chip tegra_gpio_chip = {
>>
>>   static void tegra_gpio_irq_ack(struct irq_data *d)
>>   {
>> +       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>> +       struct tegra_gpio_info *tgi = bank->tgi;
>>          int gpio = d->hwirq;
>>
>> -       tegra_gpio_writel(1 << GPIO_BIT(gpio), GPIO_INT_CLR(gpio));
>> +       tegra_gpio_writel(tgi, 1 << GPIO_BIT(gpio), GPIO_INT_CLR(tgi, gpio));
>>   }
>>
>>   static void tegra_gpio_irq_mask(struct irq_data *d)
>>   {
>> +       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>> +       struct tegra_gpio_info *tgi = bank->tgi;
>>          int gpio = d->hwirq;
>>
>> -       tegra_gpio_mask_write(GPIO_MSK_INT_ENB(gpio), gpio, 0);
>> +       tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 0);
>>   }
>>
>>   static void tegra_gpio_irq_unmask(struct irq_data *d)
>>   {
>> +       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>> +       struct tegra_gpio_info *tgi = bank->tgi;
>>          int gpio = d->hwirq;
>>
>> -       tegra_gpio_mask_write(GPIO_MSK_INT_ENB(gpio), gpio, 1);
>> +       tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 1);
>>   }
>>
>>   static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>   {
>>          int gpio = d->hwirq;
>>          struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>> +       struct tegra_gpio_info *tgi = bank->tgi;
>>          int port = GPIO_PORT(gpio);
>>          int lvl_type;
>>          int val;
>> @@ -238,23 +264,24 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>                  return -EINVAL;
>>          }
>>
>> -       ret = gpiochip_lock_as_irq(&tegra_gpio_chip, gpio);
>> +       ret = gpiochip_lock_as_irq(tgi->gc, gpio);
>>          if (ret) {
>> -               dev_err(dev, "unable to lock Tegra GPIO %d as IRQ\n", gpio);
>> +               dev_err(tgi->dev,
>> +                       "unable to lock Tegra GPIO %d as IRQ\n", gpio);
>>                  return ret;
>>          }
>>
>>          spin_lock_irqsave(&bank->lvl_lock[port], flags);
>>
>> -       val = tegra_gpio_readl(GPIO_INT_LVL(gpio));
>> +       val = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
>>          val &= ~(GPIO_INT_LVL_MASK << GPIO_BIT(gpio));
>>          val |= lvl_type << GPIO_BIT(gpio);
>> -       tegra_gpio_writel(val, GPIO_INT_LVL(gpio));
>> +       tegra_gpio_writel(tgi, val, GPIO_INT_LVL(tgi, gpio));
>>
>>          spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
>>
>> -       tegra_gpio_mask_write(GPIO_MSK_OE(gpio), gpio, 0);
>> -       tegra_gpio_enable(gpio);
>> +       tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
>> +       tegra_gpio_enable(tgi, gpio);
>>
>>          if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
>>                  irq_set_handler_locked(d, handle_level_irq);
>> @@ -266,9 +293,11 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>
>>   static void tegra_gpio_irq_shutdown(struct irq_data *d)
>>   {
>> +       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>> +       struct tegra_gpio_info *tgi = bank->tgi;
>>          int gpio = d->hwirq;
>>
>> -       gpiochip_unlock_as_irq(&tegra_gpio_chip, gpio);
>> +       gpiochip_unlock_as_irq(tgi->gc, gpio);
>>   }
>>
>>   static void tegra_gpio_irq_handler(struct irq_desc *desc)
>> @@ -276,19 +305,24 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
>>          int port;
>>          int pin;
>>          int unmasked = 0;
>> +       int gpio;
>> +       u32 lvl;
>> +       unsigned long sta;
> Why do you move these declarations here? They are not used outside of
> the loop IIUC.
Declaring and defining in single lime making this more than 80 column 
when adding tgi.
Breaking them multiple lines does nto look good and hence move the 
declaration outside of loop.


>>   
>> +       tgi->gc->parent = &pdev->dev;
>> +       tgi->gc->of_node = pdev->dev.of_node;
> As said in 4/4, I really think gc should not be a pointer so several
> instances can coexist. Most other GPIO drivers follow this model.
>
> With these small details fixed, I believe this looks good!
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>


OK will make that change and collect your RB.
