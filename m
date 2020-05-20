From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: fix runtime pm imbalance on error
Date: Wed, 20 May 2020 11:42:30 -0500
Message-ID: <20200520164230.GA1100990@bjorn-Precision-5520>
References: <20200520084012.30190-1-dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200520084012.30190-1-dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Cc: kjlu-OJFnDUYgAso@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 20, 2020 at 04:40:12PM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Also This driver forgets to call pm_runtime_disable() when
> pm_runtime_get_sync() returns an error code.

  Also, call pm_runtime_disable() when pm_runtime_get_sync() returns
  an error code.

> Signed-off-by: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
> ---
>  drivers/pci/controller/pci-tegra.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 3e64ba6a36a8..00236dd65b5b 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2712,7 +2712,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>  	err = pm_runtime_get_sync(pcie->dev);
>  	if (err < 0) {
>  		dev_err(dev, "fail to enable pcie controller: %d\n", err);
> -		goto teardown_msi;
> +		goto pm_runtime_put;
>  	}
>  
>  	host->busnr = bus->start;
> @@ -2746,7 +2746,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>  pm_runtime_put:
>  	pm_runtime_put_sync(pcie->dev);
>  	pm_runtime_disable(pcie->dev);
> -teardown_msi:
>  	tegra_pcie_msi_teardown(pcie);
>  put_resources:
>  	tegra_pcie_put_resources(pcie);
> -- 
> 2.17.1
> 
