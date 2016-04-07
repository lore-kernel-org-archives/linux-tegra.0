From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v10 8/9] usb: xhci: Add NVIDIA Tegra XUSB controller driver
Date: Thu, 07 Apr 2016 14:03:45 +0300
Message-ID: <57063E91.1070202@linux.intel.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com> <1457108379-20794-8-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457108379-20794-8-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04.03.2016 18:19, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add support for the on-chip XUSB controller present on Tegra SoCs. This
> controller, when loaded with external firmware, exposes an interface
> compliant with xHCI. This driver loads the firmware, starts the
> controller, and is able to service host-specific messages sent by the
> controller's firmware.
>
> The controller also supports USB device mode as well as powergating
> of the SuperSpeed and host-controller logic when not in use, but
> support for these is not yet implemented.
>
> Based on work by:
>    Ajay Gupta <ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>    Bharath Yadav <byadav-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>    Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

...

> +static int tegra_xusb_remove(struct platform_device *pdev)
> +{
> +	struct tegra_xusb *tegra = platform_get_drvdata(pdev);
  > +	struct usb_hcd *hcd = tegra->hcd;
> +	struct xhci_hcd *xhci;
> +
> +	if (tegra->fw_loaded) {
> +		xhci = hcd_to_xhci(hcd);
> +		usb_remove_hcd(xhci->shared_hcd);
> +		usb_put_hcd(xhci->shared_hcd);
> +		usb_remove_hcd(hcd);
> +		tegra_xusb_padctl_put(tegra->padctl);
> +		usb_put_hcd(hcd);
> +		kfree(xhci);

Don't free xhci here, xhci is a part of hcd (hcd_priv) and hcd is already freed in usb_put_hcd()

Other than that I can't see any issues

-Mathias


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
