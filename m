From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH 3/6] PCI: tegra: Add support to configure sideband pins
Date: Tue, 27 Aug 2019 16:30:29 +0100
Message-ID: <20190827153029.GO14582@e119886-lin.cambridge.arm.com>
References: <20190826073143.4582-1-vidyas@nvidia.com>
 <20190826073143.4582-4-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190826073143.4582-4-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 26, 2019 at 01:01:40PM +0530, Vidya Sagar wrote:
> Add support to configure sideband signal pins when information is present
> in respective controller's device-tree node.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index fc0dbeb31d78..8a27b25893c9 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1308,6 +1308,12 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
>  		return ret;
>  	}
>  
> +	ret = pinctrl_pm_select_default_state(pcie->dev);
> +	if (ret < 0) {
> +		dev_err(pcie->dev, "Failed to configure sideband pins\n");

I think you can just use dev instead of pcie->dev here.

> +		return ret;

Don't you need to pm_runtime_put_sync and pm_runtime_disable here?

Thanks,

Andrew Murray

> +	}
> +
>  	tegra_pcie_init_controller(pcie);
>  
>  	pcie->link_state = tegra_pcie_dw_link_up(&pcie->pci);
> -- 
> 2.17.1
> 
