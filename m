From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH V2 6/6] USB: EHCI: make ehci-tegra a separate driver
Date: Wed, 5 Jun 2013 10:41:24 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1306051030430.1078-100000@iolanthe.rowland.org>
References: <1370390014-25452-7-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370390014-25452-7-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 4 Jun 2013, Stephen Warren wrote:

> From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Separate the Tegra on-chip host controller driver from
> ehci-hcd host code so that it can be built as a separate driver module.
> This work is part of enabling multi-platform kernels on ARM.
> 
> Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> [swarren, reworked Manjunath's patches to split them more logically,
> minor re-order of added lines to better match layout of other split-up
> HCD drivers and existing code, add MODULE_DEVICE_TABLE, fix
> MODULE_LICENSE.]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
> * Set non-standard fields in tegra_ehci_hc_driver manually, rather than
>   relying on an expanded struct ehci_driver_overrides.
> * Save orig_hub_control rather than relying on ehci_hub_control being
>   exported.
> * Rebased on new versions of earlier patches.

Considering the changes recommended for the 4/6 patch, this needs a few 
updates too.

> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index c8dc687..b164757 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c

>  struct tegra_ehci_hcd {
>  	struct ehci_hcd *ehci;
>  	struct tegra_usb_phy *phy;

Since you're doing the conversion, it makes sense also to convert this
structure from being separately allocated to using the private area at
the end of ehci_hcd.  (As part of that, the platform_set/get_drvdata
calls would store/retrieve the address of the ehci_hcd structure
instead of the tegra_ehci_hcd.)  Manjunath has already done this for
other drivers.

I suppose this could be added on in a separate patch.

> -static void tegra_ehci_shutdown(struct usb_hcd *hcd)
> -{
> -	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
> -
> -	/* ehci_shutdown touches the USB controller registers, make sure
> -	 * controller has clocks to it */
> -	if (!tegra->host_resumed)
> -		tegra_ehci_power_up(hcd);
> -
> -	ehci_shutdown(hcd);
> -}

Of course, this routine should already be gone.

> @@ -462,6 +429,9 @@ static int tegra_ehci_probe(struct platform_device *pdev)
>  		err = -ENOMEM;
>  		goto cleanup_clk;
>  	}
> +	tegra->ehci = hcd_to_ehci(hcd);

When the private data structure is moved to the private area, there 
will be no need for this back-pointer.  The "ehci" field can be 
eliminated.

> @@ -563,6 +533,12 @@ static void tegra_ehci_hcd_shutdown(struct platform_device *pdev)
>  	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
>  	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
>  
> +	/*
> +	 * ehci_shutdown touches the USB controller registers, make sure
> +	 * controller has clocks to it
> +	 */
> +	if (!tegra->host_resumed)
> +		tegra_ehci_power_up(hcd);

This doesn't need to go here.  Since all the power management has been 
removed, the controller will never be suspended or powered down.  Hence 
there's no need to check or to power it back up.

> +static struct ehci_driver_overrides tegra_overrides __initdata = {
> +	.extra_priv_size	= sizeof(struct tegra_ehci_hcd),
> +};

The annotation should be __initconst rather than __initdata.

> +
> +static int __init ehci_tegra_init(void)
> +{
> +	if (usb_disabled())
> +		return -ENODEV;
> +
> +	pr_info(DRV_NAME ": " DRIVER_DESC "\n");
> +
> +	ehci_init_driver(&tegra_ehci_hc_driver, &tegra_overrides);
> +
> +	orig_hub_control = tegra_ehci_hc_driver.hub_control;
> +
> +	tegra_ehci_hc_driver.map_urb_for_dma = tegra_ehci_map_urb_for_dma;
> +	tegra_ehci_hc_driver.unmap_urb_for_dma = tegra_ehci_unmap_urb_for_dma;
> +	tegra_ehci_hc_driver.hub_control = tegra_ehci_hub_control;

You might want to add a comment explaining the reason for these manual 
overrides.  It's up to you.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
