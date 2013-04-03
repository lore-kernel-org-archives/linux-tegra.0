From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] usb: host: ehci-tegra: Fix oops in error cleanup
Date: Wed, 3 Apr 2013 17:28:15 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E50BE4639@BGMAIL02.nvidia.com>
References: <1364935250-26422-1-git-send-email-thierry@gilfi.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364935250-26422-1-git-send-email-thierry-TKn1d31QZ+o@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-usb-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Thierry Reding
> Sent: Wednesday, April 03, 2013 2:11 AM
> To: Felipe Balbi
> Cc: Stephen Warren; Alan Stern; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: [PATCH] usb: host: ehci-tegra: Fix oops in error cleanup
> 
> The cleanup path checks whether the transceiver was properly initialized
> using IS_ERR(). However it can also happen that the cleanup path is run
> before the transceiver was initialized (or the operating mode isn't set
> to TEGRA_USB_OTG) and is therefore NULL. Add a separate label for error
> unwinding and initialize the transceiver field to ERR_PTR(-ENODEV) when
> the operating mode isn't TEGRA_USB_OTG to allow for consistent checking.

This change looks good to me.
Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> 
> Signed-off-by: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
> ---
>  drivers/usb/host/ehci-tegra.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 1d2488c..c8cb488 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -755,7 +755,7 @@ static int tegra_ehci_probe(struct platform_device
> *pdev)
>  	err = usb_phy_set_suspend(hcd->phy, 0);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to power on the phy\n");
> -		goto fail;
> +		goto fail_phy;
>  	}
