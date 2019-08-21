From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH][next] PCI: tegra: tegra194: fix phy_count less than zero
 check
Date: Wed, 21 Aug 2019 14:43:37 +0200
Message-ID: <20190821124337.GB21839@ulmo>
References: <20190821120123.14223-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821120123.14223-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Vidya Sagar <vidyas@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2019 at 01:01:23PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The check for pcie->phy_count < 0 is always false because phy_count
> is an unsigned int and can never be less than zero. Fix this by
> assigning ret to the return from of_property_count_strings and
> checking if this is less than zero instead.
>=20
> Addresses-Coverity: ("Dead code")
> Fixes: 6404441c8e13 ("PCI: tegra: Add Tegra194 PCIe support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Good catch!

Acked-by: Thierry Reding <treding@nvidia.com>

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1dPHIACgkQ3SOs138+
s6Ho9xAAwUKuZi8iVfSdVTIm8t3Z0hjhCUBry2XL8mKbnYiq3Bb7U6+PwonQ34xY
EEY29C7cEjDhFWugnN1kS5unXAYdPZRu1VC6E89/rBkFOLogQcBBl4X1b/ziGEkC
zq3J5xkmakn/8O2vxvvEFFkYmXYdBZaEIG8kIg/by6ONb5wwIv/jzdIuhDhAAVSl
SikW0Gz2uDXiNev7cNnEFOgbGeAix9Y6w4nfAELuYn4kRLKul11avGyRf/t02FwB
vkyW5D3iyGTe5eJ9dANXIDVxUZhk8dy04X+rbs4q6Y+O3IYOE6dJ9K/8U9v2a6WM
U0uBDfrwsuDwOEyviarkQhaTin+51wbdx9dv7cgIaELb66pm6wq08IYKORPBe2J/
YAQxxlzjwlcLUZ2eHv1XH4Ra5mxdK3wWwO31WHB9/gIMsQgRhVF8aywjewYesJje
6AQcE7WvPcw3quTEiln1muXbJRDJY0zxBGDMdhB90x0n/60afHPwSNvlIzTJtQ6u
jHbKgfw1/ay4A9TY3O8KW8AdVWZLP/5qKQF4uvjapwNRWBHKwHQ7DFJGD/aUTWrz
EZL06MO809iUSFjS63LJo+oLhWs+g7gvzH4NSZchHJsuT86rS8qUQH8P9z2dLYlO
/PmMNaOcASfxYT2vMskY9xKO6Dq7PV7SFNe2DKRQpsRQj4swqN8=
=JGRC
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
