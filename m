From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] clocksource: tegra: Use rating when registering
 clock source
Date: Fri, 14 Jun 2019 16:55:27 +0200
Message-ID: <20190614145527.GJ15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
 <20190614132253.GE15526@ulmo>
 <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
 <20190614135353.GH15526@ulmo>
 <286cb0b7-1c8a-1a61-517e-1a9eee08e614@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NqSa+Xr3J/G6Hhls"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <286cb0b7-1c8a-1a61-517e-1a9eee08e614@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--NqSa+Xr3J/G6Hhls
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 05:02:45PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 16:53, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jun 14, 2019 at 04:29:17PM +0300, Dmitry Osipenko wrote:
> >> 14.06.2019 16:22, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
> >>>> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>
> >>>>> The rating is parameterized depending on SoC generation to make sur=
e it
> >>>>> takes precedence on implementations where the architected timer can=
't be
> >>>>> used. This rating is already used for the clock event device. Use t=
he
> >>>>> same rating for the clock source to be consistent.
> >>>>>
> >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>> ---
> >>>>>  drivers/clocksource/timer-tegra.c | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksourc=
e/timer-tegra.c
> >>>>> index f6a8eb0d7322..e6608141cccb 100644
> >>>>> --- a/drivers/clocksource/timer-tegra.c
> >>>>> +++ b/drivers/clocksource/timer-tegra.c
> >>>>> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct devic=
e_node *np, bool tegra20,
> >>>>>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
> >>>>> =20
> >>>>>  	ret =3D clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> >>>>> -				    "timer_us", TIMER_1MHz, 300, 32,
> >>>>> +				    "timer_us", TIMER_1MHz, rating, 32,
> >>>>>  				    clocksource_mmio_readl_up);
> >>>>>  	if (ret)
> >>>>>  		pr_err("failed to register clocksource: %d\n", ret);
> >>>>>
> >>>>
> >>>> Looks good. Although, could you please clarify whether arch-timer st=
ops on T210 when CPU
> >>>> enters deepest (powerdown) idle state? I'm starting to lose track a =
bit already. Because
> >>>> if arch-timer stops in the deepest idle state, then it's a bit odd t=
hat Joseph didn't add
> >>>> the clocksource for T210 in the first place and v5.1 probably should=
n't work well because
> >>>> of that already.
> >>>
> >>> Yes, the architected timer doesn't work across an SC7 (which is what =
the
> >>> deepest idle state is called on Tegra210) transition, hence why we ca=
n't
> >>> use it as a suspend clocksource. I actually sent out a patch to do th=
at,
> >>> earlier.
> >>>
> >>> And yes, it's entirely possible that v5.1 doesn't work in this regard,
> >>> but we're not noticing that because we don't have suspend/resume supp=
ort
> >>> for Tegra210 anyway. There are a couple of missing pieces that we need
> >>> in order to make it work.
> >>>
> >>> This change in particular is only going to affect the CPU idle state
> >>> (CC7). Since the architected timer doesn't survive that either, we ne=
ed
> >>> the Tegra timer to be preferred over the architected timer for normal
> >>> operation.
> >>>
> >>> All of these issues go away on Tegra186 and later, where the architec=
ted
> >>> timer is in an always-on partition and has a PLL that remains on duri=
ng
> >>> SC7 (and CC7).
> >>
> >> Thank you very much for the clarification. But then what about the
> >> sched_clock? I suppose sched_clock will suffer on T210 as well and it's
> >> a bit trickier case because apparently arch-timer always wins since it
> >> has a higher precision. I guess the best solution will be to just bail
> >> out from arch-timer's driver probe in a case of T210.
> >>
> >> if (of_machine_is_compatible("nvidia,tegra210"))
> >> 	return 0.
> >=20
> > I don't think there's any issue with the scheduler clock on Tegra210.
> > Before the CPU can be turned off, all tasks scheduled on that CPU have
> > to be migrated to another CPU, right? Conversely, before any tasks can
> > be scheduled on a CPU that CPU needs to be brought online, at which
> > point the architected timer should work fine again.
>=20
> Is SC7 a CPU-idle state that cpuidle driver may enter or it's a
> system-wide suspend state? It's still not clear to me.

SC7 is the system-wide suspend state. When entered pretty much
everything in the SoC is turned off. The CPU idle state is called CC7,
but I think we only expose that via PSCI. However, I'm not sure we have
any extensive testing for that. I'll have to check that.

Thierry

--NqSa+Xr3J/G6Hhls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DtVwACgkQ3SOs138+
s6HmoA/7BZqvHAtXYmKwnc+4h3cfk+VmKRx+C9VyVaUSwc1clAfoeBtRBF9IGMX1
BXyBjEycXMDzooVWokRO889MHMk1hvSaRCwaHYcsNGpFPjtL0/nxGUTWaeGCsZcW
g7G4mYczxob1gSQj7k/sZw1PwSopLUZfGms5Z1BT3bM3rCaEsBZBjbIs4Dh2pgrx
BeSqsnWDbpiXBqq+ds2gD8WYxP+m6t37mScluHe2ZYwXVN5piw11svOBhgdDDULj
m2ewotvyElyw76x8PJB5NJwcaipOSV9urhKQ4Ifz3yAcjDakYJ8QmutKXjjEkN5P
Fr/H3t57fsta8/W361ddJnY959TRb63o4qViHoNB9JNxgzG4dkXWlsnz7QqBLo4Y
pr8GGZUgyoYshhFXtBdbvSjR+3CPZT0E+jvIUlmVfG7HEKoUaXdzuTfWlHCdUGxw
jW94oq0Le/x/b4ZcpzIiC/m192LqM3YBuqzUeyZTyvKEJJ5Hl182sCt/ZLIIN50G
lzXLI6bnVTlEf5ECwhdax6pDzTcfQtePBqmoZqEkPDBjmN4i8/CXdQ8TAmnPFCGR
fE6fG0mAj4Qdl1uYNd1+wDX/dU84etbhvq0Ze9kxiZVNtQG4R3x8/UKNEQSlnxLr
lHn5w6Ioz8VxQe4lDE3p65kmc1MXWtoy4bassDdWXO6DnAggH6M=
=TiYy
-----END PGP SIGNATURE-----

--NqSa+Xr3J/G6Hhls--
