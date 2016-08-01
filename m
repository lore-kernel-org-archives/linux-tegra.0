From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Remove stray call to pci_ioremap_io()
Date: Mon, 1 Aug 2016 10:08:55 +0100
Message-ID: <f0118758-2d9b-378e-256e-7b1cb656bad9@nvidia.com>
References: <20160801070539.24779-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160801070539.24779-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 01/08/16 08:05, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This was introduced by an unfortunate interaction between commits
> 45c64b6ac4ef ("PCI: tegra: Request host bridge window resources with
> core function") and e6e9f471f5fe ("PCI: tegra: Use generic
> pci_remap_iospace() rather than ARM32-specific one").
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/host/pci-tegra.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 2544937620a5..6de0757b11e4 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -621,8 +621,6 @@ static int tegra_pcie_setup(int nr, struct pci_sys_data *sys)
>  	if (err < 0)
>  		return err;
>  
> -	pci_ioremap_io(pcie->pio.start, pcie->io.start);
> -
>  	pci_add_resource_offset(&sys->resources, &pcie->pio, sys->io_offset);
>  	pci_add_resource_offset(&sys->resources, &pcie->mem, sys->mem_offset);
>  	pci_add_resource_offset(&sys->resources, &pcie->prefetch,

Fixes booting on some Tegra boards for me.

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon
