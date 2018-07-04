From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] mfd: as3722: disable auto power on when AC OK
Date: Wed, 4 Jul 2018 08:52:02 +0100
Message-ID: <20180704075202.GQ20176@dell>
References: <20180703150411.29709-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703150411.29709-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Laxman Dewangan <ldewangan@nvidia.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 03 Jul 2018, Marcel Ziswiler wrote:

> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> On ams AS3722, power on when AC OK is enabled by default.
> Making this option as disable by default and enable only
> when platform need this explicitly.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Bibek Basu <bbasu@nvidia.com>
> Tested-by: Bibek Basu <bbasu@nvidia.com>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v2:
> - Document device tree property as suggested by Stefan.
> - Rename SEQ1 to SEQU1 as per datasheet as suggested by Stefan.
> - Drop reference to downstream commit as suggested by Lee.
> 
>  Documentation/devicetree/bindings/mfd/as3722.txt |  2 ++
>  drivers/mfd/as3722.c                             | 12 ++++++++++++
>  include/linux/mfd/as3722.h                       |  3 +++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/as3722.txt b/Documentation/devicetree/bindings/mfd/as3722.txt
> index 5297b2210704..2a665741d7fe 100644
> --- a/Documentation/devicetree/bindings/mfd/as3722.txt
> +++ b/Documentation/devicetree/bindings/mfd/as3722.txt
> @@ -20,6 +20,8 @@ Optional properties:
>  - ams,enable-internal-i2c-pullup: Boolean property, to enable internal pullup on
>  	i2c scl/sda pins. Missing this will disable internal pullup on i2c
>  	scl/sda lines.
> +- ams,enable-ac-ok-power-on: Boolean property, to enable exit out of power off
> +	mode with AC_OK pin (pin enabled in power off mode).

This needs a DT Ack.

>  Optional submodule and their properties:
>  =======================================
> diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
> index f87342c211bc..4d069ed21ff6 100644
> --- a/drivers/mfd/as3722.c
> +++ b/drivers/mfd/as3722.c
> @@ -349,6 +349,8 @@ static int as3722_i2c_of_probe(struct i2c_client *i2c,
>  					"ams,enable-internal-int-pullup");
>  	as3722->en_intern_i2c_pullup = of_property_read_bool(np,
>  					"ams,enable-internal-i2c-pullup");
> +	as3722->en_ac_ok_pwr_on = of_property_read_bool(np,
> +					"ams,enable-ac-ok-power-on");
>  	as3722->irq_flags = irqd_get_trigger_type(irq_data);
>  	dev_dbg(&i2c->dev, "IRQ flags are 0x%08lx\n", as3722->irq_flags);
>  	return 0;
> @@ -360,6 +362,7 @@ static int as3722_i2c_probe(struct i2c_client *i2c,
>  	struct as3722 *as3722;
>  	unsigned long irq_flags;
>  	int ret;
> +	u8 val = 0;
>  
>  	as3722 = devm_kzalloc(&i2c->dev, sizeof(struct as3722), GFP_KERNEL);
>  	if (!as3722)
> @@ -398,6 +401,15 @@ static int as3722_i2c_probe(struct i2c_client *i2c,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (as3722->en_ac_ok_pwr_on)
> +		val = AS3722_CTRL_SEQU1_AC_OK_PWR_ON;
> +	ret = as3722_update_bits(as3722, AS3722_CTRL_SEQU1_REG,
> +			AS3722_CTRL_SEQU1_AC_OK_PWR_ON, val);

What is the default value?

If 0, you could place all of this code inside the "if
(as3722->en_ac_ok_pwr_on)" and save on a few unnecessary cycles.

> +	if (ret < 0) {
> +		dev_err(as3722->dev, "CTRLsequ1 update failed: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = devm_mfd_add_devices(&i2c->dev, -1, as3722_devs,
>  				   ARRAY_SIZE(as3722_devs), NULL, 0,
>  				   regmap_irq_get_domain(as3722->irq_data));
> diff --git a/include/linux/mfd/as3722.h b/include/linux/mfd/as3722.h
> index 51e6f9414575..b404a5af9bba 100644
> --- a/include/linux/mfd/as3722.h
> +++ b/include/linux/mfd/as3722.h
> @@ -296,6 +296,8 @@
>  #define AS3722_ADC1_CONV_NOTREADY			BIT(7)
>  #define AS3722_ADC1_SOURCE_SELECT_MASK			0x1F
>  
> +#define AS3722_CTRL_SEQU1_AC_OK_PWR_ON			BIT(0)
> +
>  /* GPIO modes */
>  #define AS3722_GPIO_MODE_MASK				0x07
>  #define AS3722_GPIO_MODE_INPUT				0x00
> @@ -391,6 +393,7 @@ struct as3722 {
>  	unsigned long irq_flags;
>  	bool en_intern_int_pullup;
>  	bool en_intern_i2c_pullup;
> +	bool en_ac_ok_pwr_on;
>  	struct regmap_irq_chip_data *irq_data;
>  };
>  

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
