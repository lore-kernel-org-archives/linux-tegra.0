From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH V6 02/15] PCI/PME: Export pcie_pme_disable_msi() &
 pcie_pme_no_msi() APIs
Date: Thu, 16 May 2019 08:28:07 -0500
Message-ID: <20190516132807.GB101793@google.com>
References: <20190513050626.14991-1-vidyas@nvidia.com>
 <20190513050626.14991-3-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190513050626.14991-3-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Mon, May 13, 2019 at 10:36:13AM +0530, Vidya Sagar wrote:
> Export pcie_pme_disable_msi() & pcie_pme_no_msi() APIs to enable drivers
> using these APIs be able to build as loadable modules.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>

Nak, as-is.

1) The argument for why this is needed is unconvincing.  If device
advertises MSI support, we should be able to use it.

2) If it turns out we really need this, it should be some sort of
per-device setting rather than a global thing like this.

> ---
> Changes since [v5]:
> * Corrected inline implementation of pcie_pme_no_msi() API
> 
> Changes since [v4]:
> * None
> 
> Changes since [v3]:
> * None
> 
> Changes since [v2]:
> * Exported pcie_pme_no_msi() API after making pcie_pme_msi_disabled a static
> 
> Changes since [v1]:
> * This is a new patch in v2 series
> 
>  drivers/pci/pcie/pme.c     | 14 +++++++++++++-
>  drivers/pci/pcie/portdrv.h | 14 ++------------
>  2 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
> index 54d593d10396..d5e0ea4a62fc 100644
> --- a/drivers/pci/pcie/pme.c
> +++ b/drivers/pci/pcie/pme.c
> @@ -25,7 +25,19 @@
>   * that using MSI for PCIe PME signaling doesn't play well with PCIe PME-based
>   * wake-up from system sleep states.
>   */
> -bool pcie_pme_msi_disabled;
> +static bool pcie_pme_msi_disabled;
> +
> +void pcie_pme_disable_msi(void)
> +{
> +	pcie_pme_msi_disabled = true;
> +}
> +EXPORT_SYMBOL_GPL(pcie_pme_disable_msi);
> +
> +bool pcie_pme_no_msi(void)
> +{
> +	return pcie_pme_msi_disabled;
> +}
> +EXPORT_SYMBOL_GPL(pcie_pme_no_msi);
>  
>  static int __init pcie_pme_setup(char *str)
>  {
> diff --git a/drivers/pci/pcie/portdrv.h b/drivers/pci/pcie/portdrv.h
> index 944827a8c7d3..1d441fe26c51 100644
> --- a/drivers/pci/pcie/portdrv.h
> +++ b/drivers/pci/pcie/portdrv.h
> @@ -129,18 +129,8 @@ void pcie_port_bus_unregister(void);
>  struct pci_dev;
>  
>  #ifdef CONFIG_PCIE_PME
> -extern bool pcie_pme_msi_disabled;
> -
> -static inline void pcie_pme_disable_msi(void)
> -{
> -	pcie_pme_msi_disabled = true;
> -}
> -
> -static inline bool pcie_pme_no_msi(void)
> -{
> -	return pcie_pme_msi_disabled;
> -}
> -
> +void pcie_pme_disable_msi(void);
> +bool pcie_pme_no_msi(void);
>  void pcie_pme_interrupt_enable(struct pci_dev *dev, bool enable);
>  #else /* !CONFIG_PCIE_PME */
>  static inline void pcie_pme_disable_msi(void) {}
> -- 
> 2.17.1
> 
