From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 05/15] PCI: dwc: Add ext config space capability
 search API
Date: Tue, 21 May 2019 12:36:29 +0200
Message-ID: <20190521103629.GE29166@ulmo>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-6-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517123846.3708-6-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 06:08:36PM +0530, Vidya Sagar wrote:
> Add extended configuration space capability search API using struct dw_pc=
ie *
> pointer
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
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
> * This is a new patch in v2 series
>=20
>  drivers/pci/controller/dwc/pcie-designware.c | 41 ++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>  2 files changed, 42 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/c=
ontroller/dwc/pcie-designware.c
> index 8f53ce63d17e..3b7d50888caa 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -54,6 +54,47 @@ u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_find_capability);
> =20
> +static int dw_pcie_find_next_ext_capability(struct dw_pcie *pci, int sta=
rt,
> +					    int cap)

Perhaps make this more consistent with the existing regular
configuration space capability search API? Something like this perhaps:

	static u16 dw_pcie_find_next_ext_capability(struct dw_pcie *pci,
						    u16 start, u8 cap)

? I guess your variant above is consistent with the existing generic
capability search API, so another alternative might be to make the old
dw_pcie_find_capability() API consistent with everything else. It's
confusing if we keep having to jump between the two variants.

Thierry

> +{
> +	u32 header;
> +	int ttl;
> +	int pos =3D PCI_CFG_SPACE_SIZE;
> +
> +	/* minimum 8 bytes per capability */
> +	ttl =3D (PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) / 8;
> +
> +	if (start)
> +		pos =3D start;
> +
> +	header =3D dw_pcie_readl_dbi(pci, pos);
> +	/*
> +	 * If we have no capabilities, this is indicated by cap ID,
> +	 * cap version and next pointer all being 0.
> +	 */
> +	if (header =3D=3D 0)
> +		return 0;
> +
> +	while (ttl-- > 0) {
> +		if (PCI_EXT_CAP_ID(header) =3D=3D cap && pos !=3D start)
> +			return pos;
> +
> +		pos =3D PCI_EXT_CAP_NEXT(header);
> +		if (pos < PCI_CFG_SPACE_SIZE)
> +			break;
> +
> +		header =3D dw_pcie_readl_dbi(pci, pos);
> +	}
> +
> +	return 0;
> +}
> +
> +int dw_pcie_find_ext_capability(struct dw_pcie *pci, int cap)
> +{
> +	return dw_pcie_find_next_ext_capability(pci, 0, cap);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_find_ext_capability);
> +
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val)
>  {
>  	if (!IS_ALIGNED((uintptr_t)addr, size)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/c=
ontroller/dwc/pcie-designware.h
> index 6cb978132469..fff284098117 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -252,6 +252,7 @@ struct dw_pcie {
>  		container_of((endpoint), struct dw_pcie, ep)
> =20
>  u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
> +int dw_pcie_find_ext_capability(struct dw_pcie *pci, int cap);
> =20
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val);
>  int dw_pcie_write(void __iomem *addr, int size, u32 val);
> --=20
> 2.17.1
>=20

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzj1K0ACgkQ3SOs138+
s6HTgQ//aJr7a1P9iSYJK5pv2YoM6D33S9R3ezA6+xgoGLr8Kc0/or1z4iDwNpfh
u08lYHkPxU8cIl5I9LFY8gxFvQu1ZVm3P9PDhMeyiR6TXnTa7FPJT28xY/bTQzyY
g/Y6rkKxoN5V+ZQ/bRyzlbZIRKbQJtEXEs8AE859u/B3EGiBw2aEYJ22/TZfrfhM
CIHyXaQGrTevCcBoKYp4B+qiYOH9sxLBdlDe1v6ZDhG4ulPpxpIT6fT8yuVxZhs+
1hOIjVM5N9m8jI8t4ZCiN1Qen1xK2M/saa1y5+JJt6pssb7xUa3YjX4ESGSH68GX
3/jcqOLAnRk+ZXrRwxRSrZtyCmuX1P+clOTrVV2QCYbf0VYHFD0kz3AD4IJcPjZ/
pouAXmXETl2PQQJs/My08Dc5ICYba5+/JYKvxJL9kPXDsMyuTAahoSXuomu/TKIU
Qy8VtWwAxo4oPlKQDxiRir2Qrh85R7Yg7uqDBZ9+WdQRW1z9Y5JuQFrryHClssfl
6Lehxkw0YH4ubcZ0h+qWHPBE8nhIOHNtSv6rvgKd/A0mF97DaCKiqRx29VU+ywgh
bdfDqEjzUa6wNykNB6Iz8QT8J29ayymgxBcU1cJy9UDrf1t/jX3nt/7R7G9Yst1h
exQop1nRDInzw2kEnw17lfJjj12b7izfI/J12l/j0bK4Ay9InDc=
=4jiK
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--
