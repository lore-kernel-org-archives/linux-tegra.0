From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 9/9] clk: tegra: pll: Fix PLLE SS coefficients val
Date: Mon, 25 Jan 2016 13:49:12 +0100
Message-ID: <20160125124912.GN20452@ulmo.nvidia.com>
References: <1452799602-14847-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MSd2ShuMixI0uVaZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452799602-14847-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Kuo <mkuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--MSd2ShuMixI0uVaZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:26:42PM -0500, Rhyland Klein wrote:
> From: Mark Kuo <mkuo@nvidia.com>
>=20
> The PLLE_SS_COEFFICIENTS_VAL should be different for Tegra210
> from Tegra114. Add SoC generation specific versions for Tegra114
> and Tegra210 and use those in their respective plle_enable functions.
>=20
> Signed-off-by: Mark Kuo <mkuo@nvidia.com>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--MSd2ShuMixI0uVaZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphnIAAoJEN0jrNd/PrOhS88P/3XCFntNJJQoOjfmcB8puJYf
DIZF3xO74Xa0EeBiupYV4IjdamD5hMYgrYrkcJHkctBDs5YgDQW8EN5OiYEceAxr
pqh/rRHyWaDmX9IIIfAbmPzJjgp8VyowJhyRg4ZgUFwcqJ304cOcJ+PNmCK+h0lm
Geih/7T/5M/I6T/Nuxpfac5jxpofkRAwIUBAURq7nHOe5ap8JQnSaxtc/wT9eifl
7pWki2EoZCxDWzjIj57JTMFL+W+NpST+ZewqIEyjsedbcxTdyC74255e1zp+MSuy
Y1Paz9G7zUApE/Yna/dHihpJu6hujw32rnTXJ1R6duaPErP5tj1sWiX1wmIxfno8
NHYKH8euXfyFsg/kohkahxWVapv/FvT+/Yo4RbwcCL/JuG0Ydaqa58Jg2pwLjcxm
6g1CKQllQeNT8N8ZGDwQ7zS1jaHsANvXj1JfD08COGjQiJ6UrSPVdZnTcsFw6CJ8
6R/xSmsNthp4yyNch5Fte+Rhl1dgRNVE35uqkkIQsOoIyBezyjb186nz/e3T0hNN
QbTE/Ul1MzNpe407YHEoZoINfvcJH6WfznweyB4IOJsHZjeGWu2mA4rYW1qlWClt
lAtlMtbnaSaaC4j8F9fKs1c76SxMEqHXU8HDDIjNn4I2PnnENsnqcc9d1xAhCHAy
YZY86LKoXrG8wNoqXETx
=2F+Y
-----END PGP SIGNATURE-----

--MSd2ShuMixI0uVaZ--
