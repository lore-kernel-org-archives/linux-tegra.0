From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: RE: [PATCH V3 06/16] PCI: dwc: Add ext config space capability
 search API
Date: Wed, 17 Apr 2019 09:27:59 +0000
Message-ID: <305100E33629484CBB767107E4246BBB0A22C0A7@de02wembxa.internal.synopsys.com>
References: <20190416192730.15681-1-vidyas@nvidia.com>
 <20190416192730.15681-7-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416192730.15681-7-vidyas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "kishon@ti.com" <kishon@ti.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>
Cc: "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kthota@nvidia.com" <kthota@nvidia.com>, "mmaddireddy@nvidia.com" <mmaddireddy@nvidia.com>, "sagar.tv@gmail.com" <sagar.tv@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 16, 2019 at 20:27:20, Vidya Sagar <vidyas@nvidia.com> wrote:

> Add extended configuration space capability search API using struct dw_pc=
ie *
> pointer
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes from [v2]:
> * None
>=20
> Changes from [v1]:
> * This is a new patch in v2 series
>=20
>  drivers/pci/controller/dwc/pcie-designware.c | 41 ++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>  2 files changed, 42 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/c=
ontroller/dwc/pcie-designware.c
> index d68c123e409c..44c0ba078452 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -53,6 +53,47 @@ u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap=
)
>  	return __dw_pcie_find_next_cap(pci, next_cap_ptr, cap);
>  }
> =20
> +static int dw_pcie_find_next_ext_capability(struct dw_pcie *pci, int sta=
rt,
> +					    int cap)
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
> index 4ccd4c706ddb..fa41d675c48f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -248,6 +248,7 @@ struct dw_pcie {
>  		container_of((endpoint), struct dw_pcie, ep)
> =20
>  u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
> +int dw_pcie_find_ext_capability(struct dw_pcie *pci, int cap);
> =20
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val);
>  int dw_pcie_write(void __iomem *addr, int size, u32 val);
> --=20
> 2.17.1

This ext capability function is aimed to be used by the EP also?
