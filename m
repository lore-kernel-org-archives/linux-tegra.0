From: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1 6/9] usb: xhci: Add NVIDIA Tegra XHCI host-controller driver
Date: Fri, 20 Jun 2014 09:58:19 -0700
Message-ID: <CAODwPW-HSY3RoBi9VEhHSJ98drTsdche-2=mKfAViXWaUa3X1g@mail.gmail.com>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org>
	<1403072180-4944-7-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403072180-4944-7-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon>
List-Id: linux-tegra@vger.kernel.org

> +static const struct hc_driver tegra_xhci_hc_driver = {
> +       .description =          "tegra-xhci-hcd",
> +       .product_desc =         "Tegra xHCI Host Controller",
> +       .hcd_priv_size =        sizeof(struct xhci_hcd *),
> +
> +       /*
> +        * generic hardware linkage
> +        */
> +       .irq =                  xhci_irq,
> +       .flags =                HCD_MEMORY | HCD_USB3 | HCD_SHARED,
> +
> +       /*
> +        * basic lifecycle operations
> +        */
> +       .reset =                tegra_xhci_setup,
> +       .start =                xhci_run,
> +       .stop =                 xhci_stop,
> +       .shutdown =             xhci_shutdown,
> +
> +       /*
> +        * managing i/o requests and associated device resources
> +        */
> +       .urb_enqueue =          xhci_urb_enqueue,
> +       .urb_dequeue =          xhci_urb_dequeue,
> +       .alloc_dev =            xhci_alloc_dev,
> +       .free_dev =             xhci_free_dev,
> +       .alloc_streams =        xhci_alloc_streams,
> +       .free_streams =         xhci_free_streams,
> +       .add_endpoint =         xhci_add_endpoint,
> +       .drop_endpoint =        xhci_drop_endpoint,
> +       .endpoint_reset =       xhci_endpoint_reset,
> +       .check_bandwidth =      xhci_check_bandwidth,
> +       .reset_bandwidth =      xhci_reset_bandwidth,
> +       .address_device =       xhci_address_device,
> +       .enable_device =        xhci_enable_device,
> +       .update_hub_device =    xhci_update_hub_device,
> +       .reset_device =         xhci_discover_or_reset_device,
> +
> +       /*
> +        * scheduling support
> +        */
> +       .get_frame_number =     xhci_get_frame,
> +
> +       /* Root hub support */
> +       .hub_control =          xhci_hub_control,
> +       .hub_status_data =      xhci_hub_status_data,
> +       .bus_suspend =          xhci_bus_suspend,
> +       .bus_resume =           xhci_bus_resume,
> +};

I know I missed the first round of discussion where this was
suggested, but I don't think it's a good idea to pull the whole
hc_driver structure out into every platform implementation. It will
lead to duplication, then to future additions only being applied to
some of the implementations and everything getting out of sync. This
is already a problem with the PCI/plat split (e.g. the LPM functions
were only added to xhci-pci even though they should apply to both).
Also, if I'm not mistaken this code would fail to compile as a module
(you are referencing lots of symbols that are internal to the xhci-hcd
module).

I think at the very least you should add a function
"xhci_default_driver(struct hc_driver *driver)" to xhci-plat.c (or
even better to xhci.c and use it for PCI as well) that initializes all
function pointers to the default (internal) symbols, and can then be
overridden afterwards.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
