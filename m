From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: RE: [PATCH V3 05/16] PCI: dwc: Move config space capability search
 API
Date: Wed, 17 Apr 2019 09:28:58 +0000
Message-ID: <305100E33629484CBB767107E4246BBB0A22C0BB@de02wembxa.internal.synopsys.com>
References: <20190416192730.15681-1-vidyas@nvidia.com>
 <20190416192730.15681-6-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416192730.15681-6-vidyas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "kishon@ti.com" <kishon@ti.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>
Cc: "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kthota@nvidia.com" <kthota@nvidia.com>, "mmaddireddy@nvidia.com" <mmaddireddy@nvidia.com>, "sagar.tv@gmail.com" <sagar.tv@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 16, 2019 at 20:27:19, Vidya Sagar <vidyas@nvidia.com> wrote:

> move PCIe config space capability search API to common designware file
s/designware/DesignWare
> as this can be used by both host and ep mode codes.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes from [v2]:
> * None
>=20
> Changes from [v1]:
> * Removed dw_pcie_find_next_ext_capability() API from here and made a
>   separate patch for that
>=20
>  .../pci/controller/dwc/pcie-designware-ep.c   | 37 +------------------
>  drivers/pci/controller/dwc/pcie-designware.c  | 33 +++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h  |  2 +
>  3 files changed, 37 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pc=
i/controller/dwc/pcie-designware-ep.c
> index 24f5a775ad34..b9d9c9a4ba6d 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -40,39 +40,6 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pc=
i_barno bar)
>  	__dw_pcie_ep_reset_bar(pci, bar, 0);
>  }
> =20
> -static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
> -			      u8 cap)
> -{
> -	u8 cap_id, next_cap_ptr;
> -	u16 reg;
> -
> -	reg =3D dw_pcie_readw_dbi(pci, cap_ptr);
> -	next_cap_ptr =3D (reg & 0xff00) >> 8;
> -	cap_id =3D (reg & 0x00ff);
> -
> -	if (!next_cap_ptr || cap_id > PCI_CAP_ID_MAX)
> -		return 0;
> -
> -	if (cap_id =3D=3D cap)
> -		return cap_ptr;
> -
> -	return __dw_pcie_ep_find_next_cap(pci, next_cap_ptr, cap);
> -}
> -
> -static u8 dw_pcie_ep_find_capability(struct dw_pcie *pci, u8 cap)
> -{
> -	u8 next_cap_ptr;
> -	u16 reg;
> -
> -	reg =3D dw_pcie_readw_dbi(pci, PCI_CAPABILITY_LIST);
> -	next_cap_ptr =3D (reg & 0x00ff);
> -
> -	if (!next_cap_ptr)
> -		return 0;
> -
> -	return __dw_pcie_ep_find_next_cap(pci, next_cap_ptr, cap);
> -}
> -
>  static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
>  				   struct pci_epf_header *hdr)
>  {
> @@ -591,9 +558,9 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		dev_err(dev, "Failed to reserve memory for MSI/MSI-X\n");
>  		return -ENOMEM;
>  	}
> -	ep->msi_cap =3D dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSI);
> +	ep->msi_cap =3D dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
> =20
> -	ep->msix_cap =3D dw_pcie_ep_find_capability(pci, PCI_CAP_ID_MSIX);
> +	ep->msix_cap =3D dw_pcie_find_capability(pci, PCI_CAP_ID_MSIX);
> =20
>  	dw_pcie_setup(pci);
> =20
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/c=
ontroller/dwc/pcie-designware.c
> index f98e2f284ae1..d68c123e409c 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -20,6 +20,39 @@
>  #define PCIE_PHY_DEBUG_R1_LINK_UP	(0x1 << 4)
>  #define PCIE_PHY_DEBUG_R1_LINK_IN_TRAINING	(0x1 << 29)
> =20
> +static u8 __dw_pcie_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
> +				  u8 cap)
> +{
> +	u8 cap_id, next_cap_ptr;
> +	u16 reg;
> +
> +	reg =3D dw_pcie_readw_dbi(pci, cap_ptr);
> +	next_cap_ptr =3D (reg & 0xff00) >> 8;
> +	cap_id =3D (reg & 0x00ff);
> +
> +	if (!next_cap_ptr || cap_id > PCI_CAP_ID_MAX)
> +		return 0;
> +
> +	if (cap_id =3D=3D cap)
> +		return cap_ptr;
> +
> +	return __dw_pcie_find_next_cap(pci, next_cap_ptr, cap);
> +}
> +
> +u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap)
> +{
> +	u8 next_cap_ptr;
> +	u16 reg;
> +
> +	reg =3D dw_pcie_readw_dbi(pci, PCI_CAPABILITY_LIST);
> +	next_cap_ptr =3D (reg & 0x00ff);
> +
> +	if (!next_cap_ptr)
> +		return 0;
> +
> +	return __dw_pcie_find_next_cap(pci, next_cap_ptr, cap);
> +}
> +
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val)
>  {
>  	if (!IS_ALIGNED((uintptr_t)addr, size)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/c=
ontroller/dwc/pcie-designware.h
> index 86df36701a37..4ccd4c706ddb 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -247,6 +247,8 @@ struct dw_pcie {
>  #define to_dw_pcie_from_ep(endpoint)   \
>  		container_of((endpoint), struct dw_pcie, ep)
> =20
> +u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
> +
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val);
>  int dw_pcie_write(void __iomem *addr, int size, u32 val);
> =20
> --=20
> 2.17.1

With the replacement, you have my ack:

Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

Thanks,
Gustavo
