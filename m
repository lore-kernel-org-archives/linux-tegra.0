From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix divider settings for Tegra210 pll_a
Date: Fri, 5 Feb 2016 17:20:29 +0100
Message-ID: <20160205162029.GA25367@ulmo>
References: <1454680897-9464-1-git-send-email-jonathanh@nvidia.com>
 <56B4C7B8.4090402@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56B4C7B8.4090402@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2016 at 11:03:04AM -0500, Rhyland Klein wrote:
> On 2/5/2016 9:01 AM, Jon Hunter wrote:
> > When setting the pll_a frequency, to what should be 368639844 Hz, the
> > actual output frequency of the pll is 737279687 Hz (as reported by the
> > debugfs clk_summary entry), which is double the expect frequency. The
> > calculations for the pll frequency appear to be correct and the problem
> > is caused by incorrect divider settings for the pll_a in the look-up
> > table of multipliers and dividers. The P dividers for all entries in the
> > table are all one less than they should be. Fix this by increasing the
> > value of the P dividers by 1 to get the expected rates.
> >=20
> > The rates in the table have been verified using the following equations:
> >=20
> > 1. Integer NDIV (SDM_DIN =3D 0)
> >    fout =3D (fref * n) / (m * p)
> >=20
> > 2. Fractional NDIV
> >    fout =3D (fref * (n + 0.5 + (SDM_DIN/8192))) / (m * p)
> >=20
> > Where SDM_DIN is a signed 16-bit value between 0xf000 and 0x1000.
> >=20
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> >=20
> > Thierry, Rhyland, please note that after this change, the pll_a settings
> > match those in the nvidia downstream 3.18 kernel for Tegra210.
> >=20
> >
>=20
> This was an issue we had before/around merging T210 driver. The tegra
> clock code was inconsistent in how it treated the pdiv. In some places
> it stored the direct HW value in the frequency table entry struct (like
> in the predefined frequencies like what you changed). Some places stored
> the translated (=3D_hw_to_p_div()). This is most commonly a difference in
> a factor of 2.
>=20
> I found when initially doing the T210 that most clocks I requested rates
> for came out at either 1/2 or 2x what I wanted depending on the path.
>=20
> I think when Thierry merged my series, he added some code to address
> this issue, as he saw it too I think. Depending on what his change was
> (to consistently store either pdiv or hw_val) then we may need to adjust
> ALL the predefined rates in the clk-tegra210 code.
>=20
> Thierry, do you remember off-hand what you changed for that?

Yes. The problem was that we were inconsistently treating the P-divider
values in frequency tables. In some cases they were assumed to be the
real divider values, whereas in other cases they were treated as being
the direct register values.

This was changed to be consistent in commit 86c679a52294 ("clk: tegra:
pll: Fix _pll_ramp_calc_pll logic and _calc_dynamic_ramp_rate") but I
must have forgotten to update the Tegra210 frequency tables with a
corresponding change.

I've sent out a patch that should fix those all up since the same error
exists for many others.

Thierry

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWtMvKAAoJEN0jrNd/PrOh5SgP/ijX6P/X3PraOwtHMruSnhc4
PD0+AUCTND2r07noIrHyAvcMY25hC4EfNa8Gn1QqN7PufgciimPtMfG/voyDpoJU
hkMpCVAII1vcqKio3gUffgAo5Jx36L39EurAAsY5xn9o/7J82l/I7BbiX/vsrsDn
G8ShVYJptuEFox5PYkZEVConRQV111LHWOh5yoszS/FRAxfafmdj3QR13VeYuzaT
QDu7FildXazWBa/LawSQEEpDQ8nrbpdOekmMVjmbhpxmqYI2NjywAoa57Y4jucRL
weJ25kqpJqHOkaYJgESIG5DdrZcdtfEYH98LgdizvrWQN4siLuY/3LHaJG0aeelE
pSjAU8Fn5nulbpMZycLBY8XJOH1KzhjQJ19v14TvWlCuvBqrxXxxx1enx7eTZoCT
JRCDflVw6lNjNBcq4ghfGhU5EeJSgVkXxT1IplJvEd5Zimia39Y/B6pnnXwod53T
ENeOOrNsRzsGyzFX418xrDvGhSFXXowYfhbsyyExngcUzFIEvqu+gwCaPjAYsY7G
LCkzexY67sJsaV+ssFjBJhdAX1uI/3MGa+v8e440azAfAIgK6juNZTAVUCQgkVuf
C+0F3ZCjg9LDCYmjAjOZDA/Jy7je8r8PUMjYeS/p8mIO5wFSvmqwPSwAOBifZ8xQ
UjjlIGAHu2OJROspkfb1
=1+6R
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
