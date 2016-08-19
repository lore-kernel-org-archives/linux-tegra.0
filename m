From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/4] PCI: Allow driver-specific data in host bridge
Date: Fri, 19 Aug 2016 17:55:06 +0100
Message-ID: <20160819165506.GA11823@red-moon>
References: <20160815153647.1075-1-thierry.reding@gmail.com>
 <20160815153647.1075-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160815153647.1075-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 15, 2016 at 05:36:45PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Provide a way to allocate driver-specific data along with a PCI host
> bridge structure. The bridge's ->private field points to this data.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/probe.c | 9 ++++++---
>  include/linux/pci.h | 1 +
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 93583b389058..ecf543014da3 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -521,16 +521,19 @@ static void pci_release_host_bridge_dev(struct device *dev)
>  	kfree(bridge);
>  }
>  
> -static struct pci_host_bridge *pci_alloc_host_bridge(void)
> +static struct pci_host_bridge *pci_alloc_host_bridge(size_t priv)
>  {
>  	struct pci_host_bridge *bridge;
>  
> -	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
> +	bridge = kzalloc(sizeof(*bridge) + priv, GFP_KERNEL);
>  	if (!bridge)
>  		return NULL;
>  
>  	INIT_LIST_HEAD(&bridge->windows);
>  
> +	if (priv)
> +		bridge->private = &bridge[1];

How about making private a zero length array ?

Lorenzo

> +
>  	return bridge;
>  }
>  
> @@ -2249,7 +2252,7 @@ static struct pci_bus *pci_create_root_bus_msi(struct device *parent,
>  	int error;
>  	struct pci_host_bridge *bridge;
>  
> -	bridge = pci_alloc_host_bridge();
> +	bridge = pci_alloc_host_bridge(0);
>  	if (!bridge)
>  		return NULL;
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index ccf298fad9e7..3aa7240800c8 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -421,6 +421,7 @@ struct pci_host_bridge {
>  			resource_size_t start,
>  			resource_size_t size,
>  			resource_size_t align);
> +	void *private;
>  };
>  
>  #define	to_pci_host_bridge(n) container_of(n, struct pci_host_bridge, dev)
> -- 
> 2.9.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
