From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 1/2] ARM: Tegra: Device Tree Support: Update how sdhci
 devices	are initialized
Date: Tue, 10 May 2011 15:03:18 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA06A@HQMAIL01.nvidia.com>
References: <20110510201108.22693.50319.stgit@riker>
 <20110510201414.22693.7427.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110510201414.22693.7427.stgit@riker>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-a
Cc: "olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

John Bonesio wrote at Tuesday, May 10, 2011 2:14 PM:
> This patch changes how sdhci devices are initialized so that a later patch can
> easily add support for i2c devies.
> 
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> @@ -134,6 +57,25 @@ static __initdata struct tegra_clk_init_table
> tegra_dt_clk_init_table[] = {
>  	{ NULL,		NULL,		0,		0},
>  };
> 
> +static struct tegra_sdhci_platform_data sdhci_pdata1 = {
> +	.cd_gpio        = -1,
> +	.wp_gpio        = -1,
> +	.power_gpio     = -1,
> +};
> +
> +static struct tegra_sdhci_platform_data sdhci_pdata2 = {
> +	.cd_gpio        = TEGRA_GPIO_SD2_CD,
> +	.wp_gpio        = TEGRA_GPIO_SD2_WP,
> +	.power_gpio     = TEGRA_GPIO_SD2_POWER,
> +};
> +
> +static struct tegra_sdhci_platform_data sdhci_pdata4 = {
> +	.cd_gpio        = TEGRA_GPIO_SD4_CD,
> +	.wp_gpio        = TEGRA_GPIO_SD4_WP,
> +	.power_gpio     = TEGRA_GPIO_SD4_POWER,
> +	.is_8bit        = 1,
> +};
> +

So I understand why board-dt is itself registering the SDHCI platform
devices itself; so that the pdev initialization path is identical
between fully hard-coded boards and board-dt.c.

However, I'm surprised that we would include the platform data for
those devices within that argument; if we do that, we'll end up needing
different platform data for every board, and devicetree won't have
bought us anything.

In other words, I understood that board-dt would register all the
platform devices within Tegra, but not set up any of the plataform
data, and the device drivers for those devices would be updated to
get their platform data from devicetree if available, then fall back
to old-style platform data. In other words, the way the SDHCI drivers
work today in the devicetree/test branch.

If my understanding is correct, shouldn't the chunk above and the
one below be removed?

>  static struct of_device_id tegra_dt_match_table[] __initdata = {
>  	{ .compatible = "simple-bus", },
>  	{}
> @@ -164,6 +106,10 @@ static void __init tegra_dt_init(void)
> 
>  	harmony_pinmux_init();
> 
> +	tegra_sdhci_device1.dev.platform_data = &sdhci_pdata1;
> +	tegra_sdhci_device2.dev.platform_data = &sdhci_pdata2;
> +	tegra_sdhci_device4.dev.platform_data = &sdhci_pdata4;
> +
>  	platform_add_devices(harmony_devices, ARRAY_SIZE(harmony_devices));
> 
>  	/*

-- 
nvpublic
