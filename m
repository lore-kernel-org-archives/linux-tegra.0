From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 02/18] pinctrl: tegra: add suspend and resume support
Date: Wed, 26 Jun 2019 12:08:56 +0200
Message-ID: <20190626100856.GB6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561345379-2429-3-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:43PM -0700, Sowjanya Komatineni wrote:
> This patch adds support for Tegra pinctrl driver suspend and resume.
>=20
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 47 ++++++++++++++++++++++++++=
++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  4 +++
>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  6 ++++
>  3 files changed, 57 insertions(+)

With Dmitry's comments addressed, this is:

Acked-by: Thierry Reding <treding@nvidia.com>

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TRDUACgkQ3SOs138+
s6GvzxAAiFH/gYSVcwCuGy396VD5pJeLGEfJDzcnWqlSTP7KjyLuPUbzCaT79xLd
d3YULAplbjAKrhKnlWQJdI/8yFkOUB8fVsj1Dsxw6uMsPvh9UeRjGS7QV1a5ophH
xLTPD3WuXqY8BHmQ2uTQ8gTGq2/6JT3F+wNl/Uv7jj3i0EieUo0/o1nvUhkX6obL
hW1quyskaRdTtJDGlGwOqbV/eqCSoW1nRoCGHL/4JTcuVa6hovz86g0jgl2ugMxu
Rn2jHHHhVoq3WA856YGzSGn453Oj7ddh1gCX8ZG0NfjA2JfBLjb6s1EB35FNtot/
jI68p7QZV0AVwE4CFjEy4Dc7YUP/I8xQvwOeaFu3/++v6EPckyNP00grYhsf42GW
oZQoQ0LgyCL1BGzxfD3AoioDVIxqtI4H8jCObu1Hond7B+4FI+mXa+SGf+vm25y4
doXsqjgv4Nu1QkFd+xToWK1irVnQoXYIYsub96XnX6+AsPb6EOB50rtl6zXfCzZn
ZWa8KCk00T/ur2CI2Sk12rHxlQ0nA9IDq2eFeEuQwz3O2R6+ZUwISeLLRvI1bGji
dhwO65R/a9FQc5PM0tzkrfhoxKatl/vVxmBFIeEIVpFBhaJ7rA1HlPoscQQ5J50C
lv+T2xtIODfuEchmgf4tZc4QMnZ8gw1UG+2n71EZZRX3qp5QQ6s=
=iW3N
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
