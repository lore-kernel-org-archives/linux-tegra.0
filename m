From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V15 12/13] phy: tegra: Add PCIe PIPE2UPHY support
Date: Mon, 12 Aug 2019 12:23:00 +0200
Message-ID: <20190812102300.GM8903@ulmo>
References: <20190809044609.20401-1-vidyas@nvidia.com>
 <20190809044609.20401-13-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GeONROBiaq1zPAtT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809044609.20401-13-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--GeONROBiaq1zPAtT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 10:16:08AM +0530, Vidya Sagar wrote:
> Synopsys DesignWare core based PCIe controllers in Tegra 194 SoC interface
> with Universal PHY (UPHY) module through a PIPE2UPHY (P2U) module.
> For each PCIe lane of a controller, there is a P2U unit instantiated at
> hardware level. This driver provides support for the programming required
> for each P2U that is going to be used for a PCIe controller.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
> V15:
> * None
>=20
> V14:
> * None
>=20
> V13:
> * None
>=20
> V12:
> * None
>=20
> V11:
> * Replaced PTR_ERR_OR_ZERO() with PTR_ERR() as the check for zero is alre=
ady
>   present in the code.
>=20
> V10:
> * Used _relaxed() versions of readl() & writel()
>=20
> V9:
> * Made it dependent on ARCH_TEGRA_194_SOC directly instead of ARCH_TEGRA
>=20
> V8:
> * Changed P2U driver file name from pcie-p2u-tegra194.c to phy-tegra194-p=
2u.c
>=20
> V7:
> * None
>=20
> V6:
> * Addressed review comments from Thierry
>=20
> V5:
> * None
>=20
> V4:
> * Rebased on top of linux-next top of the tree
>=20
> V3:
> * Replaced spaces with tabs in Kconfig file
> * Sorted header file inclusion alphabetically
>=20
> V2:
> * Added COMPILE_TEST in Kconfig
> * Removed empty phy_ops implementations
> * Modified code according to DT documentation file modifications
>=20
>  drivers/phy/tegra/Kconfig            |   7 ++
>  drivers/phy/tegra/Makefile           |   1 +
>  drivers/phy/tegra/phy-tegra194-p2u.c | 120 +++++++++++++++++++++++++++
>  3 files changed, 128 insertions(+)
>  create mode 100644 drivers/phy/tegra/phy-tegra194-p2u.c

Acked-by: Thierry Reding <treding@nvidia.com>

--GeONROBiaq1zPAtT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RPgMACgkQ3SOs138+
s6G6QRAApZ8Wo+dLU8yIc2xUpt31Zb4Mt89cHlgrBXMadX3WQGRdKFxNtS63hucq
6bj/FGGojkXhuiFBY4vaRnhhWFEeUi8khH+gCiKHEq4f8ENNpPRF3nC11/ISDQlt
rYB0lB0edwd7ZVso8KVs8LAXPO/qg3hF2UsriGDYyHIzhgNrpAqGtue+RbgfoXic
uzcPDzhaXgcSls0JkMrQrqdb3I7dH/VrPXs4Y9FdbnHb4OaaSpDRiyR1M0e+j5Rs
uBA3+qz84CGVEzUCmLakD52NbtEW1SJj2x3LfKe2LzjlR03p8p8q0+L7UbCP3OdM
SNOB+VD+FCCQ2uH0aJMn1U4t/pAp16NuDSWlJxXXx8Pn/auq1nyYgluYyyArWNJO
K1Y93Tr3DmEwzv67v8nXQqP7nyFj/Rn0XapYHt9JmjpBsFuZC9vh9lJ+m0lplJir
LYFt0sZYyP/aYr6EmNwPE4fOsgW9++yXP68WqaS7YmL+Mr7Xek+ojJqi6t65J6K+
QxIczmLN+hnkAr8RDjO1f5fClz2pIJRCt//HVwk2nMAr6aiSf4oKg0dAoxOW1q04
7d5Mfcivnqus2gm2w2g4qtnUH1hQ4zxUjDMbaNsYJTxtjwnUS01lA8M2F1eJpqJX
yTihfhNjw1i2pqoK4FD694YSFT3e/4toB0LG86K4ej9qfFcHcqI=
=HGLV
-----END PGP SIGNATURE-----

--GeONROBiaq1zPAtT--
