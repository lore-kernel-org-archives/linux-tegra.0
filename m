From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] uphy: handle utmipll iddq
Date: Mon, 20 Mar 2017 14:09:59 +0100
Message-ID: <20170320130959.GE22463@ulmo.ba.sec>
References: <1488295165-23975-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488295165-23975-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, BH Hsieh <bhsieh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 05:19:24PM +0200, Peter De Schrijver wrote:
> Export utmipll iddq functions. These will be needed when powergating the
> XUSB partition.
>=20
> Signed-off-by: BH Hsieh <bhsieh@nvidia.com>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 26 ++++++++++++++++++++++++++
>  include/linux/clk/tegra.h        |  2 ++
>  2 files changed, 28 insertions(+)

Applied to for-4.12/clk, thanks.

Thierry

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP1KcACgkQ3SOs138+
s6HVIRAAhN/tAXl54u5WBTAoW0bwZT7FEoexdKmnjnYZKfn7c7ugi9PzcpdsAkhU
f/DWkQ9JQ2Qu5rmACv0NSrZRtJhWRgU3ONqbSfp/91k4w+FPtY7VqBx8qYwD/k2t
IWPZcPoBi4aKO9GBLKsBFESNuZ9/sTJIOF6d8cxtup1WBibKhq8kcnExB79kLgCG
7nT10r3ekgZ2tJTtTkbjqbDq+StF1RzFMPx9acm32W87OUQ8VH6Xzb/ddV39i2OP
GwewYxcix6zwnXevSwx85YFrbPhBjzJ7dRO2FaoQLRx49A0LSXgGmDlfWHRA49sg
zOiayC4wrAshNOpFMRacEyI0kWLtcif3KLAf2nn+f35x8LyKKLSLF21nLDdtrnaO
6alEsUKn79vardkJoerVFyLchgvTnR6T9ZT0ROOIZc5d+JlIBRd1UHbAi5Z5zTPi
enHIkIa5cgvJQ/sa3HX55p3/S53USpnRGPR0gphbykqWKu/ABRGFJTKlU2KubZYh
qr0+YZBdNP7fBUoq5km5zw8wyrf6u+6ykIUimWKW3MkEiEqvNIYChOodGzpbTG3M
qcqYSghaN3f5FY4reLTluVTcB0u/tAdEYUSqSvhNQM9aUQ4aLCd9iN6pdWhTNYy0
IhAdX4C/cD7pJUPPtH8TdIP1BL/z8pDvWlRuapnZIDYKkg+JQb0=
=lFJa
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--
