From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ASoC: Add device tree binding for WM8903
Date: Thu, 1 Dec 2011 08:46:35 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDB01D8@HQMAIL01.nvidia.com>
References: <1322700455-26916-1-git-send-email-swarren@nvidia.com>
 <20111201132559.GG2915@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111201132559.GG2915-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Thursday, December 01, 2011 6:26 AM:
> On Wed, Nov 30, 2011 at 05:47:35PM -0700, Stephen Warren wrote:
> 
> > v2: (swarren) Significantly reworked based on review feedback.
> > v1: (swarren) Applied the following modifications relative to John's code:
> > * Cleaned up DT parsing code
> > * Documented DT binding
> > * Set up wm8903->gpio_chip.of_node, extracted from another patch by John.
> 
> Don't put stuff like this in the changelog.  "Significantly reworked"
> isn't going to help anyone reading the logs...

Sorry, I forgot to move it this time.

> > @@ -1931,18 +1942,65 @@ static int wm8903_probe(struct snd_soc_codec *codec)
> >
> >  	wm8903_reset(codec);
> >
> > -	/* Set up GPIOs and microphone detection */
> > +	/* Get configuration from platform data, or device tree */
> >  	if (pdata) {
> > -		bool mic_gpio = false;
> > +		have_pdata = true;
> > +		gpio_base = pdata->gpio_base;
> > +		irq_active_low = pdata->irq_active_low;
> > +		micdet_cfg = pdata->micdet_cfg;
> > +		wm8903->mic_delay = pdata->micdet_delay;
> > +		gpio_cfg = &pdata->gpio_cfg[0];
> > +	} else if (codec->dev->of_node) {
> > +		have_pdata = true;
> 
> This all seems really complicated and invasive, especially the
> have_pdata flag.  Why not just always have a platform data structure and
> fill it in from the device tree?

The first patch set did that, and you objected to how it was structured...

> > +		if (wm8903->irq) {
> > +			irq_data = irq_get_irq_data(wm8903->irq);
> > +			if (!irq_data) {
> > +				dev_err(codec->dev, "Invalid IRQ: %d\n",
> > +					wm8903->irq);
> > +				return -EINVAL;
> > +			}
> > +			trigger = irqd_get_trigger_type(irq_data);
> > +			switch (trigger) {
> > +			case IRQ_TYPE_NONE:
> > +			case IRQ_TYPE_LEVEL_HIGH:
> > +				irq_active_low = false;
> > +				break;
> > +			case IRQ_TYPE_LEVEL_LOW:
> > +				irq_active_low = true;
> > +				break;
> > +			default:
> > +				dev_err(codec->dev,
> > +					"Unsupported IRQ trigger: %x\n",
> > +					trigger);
> > +				return -EINVAL;
> > +			}
> > +		}
> 
> This stuff isn't device tree specific.

OK, I could remove the platform data's irq_active_low flag, and determine
the IRQ polarity this way in all cases. Do you want that? I avoided doing
it this time around since it'd affect non-device-tree users of the codec
too, and I aimed for complete backwards compatibility (although that said,
the only in-tree user is the Tegra machines, and they don't set this flag,
so the impact would be minimal in-tree)

> > +#ifdef CONFIG_OF
> > +/* Match table for of_platform binding */
> > +static const struct of_device_id wm8903_of_match[] __devinitconst = {
> > +	{ .compatible = "wlf,wm8903", },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, wm8903_of_match);
> > +#else
> > +#define wm8903_of_match NULL
> > +#endif
> 
> If you're going to do this then go through and consistently add the
> defines.  I'd also be inclined to drop the comment.

I'll just drop the ifdefs; looking at all the other codecs, they don't
have ifdefs anyway - I thought I added the ifdefs to be consistent, but
I must have checked something other than ASoC codecs...

-- 
nvpublic
