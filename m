From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH v2 09/13] gpio/tegra: Add device tree support
Date: Tue, 16 Aug 2011 11:39:01 +0800
Message-ID: <20110816033900.GF8044@S2100-06.ap.freescale.net>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
 <1313440100-17131-10-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313440100-17131-10-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 15, 2011 at 02:28:16PM -0600, Stephen Warren wrote:
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpio/gpio-tegra.c |   32 ++++++++++++++++++++++++++++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 4da4839..1d0a764 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -326,6 +326,30 @@ static struct irq_chip tegra_gpio_irq_chip = {
>  #endif
>  };
>  
> +#ifdef CONFIG_OF
> +static void __init tegra_gpio_probe_dt(struct platform_device *pdev)
> +{
> +	const __be32 *gpios;
> +	u32 gpioslen;
> +	int i;
> +
> +	gpios = of_get_property(pdev->dev.of_node, "nvidia,enabled-gpios",
> +				&gpioslen);
> +	if (gpios == NULL)
> +		return;
> +
> +	gpioslen /= sizeof(*gpios);
> +	for (i = 0; i < gpioslen; i++, gpios++) {
> +		u32 gpio = be32_to_cpup(gpios);
> +		dev_dbg(&pdev->dev, "Enabling GPIO %d\n", gpio);
> +		tegra_gpio_enable(gpio);
> +	}
> +}
> +#else
> +static inline void __init tegra_gpio_probe_dt(struct platform_device *pdev)
> +{
> +}
> +#endif
>  
With your patch below being merged, and the suggestion that
of_property_read_u32[_array] should be used to read integer from
device tree, the #ifdef thing can be removed?

  [PATCH] dt: add empty of_get_property for non-dt

Regards,
Shawn

>  /* This lock class tells lockdep that GPIO irqs are in a different
>   * category than their parents, so it won't report false recursion.
> @@ -371,13 +395,21 @@ static int __init tegra_gpio_probe(struct platform_device *pdev)
>  			spin_lock_init(&bank->lvl_lock[j]);
>  	}
>  
> +	tegra_gpio_probe_dt(pdev);
> +
>  	return 0;
>  }
>  
> +static struct of_device_id tegra_gpio_of_match[] __devinitdata = {
> +	{ .compatible = "nvidia,tegra20-gpio", },
> +	{ },
> +};
> +
>  static struct platform_driver tegra_gpio_driver = {
>  	.driver		= {
>  		.name	= "tegra-gpio",
>  		.owner	= THIS_MODULE,
> +		.of_match_table = tegra_gpio_of_match,
>  	},
>  	.probe		= tegra_gpio_probe,
>  };
> -- 
> 1.7.0.4
> 
> 
