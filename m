From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH V2 06/12] PCI: tegra: Enable opportunistic update FC and
 ACK
Date: Mon, 30 Oct 2017 11:58:04 +0200
Message-ID: <f3dbdb48-3a3c-399d-de8e-5a9aeda0ac1d@kapsi.fi>
References: <1509337143-25963-1-git-send-email-mmaddireddy@nvidia.com>
 <1509337143-25963-7-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509337143-25963-7-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 30.10.2017 06:18, Manikanta Maddireddy wrote:
> This patch ensures that DL sends pending ACKs and update FC packets when
> link is idle instead of waiting for timers to expire which improves PCIe
> bandwidth.
>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
> * no change in this patch
>
>  drivers/pci/host/pci-tegra.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 51b7821646eb..bf615c5e6b78 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -209,7 +209,9 @@
>  #define  RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK	0xffffffff
>
>  #define RP_VEND_XP	0x00000f00
> -#define  RP_VEND_XP_DL_UP	(1 << 30)
> +#define  RP_VEND_XP_DL_UP			(1 << 30)
> +#define  RP_VEND_XP_OPPORTUNISTIC_ACK		(1 << 27)
> +#define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	(1 << 28)
>
>  #define RP_VEND_CTL1	0xf48
>  #define  RP_VEND_CTL1_ERPT	(1 << 13)
> @@ -2147,6 +2149,16 @@ static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
>  	writel(value, port->base + RP_VEND_CTL1);
>  }
>
> +static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
> +{
> +	unsigned long value;
> +
> +	/* Optimal settings to enhance bandwidth */
> +	value = readl(port->base + RP_VEND_XP);
> +	value |= RP_VEND_XP_OPPORTUNISTIC_ACK;
> +	value |= RP_VEND_XP_OPPORTUNISTIC_UPDATEFC;
> +	writel(value, port->base + RP_VEND_XP);
> +}
>  /*
>   * FIXME: If there are no PCIe cards attached, then calling this function
>   * can result in the increase of the bootup time as there are big timeout
> @@ -2215,6 +2227,7 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>  		if (soc->program_ectl_settings)
>  			tegra_pcie_program_ectl_settings(port);
>  		tegra_pcie_enable_rp_features(port);
> +		tegra_pcie_apply_sw_fixup(port);

As in the AER patch, I think this can be done in-line here. Otherwise 
looks good.

>  	}
>
>  	/* take the PCIe interface module out of reset */
>
