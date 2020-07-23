From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH 00/23] memory: Cleanup, improve and compile test
 memory drivers
Date: Thu, 23 Jul 2020 12:14:24 +0200
Message-ID: <CAK8P3a0g0k6e-STpqPS0S-wajxqS-M3DV+3UD=QFE7e-98J-og@mail.gmail.com>
References: <20200723073744.13400-1-krzk@kernel.org> <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
 <20200723095209.GA30472@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200723095209.GA30472@kozik-lap>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SoC Team <soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-omap <linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>"open list:TEGRA ARCHITECTURE SUPPORT" <li>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 11:52 AM Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jul 23, 2020 at 11:31:02AM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 23, 2020 at 9:37 AM Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > Afterwards you could either send the pull requests to Linus directly,
> > or send them to the soc team (or to Greg) as well, the way we handle
> > a couple of other subsystems like drivers/reset and drivers/tee that
> > usually only have a handful of patches per release.
>
> Most of the drivers are for ARM architecture so arm-soc seems like the
> way to do it.  However BT1_L2_CTL and JZ4780_NEMC are MIPS specific and
> maybe more would come in the future.  Are you fine taking them as well?

Yes, that's not a problem at all. Most other architectures are ramping down
anyway, both on the maintainership side and on newly supported hardware,
so we are picking those up where necessary. I also merged a couple of
drivers for the MIPS based Baikal SoCs recently.

     Arnd
