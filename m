From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH V4 06/16] PCI: dwc: Add ext config space capability
 search API
Date: Tue, 23 Apr 2019 15:35:02 -0500
Message-ID: <20190423203502.GE14616@google.com>
References: <20190423082730.370-1-vidyas@nvidia.com>
 <20190423082730.370-7-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190423082730.370-7-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 23, 2019 at 01:57:20PM +0530, Vidya Sagar wrote:
> Add extended configuration space capability search API using struct dw_pcie *
> pointer
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
> Changes from [v3]:
> * None
> 
> Changes from [v2]:
> * None
> 
> Changes from [v1]:
> * This is a new patch in v2 series
> 
>  drivers/pci/controller/dwc/pcie-designware.c | 41 ++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 6a98135244d6..ecf5fe8842f6 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -53,6 +53,47 @@ u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap)
>  	return __dw_pcie_find_next_cap(pci, next_cap_ptr, cap);
>  }
>  

Please make sure there's a comment here about why
pci_find_ext_capability() can't be used (a comment covering both this
and pci_find_capability() is fine, if the reason is the same).

> +static int dw_pcie_find_next_ext_capability(struct dw_pcie *pci, int start,
> +					    int cap)
> +{
> +	u32 header;
> +	int ttl;
> +	int pos = PCI_CFG_SPACE_SIZE;
> +
> +	/* minimum 8 bytes per capability */
> +	ttl = (PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) / 8;
> +
> +	if (start)
> +		pos = start;
> +
> +	header = dw_pcie_readl_dbi(pci, pos);
> +	/*
> +	 * If we have no capabilities, this is indicated by cap ID,
> +	 * cap version and next pointer all being 0.
> +	 */
> +	if (header == 0)
> +		return 0;
> +
> +	while (ttl-- > 0) {
> +		if (PCI_EXT_CAP_ID(header) == cap && pos != start)
> +			return pos;
> +
> +		pos = PCI_EXT_CAP_NEXT(header);
> +		if (pos < PCI_CFG_SPACE_SIZE)
> +			break;
> +
> +		header = dw_pcie_readl_dbi(pci, pos);
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
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 35160b4ce929..67307842e003 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -249,6 +249,7 @@ struct dw_pcie {
>  		container_of((endpoint), struct dw_pcie, ep)
>  
>  u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
> +int dw_pcie_find_ext_capability(struct dw_pcie *pci, int cap);
>  
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val);
>  int dw_pcie_write(void __iomem *addr, int size, u32 val);
> -- 
> 2.17.1
> 
