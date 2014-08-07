From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] host1x: mipi: Add new parent clock for mipi
 calibration
Date: Thu, 7 Aug 2014 16:52:45 +0200
Message-ID: <20140807145243.GC11095@ulmo.nvidia.com>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
 <1407391907-19488-2-git-send-email-seanpaul@chromium.org>
 <20140807081127.GD18359@ulmo>
 <CAOw6vbKiECG8w6V3zvnr5Z4r4WuRsq556gtspAnM7Drj=A8m8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOw6vbKiECG8w6V3zvnr5Z4r4WuRsq556gtspAnM7Drj=A8m8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 10:15:42AM -0400, Sean Paul wrote:
> On Thu, Aug 7, 2014 at 4:11 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > On Thu, Aug 07, 2014 at 02:11:44AM -0400, Sean Paul wrote:
> >> This patch adds a new parent clock to enable/disable the 72MHz
> >> clock required for mipi calibration.
> >
> > s/mipi/MIPI/ please. Also this doesn't explain why this change is
> > necessary. Doesn't MIPI D-PHY calibration work without this patch? It
> > sure does for me.
>=20
> Hi Thierry,
> Thanks for the prompt reviews.
>=20
> It doesn't work for me on T132 without this additional clock. It seems
> the source for mipi-cal has changed between T124 & T132 from PLL_OUT3
> to CLK72MHZ, so that could be why it's working for you and not for me.

I don't have Tegra124 hardware with DSI (I don't have Tegra132 hardware
with DSI either, for that matter) so I only tested on Tegra114. So I
guess it's possible that Tegra124 already uses clk72mhz as parent for
mipi_cal. However I can't find any authoritative source as to what
exactly is the parent on Tegra124 and later.

Peter, can you help find out what the right thing to do is here? The
clock driver currently always registers the mipi_cal clock as child of
clk_m, but that's clearly not correct. Should this be split up per SoC
so that it's a child of pll_p_out3 on Tegra114 and clk72mhz on Tegra124
and later?

> > Furthermore you say 72 MHz clock, but the below uses PLL_P_OUT3 as the
> > parent in the example, yet PLL_P_OUT3 runs at 102 MHz on all of my
> > systems. What 72 MHz clock are you referring to?
> >
>=20
> This was just a bogus assumption on my part that PLL_P_OUT3 was to be
> programmed to 72MHz on pre-T132 setups.
>=20
> > Also can this parent clock ever be anything other than PLL_P_OUT3? If
> > not it would probably be better to set that statically in the clock
> > initialization tables.
>=20
> I'm not entirely certain how I'd set CLK72MHZ statically in the init
> tables, could you elaborate? I can get it to work by re-parenting
> mipi-cal to clk72mhz, however I'm not sure if that would break other
> platforms.

Given the above that probably won't work. The reason is that the clock
is a simple gate and uses clk_m as a parent (see the gate_clks array in
drivers/clk/tegra/clk-tegra-periph.c).

What I think should work is if we rip out the mipi_cal entry and move
registration of the clock into clk-tegra114.c and clk-tegra124.c
respectively.

> My initial thought was to add a compatible =3D "nvidia,tegra132-mipi",
> which then would require the parent to be present in the dt.

We need to add a new compatible anyway since there are register
differences between the two. But I'd assume that the compatible should
be "nvidia,tegra124-mipi" since it most likely remained unmodified from
Tegra124 to Tegra132.

> >> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> >> index 9882ea1..4dd91fd 100644
> >> --- a/drivers/gpu/host1x/mipi.c
> >> +++ b/drivers/gpu/host1x/mipi.c
> >> @@ -80,7 +80,8 @@ static const struct module {
> >>  struct tegra_mipi {
> >>       void __iomem *regs;
> >>       struct mutex lock;
> >> -     struct clk *clk;
> >> +     struct clk *clk_parent;
> >> +     struct clk *clk_mipi_cal;
> >
> > I don't think the clk -> clk_mipi_cal rename is warranted here.
>=20
> Will do.

Given the above discussion I think this patch may simply become obsolete
if the mipi_cal clock is properly registered with pll_p_out3 or clk72mhz
as parent, since enabling the clock will then end up propagating the
enable up the whole clock tree.

Thierry

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT45K7AAoJEN0jrNd/PrOhE0YP/2Y8QfpMjCae7pwLX4Kr4+/4
jhevjo0yFE7qq4w9Rh7GIHrsFBKhBlQ/v9k1tdxJdO04tNgi/bWLvzrD7Gsx1h5+
HH++svqM+Fn4iu50DK35d1dPYdTvsj0whoZHczCYBEPwtmtdMturctIBCfAr3rA1
YOYIixybza976th9dU84gWbDyUlrC/6sSRckKua3r97ik4AlWUIhbM9cSGP+pvGE
vfwXtKfaGopmievnfop+D05M1IjUFF1FeWmjTN2vEqDtn91+yaHWVf9SOiWRywd3
KW0giBBfp0Oqtq/JqCtDYPFeoSCvt17SxbmZwD7L819w8N4QQKi20wmS4WluCmuw
8fJcZeI75zim7hpO0Q2jnOGKLC1UA5VDhs+/rBQEHFNZZXk6i7uU+weRuwV23hdh
34po2mpzr25lotSB/VFoKqc7Xq19ObNFfe12bTAduE2jy5Su7h7dL1nPhLtRpdEO
rceTN1SJ6r4zul5XiIm59TsNoyejD+Ira4KQ/QSqZaOJ4uhDKS/oECQHjc5chR07
KME/Bg9iijLQ53Fh/bv3ycMBzrxdZjZo34BlDmjdvFXq0h9IYpZeFcb7b5xJPwc/
g5H1HcOR23g2srF9/0wvBMVXE06TnoiILS/4squWARxTC+rEBM0XOE3xzNIOQ8h3
XOk9jFLP+r0TOW1e9aAS
=Kls3
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
