From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC 3/3] ARM:Tegra: Device Tree Support: Initialize from wm8903
 the device tree
Date: Thu, 12 May 2011 09:49:19 +0200
Message-ID: <20110512074917.GA16250@opensource.wolfsonmicro.com>
References: <20110511231905.10362.12844.stgit@riker>
 <20110511232711.10362.53256.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110511232711.10362.53256.stgit@riker>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 11, 2011 at 04:27:18PM -0700, John Bonesio wrote:
> This patch makes it so the wm8903 is initialized from it's device tree node.
> 
> Signed-off-by: John Bonesio<bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
> 
>  arch/arm/boot/dts/tegra-harmony.dts |   17 ++++++
>  sound/soc/codecs/wm8903.c           |   93 +++++++++++++++++++++++++++++++++--

This needs to be sent separately to the relevant mailing lists and
maintainers.  You can't go making substantial changes to drivers without
even telling the maintainers about it - this will apply to any device
tree work you're doing.  In this case one of the maintainers happens to
be me, but even so.

> +			interrupts = < 347 >;
> +			irq-active-low = <0>;
> +			micdet-cfg = <0>;
> +			micdet-delay = <100>;

Some of this looks like chip default, why is it being configured?

> +                       gpio-controller;
> +                       #gpio-cells = <2>;

The fact that this device is a GPIO controller is a physical property of
the device, we shouldn't need to be putting it into the device tree.

> +			gpio-num-cfg = < 5 >;

Similarly here, the device has a fixed number of GPIOs.

> +			/* #define WM8903_GPIO_NO_CONFIG 0x8000 */
> +			gpio-cfg = < 0x8000 0x8000 0 0x8000 0x8000 >;

This doesn't seem great for usability.  I'd suggest key/value pairs
rather than an array.

> -	if (pdata && pdata->gpio_base)
> +	wm8903->gpio_chip.base = -1;
> +	if (pdata && pdata->gpio_base) {
>  		wm8903->gpio_chip.base = pdata->gpio_base;
> -	else
> -		wm8903->gpio_chip.base = -1;
> +	} else if (codec->dev->of_node) {
> +		prop = of_get_property(codec->dev->of_node, "gpio-base", NULL);
> +		if (prop)
> +			wm8903->gpio_chip.base = be32_to_cpup(prop);
> +	}

We have to do manual endianness conversions to read from the device
tree?  Oh, well.

> +
> +		prop = of_get_property(codec->dev->of_node, "interrupts", NULL);
> +		if (prop)
> +			wm8903->irq = be32_to_cpup(prop);
> +

We have a standard way of passing the IRQ number to I2C devices, surely
we should make sure that works at the bus level rather than having to
replicate this code everywhere?

> +		prop = of_get_property(codec->dev->of_node, "micdet-cfg", NULL);
> +		if (prop)
> +			micdet_cfg = be32_to_cpup(prop);
> +
> +		snd_soc_write(codec, WM8903_MIC_BIAS_CONTROL_0, micdet_cfg);
> +
> +		if (micdet_cfg)
> +			snd_soc_update_bits(codec, WM8903_WRITE_SEQUENCER_0,
> +					    WM8903_WSEQ_ENA, WM8903_WSEQ_ENA);
> +		
> +		/* If microphone detection is enabled in device tree but
> +		 * detected via IRQ then interrupts can be lost before
> +		 * the machine driver has set up microphone detection
> +		 * IRQs as the IRQs are clear on read.  The detection
> +		 * will be enabled when the machine driver configures.
> +		 */
> +		WARN_ON(!mic_gpio && (micdet_cfg & WM8903_MICDET_ENA));
> +

There's an awful lot of cut'n'paste code for the parsing code from the
platform data code.

>  config SND_TEGRA_SOC_HARMONY
>  	tristate "SoC Audio support for Tegra Harmony reference board"
> -	depends on SND_TEGRA_SOC && MACH_HARMONY && I2C
> +	depends on SND_TEGRA_SOC && (MACH_HARMONY || MACH_TEGRA_DT) && I2C

You've not added anything to the device tree to register the platform
device for the machine and I rather fear this won't apply to current
code.  You should develop against -next.
