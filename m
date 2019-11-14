From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: divider: Check UART's divider enable-bit
 state on rate's recalculation
Date: Thu, 14 Nov 2019 12:54:24 +0100
Message-ID: <20191114115424.GB5690@aiwendil>
References: <20191030004813.9187-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191030004813.9187-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 03:48:13AM +0300, Dmitry Osipenko wrote:
> UART clock is divided using divisor values from DLM/DLL registers when
> enable-bit is unset in clk register and clk's divider configuration isn't
> taken onto account in this case. This doesn't cause any problems, but
> let's add a check for the divider's enable-bit state, for consistency.
>=20
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v2: In the comment to v1 Peter De Schrijver pointed out that UART's DLM/D=
LL
>     registers configuration is used when enable bit is unset, thus the
>     commit's title and message are changed accordingly.
>=20
>  drivers/clk/tegra/clk-divider.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Stephen, feel free to apply this on top of the Tegra pull requests:

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divi=
der.c
> index e76731fb7d69..f33c19045386 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -40,8 +40,13 @@ static unsigned long clk_frac_div_recalc_rate(struct c=
lk_hw *hw,
>  	int div, mul;
>  	u64 rate =3D parent_rate;
> =20
> -	reg =3D readl_relaxed(divider->reg) >> divider->shift;
> -	div =3D reg & div_mask(divider);
> +	reg =3D readl_relaxed(divider->reg);
> +
> +	if ((divider->flags & TEGRA_DIVIDER_UART) &&
> +	    !(reg & PERIPH_CLK_UART_DIV_ENB))
> +		return rate;
> +
> +	div =3D (reg >> divider->shift) & div_mask(divider);
> =20
>  	mul =3D get_mul(divider);
>  	div +=3D mul;
> --=20
> 2.23.0
>=20

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3NQHAACgkQ3SOs138+
s6HdixAAl5ejIwhvheyL/qCf0ZUiB15Q+IG8wHI93w7Rw9zWlCXitzl7ST4MQSwS
n3rUZWw3wymfL0Oybfoz1Yv7B1Ei7hoQBRPtIP2r6yMqgLQv+0wCOtjlZr3jWKKI
k3Ik4MHg3VN9WDEukbd1E8VCFEzUaWwFVVuX4XJzDuuPAWIrtHmLq/zg4y7mWyt3
qKnS/JFhJJWWPotHklgj8yYlNrWpgkWRwlyIHmrMtB+mpFyLJKPvN8v8skIBfA5F
Dkp7kTxrff3cOdoHLze/MmlMOqJMKC0aIKhKFdU00cMi/g0BTHOFd446ydj1u46V
3d7H9PdM4MV9tdJNLOjZ7fooZMw8vB2dvEshow5O57Ko88yK0ogl9P7uVCPVb6Dx
sBVMCmiO6owglBtxWfh7SukaiJCc5S9czdaiPKmi3DRo0YOwP1rRqdQXVCOSsFDV
4CIESHrk2/2d6eNf87xvuDsFiiGvKrKjBgPDCKVj73/4clgmDA44r66U8JyFgoOn
HthcN5IJvyAh5+5Q7vn+ovAnR/yT6NWR9h+21sXA+rpaM/yeyoUZJRhFoQWvyj19
QMTiZuKBtfbYUuL0/w4u0At66kud3TzMuGw2bIamY3CdOzDrEUS66XjuM9urpn2B
lBWDc32/JLzi8lhfHIv8D0EesNsHGQLHgRUUDMQBojqPEMECj30=
=2lWh
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
