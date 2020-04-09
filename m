From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] phy: tegra: fix USB dependencies
Date: Thu, 9 Apr 2020 15:24:35 +0200
Message-ID: <20200409132435.GA3263479@ulmo>
References: <20200408200828.124139-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200408200828.124139-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 10:08:14PM +0200, Arnd Bergmann wrote:
> Without CONFIG_USB_SUPPORT, we can get a couple of warnings for
> missing dependencies:
>=20
> WARNING: unmet direct dependencies detected for USB_PHY
>   Depends on [n]: USB_SUPPORT [=3Dn]
>   Selected by [m]:
>   - PHY_TEGRA_XUSB [=3Dm] && ARCH_TEGRA [=3Dy]
>=20
> WARNING: unmet direct dependencies detected for USB_CONN_GPIO
>   Depends on [n]: USB_SUPPORT [=3Dn] && GPIOLIB [=3Dy]
>   Selected by [m]:
>   - PHY_TEGRA_XUSB [=3Dm] && ARCH_TEGRA [=3Dy]
>=20
> Fixes: 6835bdc99580 ("phy: tegra: Select USB_PHY")
> Fixes: f67213cee2b3 ("phy: tegra: xusb: Add usb-role-switch support")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/phy/tegra/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I sent a similar patch a couple of days ago:

	http://patchwork.ozlabs.org/patch/1263865/

This should be applied by Greg on top of the PR that I sent for USB. I
did get the semi-automated "we're in the merge window" reply from Greg,
but I was under the impression that he still applied fixes during the
merge window. It seems like he didn't pick this up yet, though.

Greg, anything I should've done differently for you to notice this?

Thierry

> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> index a208aca4ba7b..4f8c61863411 100644
> --- a/drivers/phy/tegra/Kconfig
> +++ b/drivers/phy/tegra/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config PHY_TEGRA_XUSB
>  	tristate "NVIDIA Tegra XUSB pad controller driver"
> -	depends on ARCH_TEGRA
> +	depends on ARCH_TEGRA && USB_SUPPORT
>  	select USB_CONN_GPIO
>  	select USB_PHY
>  	help
> --=20
> 2.26.0
>=20

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6PIhAACgkQ3SOs138+
s6E8iw//Y9WWnboPxDt/ZMifr8p+Redn8CloOlGCXq6Howr3MxpgVeSK1Zbn5hMN
CmLozFxfT9CCQ1QLFZWsBJB7xlZ4rVWKWNTlkWuAO8nW1R2nXlE6rLyd4z6/M63P
31f9MgD1fcBcr7y3bfus6MXwfWvwaMJV6VQPi2Kcvk5VIiJDCMZkA8zgHikcxlzh
0OBBpzIViwSvclojJP8XaF7DqXz76fhfzNaPyDFlu3H3fDu5/KxMZ4O8bv0v+N2L
KR7XAlLNfbUsLk28NvCddpmkByCOsD2yhvdasuEeAb4Tb+tDSc8NYauwISjKgYAh
ifpC/+YudVHCVdiJ7hlv/zyL/R7YrQtyxoPSXXLoot6HIz1jSJK361uaPJy1lJ3Z
dkVKxfE1F9vI2zCy6NJZ2dhBgHm1jjaP6P863xPZXOJxO5qMriHxvN+UsBa6Uyvp
e9FzjNMmVkKkkwMISJBvLWRUH6+lykFPNvVR4rsTUZPmMLqS68VhC2bCDFU5BVsZ
3jdegKdz8OKxLN7cCnQHSp0MhS12RqKia9fH9Nir3bmdnwpYiHEVxoNBP9ZWuuZX
Db26zPPhWokIDHJEcIWIrOWrjbTL9GokUW0WIUpck4u1tnJRqr7S27rDMEK/PK9W
6vqSi4uYf9xt1RiJDmp6c0VgcfkCBE0n8v3POT4bp+rvIF9gyhE=
=3Kkl
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
