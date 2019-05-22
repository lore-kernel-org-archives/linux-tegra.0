From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 08/12] soc/tegra: pmc: allow support for more tegra
 wake models
Date: Wed, 22 May 2019 15:02:35 +0200
Message-ID: <20190522130235.GK30938@ulmo>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
 <1558481483-22254-9-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="F55Y67F01HNW3AgB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558481483-22254-9-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--F55Y67F01HNW3AgB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 04:31:19PM -0700, Sowjanya Komatineni wrote:
> This patch allows to create separate irq_set_wake and irq_set_type
> implementations for different tegra designs PMC that has different
> wake models which require difference wake registers and different
> programming sequence.
>=20
> AOWAKE model support is available for Tegra186 and Tegra194 only
> and it resides within PMC and supports tiered wake architecture.
>=20
> Tegra210 and prior tegra designs uses PMC directly to receive wake
> events and coordinate the wake sequence.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)

One more thing...

> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 5648e5c09ef5..f77ce4b827e3 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -235,6 +235,8 @@ struct tegra_pmc_soc {
>  	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
>  				   struct device_node *np,
>  				   bool invert);
> +	int (*pmc_irq_set_wake)(struct irq_data *data, unsigned int on);
> +	int (*pmc_irq_set_type)(struct irq_data *data, unsigned int type);

=2E.. drop the pmc_ prefix here. These are part of a struct tegra_pmc_soc
structure, so that pmc_ is redundant.

Thierry

--F55Y67F01HNW3AgB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlSGsACgkQ3SOs138+
s6HxsxAAn4FIWyy16hYAw8H5oy8A4vJGWv2gUZTS5idKN2eKFrehhGUPdUkde3yg
zLfZM3pkzQ3vCHI6t9D3zBJv14CTwZjDCBXPSOCoiNDuy23YagCfpXAhqNz5hKOV
4iUTJNKGlHpLnNCG3WXRtzIJgbzNfN+bKuvHA1BuB+QLzejZfkMbS2BuW/Y43NxM
DX5zGG1VgCdDpX9vmSPYY2PvQdpjdXC/0JRYyOtK/3K4R8yb/oavoHIQoCBOyYN6
7PS6/jHI3gz5HI+nVcoYRTxfZ7RT/lbsATd8xKVlDpfYkKxSwOxFjzeHaBfs486N
PtP8CN0wfU5990qNERI3k1yf855GzH3+JwBiO5bV3QmpbNCCjm3+dMnmKKGBSXhs
ktiEkVwrhh75zMULkAkzvWEGbRp0/AM9gegASee6fbPgIr1X6Pctz1ss2MqRB0CI
u15VXwKSIl6JCQ0levuFkJM71GpAlW5jacRegl6+wUGgJh/YIjN4guV/2HJnaWdB
xrfD830h+fVSKHChbNRx02j5Y2x7/PnijTKLcjXIT6X5QBSeF3jB2ygXx+omcXuu
bcz/LG5gPXqe7nsmaaYwTWbrGa6qFqODT7bZdbooEWMmEQLV07zt2FPr1a7SSKrd
E2cGoh3GWoKQLcRc1W7qkLUusgIulOl1VjS1MThxutpHxc54fFs=
=I9/r
-----END PGP SIGNATURE-----

--F55Y67F01HNW3AgB--
