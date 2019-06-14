From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
Date: Fri, 14 Jun 2019 15:41:10 +0200
Message-ID: <20190614134110.GF15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
 <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 03:01:13PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The suspend clock source for Tegra210 and earlier is currently
> > implemented in the Tegra timer driver. However, the suspend clock source
> > code accesses registers that are part of the RTC hardware block, so both
> > can step on each others' toes. In practice this isn't an issue, but
> > there is no reason why the RTC driver can't implement the clock source,
> > so move the code over to the tegra-rtc driver.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clocksource/timer-tegra.c | 44 -------------------------------
> >  drivers/rtc/rtc-tegra.c           | 42 +++++++++++++++++++++++++++++
> >  2 files changed, 42 insertions(+), 44 deletions(-)
> >=20
> > diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/ti=
mer-tegra.c
> > index e6608141cccb..87eac618924d 100644
> > --- a/drivers/clocksource/timer-tegra.c
> > +++ b/drivers/clocksource/timer-tegra.c
> > @@ -21,10 +21,6 @@
> > =20
> >  #include "timer-of.h"
> > =20
> > -#define RTC_SECONDS		0x08
> > -#define RTC_SHADOW_SECONDS	0x0c
> > -#define RTC_MILLISECONDS	0x10
> > -
> >  #define TIMERUS_CNTR_1US	0x10
> >  #define TIMERUS_USEC_CFG	0x14
> >  #define TIMERUS_CNTR_FREEZE	0x4c
> > @@ -164,34 +160,6 @@ static struct delay_timer tegra_delay_timer =3D {
> >  };
> >  #endif
> > =20
> > -static struct timer_of suspend_rtc_to =3D {
> > -	.flags =3D TIMER_OF_BASE | TIMER_OF_CLOCK,
> > -};
> > -
> > -/*
> > - * tegra_rtc_read - Reads the Tegra RTC registers
> > - * Care must be taken that this function is not called while the
> > - * tegra_rtc driver could be executing to avoid race conditions
> > - * on the RTC shadow register
> > - */
> > -static u64 tegra_rtc_read_ms(struct clocksource *cs)
> > -{
> > -	void __iomem *reg_base =3D timer_of_base(&suspend_rtc_to);
> > -
> > -	u32 ms =3D readl_relaxed(reg_base + RTC_MILLISECONDS);
> > -	u32 s =3D readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
> > -
> > -	return (u64)s * MSEC_PER_SEC + ms;
> > -}
> > -
> > -static struct clocksource suspend_rtc_clocksource =3D {
> > -	.name	=3D "tegra_suspend_timer",
> > -	.rating	=3D 200,
> > -	.read	=3D tegra_rtc_read_ms,
> > -	.mask	=3D CLOCKSOURCE_MASK(32),
> > -	.flags	=3D CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
> > -};
> > -
> >  static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
> >  {
> >  	if (tegra20) {
> > @@ -385,15 +353,3 @@ static int __init tegra20_init_timer(struct device=
_node *np)
> >  	return tegra_init_timer(np, true, rating);
> >  }
> >  TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_t=
imer);
> > -
> > -static int __init tegra20_init_rtc(struct device_node *np)
> > -{
> > -	int ret;
> > -
> > -	ret =3D timer_of_init(np, &suspend_rtc_to);
> > -	if (ret)
> > -		return ret;
> > -
> > -	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
> > -}
> > -TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
> > diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> > index 8fa1b3febf69..6da54264a27a 100644
> > --- a/drivers/rtc/rtc-tegra.c
> > +++ b/drivers/rtc/rtc-tegra.c
> > @@ -6,6 +6,7 @@
> >   */
> > =20
> >  #include <linux/clk.h>
> > +#include <linux/clocksource.h>
> >  #include <linux/delay.h>
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> > @@ -52,8 +53,15 @@ struct tegra_rtc_info {
> >  	struct clk *clk;
> >  	int irq; /* alarm and periodic IRQ */
> >  	spinlock_t lock;
> > +
> > +	struct clocksource clksrc;
> >  };
> > =20
> > +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
> > +{
> > +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> > +}
> > +
> >  /*
> >   * RTC hardware is busy when it is updating its values over AHB once e=
very
> >   * eight 32 kHz clocks (~250 us). Outside of these updates the CPU is =
free to
> > @@ -268,6 +276,17 @@ static const struct rtc_class_ops tegra_rtc_ops =
=3D {
> >  	.alarm_irq_enable =3D tegra_rtc_alarm_irq_enable,
> >  };
> > =20
> > +static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
> > +{
> > +	struct tegra_rtc_info *info =3D to_tegra_rtc(clksrc);
> > +	u32 ms, s;
> > +
> > +	ms =3D readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
> > +	s =3D readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
> > +
> > +	return (u64)s * MSEC_PER_SEC + ms;
> > +}
> > +
> >  static const struct of_device_id tegra_rtc_dt_match[] =3D {
> >  	{ .compatible =3D "nvidia,tegra20-rtc", },
> >  	{}
> > @@ -339,6 +358,28 @@ static int tegra_rtc_probe(struct platform_device =
*pdev)
> >  		goto disable_clk;
> >  	}
> > =20
> > +	/*
> > +	 * The Tegra RTC is the only reliable clock source that persists
> > +	 * across an SC7 transition (VDD_CPU and VDD_CORE off) on Tegra210
> > +	 * and earlier. Starting with Tegra186, the ARM v8 architected timer
> > +	 * is in an always on power partition and its reference clock keeps
> > +	 * running during SC7. Therefore, we technically don't need to have
> > +	 * the RTC register as a clock source on Tegra186 and later, but it
> > +	 * doesn't hurt either, so we just register it unconditionally here.
> > +	 */
> > +	info->clksrc.name =3D "tegra_rtc";
> > +	info->clksrc.rating =3D 200;
> > +	info->clksrc.read =3D tegra_rtc_read_ms;
> > +	info->clksrc.mask =3D CLOCKSOURCE_MASK(32);
>=20
> Hm.. shouldn't this be CLOCKSOURCE_MASK(52)? Given that there are 32 bits=
 for seconds and
> 10bits for milliseconds.

Did you mean to say CLOCKSOURCE_MASK(42)? Yeah, that's probably better
here.

Thierry

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Do/QACgkQ3SOs138+
s6HR9RAAsJyzd0Esu9QvsUoB6AafwWFSFPYw6wwtOpUYUKXqhjnGhCnrokJmny2I
DNS8nD0AEcdS2J1xcz0g1Ani1ZfK6go7eKRR70cxvoqR+ykYybGodqoXYrDNFAy6
aqazQXOZLHL76jWTgBbLpxCj0PXPqzDJVca01x6VgCqCaQlyY00gxm99FaOe+RFQ
ldzN3zEXysNXcW4k0NvDdDEfBcnT5HcxtNd7+HMovWB9XlO6RefD1Fp+sXpiLtw1
OGVvIqQVVu7pwrQvaQN8LD96GFE9IygI98h3QiIAkXeOKQaL83KENg5+O1setGqM
Gc/1QqIEnHFNNPcUiJWQJ+czlxVN+4hfAUPq+s27f+f+7Brz2jjVB2xbAeV3QJT8
OR+rC0rs56lI85wuqUNQDGeGO2VrVrXQXNMPlB5YYBAcegzTg7p+yXFNMxP+8jsO
aSMi7hlVKT7aulOh0mGiyDOhw5iSo2oDfwa1LS8ssFyFqGokCpnsNDX4Hbp3ty9B
rwB77aKiMCYlfi+tLufWqbPA7aKUKg76eRHIyAfAG3KA/OaYWELxDeghO0IXi5JF
XIr0KGim7+xoxAj9BN7GbOplb38jSSmYMYFmdJvG2GJx9Qtvpz++e7sUch+t0Uat
01UaISSIEOC49LsJ5OKlpWfKeJ+PaHm+LLe9Mn3q8pN7alBK4is=
=/nfa
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--
