From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Thu, 17 Jul 2014 10:31:50 +0100
Message-ID: <20140717093149.GB3180@arm.com>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53AEF81D.3080408@ti.com>
 <20140628204025.GA16415@ulmo>
 <7497427.LQy8pJts8f@wuerfel>
 <CAOesGMjgNZ0hvWy0p1fh36gOMfBVd-uJSf=AWUsr9GdrrErtyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjgNZ0hvWy0p1fh36gOMfBVd-uJSf=AWUsr9GdrrErtyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 16, 2014 at 08:31:00PM +0100, Olof Johansson wrote:
> [ Gee, I had completely missed this thread because nobody bothered to
> cc me. Seems to be standard procedure on 64-bit these days. :( ]

Just to clarify this point, as per prior agreement I'm expecting the
arm-soc guys to help reviewing/merging arm64-soc as well, even though
there are no arch/arm64/{mach,plat}-* directories. That means that
arm-soc folks should also be cc'ed on such patches.

However, the "ARM SUB-ARCHITECTURES" MAINTAINERS entry does not mention
arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org (neither Olof nor Arnd). Was this not meant as an arm-soc
email alias?

-- 
Catalin
