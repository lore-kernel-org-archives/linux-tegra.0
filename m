From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] clocksource: tegra: Use rating when registering
 clock source
Date: Fri, 14 Jun 2019 15:53:53 +0200
Message-ID: <20190614135353.GH15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
 <20190614132253.GE15526@ulmo>
 <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IbVRjBtIbJdbeK1C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--IbVRjBtIbJdbeK1C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 04:29:17PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 16:22, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
> >> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The rating is parameterized depending on SoC generation to make sure =
it
> >>> takes precedence on implementations where the architected timer can't=
 be
> >>> used. This rating is already used for the clock event device. Use the
> >>> same rating for the clock source to be consistent.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/clocksource/timer-tegra.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/=
timer-tegra.c
> >>> index f6a8eb0d7322..e6608141cccb 100644
> >>> --- a/drivers/clocksource/timer-tegra.c
> >>> +++ b/drivers/clocksource/timer-tegra.c
> >>> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_=
node *np, bool tegra20,
> >>>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
> >>> =20
> >>>  	ret =3D clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> >>> -				    "timer_us", TIMER_1MHz, 300, 32,
> >>> +				    "timer_us", TIMER_1MHz, rating, 32,
> >>>  				    clocksource_mmio_readl_up);
> >>>  	if (ret)
> >>>  		pr_err("failed to register clocksource: %d\n", ret);
> >>>
> >>
> >> Looks good. Although, could you please clarify whether arch-timer stop=
s on T210 when CPU
> >> enters deepest (powerdown) idle state? I'm starting to lose track a bi=
t already. Because
> >> if arch-timer stops in the deepest idle state, then it's a bit odd tha=
t Joseph didn't add
> >> the clocksource for T210 in the first place and v5.1 probably shouldn'=
t work well because
> >> of that already.
> >=20
> > Yes, the architected timer doesn't work across an SC7 (which is what the
> > deepest idle state is called on Tegra210) transition, hence why we can't
> > use it as a suspend clocksource. I actually sent out a patch to do that,
> > earlier.
> >=20
> > And yes, it's entirely possible that v5.1 doesn't work in this regard,
> > but we're not noticing that because we don't have suspend/resume support
> > for Tegra210 anyway. There are a couple of missing pieces that we need
> > in order to make it work.
> >=20
> > This change in particular is only going to affect the CPU idle state
> > (CC7). Since the architected timer doesn't survive that either, we need
> > the Tegra timer to be preferred over the architected timer for normal
> > operation.
> >=20
> > All of these issues go away on Tegra186 and later, where the architected
> > timer is in an always-on partition and has a PLL that remains on during
> > SC7 (and CC7).
>=20
> Thank you very much for the clarification. But then what about the
> sched_clock? I suppose sched_clock will suffer on T210 as well and it's
> a bit trickier case because apparently arch-timer always wins since it
> has a higher precision. I guess the best solution will be to just bail
> out from arch-timer's driver probe in a case of T210.
>=20
> if (of_machine_is_compatible("nvidia,tegra210"))
> 	return 0.

I don't think there's any issue with the scheduler clock on Tegra210.
Before the CPU can be turned off, all tasks scheduled on that CPU have
to be migrated to another CPU, right? Conversely, before any tasks can
be scheduled on a CPU that CPU needs to be brought online, at which
point the architected timer should work fine again.

Thierry

--IbVRjBtIbJdbeK1C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Dpu4ACgkQ3SOs138+
s6Gm3hAAsQ17FKRMhkoY7jdMvBWKzbHBQ6eK7yWiniVpZNlbTv2ur5hvMb8EoiAZ
3EIsXggcoxsvxGrJqs8asUWeprNBB0UaJ/mGEbwY7aMsA+J++mTZ4bASeudt/ieS
Ow69g+KNN9z3WMYPZ5YpF+R+N/fUMvVwsGP+QsduC+GMM4qYk/mh8NScMFmcqnSI
s5WT1/R3fcTMRUkw1z1Rofa7WMa05/o8AHUgLdSh2QneaE4VBSLChpOvc7FpGfuO
cfrZ14xzdYLt11h33Yxb0X0XXocObzr0n0cyyVQKMEdKrzgXBXTbL4OS2La048bu
MtpNxvlkev+OB7/pOut+Nb0lE3EUuxDJOXVPzXo8ndlN0YX16GEsQ9kUBCfy1xJv
s+OnC5rPWHU/qb7KU+zJ9jhrt24dJIlCqvXUvVFgSFA2IpT8FnBfmZfCoX+ytdEp
GVv5NUr7jxLBBh7oDkFxkmmyzdmAVq3DyWrDPU5RVBShTK9FUvoZHdVUaVSma37g
2djL12rwrFvXEolyi3nvWgIHRe0jf+/BIXjPGEocrjSkUg6uRJwif/6QrAB6d9cA
2M2xyhrwJzSfrbrq8jaf9L5ArfXyCfBdMauQK7BWInUebAurF5Evq0rc6qObNRxT
vKOd6O5TEQ+RTevYlUumdUkuLCiOgbzY64jqIixrtR6MRBFiqN4=
=yriP
-----END PGP SIGNATURE-----

--IbVRjBtIbJdbeK1C--
