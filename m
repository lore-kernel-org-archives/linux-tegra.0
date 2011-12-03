From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ASoC: WM8903: Get default irq_active_low from IRQ
 controller
Date: Sat, 3 Dec 2011 11:17:14 +0000
Message-ID: <20111203111713.GC6043@opensource.wolfsonmicro.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
 <1322863721-29793-5-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322863721-29793-5-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 02, 2011 at 03:08:40PM -0700, Stephen Warren wrote:

> +	switch (irqd_get_trigger_type(irq_data)) {
> +	case IRQ_TYPE_NONE:
> +		/*
> +		* We assume the controller imposes no restrictions,
> +		* so we are able to select active-high
> +		*/
> +		/* Fall-through */
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		pdata->irq_active_low = false;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		pdata->irq_active_low = true;
> +		break;
> +	default:
> +		dev_err(&i2c->dev,
> +			"Unsupported IRQ_TYPE %x\n",
> +			irqd_get_trigger_type(irq_data));
> +		return -EINVAL;

Actually, it occurs to me that we should treat the default case in the
same way as IRQ_TYPE_NONE - even if the interrupt controller defaults to
an edge triggered mode which we can't use it might also support a level
triggered interrupt we can use.  If it doesn't then we'll just fail
later on when we request the IRQ so the end result should be the same.

Don't worry about respinning for this unless the series needs to get
resent for some other reason let's just fix it incrementally (I'll do
that myself when I apply unless you want to).
