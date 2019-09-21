From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/2] net: stmmac: Enhanced addressing mode for DWMAC
 4.10
Date: Sat, 21 Sep 2019 03:35:37 +0200
Message-ID: <20190921013537.GC86019@mithrandir>
References: <20190920170036.22610-1-thierry.reding@gmail.com>
 <fa2fafac-f193-3cef-666a-767859d41f91@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fa2fafac-f193-3cef-666a-767859d41f91@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 10:02:28AM -0700, Florian Fainelli wrote:
> On 9/20/19 10:00 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The DWMAC 4.10 supports the same enhanced addressing mode as later
> > generations. Parse this capability from the hardware feature registers
> > and set the EAME (Enhanced Addressing Mode Enable) bit when necessary.
>=20
> Do you think these two patches should have companion Fixes: tag? They
> are definitively bug fixes, but maybe you would also want those to be
> back ported to -stable trees?

I wouldn't really consider these bug fixes. They're more along the lines
of feature additions. The driver previously didn't support EAME and that
was fine. The fact that it never worked under specific circumstances is
not a bug or regression, really.

Thierry

> > Thierry Reding (2):
> >   net: stmmac: Only enable enhanced addressing mode when needed
> >   net: stmmac: Support enhanced addressing mode for DWMAC 4.10
> >=20
> >  drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  1 +
> >  .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  4 ++--
> >  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 22 +++++++++++++++++++
> >  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  3 +++
> >  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  5 ++++-
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++
> >  include/linux/stmmac.h                        |  1 +
> >  7 files changed, 39 insertions(+), 3 deletions(-)
> >=20
>=20
>=20
> --=20
> Florian

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2FfmYACgkQ3SOs138+
s6FseQ/+KuW4pJjrgxcRnR7eVA3n7gakuqezBPcH1vTtwGh9sQlShZa1WatorptO
SA4Y7Raxod4Ed4cSsIE8WO6e2EA3EO9cPNqAzpw+Cdf5/AzcT0X1QZ7/3h6pJJXR
PGh3ZvdrSSskL4M389UIKLzM4Z/2AHmQBWZbhJCKGux5TQ+B2S05TWxhotjUNqC8
r8fDMb19ECYlUA7IVSt23oQ1DqFN5vYzUpwPbCBZt3FN4v9/K5npkdLIiFL4jtZp
O2645NSIBK3mGC+C163VHB5BUlQrcxmWTkB4Cb8RzfoJ/6zuv848+c29UQKcj0Pc
l+dxKaYVty+GYfI2JEhmmsRI9/ZgLzhO56rQchjS4Itm3bff/RPAynuTvl9AUSpA
naFKBab95eg7Y1tHN6+VhuGU/vHwVLocssWfvZ5F10SdpjOaKzoaz7Kqj9EwtrzU
0jOINKrcrWYHYiPFrvfXjwSpIQugZeYAr3aFj7UASfc0drWgGK3OFqYfPHUbvLYH
dhrj+0uiKJKMgjzA6/c23SEmKjrVnobRY5GgKBNiATywD/iVM35XN64XPtfij+GK
7/iqK/VfxWl9e4VCWnX51YI82+uiz8fFPHKjo94lxBtuz3LWTirg7Ag/iy05Ins7
rRcotpiMGP429kEhwCbBhEFDrpLruC5pIFO7IGYjtCQIzu3Dz/E=
=FbkH
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
