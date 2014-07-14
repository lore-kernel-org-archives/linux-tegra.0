From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] xhci: Allow xHCI drivers to be built as separate modules
Date: Mon, 14 Jul 2014 10:20:52 -0700
Message-ID: <CAL1qeaGCLw0LSE_Oy_VteAyWLHS9D4y-U8+6Mu+cGKEUp3T3GQ@mail.gmail.com>
References: <1404954350-26343-1-git-send-email-abrestic@chromium.org>
	<1404954350-26343-5-git-send-email-abrestic@chromium.org>
	<CAODwPW9FORb2jnxFi6US6CUJvJzKyUkT8cuSzkPues41hJe+Jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAODwPW9FORb2jnxFi6US6CUJvJzKyUkT8cuSzkPues41hJe+Jw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 10, 2014 at 11:34 AM, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
>> index af89a90..bafba71 100644
>> --- a/drivers/usb/host/Makefile
>> +++ b/drivers/usb/host/Makefile
>> @@ -15,19 +15,19 @@ fhci-$(CONFIG_FHCI_DEBUG) += fhci-dbg.o
>>  xhci-hcd-y := xhci.o xhci-mem.o
>>  xhci-hcd-y += xhci-ring.o xhci-hub.o xhci-dbg.o
>>  xhci-hcd-y += xhci-trace.o
>> -xhci-hcd-$(CONFIG_PCI) += xhci-pci.o
>>
>> -ifneq ($(CONFIG_USB_XHCI_PLATFORM), )
>> -       xhci-hcd-y              += xhci-plat.o
>> +xhci-plat-hcd-y := xhci-plat.o
>>  ifneq ($(CONFIG_USB_XHCI_MVEBU), )
>> -       xhci-hcd-y              += xhci-mvebu.o
>> -endif
>
> nit: Can do this even simpler now, just
> "xhci-plat-hcd-$(CONFIG_USB_XHCI_MVEBU) += xhci-mvebu.o" without the
> ifneq.

Nope - since CONFIG_USB_XHCI_MVEBU can be 'y' or 'm' we need the ifneq
here (which matches against both) to ensure xhci-mvebu.o is built is
part of xhci-plat-hcd.o.
