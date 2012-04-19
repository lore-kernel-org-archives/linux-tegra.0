From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH] USB: EHCI: remove PORT_RWC_BITS when clearing
 USB_PORT_FEAT_ENABLE
Date: Thu, 19 Apr 2012 09:47:59 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204190946530.2070-100000@iolanthe.rowland.org>
References: <1334784766-14016-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334784766-14016-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 18 Apr 2012, Stephen Warren wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> In the ClearPortFeature/USB_PORT_FEAT_ENABLE case, ehci_hub_control()
> would read from status_reg, clear PORT_PE, and write the result back to
> status_reg. This would clear any bits in PORT_RWC_BITS that were set in
> the registers. Fix this by masking these bits off before the write.
> 
> Since this masking is common across all ClearPortFeature cases, move it
> into a single early location to avoid duplicating it.
> 
> Remove the same bugfix from ehci-tegra.c's tegra_ehci_hub_control(), now
> that this case is correctly handled by the core.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

> ---
>  drivers/usb/host/ehci-hub.c   |   17 +++++++----------
>  drivers/usb/host/ehci-tegra.c |   13 +------------
>  2 files changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
> index 38fe076..3ff35b9 100644
> --- a/drivers/usb/host/ehci-hub.c
> +++ b/drivers/usb/host/ehci-hub.c
> @@ -699,6 +699,7 @@ static int ehci_hub_control (
>  			goto error;
>  		wIndex--;
>  		temp = ehci_readl(ehci, status_reg);
> +		temp &= ~PORT_RWC_BITS;
>  
>  		/*
>  		 * Even if OWNER is set, so the port is owned by the
> @@ -712,8 +713,7 @@ static int ehci_hub_control (
>  			ehci_writel(ehci, temp & ~PORT_PE, status_reg);
>  			break;
>  		case USB_PORT_FEAT_C_ENABLE:
> -			ehci_writel(ehci, (temp & ~PORT_RWC_BITS) | PORT_PEC,
> -					status_reg);
> +			ehci_writel(ehci, temp | PORT_PEC, status_reg);
>  			break;
>  		case USB_PORT_FEAT_SUSPEND:
>  			if (temp & PORT_RESET)
> @@ -742,7 +742,7 @@ static int ehci_hub_control (
>  				spin_lock_irqsave(&ehci->lock, flags);
>  			}
>  			/* resume signaling for 20 msec */
> -			temp &= ~(PORT_RWC_BITS | PORT_WAKE_BITS);
> +			temp &= ~PORT_WAKE_BITS;
>  			ehci_writel(ehci, temp | PORT_RESUME, status_reg);
>  			ehci->reset_done[wIndex] = jiffies
>  					+ msecs_to_jiffies(20);
> @@ -752,9 +752,8 @@ static int ehci_hub_control (
>  			break;
>  		case USB_PORT_FEAT_POWER:
>  			if (HCS_PPC (ehci->hcs_params))
> -				ehci_writel(ehci,
> -					  temp & ~(PORT_RWC_BITS | PORT_POWER),
> -					  status_reg);
> +				ehci_writel(ehci, temp & ~PORT_POWER,
> +						status_reg);
>  			break;
>  		case USB_PORT_FEAT_C_CONNECTION:
>  			if (ehci->has_lpm) {
> @@ -762,12 +761,10 @@ static int ehci_hub_control (
>  				temp &= ~PORT_LPM;
>  				temp &= ~PORT_DEV_ADDR;
>  			}
> -			ehci_writel(ehci, (temp & ~PORT_RWC_BITS) | PORT_CSC,
> -					status_reg);
> +			ehci_writel(ehci, temp | PORT_CSC, status_reg);
>  			break;
>  		case USB_PORT_FEAT_C_OVER_CURRENT:
> -			ehci_writel(ehci, (temp & ~PORT_RWC_BITS) | PORT_OCC,
> -					status_reg);
> +			ehci_writel(ehci, temp | PORT_OCC, status_reg);
>  			break;
>  		case USB_PORT_FEAT_C_RESET:
>  			/* GetPortStatus clears reset */
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 10bb3ea..0300137 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -148,18 +148,7 @@ static int tegra_ehci_hub_control(
>  
>  	spin_lock_irqsave(&ehci->lock, flags);
>  
> -	/*
> -	 * In ehci_hub_control() for USB_PORT_FEAT_ENABLE clears the other bits
> -	 * that are write on clear, by writing back the register read value, so
> -	 * USB_PORT_FEAT_ENABLE is handled by masking the set on clear bits
> -	 */
> -	if (typeReq == ClearPortFeature && wValue == USB_PORT_FEAT_ENABLE) {
> -		temp = ehci_readl(ehci, status_reg) & ~PORT_RWC_BITS;
> -		ehci_writel(ehci, temp & ~PORT_PE, status_reg);
> -		goto done;
> -	}
> -
> -	else if (typeReq == GetPortStatus) {
> +	if (typeReq == GetPortStatus) {
>  		temp = ehci_readl(ehci, status_reg);
>  		if (tegra->port_resuming && !(temp & PORT_SUSPEND)) {
>  			/* Resume completed, re-enable disconnect detection */
> 
