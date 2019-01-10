From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V5] i2c: tegra: Fix Maximum transfer size
Date: Fri, 11 Jan 2019 00:16:13 +0100
Message-ID: <20190110231613.GB3628@kunai>
References: <1546984750-26199-1-git-send-email-skomatineni@nvidia.com>
 <1546984750-26199-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546984750-26199-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2019 at 01:59:10PM -0800, Sowjanya Komatineni wrote:
> Tegra194 supports maximum 64K Bytes transfer per packet.
> Tegra186 and prior supports maximum 4K Bytes transfer per packet.
>=20
> This patch fixes this payload difference between Tegra194 and prior
> tegra chipsets using separate i2c_adapter_quirks.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-current, thanks!


--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlw30j0ACgkQFA3kzBSg
KbZUVg/9G5lAXsj4CaV1xLaAGyJuzOCt5aJw2DjO984npBoR8hNWCaBIzB0VDlG6
efDxcc+blmRuH31HXdQpdLAc+cypVXdhTVWPtaDHYl+veuw5pDuzKtq0DYmX6cfP
vjqV01k11g8y4GwmgpqXJzgIcNgMh3cv8VP7ID1zQEIt3wHWSkohhfk+Q+dLz5Ux
M53fix0OLM3pktpijSZS7FT5whVsfuijTCGqa8lpi0Rd655z5+ef4kr/e/5c5iOY
e/9cNWPsngZPRGiLQhI9KfYthe+XYHXCr4rsYti0D3ptgMGAcyfa876ZnixAEo78
JN+VUgm4IARs3Fm5zVXHC7Zj87wLvNCUKuNwygbakGwIx77SkunOPr4ph6+vKrjB
abK7rgmG0udlHGbdMyF9Pq7DYc6xLZcUSo1hYBnIJWeopcNUaIKsPnN67NA4K+rn
sq7/x61z083hAr2c6By4m623/XnEylN6jCbd0z0XnGW84nRUvm8OjO1AFCF95mxW
u/+Vm923uUqRvAiBKFHYM/YItrvicO11MRaIyO5cc5OU4qYi3qDQjA8JHjvtfnbN
ycbQXrQ6GpK4nhVWYLTaJ/PMqvrgCovARz5I6MYpIKVXrXjtksmvtRfSeFlVPeqv
7v4y8A/MAUIJESx12g+FEMuyhTWXR7Ou/+CHxPp0hVJ6sATvZBk=
=fJ7V
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
