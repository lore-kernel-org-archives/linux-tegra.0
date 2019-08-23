From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] PCI: tegra: Don't print an error on -EPROBE_DEFER
Date: Fri, 23 Aug 2019 16:41:15 +0100
Message-ID: <20190823154115.GB28344@e121166-lin.cambridge.arm.com>
References: <20190823151832.14427-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190823151832.14427-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 23, 2019 at 08:48:32PM +0530, Vidya Sagar wrote:
> APIs like devm_regulator_get() and devm_phy_get() have the potential to
> return -EPROBE_DEFER when the respective sub-systems are not ready yet.
> So avoid printing an error message as .probe() will be tried out again
> at a later point of time anyway.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Squashed in pci/tegra, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index fc0dbeb31d78..c730986ed34d 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1368,9 +1368,11 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
>  
>  	pcie->pex_ctl_supply = devm_regulator_get(dev, "vddio-pex-ctl");
>  	if (IS_ERR(pcie->pex_ctl_supply)) {
> -		dev_err(dev, "Failed to get regulator: %ld\n",
> -			PTR_ERR(pcie->pex_ctl_supply));
> -		return PTR_ERR(pcie->pex_ctl_supply);
> +		ret = PTR_ERR(pcie->pex_ctl_supply);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get regulator: %ld\n",
> +				PTR_ERR(pcie->pex_ctl_supply));
> +		return ret;
>  	}
>  
>  	pcie->core_clk = devm_clk_get(dev, "core");
> @@ -1412,7 +1414,8 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
>  		kfree(name);
>  		if (IS_ERR(phys[i])) {
>  			ret = PTR_ERR(phys[i]);
> -			dev_err(dev, "Failed to get PHY: %d\n", ret);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to get PHY: %d\n", ret);
>  			return ret;
>  		}
>  	}
> -- 
> 2.17.1
> 
