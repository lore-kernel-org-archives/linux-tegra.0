From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH V2 04/12] PCI: tegra: Advertise AER capability
Date: Mon, 30 Oct 2017 11:36:59 +0200
Message-ID: <04b11c1b-270f-d335-185f-d3bc40133f7b@kapsi.fi>
References: <1509337143-25963-1-git-send-email-mmaddireddy@nvidia.com>
 <1509337143-25963-5-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509337143-25963-5-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 30.10.2017 06:18, Manikanta Maddireddy wrote:
> Default root port settings hide AER capability. This patch enables the
> advertisement of AER capability by root port.

Can you open/explain the term AER in the commit message?

>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
> * no change in this patch
>
>  drivers/pci/host/pci-tegra.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 9f6d331c3571..2a7665a9ce5b 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -187,6 +187,9 @@
>  #define RP_VEND_XP	0x00000f00
>  #define  RP_VEND_XP_DL_UP	(1 << 30)
>
> +#define RP_VEND_CTL1	0xf48
> +#define  RP_VEND_CTL1_ERPT	(1 << 13)
> +
>  #define RP_VEND_CTL2 0x00000fa8
>  #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
>
> @@ -2055,6 +2058,16 @@ static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
>  		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
>  }
>
> +static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
> +{
> +	unsigned long value;
> +
> +	/* Enable AER capability */
> +	value = readl(port->base + RP_VEND_CTL1);
> +	value |= RP_VEND_CTL1_ERPT;
> +	writel(value, port->base + RP_VEND_CTL1);
> +}
> +
>  /*
>   * FIXME: If there are no PCIe cards attached, then calling this function
>   * can result in the increase of the bootup time as there are big timeout
> @@ -2119,6 +2132,7 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>  			 port->index, port->lanes);
>
>  		tegra_pcie_port_enable(port);
> +		tegra_pcie_enable_rp_features(port);

I would prefer writing the register in-line here instead of in a 
separate function, since the operation is so simple. Having a separate 
function adds some complexity.

>  	}
>
>  	/* take the PCIe interface module out of reset */
>
