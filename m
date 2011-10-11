From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] gpio/tegra: Convert to a platform device
Date: Tue, 11 Oct 2011 14:29:15 -0700
Message-ID: <20111011212915.GA706@quad.lixom.net>
References: <1318364638-20191-1-git-send-email-swarren@nvidia.com>
 <1318364638-20191-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1318364638-20191-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

Some nits below. Overall looks good.

On Tue, Oct 11, 2011 at 02:23:57PM -0600, Stephen Warren wrote:
> @@ -76,16 +75,20 @@ struct tegra_gpio_bank {
>  };
>  
>  
> -static struct tegra_gpio_bank tegra_gpio_banks[] = {
> -	{.bank = 0, .irq = INT_GPIO1},
> -	{.bank = 1, .irq = INT_GPIO2},
> -	{.bank = 2, .irq = INT_GPIO3},
> -	{.bank = 3, .irq = INT_GPIO4},
> -	{.bank = 4, .irq = INT_GPIO5},
> -	{.bank = 5, .irq = INT_GPIO6},
> -	{.bank = 6, .irq = INT_GPIO7},
> +void __iomem *regs;

Should be static.

> +static struct tegra_gpio_bank tegra_gpio_banks[7] = {
>  };

Can be on the same line as the rest, i.e.  ... = { };

> +static inline void tegra_gpio_writel(u32 val, u32 reg)
> +{
> +	__raw_writel(val, regs + reg);
> +}
> +
> +static inline u32 tegra_gpio_readl(u32 reg)
> +{
> +	return __raw_readl(regs + reg);
> +}
> +
>  static int tegra_gpio_compose(int bank, int port, int bit)
>  {
>  	return (bank << 5) | ((port & 0x3) << 3) | (bit & 0x7);

[...]

> @@ -333,28 +336,55 @@ static struct irq_chip tegra_gpio_irq_chip = {
>   */
>  static struct lock_class_key gpio_lock_class;
>  
> -static int __init tegra_gpio_init(void)
> +static int __init tegra_gpio_probe(struct platform_device *pdev)
>  {
> +	struct resource *res;
>  	struct tegra_gpio_bank *bank;
>  	int gpio;
>  	int i;
>  	int j;
>  
> +	for (i = 0; i < ARRAY_SIZE(tegra_gpio_banks); i++) {
> +		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
> +		if (!res) {
> +			dev_err(&pdev->dev, "Missing IRQ resource\n");
> +			return -ENODEV;
> +		}
> +
> +		bank = &tegra_gpio_banks[i];
> +		bank->bank = i;
> +		bank->irq = res->start;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Missing MEM resource\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!devm_request_mem_region(&pdev->dev, res->start,
> +				     resource_size(res),
> +				     dev_name(&pdev->dev))) {
> +		dev_err(&pdev->dev, "Couldn't request MEM resource\n");
> +		return -ENODEV;
> +	}
> +
> +	regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	if (!regs) {
> +		dev_err(&pdev->dev, "Couldn't ioremap regs\n");
> +		return -ENODEV;

Should you release the mem region requested above here?


-Olof
