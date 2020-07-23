From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
Date: Thu, 23 Jul 2020 12:01:36 +0200
Message-ID: <20200723100136.GB30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-15-krzk@kernel.org>
 <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
 <20200723090230.GB25935@kozik-lap>
 <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SoC Team <soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-omap <linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>"open list:TEGRA ARCHITECTURE SUPPORT" <li>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 11:14:02AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 11:02 AM Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, Jul 23, 2020 at 10:48:19AM +0200, Arnd Bergmann wrote:
> > > On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > > >
> > > > Cast pointer to iomem memory properly to fix sparse warning:
> > > >
> > > >     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
> > > >     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
> > > >     drivers/memory/ti-emif-pm.c:251:38:    got void *
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > ---
> > > >  drivers/memory/ti-emif-pm.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> > > > index 9c90f815ad3a..6c747c1e98cb 100644
> > > > --- a/drivers/memory/ti-emif-pm.c
> > > > +++ b/drivers/memory/ti-emif-pm.c
> > > > @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
> > > >  static int ti_emif_resume(struct device *dev)
> > > >  {
> > > >         unsigned long tmp =
> > > > -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> > > > +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
> > > >
> > >
> > > Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?
> >
> > Won't readl() be enough? Indeed it looks problematic.
> 
> readl() won't work on big-endian kernels, since this is a byte comparison.

Ah, right.

> 
> > > The other accesses in this file don't use MMIO wrappers either but just treat
> > > it as a pointer. The effect would be the same though.
> >
> > I think all the reads and writes are with readl() and writel().
> 
> I actually see only one other access:
> 
>         copy_addr = sram_exec_copy(emif_data->sram_pool_code,
>                                    (void *)emif_data->ti_emif_sram_virt,
>                                    &ti_emif_sram, ti_emif_sram_sz);
> 
> and this one ends up in a memcpy() that does not perform any byte
> swapping or barriers.

At least the barrier would come through mutex in sram_exec_copy() and
later spin locks for page table manipulation.

Anyway, I do not have the HW to test the changes or to confirm whether
this is real issue.  I guess the driver author/owner should follow up on
this report.

Best regards,
Krzysztof
