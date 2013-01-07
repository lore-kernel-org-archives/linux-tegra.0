From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra114: add pinctrl driver for NVIDIA's
 Tegra114 SoC
Date: Mon, 07 Jan 2013 09:58:15 -0700
Message-ID: <50EAFEA7.90201@wwwdotorg.org>
References: <1357387375-25919-1-git-send-email-ldewangan@nvidia.com> <1357387375-25919-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357387375-25919-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/05/2013 05:02 AM, Laxman Dewangan wrote:
> From: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This adds a driver for the Tegra114 pinmux, and required
> parameterization data for Tegra114.
> 
> The driver uses the common Tegra pincontrol driver utility
> functions to implement the majority of the driver.
> 
> This driver is not compatible with the earlier NVIDIA's SoCs,
> hence add new compatibile as "nvidia,tegra114-pinmux".
> 
> Originally written by Pritesh.
> ldewangan: cleanup the patches, remove non-require tables.

> +static struct platform_driver tegra114_pinctrl_driver = {
> +	.driver = {
> +		.name = "tegra114-pinctrl",
> +		.owner = THIS_MODULE,
> +		.of_match_table = tegra114_pinctrl_of_match,
> +	},
> +	.probe = tegra114_pinctrl_probe,
> +	.remove = tegra_pinctrl_remove,
> +};

> +
> +static int __init tegra114_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra114_pinctrl_driver);
> +}
> +arch_initcall(tegra114_pinctrl_init);
> +
> +static void __exit tegra114_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&tegra114_pinctrl_driver);
> +}
> +module_exit(tegra114_pinctrl_exit);

I believe that last chunk should be
module_platform_driver(tegra114_pinctrl_driver), since now that
everything is instantiated purely from DT, I don't believe there's any
probe ordering advantage to be gained from using arch_initcall() rather
than module_init().

Aside from that, the series,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I didn't check the content of all the tables, but the structure looks good!
