From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] [v2] PCI: tegra194: Fix runtime PM imbalance on error
Date: Fri, 29 May 2020 11:27:24 +0100
Message-ID: <20200529102724.GB12270@e121166-lin.cambridge.arm.com>
References: <20200521031355.7022-1-dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200521031355.7022-1-dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Cc: kjlu-OJFnDUYgAso@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Murray <amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 21, 2020 at 11:13:49AM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to pci/tegra, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index ae30a2fd3716..2c0d2ce16b47 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1623,7 +1623,7 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
>  	ret = pinctrl_pm_select_default_state(dev);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to configure sideband pins: %d\n", ret);
> -		goto fail_pinctrl;
> +		goto fail_pm_get_sync;
>  	}
>  
>  	tegra_pcie_init_controller(pcie);
> @@ -1650,9 +1650,8 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
>  
>  fail_host_init:
>  	tegra_pcie_deinit_controller(pcie);
> -fail_pinctrl:
> -	pm_runtime_put_sync(dev);
>  fail_pm_get_sync:
> +	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
>  	return ret;
>  }
> -- 
> 2.17.1
> 
