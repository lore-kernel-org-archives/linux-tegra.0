From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: trimslice: enable MMC/SD slots
Date: Mon, 7 Mar 2011 09:39:03 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF045687B867@HQMAIL01.nvidia.com>
References: <1299509842-21191-1-git-send-email-mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299509842-21191-1-git-send-email-mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mike Rapoport wrote at Monday, March 07, 2011 7:57 AM:
> TrimSlice has MicroSD and standard MMC/SD slots.
> Register sdhci devices and enable GPIOs for MMC/SD slot.
> 
> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> @@ -139,7 +142,13 @@ static __initdata struct tegra_pingroup_config
> trimslice_pinmux[] = {
>  	{TEGRA_PINGROUP_XM2D,  TEGRA_MUX_NONE,          TEGRA_PUPD_NORMAL,
> TEGRA_TRI_NORMAL},
>  };
> 
> +static struct tegra_gpio_table gpio_table[] = {
> +	{ .gpio = TEGRA_GPIO_PP1,	.enable = true	}, /* mmc4 cd */
> +	{ .gpio = TEGRA_GPIO_PP2,	.enable = true	}, /* mmc4 wp */
> +};
> +

Not a big deal, but it'd be great if this could use defines that name the
GPIOs, like other boards do now; see Olof's boards-for-next tree for examples
on Harmony and Seaboard.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
