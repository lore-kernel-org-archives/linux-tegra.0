From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V10 15/15] arm64: Add Tegra194 PCIe driver to defconfig
Date: Thu, 20 Jun 2019 13:03:14 +0200
Message-ID: <20190620110314.GC15892@ulmo>
References: <20190612095339.20118-1-vidyas@nvidia.com>
 <20190612095339.20118-16-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190612095339.20118-16-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2019 at 03:23:39PM +0530, Vidya Sagar wrote:
> Add PCIe host controller driver for DesignWare core based
> PCIe controller IP present in Tegra194.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v9]:
> * None
>=20
> Changes since [v8]:
> * None
>=20
> Changes since [v7]:
> * None
>=20
> Changes since [v6]:
> * None
>=20
> Changes since [v5]:
> * None
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * None
>=20
> Changes since [v1]:
> * Changed CONFIG_PCIE_TEGRA194 from 'y' to 'm'
>=20
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.3/arm64/defconfig, thanks.

Thierry

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index bb0705e1f52e..6462a4dbac87 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -192,6 +192,7 @@ CONFIG_PCIE_QCOM=3Dy
>  CONFIG_PCIE_ARMADA_8K=3Dy
>  CONFIG_PCIE_KIRIN=3Dy
>  CONFIG_PCIE_HISI_STB=3Dy
> +CONFIG_PCIE_TEGRA194=3Dm
>  CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
>  CONFIG_DEVTMPFS=3Dy
>  CONFIG_DEVTMPFS_MOUNT=3Dy
> --=20
> 2.17.1
>=20

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LZ/IACgkQ3SOs138+
s6HnVQ//V0AiVK2T4Zt26dMdZRhdje5rcfQvqSvS26yAWlB19a4K+KnSpeO7nTt8
i6xPCg/PJR7n4dZixeneI2T9CbseVldNr3S1pYDhZkauq6BjAdC83QHLsp9Qi7tX
DEFCr7Q7S5Kydzm2qWiHqEH0RkU4uS3aHLYqmQgjwegLS70jCaQZ6YKbgOcPbukl
O8+1Dh62jUJWf4aQrk2td+MtfjSkY3/w+J/ath9tZ2mUgyU3DnLXcX8bl2p2iL3e
v/fxv6TunUNh4qfxNoPxe+RKYV58eYgYdTx4/iYWWBvmuqGGfDsPibgO/PB2aueu
7GZu7HlOyAww4ZZyJZq+V59eusRVVdfOmBYNH0V7s4cZ5uylcXjo0OyVxcPaLagc
+4QAQvFvffG8dJ/EtbECoLMp2Yztw1Uq1SVLnt8MBod7DbAYL022NVBIjMB86lLj
JiWpkweF8hOdUS1adn+j5gsgRVBMR62wBKtkQ8qYx8f4pX0Vl1VEIY2ZnEq44Q7E
e1uqUuVaLcwszTaFO+CEsPDrdvWqUKyu8F01G+Qx+xC8rgh/g6b8AqDNK/y/x1q9
z+3DzwdYbUtxw9G2iL4jk76dNnJnGDAKKiDeEmxeO1qYsxEIHdBgySs/eNHvdoRh
Z1TuJN879ifWwPHgEOB95zZ8Ed5CByYQXa+JT+eDqZuumu8eU2w=
=BWCx
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
