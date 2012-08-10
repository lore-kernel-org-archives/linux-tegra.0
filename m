From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: How to get the irq flags from the dts file
Date: Fri, 10 Aug 2012 17:11:56 +0800
Message-ID: <1344589916.21467.1.camel@tegra-chromium-2>
References: <1344509006.2295.148.camel@tegra-chromium-2>
	 <201208091148.42748.arnd@arndb.de>  <20120809120530.GC8474@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120809120530.GC8474-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "frankyl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <frankyl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2012-08-09 at 20:05 +0800, Mark Brown wrote:
> On Thu, Aug 09, 2012 at 11:48:42AM +0000, Arnd Bergmann wrote:
> > On Thursday 09 August 2012, Wei Ni wrote:
> 
> > > The wlan driver wish this flags include the IRQF_TRGGER_* information,
> > > and it will use this flags to configure other hw settings. If it is
> > > wrong, the wlan can't work.
> 
> You can read the configuration with irqd_get_trigger_type() - see the OF
> code in sound/soc/codecs/wm8903.c for an example.

I tried it, it worked fine. thanks for your help.

> 
> > The driver should not need to know about thie flag. It gets read
> > by irq_create_of_mapping when calling teh xlate function and
> > gets set using irq_set_irq_type from there too.
> 
> That only helps the interrupt controller, it doesn't help the interrupt
> source.  A good proportion of embedded devices have a great deal of
> flexibility in how they signal interrupts so they need to know what mode
> to pick.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
