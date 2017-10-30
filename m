From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH V2 08/12] PCI: tegra: Wait for DLLP to finish before
 entering L1 or L2
Date: Mon, 30 Oct 2017 12:02:09 +0200
Message-ID: <1f714556-3411-c8d8-a95c-fc079f7380ee@kapsi.fi>
References: <1509337143-25963-1-git-send-email-mmaddireddy@nvidia.com>
 <1509337143-25963-9-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509337143-25963-9-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 30.10.2017 06:18, Manikanta Maddireddy wrote:
> Set required bit to have LTSSM wait for DLLP to finish before entering L1
> or L2. This avoids truncation of PM messages which results in receiver
> errors.
>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
> * no change in this patch
>
>  drivers/pci/host/pci-tegra.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 75b408b32b8b..7f1e34e670d7 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -217,6 +217,9 @@
>  #define RP_VEND_CTL1	0xf48
>  #define  RP_VEND_CTL1_ERPT	(1 << 13)
>
> +#define RP_VEND_XP_BIST	0xf4c
> +#define  RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE	(1 << 28)
> +
>  #define RP_VEND_CTL2 0x00000fa8
>  #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
>
> @@ -2160,6 +2163,13 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
>  	value |= RP_VEND_XP_OPPORTUNISTIC_ACK;
>  	value |= RP_VEND_XP_OPPORTUNISTIC_UPDATEFC;
>  	writel(value, port->base + RP_VEND_XP);
> +
> +	/* LTSSM will wait for DLLP to finish before entering L1 or L2,
> +	 * to avoid truncation of PM messages which results in receiver errors
> +	 */
> +	value = readl(port->base + RP_VEND_XP_BIST);
> +	value |= RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE;
> +	writel(value, port->base + RP_VEND_XP_BIST);
>  }
>  /*
>   * FIXME: If there are no PCIe cards attached, then calling this function
>

This would also move to the calling function, but

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
