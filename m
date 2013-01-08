From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ASoC: tegra: add tegra machine driver using
 wm9712 codec
Date: Tue, 08 Jan 2013 23:52:33 +0100
Message-ID: <1357685553.2884.33.camel@astat>
References: <1357348725-32139-1-git-send-email-dev@lynxeye.de>
	 <1357348725-32139-4-git-send-email-dev@lynxeye.de>
	 <50EC9B01.6010203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50EC9B01.6010203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 08.01.2013, 15:17 -0700 schrieb Stephen Warren:
> On 01/04/2013 06:18 PM, Lucas Stach wrote:
> > This adds a very simple machine driver using the Wolfson wm9712 AC97
> > codec.
> 
> > diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
> 
> 
> > +static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
> 
> > +	err = snd_soc_dapm_sync(dapm);
> > +	if (err)
> > +		return err;
> > +
> > +	return 0;
> 
> That block is just "return snd_soc_dapm_sync(dapm);"
> 
> > +static int tegra_wm9712_driver_probe(struct platform_device *pdev)
> 
> > +	machine->codec = platform_device_alloc("wm9712-codec", -1);
> 
> Hmmm. I thought that could be auto-instantiated based on probing the
> AC'97 bus for whatever was there?
AC97 is in principle probeable by reading the first regs of the codec,
but all the infrastructure to do proper hotplugging on the AC97 bus is
missing in the kernel. As I didn't want to be the one to add all this
infrastructure to a dying audio platform, I opted to do the same thing
as all the other platform using AC97 and instantiate the codec from the
machine driver.

This binds machine driver and codec together, but after all the machine
driver is already both pretty small and codec specific. So considering
the number of Tegra platform out there using AC97 I figured it's not
worth the hassle trying to write a generic machine driver.
> 
> > +	ret = platform_device_add(machine->codec);
> > +	if (ret)
> > +		goto codec_put;
> 
> After this point, ...
> 
> > +	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
> > +	if (ret)
> > +		goto codec_put;
> 
> don't the error paths need to undo platform_device_add()? Or does
> platform_device_put() do that automatically?
> 
Yep, I've just gone through the implementation of those platform
functions and at some point we reverse the device_add. I'll fix this up.
> > +codec_put:
> > +	platform_device_put(machine->codec);
> > +	return ret;
> > +}
> 
> > +static int tegra_wm9712_driver_remove(struct platform_device *pdev)
> 
> > +	platform_device_put(machine->codec);
> 
> Same comment here.
> 
