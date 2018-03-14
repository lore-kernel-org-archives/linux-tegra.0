From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] pci: tegra: add MSI dependency
Date: Wed, 14 Mar 2018 10:51:07 +0000
Message-ID: <20180314105107.GA27699@e107981-ln.cambridge.arm.com>
References: <20180313115218.2246372-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180313115218.2246372-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 13, 2018 at 12:52:05PM +0100, Arnd Bergmann wrote:
> Building the tegra PCIe host driver without MSI results in a link
> failure:
> 
> drivers/pci/host/pci-tegra.o:(.data+0x70): undefined reference to `pci_msi_unmask_irq'
> drivers/pci/host/pci-tegra.o:(.data+0x74): undefined reference to `pci_msi_mask_irq'
> 
> This adds the same dependency that everyone else uses.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pci/host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to pci/host/misc for v4.17, thanks.

Lorenzo

> diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> index 1fcdc890acc7..65b4afb8d11d 100644
> --- a/drivers/pci/host/Kconfig
> +++ b/drivers/pci/host/Kconfig
> @@ -38,6 +38,7 @@ config PCI_FTPCI100
>  config PCI_TEGRA
>  	bool "NVIDIA Tegra PCIe controller"
>  	depends on ARCH_TEGRA && MMU
> +	depends on PCI_MSI_IRQ_DOMAIN
>  	help
>  	  Say Y here if you want support for the PCIe host controller found
>  	  on NVIDIA Tegra SoCs.
> -- 
> 2.9.0
> 
