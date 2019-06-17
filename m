From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
Date: Mon, 17 Jun 2019 12:20:49 +0200
Message-ID: <20190617102049.GF508@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
 <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
 <20190614134110.GF15526@ulmo>
 <d9b65fd9-ecad-b241-a0d6-251a648488aa@gmail.com>
 <20190614141400.GI15526@ulmo>
 <3c6ac621-bc2a-c9c8-64fc-531be7dd323d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3c6ac621-bc2a-c9c8-64fc-531be7dd323d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 07:41:54PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 17:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jun 14, 2019 at 04:49:44PM +0300, Dmitry Osipenko wrote:
> >> 14.06.2019 16:41, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Fri, Jun 14, 2019 at 03:01:13PM +0300, Dmitry Osipenko wrote:
> >>>> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>
> >>>>> The suspend clock source for Tegra210 and earlier is currently
> >>>>> implemented in the Tegra timer driver. However, the suspend clock s=
ource
> >>>>> code accesses registers that are part of the RTC hardware block, so=
 both
> >>>>> can step on each others' toes. In practice this isn't an issue, but
> >>>>> there is no reason why the RTC driver can't implement the clock sou=
rce,
> >>>>> so move the code over to the tegra-rtc driver.
> >>>>>
> >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>> ---
> >>>>>  drivers/clocksource/timer-tegra.c | 44 ---------------------------=
----
> >>>>>  drivers/rtc/rtc-tegra.c           | 42 +++++++++++++++++++++++++++=
++
> >>>>>  2 files changed, 42 insertions(+), 44 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksourc=
e/timer-tegra.c
> >>>>> index e6608141cccb..87eac618924d 100644
> >>>>> --- a/drivers/clocksource/timer-tegra.c
> >>>>> +++ b/drivers/clocksource/timer-tegra.c
> >>>>> @@ -21,10 +21,6 @@
> >>>>> =20
> >>>>>  #include "timer-of.h"
> >>>>> =20
> >>>>> -#define RTC_SECONDS		0x08
> >>>>> -#define RTC_SHADOW_SECONDS	0x0c
> >>>>> -#define RTC_MILLISECONDS	0x10
> >>>>> -
> >>>>>  #define TIMERUS_CNTR_1US	0x10
> >>>>>  #define TIMERUS_USEC_CFG	0x14
> >>>>>  #define TIMERUS_CNTR_FREEZE	0x4c
> >>>>> @@ -164,34 +160,6 @@ static struct delay_timer tegra_delay_timer =
=3D {
> >>>>>  };
> >>>>>  #endif
> >>>>> =20
> >>>>> -static struct timer_of suspend_rtc_to =3D {
> >>>>> -	.flags =3D TIMER_OF_BASE | TIMER_OF_CLOCK,
> >>>>> -};
> >>>>> -
> >>>>> -/*
> >>>>> - * tegra_rtc_read - Reads the Tegra RTC registers
> >>>>> - * Care must be taken that this function is not called while the
> >>>>> - * tegra_rtc driver could be executing to avoid race conditions
> >>>>> - * on the RTC shadow register
> >>>>> - */
> >>>>> -static u64 tegra_rtc_read_ms(struct clocksource *cs)
> >>>>> -{
> >>>>> -	void __iomem *reg_base =3D timer_of_base(&suspend_rtc_to);
> >>>>> -
> >>>>> -	u32 ms =3D readl_relaxed(reg_base + RTC_MILLISECONDS);
> >>>>> -	u32 s =3D readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
> >>>>> -
> >>>>> -	return (u64)s * MSEC_PER_SEC + ms;
> >>>>> -}
> >>>>> -
> >>>>> -static struct clocksource suspend_rtc_clocksource =3D {
> >>>>> -	.name	=3D "tegra_suspend_timer",
> >>>>> -	.rating	=3D 200,
> >>>>> -	.read	=3D tegra_rtc_read_ms,
> >>>>> -	.mask	=3D CLOCKSOURCE_MASK(32),
> >>>>> -	.flags	=3D CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONS=
TOP,
> >>>>> -};
> >>>>> -
> >>>>>  static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra2=
0)
> >>>>>  {
> >>>>>  	if (tegra20) {
> >>>>> @@ -385,15 +353,3 @@ static int __init tegra20_init_timer(struct de=
vice_node *np)
> >>>>>  	return tegra_init_timer(np, true, rating);
> >>>>>  }
> >>>>>  TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_in=
it_timer);
> >>>>> -
> >>>>> -static int __init tegra20_init_rtc(struct device_node *np)
> >>>>> -{
> >>>>> -	int ret;
> >>>>> -
> >>>>> -	ret =3D timer_of_init(np, &suspend_rtc_to);
> >>>>> -	if (ret)
> >>>>> -		return ret;
> >>>>> -
> >>>>> -	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
> >>>>> -}
> >>>>> -TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_r=
tc);
> >>>>> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> >>>>> index 8fa1b3febf69..6da54264a27a 100644
> >>>>> --- a/drivers/rtc/rtc-tegra.c
> >>>>> +++ b/drivers/rtc/rtc-tegra.c
> >>>>> @@ -6,6 +6,7 @@
> >>>>>   */
> >>>>> =20
> >>>>>  #include <linux/clk.h>
> >>>>> +#include <linux/clocksource.h>
> >>>>>  #include <linux/delay.h>
> >>>>>  #include <linux/init.h>
> >>>>>  #include <linux/io.h>
> >>>>> @@ -52,8 +53,15 @@ struct tegra_rtc_info {
> >>>>>  	struct clk *clk;
> >>>>>  	int irq; /* alarm and periodic IRQ */
> >>>>>  	spinlock_t lock;
> >>>>> +
> >>>>> +	struct clocksource clksrc;
> >>>>>  };
> >>>>> =20
> >>>>> +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clk=
src)
> >>>>> +{
> >>>>> +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> >>>>> +}
> >>>>> +
> >>>>>  /*
> >>>>>   * RTC hardware is busy when it is updating its values over AHB on=
ce every
> >>>>>   * eight 32 kHz clocks (~250 us). Outside of these updates the CPU=
 is free to
> >>>>> @@ -268,6 +276,17 @@ static const struct rtc_class_ops tegra_rtc_op=
s =3D {
> >>>>>  	.alarm_irq_enable =3D tegra_rtc_alarm_irq_enable,
> >>>>>  };
> >>>>> =20
> >>>>> +static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
> >>>>> +{
> >>>>> +	struct tegra_rtc_info *info =3D to_tegra_rtc(clksrc);
> >>>>> +	u32 ms, s;
> >>>>> +
> >>>>> +	ms =3D readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
> >>>>> +	s =3D readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
> >>>>> +
> >>>>> +	return (u64)s * MSEC_PER_SEC + ms;
> >>>>> +}
> >>>>> +
> >>>>>  static const struct of_device_id tegra_rtc_dt_match[] =3D {
> >>>>>  	{ .compatible =3D "nvidia,tegra20-rtc", },
> >>>>>  	{}
> >>>>> @@ -339,6 +358,28 @@ static int tegra_rtc_probe(struct platform_dev=
ice *pdev)
> >>>>>  		goto disable_clk;
> >>>>>  	}
> >>>>> =20
> >>>>> +	/*
> >>>>> +	 * The Tegra RTC is the only reliable clock source that persists
> >>>>> +	 * across an SC7 transition (VDD_CPU and VDD_CORE off) on Tegra210
> >>>>> +	 * and earlier. Starting with Tegra186, the ARM v8 architected ti=
mer
> >>>>> +	 * is in an always on power partition and its reference clock kee=
ps
> >>>>> +	 * running during SC7. Therefore, we technically don't need to ha=
ve
> >>>>> +	 * the RTC register as a clock source on Tegra186 and later, but =
it
> >>>>> +	 * doesn't hurt either, so we just register it unconditionally he=
re.
> >>>>> +	 */
> >>>>> +	info->clksrc.name =3D "tegra_rtc";
> >>>>> +	info->clksrc.rating =3D 200;
> >>>>> +	info->clksrc.read =3D tegra_rtc_read_ms;
> >>>>> +	info->clksrc.mask =3D CLOCKSOURCE_MASK(32);
> >>>>
> >>>> Hm.. shouldn't this be CLOCKSOURCE_MASK(52)? Given that there are 32=
 bits for seconds and
> >>>> 10bits for milliseconds.
> >>>
> >>> Did you mean to say CLOCKSOURCE_MASK(42)? Yeah, that's probably better
> >>> here.
> >>
> >> Yes, 42 :)
> >=20
> > I'm wondering if that could perhaps be a little problematic because
> > we're not actually using all of the 10 bits for the milliseconds. So the
> > maximum value that we can return is:
> >=20
> > 	4294967296 * 1000 + 999 =3D 4294967296999
> >=20
> > However, the maximum value for a 42 bit mask is:
> >=20
> > 	2^42 - 1 =3D 4398046511103
> >=20
> > That mask is only used in order to wrap around in delta computations. So
> > I can imagine a situation where we'd end up with a wrong value in the
> > delta. I suppose this can only really happen if the two samples are very
> > far apart in time, so maybe this isn't worth worrying about.
>=20
> I'm a bit puzzled now. Looks problematic that wraparound will happen unex=
pectedly for
> the timekeeping. Although please bare in mind that I'm not expert in the =
area of
> timekeeping, actually I know very little about it.
>=20
> Maybe tegra_rtc_read_ms() should track wraparound case itself and return a
> monotonically incrementing value?
>=20
> static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
> {
> 	struct tegra_rtc_info *info =3D to_tegra_rtc(clksrc);
> 	u64 ms, s, now;
>=20
> 	ms =3D readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
> 	s =3D readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
>=20
> 	now =3D s * MSEC_PER_SEC + ms;
>=20
> 	if (now < info->last)
> 		info->ms_cnt +=3D 0x3e8000003e8ull - info->last + now;
> 	else
> 		info->ms_cnt +=3D now - info->last;
>=20
> 	info->last =3D now;
>=20
> 	return info->ms_cnt;
> }
>=20
> and then simply CLOCKSOURCE_MASK(64).

This sounds like a bit of overkill to me. There's an obscure constant in
there that's completely non-obvious and we're duplicating code that's
effectively already in the core. I think the only thing that we need to
make sure is that we don't confuse the timekeeping system by having this
discrepancy of 24 values between the values that we report and the mask.

I think we could probably do this by setting a mask of 41 bits and then
also applying that mask to the values that we return:

	return (u64)(s * MSEC_PER_SEC + ms) & clksrc->mask;

That way we always wrap around before we reach the maximum numerical
value that we could. So we "loose" that 24 value range, but that's not
really a problem.

Actually, saying it that way I don't think we actually have to worry
about this at all. Those 24 values (0x3E8-0x3FF) are already lost. We
never return any values in that range because the MILLI_SECONDS register
wraps around to 0x000 after 0x3E7. So we will never end up with any of
those 24 values being used. They are effectively already lost. The fact
that we "hide" them by contracting the 10 bit field to 1000 values does
not change that.

Thierry

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HaX4ACgkQ3SOs138+
s6E4HRAAjudfjmA6NJ+84ATQF51/ybM2nzh4E3OxY0SFLjuGQ79IkzzpEgAgHWFh
6699sQSsWBt55ZFJNpUWj/ugqt11F53fpuhJW4jU8DbWtRBTs+NLXQP0nNG8/qmL
B9Oq4FB497RukWHtNcgKd2gDT7CINMs5qQm3upAT+akQwkL+eWaPCJ3xvZbHynu2
NJN6wpIR1R7UErbhgqpfeKVJw/1elNJKbthzSOiPR6S7xOoROI6wO+aluehTzDpy
1SPgATh3DQKzzdGkrSXVP6VUSLXztZM9porIyG2fJOceCrB5ZM0HSob0nR9p6Bc3
+rvMQeqHQhf66mtSaiPRaIuJwfNop0o8j5/JfNwKqx5HHJjno2kJ5A27idgY3QA5
OPJ1Qd85zaSCTjkx1iNrj9xUFX4lY8EHo9cWSzapqDjGgeczJM6rO/Y/Pxph5S2w
F/DtwnIRRdL2Dp+Cl/bBmlJP0ND8wseax2gyJNVL7tPJ1cWGYC7PVE0zc6OzhFJE
41U2KWNjzT08vgHpLeCxNQSFp7/oNGQDWd5ynBM/mHACzmUF+ViKichSIwtJQpFn
QoPqFXZuvdKE0Fu727ugSAT+wT9Cd7TqKkXQvxKdIVgWkC5VKWwHE/UHJNkB2Eq4
ncF3zFzmW+saZTKn1hm6ZJYxTj9i51O+4OX7X13AypqsgHwZqmY=
=r2rw
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--
