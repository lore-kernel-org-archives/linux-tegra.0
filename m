From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Mon, 17 Dec 2012 12:22:14 +0100
Message-ID: <1355743334.1490.7.camel@tellur>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>
	 <1355516086-11116-2-git-send-email-dev@lynxeye.de>
	 <50CEFD28.7080601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50CEFD28.7080601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

Am Montag, den 17.12.2012, 19:08 +0800 schrieb Mark Zhang:
> If my understanding is right, I think this is a temporary solution.
> Because this kind of requirement should be addressed by DVFS subsyste=
m.
>=20
Yes, this can go away, once proper DVFS is added. But maybe it can also
be an example of how things could be done there.

> Anyway, check the comments below.
>=20
> On 12/15/2012 04:14 AM, Lucas Stach wrote:
> > This allows memory clients to collaboratively control the EMC
> > performance.
> > Each client may set its performance demands. EMC driver then tries =
to
> > find a DRAM performance level which is able to statisfy all those
> > demands.
> >=20
> > Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> > ---
> >  arch/arm/mach-tegra/tegra2_emc.c       | 84 ++++++++++++++++++++++=
++++++++++--
> >  include/memory/tegra_emc_performance.h | 79 ++++++++++++++++++++++=
++++++++++
> >  2 Dateien ge=C3=A4ndert, 160 Zeilen hinzugef=C3=BCgt(+), 3 Zeilen =
entfernt(-)
> >  create mode 100644 include/memory/tegra_emc_performance.h
> >=20
> > diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra=
/tegra2_emc.c
> > index 837c7b9..d2cf7a1 100644
> > --- a/arch/arm/mach-tegra/tegra2_emc.c
> > +++ b/arch/arm/mach-tegra/tegra2_emc.c
> > @@ -15,6 +15,7 @@
> >   *
> >   */
> > =20
> > +#include <asm/div64.h>
> >  #include <linux/kernel.h>
> >  #include <linux/device.h>
> >  #include <linux/clk.h>
> > @@ -24,6 +25,8 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/platform_data/tegra_emc.h>
> > +#include <linux/types.h>
> > +#include <memory/tegra_emc_performance.h>
>=20
> Why don't you put this file into the directory which "tegra_emc.h"
> resides? I think that'll be easy to find and understand.
>=20
Because my understanding is that mach-tegra is not the right place for
include files that are used by normal drivers and not just the platform
code.

> > =20
> >  #include "tegra2_emc.h"
> >  #include "fuse.h"
> > @@ -35,8 +38,16 @@ static bool emc_enable;
> >  #endif
> >  module_param(emc_enable, bool, 0644);
> > =20
> > +struct emc_superclient_constraint {
> > +	int bandwidth;
> > +	enum tegra_emc_perf_level perf_level;
> > +};
> > +
> > +static struct emc_superclient_constraint constraints[TEGRA_EMC_SC_=
NUM];
> > +
> >  static struct platform_device *emc_pdev;
> >  static void __iomem *emc_regbase;
> > +static struct clk *emc_clk;
>=20
> Instead of using global variables, it's better to save it into a driv=
er
> private structure. Although this way is easy to write. :)
> I think when we start upstream works on DVFS, an emc driver private
> structure is needed so we can do this right now.
>=20
I can certainly do this. It will increase the churn of the patch a bit,
but I think your concern is valid and I'll address it in V2.

> > =20
> >  static inline void emc_writel(u32 val, unsigned long addr)
> >  {
> > @@ -176,6 +187,64 @@ int tegra_emc_set_rate(unsigned long rate)
> >  	return 0;
> >  }
> > =20
> > +static void tegra_emc_scale_clock(void)
> > +{
> > +	u64 bandwidth_floor =3D 0;
> > +	enum tegra_emc_perf_level highest_level =3D TEGRA_EMC_PL_LOW;
> > +	unsigned long clock_rate;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(constraints); i++) {
> > +		bandwidth_floor +=3D constraints[i].bandwidth;
>=20
> Get confused here. Why we add all bandwidth up? We should loop all th=
e
> bandwidth requests in "constraints" array, find out the largest one,
> compare with emc table then finally write the registers and set the e=
mc
> clock, isn't it?
>=20
No, bandwidth constraints add up. Imagine two display clients scanning
out at the same time. Both on their own may be satisfied with 83MHz DRA=
M
clock, but if they are running at the same time you have to account for
that and maybe bump DRAM freq to 133MHz.

Regards,
Lucas
