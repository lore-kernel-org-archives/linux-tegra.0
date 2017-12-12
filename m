From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V3 01/12] PCI: tegra: Start LTSSM after programming root
 port
Date: Tue, 12 Dec 2017 11:32:48 +0000
Message-ID: <20171212113248.GA30799@e107981-ln.cambridge.arm.com>
References: <1509371843-22931-1-git-send-email-mmaddireddy@nvidia.com>
 <1509371843-22931-2-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509371843-22931-2-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 30, 2017 at 07:27:12PM +0530, Manikanta Maddireddy wrote:
> This patch ensures that LTSSM is started (by deasserting pcie_xrst) only
> after all the required root port register programming is completed.
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V3:
> * no change in this patch
> V2:
> * no change in this patch
> 
>  drivers/pci/host/pci-tegra.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 96e8038c3019..b41c60c7414c 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -1024,9 +1024,6 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
>  		}
>  	}
>  
> -	/* take the PCIe interface module out of reset */
> -	reset_control_deassert(pcie->pcie_xrst);
> -
>  	/* finally enable PCIe */
>  	value = afi_readl(pcie, AFI_CONFIGURATION);
>  	value |= AFI_CONFIGURATION_EN_FPCI;
> @@ -1065,7 +1062,6 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
>  			dev_err(dev, "failed to power off PHY(s): %d\n", err);
>  	}
>  
> -	reset_control_assert(pcie->pcie_xrst);

This does not look like it is part of the reset de-assertion code move.

tegra_pcie_enable_controller() -> tegra_pcie_enable_ports()

in other words, why are you removing it ?

Lorenzo

>  	reset_control_assert(pcie->afi_rst);
>  	reset_control_assert(pcie->pex_rst);
>  
> @@ -2116,7 +2112,12 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>  			 port->index, port->lanes);
>  
>  		tegra_pcie_port_enable(port);
> +	}
>  
> +	/* take the PCIe interface module out of reset */
> +	reset_control_deassert(pcie->pcie_xrst);
> +
> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>  		if (tegra_pcie_port_check_link(port))
>  			continue;
>  
> -- 
> 2.1.4
> 
