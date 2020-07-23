From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 19/23] memory: omap-gpmc: Enclose macro statements in do-while
Date: Thu, 23 Jul 2020 11:09:40 +0200
Message-ID: <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-20-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200723073744.13400-20-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SoC Team <soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-omap <linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>"open list:TEGRA ARCHITECTURE SUPPORT" <li>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> do-while is a preferred way for complex macros because of safety
> reasons.  This fixes checkpatch error:
>
>     ERROR: Macros starting with if should be enclosed by a do - while
>         loop to avoid possible if/else logic defects
>
> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This is an improvement, but the macro still has other issues that
are just as bad as the one you address:

- Using the # operator to avoid the "" in the invocation seems confusing
- it implicitly uses the 'cs' and 't' variables of the calling function instead
  of passing them as arguments.
- it calls 'return -1' in a function that otherwise uses errno-style
  return codes, so this gets interpreted as EPERM "Operation not
  permitted".

I would probably just open-code the entire thing and remove the
macro like:

ret = 0;
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  0,  3, 0, t->cs_on,
GPMC_CD_FCLK, "cs_on");
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  8,  12, 0,
t->cs_rd_off, GPMC_CD_FCLK, "cs_rd_off");
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  16,  20, 0,
t->cs_wr_off, GPMC_CD_FCLK, "cs_wr_off);
...
if (ret)
     return -ENXIO;

Of maybe leave the macro, but remove the if/return part and use
the "ret |= GPMC_SET_ONE(...)" trick to avoid some of the problems.

      Arnd
