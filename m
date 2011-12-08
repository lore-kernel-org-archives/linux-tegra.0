From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 3/8] arm/tegra: Split Seaboard GPIO table to allow for
 Ventana
Date: Wed, 7 Dec 2011 16:11:25 -0800
Message-ID: <20111208001125.GD12945@quad.lixom.net>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
 <1323296033-28730-6-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323296033-28730-6-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Dec 07, 2011 at 03:13:44PM -0700, Stephen Warren wrote:
> Seaboard and Ventana share some GPIOs, but others are different. Split the
> GPIO table into common, seaboard-specific, and ventana-specific tables, so
> that only the correct ones are enabled for each board. Add a few missing
> audio-related GPIOs for Ventana.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-seaboard-pinmux.c |   16 +++++++++++++++-
>  1 files changed, 15 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-seaboard-pinmux.c b/arch/arm/mach-tegra/board-seaboard-pinmux.c
> index b1c2972..cb5b2e9 100644
> --- a/arch/arm/mach-tegra/board-seaboard-pinmux.c
> +++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
> @@ -190,14 +190,26 @@ static struct tegra_gpio_table common_gpio_table[] = {
>  	{ .gpio = TEGRA_GPIO_SD2_CD,		.enable = true },
>  	{ .gpio = TEGRA_GPIO_SD2_WP,		.enable = true },
>  	{ .gpio = TEGRA_GPIO_SD2_POWER,		.enable = true },
> +	{ .gpio = TEGRA_GPIO_CDC_IRQ,		.enable = true },
> +};
> +
> +static struct tegra_gpio_table seaboard_gpio_table[] = {
>  	{ .gpio = TEGRA_GPIO_LIDSWITCH,		.enable = true },
>  	{ .gpio = TEGRA_GPIO_POWERKEY,		.enable = true },
>  	{ .gpio = TEGRA_GPIO_HP_DET,		.enable = true },
>  	{ .gpio = TEGRA_GPIO_ISL29018_IRQ,	.enable = true },
> -	{ .gpio = TEGRA_GPIO_CDC_IRQ,		.enable = true },
>  	{ .gpio = TEGRA_GPIO_USB1,		.enable = true },
>  };
>  
> +static struct tegra_gpio_table ventana_gpio_table[] = {
> +	/* hp_det */
> +	{ .gpio = TEGRA_GPIO_PW2,		.enable = true },
> +	/* int_mic_en */
> +	{ .gpio = TEGRA_GPIO_PX0,		.enable = true },
> +	/* ext_mic_en */
> +	{ .gpio = TEGRA_GPIO_PX1,		.enable = true },
> +};

These should be given symbolical names instead.


-Olof
