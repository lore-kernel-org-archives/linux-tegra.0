From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] gpio: tegra: Remove unnecessary check
Date: Tue, 25 Jul 2017 09:27:01 +0100
Message-ID: <18e56d60-db2a-00d1-bb50-6ba12b319005@nvidia.com>
References: <20170724145508.7388-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170724145508.7388-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 24/07/17 15:55, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> of_device_get_match_data() can never return NULL, therefore the check
> for NULL values is unnecessary.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpio/gpio-tegra.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 17725c83821f..63ee221f9be9 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -566,7 +566,6 @@ static struct lock_class_key gpio_lock_class;
>  
>  static int tegra_gpio_probe(struct platform_device *pdev)
>  {
> -	const struct tegra_gpio_soc_config *config;
>  	struct tegra_gpio_info *tgi;
>  	struct resource *res;
>  	struct tegra_gpio_bank *bank;
> @@ -575,17 +574,11 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>  	int i;
>  	int j;
>  
> -	config = of_device_get_match_data(&pdev->dev);
> -	if (!config) {
> -		dev_err(&pdev->dev, "Error: No device match found\n");
> -		return -ENODEV;
> -	}
> -
>  	tgi = devm_kzalloc(&pdev->dev, sizeof(*tgi), GFP_KERNEL);
>  	if (!tgi)
>  		return -ENODEV;
>  
> -	tgi->soc = config;
> +	tgi->soc = of_device_get_match_data(&pdev->dev);
>  	tgi->dev = &pdev->dev;
>  
>  	ret = platform_irq_count(pdev);
> @@ -625,7 +618,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, tgi);
>  
> -	if (config->debounce_supported)
> +	if (tgi->soc->debounce_supported)
>  		tgi->gc.set_config = tegra_gpio_set_config;
>  
>  	tgi->bank_info = devm_kzalloc(&pdev->dev, tgi->bank_count *

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
