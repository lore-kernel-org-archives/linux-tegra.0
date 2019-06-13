From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 4/4] soc/tegra: select pinctrl for Tegra194
Date: Thu, 13 Jun 2019 10:47:36 +0200
Message-ID: <20190613084736.GA30664@ulmo>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
 <1558007594-14824-4-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558007594-14824-4-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: linus.walleij@linaro.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 05:23:14PM +0530, Krishna Yarlagadda wrote:
> Select PINCTRL_TEGRA194 by default for Tegra194 SOC needed
> for dynamically controlling PCIe pins
>=20
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  drivers/soc/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.3/soc, thanks.

Thierry

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0CDaUACgkQ3SOs138+
s6Gw+Q/9GEMCAGe1/osKqqMZNuojtuyy3aCNb+QVhJWlJVtLn/VtdBx0AqAuAf63
2HPt17CnmoqKcToQFlPHma+uC0BEiNuPx7E0dPLCddNI9JrNxqNuU7JaPN81WsXi
Spydy5O5ioyDK42BTkWtljUAVHT8KwUDuLDMlvoINV8pWGCRKmU6CuN4+7XraC5R
kZRutq0uc0bILzcVxVbzbe449ZF3y2aZyHdayaEYwPWmpN0JXWkmFIr093TWK7li
NE+KSHUQBxujoct5IkKzgDTHAHLn3edNlzxXDLM1aM3QVN1BIo0ADnybyyFBj69y
bhiOeczT5iI74h8cuNGf5BwCsgk2CgeQX4M3DpQMXHfdkZchqC/xTbSuafI9BiAS
X9sip1PaNzHJyPMrfefXtx2uZJFz8IU6LGUqKsOfomFS4JkvJ/DKJtBaTMU8C+yq
U2FCfMJfm79zUe1Gii2dHK2BCjj2Op8LRW3vKOP9B+qL+EIdBk75VxwbJABAI2ly
C7B2Rkjl4JZ/Q0Co8+vHQ6DSxjNPJB7xnaM0S4oF0TFz++ykcLrnEVZP5QsevWrk
Hjdysh9Od2rXOKhr3NlFHlarY8ZcvQGg2KTLiKpa4IOrC8MAKabs2AmKlsCjxA24
FgzBW5XkLVHGKkUy5SmJSgE2B2Xlb/k9denLDi1UotFiEAMBhZ8=
=7+8+
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
