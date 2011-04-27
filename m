From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH] USB: ehci: tegra: fix USB1 port reset issue
Date: Wed, 27 Apr 2011 10:13:21 +0300
Message-ID: <4DB7C211.80308@compulab.co.il>
References: <1303030705-20810-1-git-send-email-mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303030705-20810-1-git-send-email-mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Greg,

Any comments on this?

On 04/17/11 11:58, Mike Rapoport wrote:
> From: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra USB1 port needs to issue Port Reset twice internally, otherwise it
> fails to enumerate devices attached to it
> 
> Signed-off-by: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> [ squash two patches into one and minor style cleanups ]
> 
> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> ---
>  drivers/usb/host/ehci-tegra.c |   72 +++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 72 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index a516af2..7359bcb 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -58,6 +58,71 @@ static void tegra_ehci_power_down(struct usb_hcd *hcd)
>  	clk_disable(tegra->emc_clk);
>  }
>  
> +static int tegra_ehci_internal_port_reset(
> +	struct ehci_hcd	*ehci,
> +	u32 __iomem	*portsc_reg
> +)
> +{
> +	u32		temp;
> +	unsigned long	flags;
> +	int		retval = 0;
> +	int		i, tries;
> +	u32		saved_usbintr;
> +
> +	spin_lock_irqsave(&ehci->lock, flags);
> +	saved_usbintr = ehci_readl(ehci, &ehci->regs->intr_enable);
> +	/* disable USB interrupt */
> +	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
> +	spin_unlock_irqrestore(&ehci->lock, flags);
> +
> +	/*
> +	 * Here we have to do Port Reset at most twice for
> +	 * Port Enable bit to be set.
> +	 */
> +	for (i = 0; i < 2; i++) {
> +		temp = ehci_readl(ehci, portsc_reg);
> +		temp |= PORT_RESET;
> +		ehci_writel(ehci, temp, portsc_reg);
> +		mdelay(10);
> +		temp &= ~PORT_RESET;
> +		ehci_writel(ehci, temp, portsc_reg);
> +		mdelay(1);
> +		tries = 100;
> +		do {
> +			mdelay(1);
> +			/*
> +			 * Up to this point, Port Enable bit is
> +			 * expected to be set after 2 ms waiting.
> +			 * USB1 usually takes extra 45 ms, for safety,
> +			 * we take 100 ms as timeout.
> +			 */
> +			temp = ehci_readl(ehci, portsc_reg);
> +		} while (!(temp & PORT_PE) && tries--);
> +		if (temp & PORT_PE)
> +			break;
> +	}
> +	if (i == 2)
> +		retval = -ETIMEDOUT;
> +
> +	/*
> +	 * Clear Connect Status Change bit if it's set.
> +	 * We can't clear PORT_PEC. It will also cause PORT_PE to be cleared.
> +	 */
> +	if (temp & PORT_CSC)
> +		ehci_writel(ehci, PORT_CSC, portsc_reg);
> +
> +	/*
> +	 * Write to clear any interrupt status bits that might be set
> +	 * during port reset.
> +	 */
> +	temp = ehci_readl(ehci, &ehci->regs->status);
> +	ehci_writel(ehci, temp, &ehci->regs->status);
> +
> +	/* restore original interrupt enable bits */
> +	ehci_writel(ehci, saved_usbintr, &ehci->regs->intr_enable);
> +	return retval;
> +}
> +
>  static int tegra_ehci_hub_control(
>  	struct usb_hcd	*hcd,
>  	u16		typeReq,
> @@ -121,6 +186,13 @@ static int tegra_ehci_hub_control(
>  		goto done;
>  	}
>  
> +	/* For USB1 port we need to issue Port Reset twice internally */
> +	if (tegra->phy->instance == 0 &&
> +	   (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_RESET)) {
> +		spin_unlock_irqrestore(&ehci->lock, flags);
> +		return tegra_ehci_internal_port_reset(ehci, status_reg);
> +	}
> +
>  	/*
>  	 * Tegra host controller will time the resume operation to clear the bit
>  	 * when the port control state switches to HS or FS Idle. This behavior


-- 
Sincerely yours,
Mike.
