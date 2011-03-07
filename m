From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] ARM: tegra: seaboard: register i2c devices
Date: Mon, 7 Mar 2011 15:42:53 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF045687B99F@HQMAIL01.nvidia.com>
References: <1299540862-3848-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299540862-3848-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Monday, March 07, 2011 4:34 PM:
> Register the base i2c devices on seaboard. A few more are pending,
> but it's a start.
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-seaboard-pinmux.c |    1 +
>  arch/arm/mach-tegra/board-seaboard.c        |   62
> +++++++++++++++++++++++++--
>  2 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-seaboard-pinmux.c b/arch/arm/mach-
> tegra/board-seaboard-pinmux.c
> index 7e96d49..d84d1dd 100644
> --- a/arch/arm/mach-tegra/board-seaboard-pinmux.c
> +++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
> @@ -166,6 +166,7 @@ static struct tegra_gpio_table gpio_table[] = {
>  	{ .gpio = TEGRA_GPIO_SD2_POWER,		.enable = true },
>  	{ .gpio = TEGRA_GPIO_LIDSWITCH,		.enable = true },
>  	{ .gpio = TEGRA_GPIO_POWERKEY,		.enable = true },
> +	{ .gpio = TEGRA_GPIO_ISL29018_IRQ, 	.enable = true },

There's a space after "_IRQ," here. I think that's what's throwing off
the display in my crappy email reader.

Aside from that,

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
