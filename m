From: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Subject: Re: [PATCH 1/3] regulator: palmas: clear sleep bits if not selected
Date: Wed, 17 Apr 2013 14:53:02 +0100
Message-ID: <516EA93E.1020409@slimlogic.co.uk>
References: <1366191793-13934-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366191793-13934-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is good with me, I originally had it like this and I cannot
remember why I convinced myself not to do it this way.

Acked-by: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>

On 17/04/13 10:43, Laxman Dewangan wrote:
> Clear the sleep/warm reset bits when it is not selected through
> regulator platform data. This will make sure that configuration
> is inline with the platform data regardless of boot/POR
> configuration.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/regulator/palmas-regulator.c |   18 ++++++++++++------
>  1 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
> index 7c54e31..7c7992b 100644
> --- a/drivers/regulator/palmas-regulator.c
> +++ b/drivers/regulator/palmas-regulator.c
> @@ -444,24 +444,26 @@ static int palmas_smps_init(struct palmas *palmas, int id,
>  
>  	switch (id) {
>  	case PALMAS_REG_SMPS10:
> -		if (reg_init->mode_sleep) {
> -			reg &= ~PALMAS_SMPS10_CTRL_MODE_SLEEP_MASK;
> +		reg &= ~PALMAS_SMPS10_CTRL_MODE_SLEEP_MASK;
> +		if (reg_init->mode_sleep)
>  			reg |= reg_init->mode_sleep <<
>  					PALMAS_SMPS10_CTRL_MODE_SLEEP_SHIFT;
> -		}
>  		break;
>  	default:
>  		if (reg_init->warm_reset)
>  			reg |= PALMAS_SMPS12_CTRL_WR_S;
> +		else
> +			reg &= ~PALMAS_SMPS12_CTRL_WR_S;
>  
>  		if (reg_init->roof_floor)
>  			reg |= PALMAS_SMPS12_CTRL_ROOF_FLOOR_EN;
> +		else
> +			reg &= ~PALMAS_SMPS12_CTRL_ROOF_FLOOR_EN;
>  
> -		if (reg_init->mode_sleep) {
> -			reg &= ~PALMAS_SMPS12_CTRL_MODE_SLEEP_MASK;
> +		reg &= ~PALMAS_SMPS12_CTRL_MODE_SLEEP_MASK;
> +		if (reg_init->mode_sleep)
>  			reg |= reg_init->mode_sleep <<
>  					PALMAS_SMPS12_CTRL_MODE_SLEEP_SHIFT;
> -		}
>  	}
>  
>  	ret = palmas_smps_write(palmas, addr, reg);
> @@ -507,9 +509,13 @@ static int palmas_ldo_init(struct palmas *palmas, int id,
>  
>  	if (reg_init->warm_reset)
>  		reg |= PALMAS_LDO1_CTRL_WR_S;
> +	else
> +		reg &= ~PALMAS_LDO1_CTRL_WR_S;
>  
>  	if (reg_init->mode_sleep)
>  		reg |= PALMAS_LDO1_CTRL_MODE_SLEEP;
> +	else
> +		reg &= ~PALMAS_LDO1_CTRL_MODE_SLEEP;
>  
>  	ret = palmas_ldo_write(palmas, addr, reg);
>  	if (ret)
