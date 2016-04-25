From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V4 4/4] gpio: tegra: Add support for gpio debounce
Date: Mon, 25 Apr 2016 14:36:45 +0900
Message-ID: <CAAVeFuJykGNGj95r4P8vatxOA_yjsP1eQkDf9zS-dYV1piHTJA@mail.gmail.com>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com> <1461319754-12040-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461319754-12040-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Sorry, just realized I commented on v3...

On Fri, Apr 22, 2016 at 7:09 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> NVIDIA's Tegra210 support the HW debounce in the GPIO controller
> for all its GPIO pins.
>
> Add support for setting debounce timing by implementing the
> set_debounce callback of gpiochip.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>
> ---
> Changes from V1:
> - Write debounce count before enable.
> - Make sure the debounce count do not have any boot residuals.
>
> Changes from V2:
> - Only access register for debounce when SoC support debounce.
>
> Changes from V3:
> - Add locking mechanism in debounce count register update.
> - Move DBC register from prev patch to here.
>
>  drivers/gpio/gpio-tegra.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 6af5eb2..45d80ec 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -46,10 +46,13 @@
>  #define GPIO_INT_ENB(t, x)     (GPIO_REG(t, x) + 0x50)
>  #define GPIO_INT_LVL(t, x)     (GPIO_REG(t, x) + 0x60)
>  #define GPIO_INT_CLR(t, x)     (GPIO_REG(t, x) + 0x70)
> +#define GPIO_DBC_CNT(t, x)     (GPIO_REG(t, x) + 0xF0)
> +
>
>  #define GPIO_MSK_CNF(t, x)     (GPIO_REG(t, x) + t->soc->upper_offset + 0x00)
>  #define GPIO_MSK_OE(t, x)      (GPIO_REG(t, x) + t->soc->upper_offset + 0x10)
>  #define GPIO_MSK_OUT(t, x)     (GPIO_REG(t, x) + t->soc->upper_offset + 0X20)
> +#define GPIO_MSK_DBC_EN(t, x)  (GPIO_REG(t, x) + t->soc->upper_offset + 0x30)
>  #define GPIO_MSK_INT_STA(t, x) (GPIO_REG(t, x) + t->soc->upper_offset + 0x40)
>  #define GPIO_MSK_INT_ENB(t, x) (GPIO_REG(t, x) + t->soc->upper_offset + 0x50)
>  #define GPIO_MSK_INT_LVL(t, x) (GPIO_REG(t, x) + t->soc->upper_offset + 0x60)
> @@ -67,6 +70,7 @@ struct tegra_gpio_bank {
>         int bank;
>         int irq;
>         spinlock_t lvl_lock[4];
> +       spinlock_t dbc_lock[4]; /* Lock for updating debounce count register */

I'm nit'ing here, but maybe one spinlock shared by all ports would be
enough? (the same would apply to lvl_lock, so feel free to do this as
a separate patch) I don't think we expect *that* many concurrent
accesses, do we?

>  #ifdef CONFIG_PM_SLEEP
>         u32 cnf[4];
>         u32 out[4];
> @@ -74,11 +78,14 @@ struct tegra_gpio_bank {
>         u32 int_enb[4];
>         u32 int_lvl[4];
>         u32 wake_enb[4];
> +       u32 dbc_enb[4];
>  #endif
> +       u32 dbc_cnt[4];
>         struct tegra_gpio_info *tgi;
>  };
>
>  struct tegra_gpio_soc_config {
> +       bool debounce_supported;
>         u32 bank_stride;
>         u32 upper_offset;
>  };
> @@ -182,6 +189,38 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>         return 0;
>  }
>
> +static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
> +                                  unsigned int debounce)
> +{
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +       unsigned int debounce_ms = DIV_ROUND_UP(debounce, 1000);
> +       unsigned long flags;
> +       int port = GPIO_PORT(offset);
> +       int bank = GPIO_BANK(offset);

Maybe declare "bank" as follows:

    struct tegra_gpio_bank *bank = &tgi->bank_info[GPIO_BANK(offset)];

This will allow you to simplify the code that follows:

> +
> +       if (!debounce_ms) {
> +               tegra_gpio_mask_write(tgi, GPIO_MSK_DBC_EN(tgi, offset),
> +                                     offset, 0);
> +               return 0;
> +       }
> +
> +       debounce_ms = min(debounce_ms, 255U);
> +
> +       /* There is only one debounce count register per port and hence
> +        * set the maximum of current and requested debounce time.
> +        */
> +       spin_lock_irqsave(&tgi->bank_info[bank].dbc_lock[port], flags);
> +       if (tgi->bank_info[bank].dbc_cnt[port] < debounce_ms) {
> +               tegra_gpio_writel(tgi, debounce_ms, GPIO_DBC_CNT(tgi, offset));
> +               tgi->bank_info[bank].dbc_cnt[port] = debounce_ms;
> +       }
> +       spin_unlock_irqrestore(&tgi->bank_info[bank].dbc_lock[port], flags);

Becomes:

       spin_lock_irqsave(bank->dbc_lock[port], flags);
       if (bank->dbc_cnt[port] < debounce_ms) {
               tegra_gpio_writel(tgi, debounce_ms, GPIO_DBC_CNT(tgi, offset));
               bank->dbc_cnt[port] = debounce_ms;
       }
       spin_unlock_irqrestore(&bank->dbc_lock[port], flags);

Which is nicer to the eyes.

Extra points if you initialize port and bank after we ensure that
debounce_ms is not zero and that their value will actually be used.

> +
> +       tegra_gpio_mask_write(tgi, GPIO_MSK_DBC_EN(tgi, offset), offset, 1);
> +
> +       return 0;
> +}
> +
>  static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
>         struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> @@ -197,6 +236,7 @@ static struct gpio_chip tegra_gpio_chip = {
>         .get                    = tegra_gpio_get,
>         .direction_output       = tegra_gpio_direction_output,
>         .set                    = tegra_gpio_set,
> +       .set_debounce           = tegra_gpio_set_debounce,
>         .to_irq                 = tegra_gpio_to_irq,
>         .base                   = 0,
>  };
> @@ -360,6 +400,14 @@ static int tegra_gpio_resume(struct device *dev)
>                         unsigned int gpio = (b<<5) | (p<<3);
>                         tegra_gpio_writel(tgi, bank->cnf[p],
>                                           GPIO_CNF(tgi, gpio));
> +
> +                       if (tgi->soc->debounce_supported) {
> +                               tegra_gpio_writel(tgi, bank->dbc_cnt[p],
> +                                                 GPIO_DBC_CNT(tgi, gpio));
> +                               tegra_gpio_writel(tgi, bank->dbc_enb[p],
> +                                                 GPIO_MSK_DBC_EN(tgi, gpio));
> +                       }
> +
>                         tegra_gpio_writel(tgi, bank->out[p],
>                                           GPIO_OUT(tgi, gpio));
>                         tegra_gpio_writel(tgi, bank->oe[p],
> @@ -395,6 +443,13 @@ static int tegra_gpio_suspend(struct device *dev)
>                                                         GPIO_OUT(tgi, gpio));
>                         bank->oe[p] = tegra_gpio_readl(tgi,
>                                                        GPIO_OE(tgi, gpio));
> +                       if (tgi->soc->debounce_supported) {
> +                               bank->dbc_enb[p] = tegra_gpio_readl(tgi,
> +                                               GPIO_MSK_DBC_EN(tgi, gpio));
> +                               bank->dbc_enb[p] = (bank->dbc_enb[p] << 8) |
> +                                                       bank->dbc_enb[p];
> +                       }
> +
>                         bank->int_enb[p] = tegra_gpio_readl(tgi,
>                                                 GPIO_INT_ENB(tgi, gpio));
>                         bank->int_lvl[p] = tegra_gpio_readl(tgi,
> @@ -547,6 +602,9 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, tgi);
>
> +       if (!config->debounce_supported)
> +               tgi->gc->set_debounce = NULL;

Yep, we really want one gpio_chip instance in the tegra_gpio_info
struct, otherwise this kind of limits the purpose of getting rid of
these global variables...
