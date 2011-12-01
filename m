From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: Add device tree binding for WM8903
Date: Thu, 1 Dec 2011 13:26:00 +0000
Message-ID: <20111201132559.GG2915@opensource.wolfsonmicro.com>
References: <1322700455-26916-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322700455-26916-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 30, 2011 at 05:47:35PM -0700, Stephen Warren wrote:

> v2: (swarren) Significantly reworked based on review feedback.
> v1: (swarren) Applied the following modifications relative to John's code:
> * Cleaned up DT parsing code
> * Documented DT binding
> * Set up wm8903->gpio_chip.of_node, extracted from another patch by John.

Don't put stuff like this in the changelog.  "Significantly reworked"
isn't going to help anyone reading the logs...

> +	micdet-cfg = <0>;
> +	micdet-delay = <100>;
> +	gpio-cfg = < 0xffffffff 0xffffffff 0 0xffffffff 0xffffffff >;

Better to have sane examples for gpio-cfg.

> -static void wm8903_init_gpio(struct snd_soc_codec *codec)
> +static void wm8903_init_gpio(struct snd_soc_codec *codec,
> +			     int gpio_base)
>  {

Can you do this restructuring separately please?  The diff is *much*
larger than I'd expect and stuff liket his isn't helping.

> +#ifdef CONFIG_OF_GPIO
> +	wm8903->gpio_chip.of_node = codec->dev->of_node;
> +#endif

Ick, ifdefs mid code :(

>  
> @@ -1931,18 +1942,65 @@ static int wm8903_probe(struct snd_soc_codec *codec)
>  
>  	wm8903_reset(codec);
>  
> -	/* Set up GPIOs and microphone detection */
> +	/* Get configuration from platform data, or device tree */
>  	if (pdata) {
> -		bool mic_gpio = false;
> +		have_pdata = true;
> +		gpio_base = pdata->gpio_base;
> +		irq_active_low = pdata->irq_active_low;
> +		micdet_cfg = pdata->micdet_cfg;
> +		wm8903->mic_delay = pdata->micdet_delay;
> +		gpio_cfg = &pdata->gpio_cfg[0];
> +	} else if (codec->dev->of_node) {
> +		have_pdata = true;

This all seems really complicated and invasive, especially the
have_pdata flag.  Why not just always have a platform data structure and
fill it in from the device tree?

> +		if (wm8903->irq) {
> +			irq_data = irq_get_irq_data(wm8903->irq);
> +			if (!irq_data) {
> +				dev_err(codec->dev, "Invalid IRQ: %d\n",
> +					wm8903->irq);
> +				return -EINVAL;
> +			}
> +			trigger = irqd_get_trigger_type(irq_data);
> +			switch (trigger) {
> +			case IRQ_TYPE_NONE:
> +			case IRQ_TYPE_LEVEL_HIGH:
> +				irq_active_low = false;
> +				break;
> +			case IRQ_TYPE_LEVEL_LOW:
> +				irq_active_low = true;
> +				break;
> +			default:
> +				dev_err(codec->dev,
> +					"Unsupported IRQ trigger: %x\n",
> +					trigger);
> +				return -EINVAL;
> +			}
> +		}

This stuff isn't device tree specific.

> +	/* Set up GPIOs */
> +	if (gpio_cfg) {
> +		for (i = 0; i < WM8903_NUM_GPIO; i++) {
> +			if (gpio_cfg[i] > 0x7fff)
>  				continue;
>  
>  			snd_soc_write(codec, WM8903_GPIO_CONTROL_1 + i,
> -				      pdata->gpio_cfg[i] & 0xffff);
> +				      gpio_cfg[i] & 0x7fff);

This is a separate change to the semantics and should be split out.

> +#ifdef CONFIG_OF
> +/* Match table for of_platform binding */
> +static const struct of_device_id wm8903_of_match[] __devinitconst = {
> +	{ .compatible = "wlf,wm8903", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, wm8903_of_match);
> +#else
> +#define wm8903_of_match NULL
> +#endif

If you're going to do this then go through and consistently add the
defines.  I'd also be inclined to drop the comment.
