From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] usb: host: tegra: don't touch EMC clock
Date: Wed, 23 Jan 2013 12:25:11 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E1B13B855@BGMAIL02.nvidia.com>
References: <1358900903-27654-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358900903-27654-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Stephen Warren
> Sent: Wednesday, January 23, 2013 5:58 AM
> To: Alan Stern; Greg Kroah-Hartman; Stephen Warren
> Cc: Venu Byravarasu; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Stephen Warren
> Subject: [PATCH 1/2] usb: host: tegra: don't touch EMC clock
> 
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Clock "emc" is for the External Memory Controller. The USB driver has no
> business touching this clock directly. Remove the code that does so.

Stephen,
This was primarily done to make sure that EMC is set to a minimum
frequency, below which data errors may occur during USB transfers.
If we plan to remove this, how should we make sure that the EMC
is programmed for the required frequency during USB transfers?
 
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Greg, Alan, I'd like to take this patch through the Tegra tree to avoid
> any merge conflicts with the Tegra USB changes that have  recently
> happened there.
> 
> Venu, When creating your patch to convert the Tegra USB PHY driver to a
> platform driver, can you assume these patches are applied first? Thanks.
> I assume that these patches make sense to you; could you ack them if so.
> ---
>  drivers/usb/host/ehci-tegra.c |   17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 1f596fb..b02622a 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -44,7 +44,6 @@ struct tegra_ehci_hcd {
>  	struct ehci_hcd *ehci;
>  	struct tegra_usb_phy *phy;
>  	struct clk *clk;
> -	struct clk *emc_clk;
>  	struct usb_phy *transceiver;
>  	int host_resumed;
>  	int port_resuming;
> @@ -56,7 +55,6 @@ static void tegra_ehci_power_up(struct usb_hcd *hcd)
>  {
>  	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
> 
> -	clk_prepare_enable(tegra->emc_clk);
>  	clk_prepare_enable(tegra->clk);
>  	usb_phy_set_suspend(&tegra->phy->u_phy, 0);
>  	tegra->host_resumed = 1;
> @@ -69,7 +67,6 @@ static void tegra_ehci_power_down(struct usb_hcd
> *hcd)
>  	tegra->host_resumed = 0;
>  	usb_phy_set_suspend(&tegra->phy->u_phy, 1);
>  	clk_disable_unprepare(tegra->clk);
> -	clk_disable_unprepare(tegra->emc_clk);
>  }
> 
>  static int tegra_ehci_internal_port_reset(
> @@ -694,16 +691,6 @@ static int tegra_ehci_probe(struct platform_device
> *pdev)
>  	if (err)
>  		goto fail_clk;
> 
> -	tegra->emc_clk = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(tegra->emc_clk)) {
> -		dev_err(&pdev->dev, "Can't get emc clock\n");
> -		err = PTR_ERR(tegra->emc_clk);
> -		goto fail_emc_clk;
> -	}
> -
> -	clk_prepare_enable(tegra->emc_clk);
> -	clk_set_rate(tegra->emc_clk, 400000000);
> -
>  	tegra->needs_double_reset = of_property_read_bool(pdev-
> >dev.of_node,
>  		"nvidia,needs-double-reset");
> 
> @@ -813,8 +800,6 @@ fail:
>  #endif
>  	usb_phy_shutdown(&tegra->phy->u_phy);
>  fail_io:
> -	clk_disable_unprepare(tegra->emc_clk);
> -fail_emc_clk:
>  	clk_disable_unprepare(tegra->clk);
>  fail_clk:
>  	usb_put_hcd(hcd);
> @@ -842,8 +827,6 @@ static int tegra_ehci_remove(struct platform_device
> *pdev)
> 
>  	clk_disable_unprepare(tegra->clk);
> 
> -	clk_disable_unprepare(tegra->emc_clk);
> -
>  	return 0;
>  }
> 
> --
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
