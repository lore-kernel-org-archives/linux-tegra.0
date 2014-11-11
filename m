From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: serial: of-serial: fetch line number from DT
Date: Tue, 11 Nov 2014 11:37:39 +0100
Message-ID: <1415702259.2815.1.camel@pengutronix.de>
References: <CAOesGMjzs=dThDv6S8Xvo+ym-XECaQhTQ8NV6t46fQZ1LoJnHw@mail.gmail.com>
	 <54613065.1090300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54613065.1090300-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 10.11.2014, 14:38 -0700 schrieb Stephen Warren:
> On 11/10/2014 02:34 PM, Olof Johansson wrote:
> > Greg,
> >
> > This commit:
> >
> > commit 1bd8324535ec1ff44aef55c0e40b9e7d56b310fb
> > Author: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> > Date:   Mon Nov 3 23:16:54 2014 +0100
> >
> >      serial: of-serial: fetch line number from DT
> ...
> > Broke a whole lot of tegra boards in last night's -next here. In
> > particular, I've been looking at tegra20-seaboard, which now doesn't
> > boot with console any more.
> >
> > http://arm-soc.lixom.net/bootlogs/next/next-20141110/
> >
> > Unfortunately, tegra has for a long time been specifying the aliases
> > as a fixed 1:1 mapping, but most environments rely on ttyS0 being the
> > first _activated_ serial port. That's obviously going to break things
> > here. :(
> ...
> > Stephen: I suppose the best way to handle this on tegra is to specify
> > the aliases per-board instead of in the soc dtsi today.
> 
> IIRC, there was a deliberate request to name the Tegra UARTs after the 
> SoC ports rather than board ports, so that it'd be obvious to people 
> which port was which. I'm not sure if we can change the aliases in the 
> Tegra DTs now that people may have got used to them?
> 
First off: sorry for breaking stuff.

The point of this patch was exactly to have a common naming scheme
between bootloader and and kernel. The aliases provide this in a broadly
recognized way.
Relying on the fact that ttyS0 maps to the debug UART seems extremely
fragile and the fact that this patch broke this assumption actually
proves this.

IMHO it is a bug in U-Boot that it doesn't look at the aliases when it
builds the console= kernel parameter. But I recognize the problem that
this change introduces a non-backward compatible break between firmware
and kernel and I don't yet see a nice solution for this.

Regards,
Lucas

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
