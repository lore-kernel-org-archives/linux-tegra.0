From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/6] gpio: gpio-tegra: simplify getting .driver_data
Date: Mon, 22 Oct 2018 10:01:50 +0200
Message-ID: <20181022080150.GA3620@ulmo>
References: <20181021200002.1472-1-wsa+renesas@sang-engineering.com>
 <20181021200002.1472-6-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181021200002.1472-6-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 21, 2018 at 10:00:00PM +0200, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Build tested only. buildbot is happy.
>=20
>  drivers/gpio/gpio-tegra.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvNg+sACgkQ3SOs138+
s6HO3hAAp2ajg6Q+V/KuVKnYNlR0s50A+tJvu3lYFZrpDkkYBquJ9XI+35g1THdS
fBG1mwfVp5JpJ2FRLNuFpHo0gR8b+D2ef05a+2Ywni2vbLguAqvIw92b3Nlo1bCA
E4rJJBLsKZPt2FH0RLxkrQOzIiJ7YRxLaOVyiAy36eCQBAPGnHrrrXY0WZGbsDyv
5uN7/Q8Mt1h4SB85QVdou0DHydrfI+9HGqymrDeiX5XWZg7Hj8L2nXOBrqVgxFyI
TQoIxr98RkfN6Y+x+Vi3N890vaATHzf2egHkC1+LQqOKyWvrcodRbkOISTP7YX+f
0FeUhvcMjKuEw1gDxLVoHrnPHcun71J5r0Ycw0RywjYqLGEq2ODaJV+jhLlMTQ4S
YBCNBdEP7sJJJtpT5Ntw+3adsmEboVqqAXw2Zng9N9gi8Gdrf5Vmd0t3lttt/OMR
vqvjE6fzjOTcjW/hDX0UMTWc5OyFc59NVGbLZZ6n2uQVYuXhAeWLoGualjjhKqew
toa8Ipd6rQ+ur6JLinSWVJKn3q+lhcF5W3CBfnnn0obS8+f9gec7IqBWl+bh8zqw
Vd+reN252gjEhxXMasadvO5NMXP5sHa/djdGBRz4cszr2vaDVb8F/nUED8j3G9zf
+FtjMjSygcd/qvHupBBJoN8lWXEblvjLuRy/kph1EUARIO60SpA=
=kBfA
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
