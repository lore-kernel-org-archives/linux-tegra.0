From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 3/4] gpio: tegra: Get rid of all file scoped global
 variables
Date: Thu, 21 Apr 2016 12:33:46 -0600
Message-ID: <57191D0A.8010005@wwwdotorg.org>
References: <1461159058-1439-1-git-send-email-ldewangan@nvidia.com>
 <1461159058-1439-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461159058-1439-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/20/2016 07:30 AM, Laxman Dewangan wrote:
> Move the file scoped multiple global variable from Tegra GPIO
> driver to the structure and make this as gpiochip data which
> can be referred from GPIO chip callbacks.

> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c

> +#define GPIO_MSK_CNF(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x00)
> +#define GPIO_MSK_OE(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x10)
> +#define GPIO_MSK_OUT(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0X20)
> +#define GPIO_MSK_INT_STA(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x40)
> +#define GPIO_MSK_INT_ENB(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x50)
> +#define GPIO_MSK_INT_LVL(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x60)
> +#define GPIO_MSK_DBC_EN(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x30)

DBC_EN/0x30 should be sorted correctly with the rest, and likely added 
in patch 4 instead.

> @@ -276,19 +307,25 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)

> +	struct tegra_gpio_info *tgi = bank->tgi;
> +
>
>   	chained_irq_enter(chip, desc);

No need for 2 blank lines there.

> @@ -410,7 +462,7 @@ static int dbg_gpio_show(struct seq_file *s, void *unused)
>
>   static int dbg_gpio_open(struct inode *inode, struct file *file)
>   {
> -	return single_open(file, dbg_gpio_show, &inode->i_private);
> +	return single_open(file, dbg_gpio_show, inode->i_private);

Can you explain that change? I'm not sure it's correct, but don't know 
why it was made.

Once those are fixed,
Reviewed-by: Stephen Warren <swarren@nvidia.com>
