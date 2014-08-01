From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/5] char: tile-srom: Remove reference to platform_bus
Date: Fri, 01 Aug 2014 18:21:18 +0100
Message-ID: <1406913678.22529.46.camel@hornet>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>
	 <1406298233-27876-2-git-send-email-pawel.moll@arm.com>
	 <53DAA605.2030500@tilera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53DAA605.2030500-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2014-07-31 at 21:24 +0100, Chris Metcalf wrote:
> On 7/25/2014 10:23 AM, Pawel Moll wrote:
> > The code was creating "srom" class devices using
> > platform_bus as a parent. As they are not really
> > platform devices, make them virtual, using NULL instead.
> >
> > Cc: Chris Metcalf<cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Pawel Moll<pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > ---
> >   drivers/char/tile-srom.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Can you clarify the point of this change a bit? 

Theoretically speaking there shouldn't be any need to export the
platform bus root, as all devices should be registered via the platform
API (platform_device_register & co.)

>  The SROM devices
> in question are real devices (bits of silicon on the processor die), not
> some kind of virtual construct.  

... but the driver seems to be accessing then through hypervisor calls
only? One could say that you this make them virtual ;-)

> In addition, we also have user binaries
> in the wild that know to look for /sys/devices/platform/srom/ paths,
> so I'm pretty reluctant to change this path without good reason.

So what is the srom class for then if not for device discovery? And why
do they look for them in the first place? To get relevant character
device's data, if I understand it right?

Maybe you could just register a simple "proper" platform device for all
the sroms and then hang the class devices from it? I can type some code
doing this if it sound reasonably?

Pawel
