From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/5] char: tile-srom: Remove reference to platform_bus
Date: Tue, 5 Aug 2014 16:06:54 -0700
Message-ID: <20140805230654.GA24614@kroah.com>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>
 <1406298233-27876-2-git-send-email-pawel.moll@arm.com>
 <53DAA605.2030500@tilera.com>
 <1406913678.22529.46.camel@hornet>
 <53E139C8.9000502@tilera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53E139C8.9000502-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 05, 2014 at 04:08:40PM -0400, Chris Metcalf wrote:
> On 8/1/2014 1:21 PM, Pawel Moll wrote:
> >On Thu, 2014-07-31 at 21:24 +0100, Chris Metcalf wrote:
> >>On 7/25/2014 10:23 AM, Pawel Moll wrote:
> >>>The code was creating "srom" class devices using
> >>>platform_bus as a parent. As they are not really
> >>>platform devices, make them virtual, using NULL instead.
> >>>
> >>>Cc: Chris Metcalf<cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
> >>>Signed-off-by: Pawel Moll<pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >>>---
> >>>   drivers/char/tile-srom.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>Can you clarify the point of this change a bit?
> >Theoretically speaking there shouldn't be any need to export the
> >platform bus root, as all devices should be registered via the platform
> >API (platform_device_register & co.)
> 
> So, perhaps the right fix is to just use platform_device_register()
> etc for this device, rather than making it virtual?

Sure, that's fine with me if you want to make it a platform device, but
note that a platform device doesn't have a minor associated with it, you
will have to still have your existing srom_class and the rest.  Right
now you aren't creating any real "devices" in the kernel, other than the
one you use for your minor number, which is not a "real" device.

struct srom_dev should be a platform device and then this will get
"easier" overall, sorry I missed that when the original code was
submitted.

thanks,

greg k-h
