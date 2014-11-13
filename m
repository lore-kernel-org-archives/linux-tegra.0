From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] PCI: tegra: Do not build on 64-bit ARM
Date: Thu, 13 Nov 2014 12:04:48 -0700
Message-ID: <20141113190448.GA14500@google.com>
References: <1415800418-22957-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415800418-22957-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 12, 2014 at 02:53:37PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> 32-bit and 64-bit ARM use very different infrastructure to register a
> PCI host bridge. The Tegra PCIe host controller driver currently only
> supports the 32-bit ARM infrastructure, so prevent it from being built
> on 64-bit ARM where it will break.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I applied both of these to pci/host-tegra for v3.19, thanks!

> ---
>  drivers/pci/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> index 3dc25fad490c..9c56137e5e5e 100644
> --- a/drivers/pci/host/Kconfig
> +++ b/drivers/pci/host/Kconfig
> @@ -32,7 +32,7 @@ config PCI_IMX6
>  
>  config PCI_TEGRA
>  	bool "NVIDIA Tegra PCIe controller"
> -	depends on ARCH_TEGRA
> +	depends on ARCH_TEGRA && !ARM64
>  
>  config PCI_RCAR_GEN2
>  	bool "Renesas R-Car Gen2 Internal PCI controller"
> -- 
> 2.1.3
> 
