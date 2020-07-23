From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 19/23] memory: omap-gpmc: Enclose macro statements in
 do-while
Date: Thu, 23 Jul 2020 12:16:34 +0200
Message-ID: <20200723101634.GD30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-20-krzk@kernel.org>
 <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, linux-omap <linux-omap@vger.kernel.org>"open list:TEGRA ARCHITECTURE SUPPORT" <li>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 11:09:40AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > do-while is a preferred way for complex macros because of safety
> > reasons.  This fixes checkpatch error:
> >
> >     ERROR: Macros starting with if should be enclosed by a do - while
> >         loop to avoid possible if/else logic defects
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> This is an improvement, but the macro still has other issues that
> are just as bad as the one you address:
> 
> - Using the # operator to avoid the "" in the invocation seems confusing

I guess it was useful for debugging.

> - it implicitly uses the 'cs' and 't' variables of the calling function instead
>   of passing them as arguments.

Actually another reason to convert it to just a function.

> - it calls 'return -1' in a function that otherwise uses errno-style
>   return codes, so this gets interpreted as EPERM "Operation not
>   permitted".

The users of this macro also do it (gpmc_cs_set_timings()) so this
wrong practice is consistent with the driver. :)

> 
> I would probably just open-code the entire thing and remove the
> macro like:
> 
> ret = 0;
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  0,  3, 0, t->cs_on,
> GPMC_CD_FCLK, "cs_on");
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  8,  12, 0,
> t->cs_rd_off, GPMC_CD_FCLK, "cs_rd_off");
> ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  16,  20, 0,
> t->cs_wr_off, GPMC_CD_FCLK, "cs_wr_off);
> ...
> if (ret)
>      return -ENXIO;a

I like this approach because it also removes the 'return' from macro
which is not desired.

> 
> Of maybe leave the macro, but remove the if/return part and use
> the "ret |= GPMC_SET_ONE(...)" trick to avoid some of the problems.

I could probably then keep it as a function.  This would be the safest
and remove most of the problems here.

Best regards,
Krzysztof
