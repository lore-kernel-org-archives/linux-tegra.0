From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] PCI: tegra: Use of_device_get_match_data()
Date: Thu, 18 Aug 2016 15:47:35 -0500
Message-ID: <20160818204735.GN27353@localhost>
References: <20160815153132.520-1-thierry.reding@gmail.com>
 <20160815153132.520-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160815153132.520-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 15, 2016 at 05:31:32PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This function was introduced a couple of releases ago to help reduce the
> the boilerplate required to get at the SoC specific data.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to pci/host-tegra for v4.9, thanks!

> ---
>  drivers/pci/host/pci-tegra.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 7756a792600c..2d520755b1d7 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -2201,21 +2201,16 @@ remove:
>  
>  static int tegra_pcie_probe(struct platform_device *pdev)
>  {
> -	const struct of_device_id *match;
>  	struct tegra_pcie *pcie;
>  	int err;
>  
> -	match = of_match_device(tegra_pcie_of_match, &pdev->dev);
> -	if (!match)
> -		return -ENODEV;
> -
>  	pcie = devm_kzalloc(&pdev->dev, sizeof(*pcie), GFP_KERNEL);
>  	if (!pcie)
>  		return -ENOMEM;
>  
> +	pcie->soc = of_device_get_match_data(&pdev->dev);
>  	INIT_LIST_HEAD(&pcie->buses);
>  	INIT_LIST_HEAD(&pcie->ports);
> -	pcie->soc = match->data;
>  	pcie->dev = &pdev->dev;
>  
>  	err = tegra_pcie_parse_dt(pcie);
> -- 
> 2.9.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
