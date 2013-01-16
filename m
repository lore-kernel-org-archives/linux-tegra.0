From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 4/4] usb: Add APIs to access host registers from Tegra
 PHY
Date: Wed, 16 Jan 2013 10:08:35 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1301161004380.1704-100000@iolanthe.rowland.org>
References: <1358343022-28919-5-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358343022-28919-5-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 16 Jan 2013, Venu Byravarasu wrote:

> As Tegra PHY driver needs to access one of the Host registers,
> added few APIs.
> 
> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c

> @@ -605,6 +619,50 @@ static const struct dev_pm_ops tegra_ehci_pm_ops = {
>  
>  #endif
>  
> +void tegra_ehci_set_wakeon_events(struct usb_phy *x, bool enable)
> +{
> +	unsigned long val;
> +	struct usb_hcd *hcd = bus_to_hcd(x->otg->host);
> +	void __iomem *base = hcd->regs;
> +	u32 wake = USB_PORTSC1_WKOC | USB_PORTSC1_WKDS | USB_PORTSC1_WKCN;
> +
> +	val = readl(base + USB_PORTSC1);
> +	if (enable)
> +		val |= wake;
> +	else
> +		val &= ~wake;
> +	writel(val, base + USB_PORTSC1);
> +}

Here and below, this sort of code is highly questionable.  You
evidently don't realize that some of the bits in the PORTSC registers
are R/WC.  This means writing a 1 to these bits will clear them.  

Consequently it is almost always wrong to read a PORTSC register and
then write back the same (or a slightly modified) value.

Alan Stern
