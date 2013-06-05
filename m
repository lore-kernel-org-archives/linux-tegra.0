From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH V2 4/6] USB: EHCI: tegra: remove all power management
Date: Wed, 5 Jun 2013 10:24:06 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1306051013590.1078-100000@iolanthe.rowland.org>
References: <1370390014-25452-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370390014-25452-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 4 Jun 2013, Stephen Warren wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The PM routines in ehci-tegra.c use APIs such as ehci_reset(),
> ehci_halt(), and ehci_tdi_reset() that would need to be exported to
> convert ehci-tegra.c into a separate module from ehci-hcd.c. However,
> we'd prefer not to export them.
> 
> Instead, simply remove all power management functionality. Runtime PM
> was disabled since it didn't work correctly, and system suspend isn't
> yet supported in a meaningful way. So, this change doesn't lose any
> functionality.
> 
> Hopefully the power management logic can be reimplemented in a cleaner
> way in the future.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> NOTE: This could do with a little more testing on a few more boards. If
> Alan is OK with this series, I'll go through and do that, and let you
> know when I've tested it enough to be applied. I saw no issues on the one
> board I tested with though.
> 
> I'd appreciate any hints if this patch is actually removing more
> functionality than I think, and is going to break something horribly.

This is a good way to break the logjam.  It needs just a couple of
improvements:

> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 289b9b8..8f42b3a 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -61,15 +61,6 @@ static void tegra_ehci_power_up(struct usb_hcd *hcd)
>  	tegra->host_resumed = 1;
>  }
>  
> -static void tegra_ehci_power_down(struct usb_hcd *hcd)
> -{
> -	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
> -
> -	tegra->host_resumed = 0;
> -	usb_phy_set_suspend(hcd->phy, 1);
> -	clk_disable_unprepare(tegra->clk);
> -}
> -

tegra_ehci_power_up() shouldn't be retained either.  And with these
functions removed, there's no need to keep the tegra->host_resumed
field.

Related to this, the tegra_ehci_shutdown() routine should be removed,
and the .shutdown entry in tegra_ehci_hc_driver should point to
ehci_shutdown.

> @@ -399,10 +369,6 @@ static const struct hc_driver tegra_ehci_hc_driver = {
>  	.map_urb_for_dma	= tegra_ehci_map_urb_for_dma,
>  	.unmap_urb_for_dma	= tegra_ehci_unmap_urb_for_dma,
>  	.hub_control		= tegra_ehci_hub_control,
> -#ifdef CONFIG_PM
> -	.bus_suspend		= ehci_bus_suspend,
> -	.bus_resume		= ehci_bus_resume,
> -#endif
>  };

These two entries should be retained.  They refer to USB bus suspend
rather than controller suspend, and they don't use any Tegra-specific
code.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
