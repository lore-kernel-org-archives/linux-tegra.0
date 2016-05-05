From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] usb: host: ehci-tegra: Avoid getting the same
 reset twice
Date: Thu, 5 May 2016 18:10:04 +0100
Message-ID: <572B7E6C.5070201@nvidia.com>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
 <1462372800-30900-2-git-send-email-thierry.reding@gmail.com>
 <572B7D48.6010807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572B7D48.6010807-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 05/05/16 18:05, Jon Hunter wrote:

[snip]

> I spent a bit of time looking at this to figure out what it is doing. Can we simply 
> this a bit as follows (limited testing so far) ...
> 
> Cheers
> Jon
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index c1c1024a054c..70501053e1ec 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -81,15 +81,25 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)
>         struct usb_hcd *hcd = platform_get_drvdata(pdev);
>         struct tegra_ehci_hcd *tegra =
>                 (struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
> +       bool has_utmi_pad_registers = false;
> +       dev_info(&pdev->dev, "%s-%d\n", __func__, __LINE__);

Oops, some left over debug I meant to remove :-p
Jon
