From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Support enhanced addressing
 mode for DWMAC 4.10
Date: Mon, 9 Sep 2019 17:08:46 +0200
Message-ID: <20190909150846.GA27056@ulmo>
References: <20190909123627.29928-1-thierry.reding@gmail.com>
 <20190909123627.29928-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190909123627.29928-2-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2019 at 02:36:27PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The address width of the controller can be read from hardware feature
> registers much like on XGMAC. Add support for parsing the ADDR64 field
> so that the DMA mask can be set accordingly.
>=20
> This avoids getting swiotlb involved for DMA on Tegra186 and later.
>=20
> Also make sure that the upper 32 bits of the DMA address are written to
> the DMA descriptors when enhanced addressing mode is used.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  1 +
>  .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  4 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 20 +++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  1 +
>  4 files changed, 24 insertions(+), 2 deletions(-)

I just ran into a case where this is not enough. The problem is that the
driver not only doesn't fill in the upper 32 bits of the DMA address in
the descriptors, it also doesn't program the upper 32 bits of the DMA
address of the descriptors when initializing the channels. I'll update
the patch for that case as well.

Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl12avoACgkQ3SOs138+
s6HKiw//TWM7ZrQDzc7XyoxuJLTo+cDwrkPcfuhx7j7KcMxyjDbUv1HqMhzxrs+Q
iHgY3b2d3LubovfTDeEq+N1uDfFsv6T+dNQg7FVo7lFsRbEnwdt8bwQrvDsfVjCD
e9aAPCp1tazMPiMLGvTpKyH/yLz6VECXcYNUH/bT/sp86NstNlmTatU10pyZC0sd
JIAKcIUesQMZVwwObof1C3Y0XMuMuTnVu0PP6hVqxe19ajV++jDylqBNq1kanbHM
GQTZoVy3ax/xwZM+RfQF6OO8bUfcDR4TRzjVEeksBCK6rMG4FLBnihHWDejN7f0N
WwBUlNGB+y1Mpfm5Dg5lao+SyyhGFPLQyHKaemxAWRWMXQeo21A+hOXGd29wwkec
4nwIeIj5YSLzN/xGel4+aJz8awfrAq+9ufCKPgz1zalXMbgq7uqY05jyiGzgqmEZ
UIEj5iNCHnZcCDpzxspLGD1mtmIGC90zwdSayLvKrTjVj0wtjkuwHsg5AYe7aqxT
ChEYn11wD088dLymiO70+r8puQR/YdHvdBNxOe2KMA4p6P/JEujUTG1IBYeH0x+H
ii2vhX4hMJFp8T19Tqntfpt0YNhny9thbFfybokv4NyaIPG4QNWLB9ZioO1SzcO0
yM33lw0ZFBc9pF6Fny2z9u7pyfCrFap3fSbynCZxBe9WNg/o4OM=
=EFgV
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
