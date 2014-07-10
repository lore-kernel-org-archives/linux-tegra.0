From: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] xhci: Allow xHCI drivers to be built as separate modules
Date: Thu, 10 Jul 2014 11:34:36 -0700
Message-ID: <CAODwPW9FORb2jnxFi6US6CUJvJzKyUkT8cuSzkPues41hJe+Jw@mail.gmail.com>
References: <1404954350-26343-1-git-send-email-abrestic@chromium.org>
	<1404954350-26343-5-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404954350-26343-5-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index af89a90..bafba71 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -15,19 +15,19 @@ fhci-$(CONFIG_FHCI_DEBUG) += fhci-dbg.o
>  xhci-hcd-y := xhci.o xhci-mem.o
>  xhci-hcd-y += xhci-ring.o xhci-hub.o xhci-dbg.o
>  xhci-hcd-y += xhci-trace.o
> -xhci-hcd-$(CONFIG_PCI) += xhci-pci.o
>
> -ifneq ($(CONFIG_USB_XHCI_PLATFORM), )
> -       xhci-hcd-y              += xhci-plat.o
> +xhci-plat-hcd-y := xhci-plat.o
>  ifneq ($(CONFIG_USB_XHCI_MVEBU), )
> -       xhci-hcd-y              += xhci-mvebu.o
> -endif

nit: Can do this even simpler now, just
"xhci-plat-hcd-$(CONFIG_USB_XHCI_MVEBU) += xhci-mvebu.o" without the
ifneq.

> +       xhci-plat-hcd-y         += xhci-mvebu.o
>  endif
>
>  obj-$(CONFIG_USB_WHCI_HCD)     += whci/
>
>  obj-$(CONFIG_PCI)              += pci-quirks.o
>
> +obj-$(CONFIG_USB_XHCI_PCI)     += xhci-pci.o
> +obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
> +
>  obj-$(CONFIG_USB_EHCI_HCD)     += ehci-hcd.o
>  obj-$(CONFIG_USB_EHCI_PCI)     += ehci-pci.o
>  obj-$(CONFIG_USB_EHCI_HCD_PLATFORM)    += ehci-platform.o

Great patch series, thank you!
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
