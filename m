From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4/4] gpio: tegra: Use unsigned int where possible
Date: Tue, 25 Jul 2017 10:16:40 +0100
Message-ID: <788c9152-2038-44e8-783e-eb0251c81c97@nvidia.com>
References: <20170724145508.7388-1-thierry.reding@gmail.com>
 <20170724145508.7388-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170724145508.7388-4-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 24/07/17 15:55, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In most of the cases, integers in this file can't be negative, so the
> type can be more restricted for clarity.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 57 ++++++++++++++++++++---------------------------
>  1 file changed, 24 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index edc1a14557f0..eb8b4d6d29cc 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -67,8 +67,8 @@
>  struct tegra_gpio_info;
>  
>  struct tegra_gpio_bank {
> -	int bank;
> -	int irq;
> +	unsigned int bank;
> +	unsigned int irq;
>  	spinlock_t lvl_lock[4];
>  	spinlock_t dbc_lock[4];	/* Lock for updating debounce count register */
>  #ifdef CONFIG_PM_SLEEP
> @@ -112,13 +112,14 @@ static inline u32 tegra_gpio_readl(struct tegra_gpio_info *tgi, u32 reg)
>  	return __raw_readl(tgi->regs + reg);
>  }
>  
> -static int tegra_gpio_compose(int bank, int port, int bit)
> +static unsigned int tegra_gpio_compose(unsigned int bank, unsigned int port,
> +				       unsigned int bit)
>  {
>  	return (bank << 5) | ((port & 0x3) << 3) | (bit & 0x7);
>  }
>  
>  static void tegra_gpio_mask_write(struct tegra_gpio_info *tgi, u32 reg,
> -				  int gpio, int value)
> +				  unsigned int gpio, u32 value)
>  {
>  	u32 val;
>  
> @@ -128,12 +129,12 @@ static void tegra_gpio_mask_write(struct tegra_gpio_info *tgi, u32 reg,
>  	tegra_gpio_writel(tgi, val, reg);
>  }
>  
> -static void tegra_gpio_enable(struct tegra_gpio_info *tgi, int gpio)
> +static void tegra_gpio_enable(struct tegra_gpio_info *tgi, unsigned int gpio)
>  {
>  	tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 1);
>  }
>  
> -static void tegra_gpio_disable(struct tegra_gpio_info *tgi, int gpio)
> +static void tegra_gpio_disable(struct tegra_gpio_info *tgi, unsigned int gpio)
>  {
>  	tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 0);
>  }
> @@ -162,7 +163,7 @@ static void tegra_gpio_set(struct gpio_chip *chip, unsigned int offset,
>  static int tegra_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> -	int bval = BIT(GPIO_BIT(offset));
> +	unsigned int bval = BIT(GPIO_BIT(offset));
>  
>  	/* If gpio is in output mode then read from the out value */
>  	if (tegra_gpio_readl(tgi, GPIO_OE(tgi, offset)) & bval)
> @@ -216,7 +217,7 @@ static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
>  	struct tegra_gpio_bank *bank = &tgi->bank_info[GPIO_BANK(offset)];
>  	unsigned int debounce_ms = DIV_ROUND_UP(debounce, 1000);
>  	unsigned long flags;
> -	int port;
> +	unsigned int port;
>  
>  	if (!debounce_ms) {
>  		tegra_gpio_mask_write(tgi, GPIO_MSK_DBC_EN(tgi, offset),
> @@ -265,7 +266,7 @@ static void tegra_gpio_irq_ack(struct irq_data *d)
>  {
>  	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>  	struct tegra_gpio_info *tgi = bank->tgi;
> -	int gpio = d->hwirq;
> +	unsigned int gpio = d->hwirq;
>  
>  	tegra_gpio_writel(tgi, 1 << GPIO_BIT(gpio), GPIO_INT_CLR(tgi, gpio));
>  }
> @@ -274,7 +275,7 @@ static void tegra_gpio_irq_mask(struct irq_data *d)
>  {
>  	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>  	struct tegra_gpio_info *tgi = bank->tgi;
> -	int gpio = d->hwirq;
> +	unsigned int gpio = d->hwirq;
>  
>  	tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 0);
>  }
> @@ -283,20 +284,18 @@ static void tegra_gpio_irq_unmask(struct irq_data *d)
>  {
>  	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>  	struct tegra_gpio_info *tgi = bank->tgi;
> -	int gpio = d->hwirq;
> +	unsigned int gpio = d->hwirq;
>  
>  	tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 1);
>  }
>  
>  static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
> -	int gpio = d->hwirq;
> +	unsigned int gpio = d->hwirq, port = GPIO_PORT(gpio), lvl_type;
>  	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>  	struct tegra_gpio_info *tgi = bank->tgi;
> -	int port = GPIO_PORT(gpio);
> -	int lvl_type;
> -	int val;
>  	unsigned long flags;
> +	u32 val;
>  	int ret;
>  
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
> @@ -327,7 +326,7 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	ret = gpiochip_lock_as_irq(&tgi->gc, gpio);
>  	if (ret) {
>  		dev_err(tgi->dev,
> -			"unable to lock Tegra GPIO %d as IRQ\n", gpio);
> +			"unable to lock Tegra GPIO %u as IRQ\n", gpio);
>  		return ret;
>  	}
>  
> @@ -355,17 +354,14 @@ static void tegra_gpio_irq_shutdown(struct irq_data *d)
>  {
>  	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>  	struct tegra_gpio_info *tgi = bank->tgi;
> -	int gpio = d->hwirq;
> +	unsigned int gpio = d->hwirq;
>  
>  	gpiochip_unlock_as_irq(&tgi->gc, gpio);
>  }
>  
>  static void tegra_gpio_irq_handler(struct irq_desc *desc)
>  {
> -	int port;
> -	int pin;
> -	int unmasked = 0;
> -	int gpio;
> +	unsigned int unmasked = 0, port, pin, gpio;
>  	u32 lvl;
>  	unsigned long sta;
>  	struct irq_chip *chip = irq_desc_get_chip(desc);
> @@ -408,8 +404,7 @@ static int tegra_gpio_resume(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct tegra_gpio_info *tgi = platform_get_drvdata(pdev);
>  	unsigned long flags;
> -	int b;
> -	int p;
> +	unsigned int b, p;
>  
>  	local_irq_save(flags);
>  
> @@ -449,8 +444,7 @@ static int tegra_gpio_suspend(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct tegra_gpio_info *tgi = platform_get_drvdata(pdev);
>  	unsigned long flags;
> -	int b;
> -	int p;
> +	unsigned int b, p;
>  
>  	local_irq_save(flags);
>  	for (b = 0; b < tgi->bank_count; b++) {
> @@ -489,7 +483,7 @@ static int tegra_gpio_suspend(struct device *dev)
>  static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
>  {
>  	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> -	int gpio = d->hwirq;
> +	unsigned int gpio = d->hwirq;
>  	u32 port, bit, mask;
>  
>  	port = GPIO_PORT(gpio);
> @@ -513,15 +507,14 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
>  static int dbg_gpio_show(struct seq_file *s, void *unused)
>  {
>  	struct tegra_gpio_info *tgi = s->private;
> -	int i;
> -	int j;
> +	unsigned int i, j;
>  
>  	for (i = 0; i < tgi->bank_count; i++) {
>  		for (j = 0; j < 4; j++) {
> -			int gpio = tegra_gpio_compose(i, j, 0);
> +			unsigned int gpio = tegra_gpio_compose(i, j, 0);
>  
>  			seq_printf(s,
> -				"%d:%d %02x %02x %02x %02x %02x %02x %06x\n",
> +				"%u:%u %02x %02x %02x %02x %02x %02x %06x\n",
>  				i, j,
>  				tegra_gpio_readl(tgi, GPIO_CNF(tgi, gpio)),
>  				tegra_gpio_readl(tgi, GPIO_OE(tgi, gpio)),
> @@ -576,10 +569,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>  	struct tegra_gpio_info *tgi;
>  	struct resource *res;
>  	struct tegra_gpio_bank *bank;
> +	unsigned int gpio, i, j;
>  	int ret;
> -	int gpio;
> -	int i;
> -	int j;
>  
>  	tgi = devm_kzalloc(&pdev->dev, sizeof(*tgi), GFP_KERNEL);
>  	if (!tgi)

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
