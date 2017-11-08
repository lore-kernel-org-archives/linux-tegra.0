From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: limit MSI target address to 32-bit
Date: Wed, 8 Nov 2017 15:25:58 -0600
Message-ID: <20171108212558.GC21597@bhelgaas-glaptop.roam.corp.google.com>
References: <1509991387-15951-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509991387-15951-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

[+cc Michal, Sören, Simon]

On Mon, Nov 06, 2017 at 11:33:07PM +0530, Vidya Sagar wrote:
> limits MSI target address to only 32-bit region to enable
> some of the PCIe end points where only 32-bit MSIs
> are supported work properly.
> One example being Marvel SATA controller
> 
> Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/host/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 1987fec1f126..03d3dcdd06c2 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -1531,7 +1531,7 @@ static int tegra_pcie_enable_msi(struct tegra_pcie *pcie)
>  	}
>  
>  	/* setup AFI/FPCI range */
> -	msi->pages = __get_free_pages(GFP_KERNEL, 0);
> +	msi->pages = __get_free_pages(GFP_DMA, 0);
>  	msi->phys = virt_to_phys((void *)msi->pages);

Should this be GFP_DMA32?  See the comment above the GFP_DMA
definition.

Should we be using virt_to_phys() here?  Where exactly is the result
("msi->phys") used, i.e., what bus will that address appear on?  If it
appears on the PCI side, this should probably use something like
pcibios_resource_to_bus().

Do rcar_pcie_enable_msi() and xilinx_pcie_enable_msi() have a similar
problem?  They both use GFP_KERNEL, then virt_to_phys(), then write the
result of virt_to_phys() using a 32-bit register write.

>  	afi_writel(pcie, msi->phys >> soc->msi_base_shift, AFI_MSI_FPCI_BAR_ST);
> -- 
> 2.7.4
> 
