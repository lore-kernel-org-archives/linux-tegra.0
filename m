From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 4/5] ASoC: WM8903: Get default irq_active_low from
 IRQ controller
Date: Mon, 5 Dec 2011 08:52:19 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1750B77016@HQMAIL01.nvidia.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
 <1322863721-29793-5-git-send-email-swarren@nvidia.com>
 <20111203111713.GC6043@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111203111713.GC6043-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Saturday, December 03, 2011 4:17 AM:
> On Fri, Dec 02, 2011 at 03:08:40PM -0700, Stephen Warren wrote:
> 
> > +	switch (irqd_get_trigger_type(irq_data)) {
> > +	case IRQ_TYPE_NONE:
> > +		/*
> > +		* We assume the controller imposes no restrictions,
> > +		* so we are able to select active-high
> > +		*/
> > +		/* Fall-through */
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		pdata->irq_active_low = false;
> > +		break;
> > +	case IRQ_TYPE_LEVEL_LOW:
> > +		pdata->irq_active_low = true;
> > +		break;
> > +	default:
> > +		dev_err(&i2c->dev,
> > +			"Unsupported IRQ_TYPE %x\n",
> > +			irqd_get_trigger_type(irq_data));
> > +		return -EINVAL;
> 
> Actually, it occurs to me that we should treat the default case in the
> same way as IRQ_TYPE_NONE - even if the interrupt controller defaults to
> an edge triggered mode which we can't use it might also support a level
> triggered interrupt we can use.  If it doesn't then we'll just fail
> later on when we request the IRQ so the end result should be the same.

Yes, deferring the failure to later seems reasonable; it's probably better
to work somehow if the HW supports it rather than being anal about e.g.
incorrect device tree content.

> Don't worry about respinning for this unless the series needs to get
> resent for some other reason let's just fix it incrementally (I'll do
> that myself when I apply unless you want to).

I'm fine if you change that when applying it.

Thanks.

-- 
nvpublic
