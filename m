From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 00/23] memory: Cleanup, improve and compile test
 memory drivers
Date: Thu, 23 Jul 2020 11:52:09 +0200
Message-ID: <20200723095209.GA30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SoC Team <soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-omap <linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>"open list:TEGRA ARCHITECTURE SUPPORT" <li>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 11:31:02AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:37 AM Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > Dear All,
> >
> > The drivers/memory directory contains generic code (of_memory.c) and a
> > bunch of drivers.  Changes to generic code were coming usually through
> > different trees with the driver code.
> >
> > Over last days, memory drivers grew in numbers but not necessarily in
> > quality.  They lacked compile testing and code cleanup.  Also lacked
> > maintainer.
> >
> > I would be happy to take care about this part.
> >
> > If there are no objections, the patches could go either to Linus or to
> > arm-soc (most of drivers are ARM specific).
> >
> > Driver-specific changes in the patchset were only compile-tested. Tests
> > are welcome. The generic code was tested on ARMv7 Exynos based boards
> > with a exynos5422-dmc memory controller driver.
> 
> Overall this looks great, I had a look through the patches and commented
> on the few things that seemed slightly odd though harmless.
> 
> Thanks for picking up the subsystem. How do you want to proceed
> in the long run? I suppose you can send a pull request to soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> to be picked up for the coming merge window as the normal way, since
> you are not yet listed as the maintained until the end of the series.
> 
> Afterwards you could either send the pull requests to Linus directly,
> or send them to the soc team (or to Greg) as well, the way we handle
> a couple of other subsystems like drivers/reset and drivers/tee that
> usually only have a handful of patches per release.

Most of the drivers are for ARM architecture so arm-soc seems like the
way to do it.  However BT1_L2_CTL and JZ4780_NEMC are MIPS specific and
maybe more would come in the future.  Are you fine taking them as well?

Best regards,
Krzysztof
