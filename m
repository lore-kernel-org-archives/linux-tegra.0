From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] PCI: Disable Gen2 for Tegra20 and Tegra30
Date: Sat, 7 Dec 2013 15:40:40 -0700
Message-ID: <20131207224040.GB7901@google.com>
References: <1384815306-3149-1-git-send-email-ebrower@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384815306-3149-1-git-send-email-ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 18, 2013 at 02:55:06PM -0800, Eric Brower wrote:
> Tegra20 and Tegra30 do not support gen2 PCIe, so correct the
> register setting to disable it.
> 
> Signed-off-by: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied with Thierry's ack to pci/host-tegra for v3.14, thanks!

Bjorn

> ---
>  drivers/pci/host/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 0afbbbc..b8ba2f7 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -805,7 +805,7 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
>  	afi_writel(pcie, value, AFI_PCIE_CONFIG);
>  
>  	value = afi_readl(pcie, AFI_FUSE);
> -	value &= ~AFI_FUSE_PCIE_T0_GEN2_DIS;
> +	value |= AFI_FUSE_PCIE_T0_GEN2_DIS;
>  	afi_writel(pcie, value, AFI_FUSE);
>  
>  	/* initialize internal PHY, enable up to 16 PCIE lanes */
> -- 
> 1.8.1.5
> 
