From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1] PCI: tegra: Enable root port specific features
Date: Tue, 07 Oct 2014 08:44:05 -0700
Message-ID: <54340A45.4050005@wwwdotorg.org>
References: <1412677678-12011-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412677678-12011-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2014 03:27 AM, Vidya Sagar wrote:
> Enables root port to advertise its ASPM-L1 capability
>  resulting in possible link entry to L1 when an ASPM-L1 capable
>  device is connected
> Enables per-controller & per-TMS clock clamping by default
> Enabling above features result in more power saving
> 
> It also avoids PM message truncation by waiting for DLLP to finish
> before entering into L1 or L2
> 
> Also, it adds helper functions to access root port registers

> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c

> @@ -1870,8 +1920,10 @@ static int tegra_pcie_enable(struct tegra_pcie *pcie)
>  
>  		tegra_pcie_port_enable(port);
>  
> -		if (tegra_pcie_port_check_link(port))
> +		if (tegra_pcie_port_check_link(port)) {
> +			tegra_pcie_enable_rp_features(port);
>  			continue;
> +		}
>  
>  		dev_info(pcie->dev, "link %u down, ignoring\n", port->index);

Wouldn't it be better to have the error case inside the if block; most
error-handling is that way. For example:

if (!tegra_pcie_port_check_link(port)) {
	dev_info(pcie->dev, "link %u down, ignoring\n", port->index);
	tegra_pcie_port_disable(port);
	tegra_pcie_port_free(port);
	continue;
}

tegra_pcie_enable_rp_features(port);
... any other "good case" code (of which there admittedly is none at
present)
