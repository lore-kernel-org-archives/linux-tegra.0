From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] rtc: max77686: Use single-byte writes on MAX77620
Date: Mon, 20 Apr 2020 15:43:06 +0100
Message-ID: <6331768f-5d4a-aefb-03f2-5b04d0193440@nvidia.com>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200417170825.2551367-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200417170825.2551367-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/04/2020 18:08, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The MAX77620 doesn't support bulk writes, so make sure the regmap code
> breaks bulk writes into multiple single-byte writes.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/rtc/rtc-max77686.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 35fd74b83626..f53db4d6bead 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -78,6 +78,8 @@ struct max77686_rtc_driver_data {
>  	int			alarm_pending_status_reg;
>  	/* RTC IRQ CHIP for regmap */
>  	const struct regmap_irq_chip *rtc_irq_chip;
> +	/* regmap configuration for the chip */
> +	const struct regmap_config *regmap_config;
>  };
>  
>  struct max77686_rtc_info {
> @@ -182,6 +184,11 @@ static const struct regmap_irq_chip max77686_rtc_irq_chip = {
>  	.num_irqs	= ARRAY_SIZE(max77686_rtc_irqs),
>  };
>  
> +static const struct regmap_config max77686_rtc_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
>  static const struct max77686_rtc_driver_data max77686_drv_data = {
>  	.delay = 16000,
>  	.mask  = 0x7f,
> @@ -191,6 +198,13 @@ static const struct max77686_rtc_driver_data max77686_drv_data = {
>  	.alarm_pending_status_reg = MAX77686_REG_STATUS2,
>  	.rtc_i2c_addr = MAX77686_I2C_ADDR_RTC,
>  	.rtc_irq_chip = &max77686_rtc_irq_chip,
> +	.regmap_config = &max77686_rtc_regmap_config,
> +};
> +
> +static const struct regmap_config max77620_rtc_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.use_single_write = true,
>  };
>  
>  static const struct max77686_rtc_driver_data max77620_drv_data = {
> @@ -202,6 +216,7 @@ static const struct max77686_rtc_driver_data max77620_drv_data = {
>  	.alarm_pending_status_reg = MAX77686_INVALID_REG,
>  	.rtc_i2c_addr = MAX77620_I2C_ADDR_RTC,
>  	.rtc_irq_chip = &max77686_rtc_irq_chip,
> +	.regmap_config = &max77620_rtc_regmap_config,
>  };
>  
>  static const unsigned int max77802_map[REG_RTC_END] = {
> @@ -658,11 +673,6 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
>  	return ret;
>  }
>  
> -static const struct regmap_config max77686_rtc_regmap_config = {
> -	.reg_bits = 8,
> -	.val_bits = 8,
> -};
> -
>  static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
>  {
>  	struct device *parent = info->dev->parent;
> @@ -698,7 +708,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
>  	}
>  
>  	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
> -						&max77686_rtc_regmap_config);
> +						info->drv_data->regmap_config);
>  	if (IS_ERR(info->rtc_regmap)) {
>  		ret = PTR_ERR(info->rtc_regmap);
>  		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
> 


Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
