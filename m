From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 02/20] clk: tegra: periph: add new periph clks and
 muxes for Tegra210
Date: Wed, 6 May 2015 16:12:58 +0200
Message-ID: <20150506141257.GD22098@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <1430757460-9478-3-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430757460-9478-3-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 12:37:22PM -0400, Rhyland Klein wrote:
[...]
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk=
-tegra-periph.c
[...]
> @@ -387,6 +563,32 @@ static u32 mux_pllm_pllc2_c_c3_pllp_plla_pllc4_idx[]=
 =3D {
>  	[0] =3D 0, [1] =3D 1, [2] =3D 2, [3] =3D 3, [4] =3D 4, [5] =3D 6, [6] =
=3D 7,
>  };
> =20
> +/* SOR1 mux'es */
> +static const char *mux_pllp_plld_plld2_clkm[] =3D {
> +	"pll_p", "pll_d_out0", "pll_d2", "clk_m"
> +};

I think "pll_d2" above needs to be "pll_d2_out0". Otherwise we're not
going to be able to make HDMI work.

> +static u32 mux_pllp_plld_plld2_clkm_idx[] =3D {
> +	[0] =3D 0, [1] =3D 2, [2] =3D 5, [3] =3D 6
> +};

I also think the below...

> +static const char *mux_plldp_sor1_src[] =3D {
> +	"pll_dp", "clk_sor1_src"
> +};
> +#define mux_plldp_sor1_src_idx NULL
> +
> +static const char *mux_clkm_sor1_brick_sor1_src[] =3D {
> +	"clk_m", "sor1_brick", "sor1_src", "sor1_brick"
> +};
> +#define mux_clkm_sor1_brick_sor1_src_idx NULL

=2E.. aren't going to cut it. The problem is that we now have a three
level hierarchy, which makes it very cumbersome to set the correct
parent from the display driver. I have a local patch that implements
this by adding a new type of mux which works on a mask rather than a
single bitfield so that we can represent the various parents of the
SOR1 clock in a single level.

I think for now we can leave this in place and apply my patch on top
after everybody agrees it's the right thing to do.

Thierry

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSiFnAAoJEN0jrNd/PrOhJR0QALeUtVHSW/P43ttU9T1/kq4W
MsySD3lNA42rwHlaZL0d8YzlWNzmhR0mVQu+wQzHJ2ePPaao228pqa/QmGa1b1wk
O9bEAFCJsSr6mYTRTVittI/A0CdIMSO3mi3dzhSZOzsPz634o2WO1Kjrfk4QDCEy
bTkub08RBA/0FOnlNjRVnACA3P/N026TIydFJiGnJPYe2C8DtqwdAhFDCxZwK50S
ln1csnqlOkSHpTOUEGbDSEmPl02DhxgoW7bnVwvaeBsrLYvTT1rOJD8eVZW1ZigS
ke55It4LBtwT6Xcp54ias3f/DVRBPQFo/z2apYEz5J+nLx24InZeDdqA9xO5cpUF
MUEVoUlmrsPO/CC2c7/sSSUM5IENv47pTvJXx0MjGgMxXtN5psRM3vh2pEsXND25
dYL6MhDeBKCkRhImj5NIVVxHQQgP2qBs+7gAUVyMg0++9U+TexlMLhQkpm8zAzWa
5CRGbMUtBWJrduSl+Ld8Z3ChfcmJfxzKFg8EJmfKxeYTCLJ7z0SRdLK0KBzAaLfh
hKyNL+dETQ0sw4tK4S5x3/tf/iZtDj/fh6+RfnAjtoOIk1Po9sbgNaETpM0GBV5j
PI4uM76h9TzgNgGd/dmU9pHyhQDDpKX3A6DR29UX0LhuRZmSkzWp8MGZ6gjzotkW
rZs8X1cy2ZLLiMrFMtvD
=J/Q1
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
