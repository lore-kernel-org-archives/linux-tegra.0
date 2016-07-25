From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Date: Mon, 25 Jul 2016 15:23:06 +0200
Message-ID: <20160725132306.GH21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-2-git-send-email-mirza.krak@gmail.com>
 <20160725111735.GC21170@ulmo.ba.sec>
 <CALw8SCUPn2xzToHbPC2FPr7rVutcFOq7dwhqREmxoG=L4gT5ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TKYYegg/GYAC5JIZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALw8SCUPn2xzToHbPC2FPr7rVutcFOq7dwhqREmxoG=L4gT5ew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TKYYegg/GYAC5JIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 02:28:48PM +0200, Mirza Krak wrote:
> 2016-07-25 13:17 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > On Tue, Jul 19, 2016 at 03:36:32PM +0200, Mirza Krak wrote:
> >> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >> Add TEGRA20_CLK_NOR to init tabel and set a "sane" default rate.
> >>
> >> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-t=
egra20.c
> >> index 837e5cb..aefc044 100644
> >> --- a/drivers/clk/tegra/clk-tegra20.c
> >> +++ b/drivers/clk/tegra/clk-tegra20.c
> >> @@ -1047,6 +1047,7 @@ static struct tegra_clk_init_table init_table[] =
__initdata =3D {
> >>       { TEGRA20_CLK_SDMMC3, TEGRA20_CLK_PLL_P, 48000000, 0 },
> >>       { TEGRA20_CLK_SDMMC4, TEGRA20_CLK_PLL_P, 48000000, 0 },
> >>       { TEGRA20_CLK_SPI, TEGRA20_CLK_PLL_P, 20000000, 0 },
> >> +     { TEGRA20_CLK_NOR, TEGRA20_CLK_PLL_P, 86500000, 0 },
> >
> > Yay for inconsistent naming in the hardware. It would've been nice if
> > this clock was called GMI. Oh well...
>=20
> I am allowed to change clk name? Can do that when I re-spin this series.

No, leave it as-is. The clock is referred to as NOR in the clock and
reset controller. I was just saying that it would've been nice if it had
been named GMI consistently.

> > Could you perhaps explain in the commit message why 86.5 MHz is a sane
> > default? I'm totally unfamiliar with this controller, so maybe it's
> > self-explanatory, but it seems a rather odd value for a clock frequency.
>=20
> I used a value that I have in a downstream kernel based on the L4T.
> This frequency is well tested and has worked for me, and wanted to
> avoid setting it to maximum rate. My guess is that they used 86.5 MHz
> because 92 MHz is max rate on Tegra2 and they put it slightly below
> that.
>=20
> What is otherwise recommended when initializing clocks? The rate could
> depend on the chip that is attached but otherwise I would like to set
> it close to max (or max) rate for performance.

I think we usually set the default rate to the maximum and let drivers
clock them down as they see fit. This is so that things run fast by
default and we often don't have much in the way of power management, at
least not when drivers are first merged. Maximum clock rate ensure that
we get good performance by default, rather than having to rely on
drivers to kick it up a notch.

Thierry

--TKYYegg/GYAC5JIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlhK3AAoJEN0jrNd/PrOhEsMP/i4bUMyxfX6xpWXIiPqehu4k
vc6sH7rpKjSmR95gYLNoXdgfh8w6FmBBvjZt7+qvbDJMbBt6/2LMRXwwSAL+knXJ
QwX0tnfV2z5YF5hm+V48MwHxrdCa3EFOvV6xjn9bZcD9RRPxjVY0pj5O1IsMVEWm
mgzhgysUazl7QQT7JHdheSs6/MV7T7mz3wkzU3/XU2d/UKqyjG6XJIF2WCUSVkoy
2ZiArc3xfUZCrpzo4Ook8qsEfqHelK0hfkDBcFq2pts9maLU8K9v393zhmAuUZxC
Jab8h2lnjzXOP02+sOoUpuwIglLnI9y4DDgZc/NtnxVqk2z11Ea5SJaWQmBZkDlF
4RSfgC3Wme1MkV+DPbQVBtUezw2I0QCrhZTNECVw8Y/o/CWuAQ7QikDfo9PW4qhI
o83ww66q8U8CqrH1euzsyxByTSlUThojA9OpEYwItWTISEd0hoZ6O51HjPbImTt8
bsLxROuljxOqA14J4m/BKa1NfNs7Q/laCkpyV3AUyNJZhAk/EXWHKsNlOJkcZrkv
CTLgSxgRbabcnbNjjhQmQ4+f/LkTyxHz4grXmediXJEA6zOrC8T9Bb/y1hJ/ZmIf
GvxbR66Wynfkq2XvHMkju+ssH+/2CfznaKhlAWs64v5S01BTOJ3k1gC+QIfbM5Jp
b8ZlY1xDsz3e6pqYSgCa
=fDkY
-----END PGP SIGNATURE-----

--TKYYegg/GYAC5JIZ--
