From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] arm: rpi: Device tree modifications for U-Boot
Date: Tue, 11 Aug 2015 21:38:38 +0200
Message-ID: <1439321918.2214.6.camel@lynxeye.de>
References: <1439303153-12171-1-git-send-email-sjg@chromium.org>
	 <1439312701.2451.3.camel@lynxeye.de> <55CA3113.1010601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55CA3113.1010601-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 11.08.2015, 11:29 -0600 schrieb Stephen Warren:
> On 08/11/2015 11:05 AM, Lucas Stach wrote:
> > Hi Simon,
> >
> > why did you send this to the Tegra ML?
> 
> At my request, so that the DT changes could be reviewed by the kernel DT 
> reviewers and added to the copy of the DT files in the kernel source 
> tree if approved.
> 
This doesn't really answer the question why it was sent to the Tegra
list if it is an RPi change, but that's just a side note.

> My assertion is that DT content should be independent of SW stack. Or 
> put another way, all SW stacks should use the same DT content. As such, 
> if these properties are needed by U-Boot, and contained in the copy of 
> the DT files in the U-Boot source tree, they should also be present in 
> the copy of the DT files in the kernel source tree, so the two do not 
> become out of sync.
> 
I agree with that overall goal to have a common DT base between
different software stacks. After all I lobbied for keeping the Tegra
pinctrl setting in the DT even though Linux doesn't use them any more.

For my question below I honestly want an answer as to why U-Boot needs
those DT changes and why it can't work with the current DT contents.
It's really just the same question we also have to answer for each and
every DT addition that we do for Linux.

Regards,
Lucas

> > Am Dienstag, den 11.08.2015, 08:25 -0600 schrieb Simon Glass:
> >> This updates the device tree from the kernel version to something suitable
> >> for U-Boot:
> >>
> >> - Add stdout-path alias for console
> >> - Mark the /soc node to be available pre-relocation so that the early
> >> serial console works (we need the 'ranges' property to be available)
> 
> >> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> >> index 301c73f..bd6bff6 100644
> >> --- a/arch/arm/boot/dts/bcm2835.dtsi
> >> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> >> @@ -8,6 +8,7 @@
> >>
> >>   	chosen {
> >>   		bootargs = "earlyprintk console=ttyAMA0";
> >> +		stdout-path = &uart;
> >>   	};
> >>
> >>   	soc {
> >> @@ -16,6 +17,7 @@
> >>   		#size-cells = <1>;
> >>   		ranges = <0x7e000000 0x20000000 0x02000000>;
> >>   		dma-ranges = <0x40000000 0x00000000 0x20000000>;
> >> +		u-boot,dm-pre-reloc;
> >
> > Why do you need this and why should upstream carry your favourite
> > bootloaders configuration? This is in no way hardware description.
> 
> 
