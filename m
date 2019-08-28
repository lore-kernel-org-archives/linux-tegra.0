From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH V2 3/6] PCI: tegra: Add support to configure sideband pins
Date: Wed, 28 Aug 2019 16:07:40 +0100
Message-ID: <20190828150739.GX14582@e119886-lin.cambridge.arm.com>
References: <20190828131505.28475-1-vidyas@nvidia.com>
 <20190828131505.28475-4-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828131505.28475-4-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 28, 2019 at 06:45:02PM +0530, Vidya Sagar wrote:
> Add support to configure sideband signal pins when information is present
> in respective controller's device-tree node.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V2:
> * Addressed review comment from Andrew Murray
> * Handled failure case of pinctrl_pm_select_default_state() cleanly
> 
>  drivers/pci/controller/dwc/pcie-tegra194.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index fc0dbeb31d78..057ba4f9fbcd 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1304,8 +1304,13 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to get runtime sync for PCIe dev: %d\n",
>  			ret);
> -		pm_runtime_disable(dev);
> -		return ret;
> +		goto fail_pm_get_sync;
> +	}
> +
> +	ret = pinctrl_pm_select_default_state(pcie->dev);

This patch looks OK, though you're still using pcie->dev here instead of dev.

Thanks,

Andrew Murray

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to configure sideband pins: %d\n", ret);
> +		goto fail_pinctrl;
>  	}
>  
>  	tegra_pcie_init_controller(pcie);
> @@ -1332,7 +1337,9 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
>  
>  fail_host_init:
>  	tegra_pcie_deinit_controller(pcie);
> +fail_pinctrl:
>  	pm_runtime_put_sync(dev);
> +fail_pm_get_sync:
>  	pm_runtime_disable(dev);
>  	return ret;
>  }
> -- 
> 2.17.1
> 
