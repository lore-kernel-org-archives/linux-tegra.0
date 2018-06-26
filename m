From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] mfd: as3722: disable auto power on when AC OK
Date: Tue, 26 Jun 2018 10:04:41 +0200
Message-ID: <9502dfa3fae42471ddedf05499876177@agner.ch>
References: <20180625080013.32157-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180625080013.32157-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 25.06.2018 10:00, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> On ams AS3722, power on when AC OK is enabled by default.
> Making this option as disable by default and enable only
> when platform need this explicitly.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Bibek Basu <bbasu@nvidia.com>
> Tested-by: Bibek Basu <bbasu@nvidia.com>
> Downsteam commit 09cd706fecb9 ("mfd: as3722: disable auto power on when
> AC OK").
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  drivers/mfd/as3722.c       | 12 ++++++++++++
>  include/linux/mfd/as3722.h |  3 +++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
> index f87342c211bc..215465c97759 100644
> --- a/drivers/mfd/as3722.c
> +++ b/drivers/mfd/as3722.c
> @@ -349,6 +349,8 @@ static int as3722_i2c_of_probe(struct i2c_client *i2c,
>  					"ams,enable-internal-int-pullup");
>  	as3722->en_intern_i2c_pullup = of_property_read_bool(np,
>  					"ams,enable-internal-i2c-pullup");
> +	as3722->en_ac_ok_pwr_on = of_property_read_bool(np,
> +					"ams,enable-ac-ok-power-on");

This property should be added to
Documentation/devicetree/bindings/mfd/as3722.txt.

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
> +		val = AS3722_CTRL_SEQ1_AC_OK_PWR_ON;

Nit: Use SEQU1 instead of SEQ1 since that is how the register is named.

--
Stefan

> +	ret = as3722_update_bits(as3722, AS3722_CTRL_SEQU1_REG,
> +			AS3722_CTRL_SEQ1_AC_OK_PWR_ON, val);
> +	if (ret < 0) {
> +		dev_err(as3722->dev, "CTRL_SEQ1 update failed: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = devm_mfd_add_devices(&i2c->dev, -1, as3722_devs,
>  				   ARRAY_SIZE(as3722_devs), NULL, 0,
>  				   regmap_irq_get_domain(as3722->irq_data));
> diff --git a/include/linux/mfd/as3722.h b/include/linux/mfd/as3722.h
> index 51e6f9414575..8841b9896033 100644
> --- a/include/linux/mfd/as3722.h
> +++ b/include/linux/mfd/as3722.h
> @@ -296,6 +296,8 @@
>  #define AS3722_ADC1_CONV_NOTREADY			BIT(7)
>  #define AS3722_ADC1_SOURCE_SELECT_MASK			0x1F
>  
> +#define AS3722_CTRL_SEQ1_AC_OK_PWR_ON			BIT(0)
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
