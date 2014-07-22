From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] platform: Make platform_bus device a platform device
Date: Tue, 22 Jul 2014 18:30:06 +0100
Message-ID: <1406050206.25343.87.camel@hornet>
References: <20140721184007.GB572@kroah.com>
	 <1406023327-18525-1-git-send-email-pawel.moll@arm.com>
	 <20140722171013.GA6605@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140722171013.GA6605-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2014-07-22 at 18:10 +0100, Greg Kroah-Hartman wrote:
> On Tue, Jul 22, 2014 at 11:02:07AM +0100, Pawel Moll wrote:
> > ... describing the root of the device tree, so one can write
> > a platform driver initializing the platform.
> > 
> > All references to platform_bus device have been fixed up,
> > although in most cases they could be simply removed or
> > replaced by NULL (platform devices with no parent are adopted
> > by main platform_bus device automagically).
> 
> In looking at this some more, I think all of these should be made NULL,
> why are we exporting this symbol at all?

I think there are about 3 non-obvious uses of it, which would probably
need looking into. All other ones that simply do of_platform_populate()
or platform_device_register*() with platform_bus as a parent, which has
exactly the same effect as it was NULL.

I can imagine situations where one would want to walk the device
hierarchy stopping at platform_bus, how I'm not sure how "legitimate"
that would be.

I'll post v3 with NULLs where I think it is enough so we can see the
other cases.

Pawel
