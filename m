From: Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/5] char: tile-srom: Remove reference to platform_bus
Date: Thu, 31 Jul 2014 16:24:37 -0400
Message-ID: <53DAA605.2030500@tilera.com>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com> <1406298233-27876-2-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406298233-27876-2-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 7/25/2014 10:23 AM, Pawel Moll wrote:
> The code was creating "srom" class devices using
> platform_bus as a parent. As they are not really
> platform devices, make them virtual, using NULL instead.
>
> Cc: Chris Metcalf<cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Pawel Moll<pawel.moll-5wv7dgnIgG8@public.gmane.org>
> ---
>   drivers/char/tile-srom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Can you clarify the point of this change a bit?  The SROM devices
in question are real devices (bits of silicon on the processor die), not
some kind of virtual construct.  In addition, we also have user binaries
in the wild that know to look for /sys/devices/platform/srom/ paths,
so I'm pretty reluctant to change this path without good reason.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
