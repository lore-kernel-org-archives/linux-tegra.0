From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] xhci: Allow xHCI drivers to be built as separate modules
Date: Mon, 14 Jul 2014 11:50:40 -0700
Message-ID: <CAL1qeaFRuw9wn+uAMEJk9bkMKnSivsG02zMda1+iK0kknBNr=g@mail.gmail.com>
References: <1404954350-26343-1-git-send-email-abrestic@chromium.org>
	<1404954350-26343-5-git-send-email-abrestic@chromium.org>
	<CAODwPW9FORb2jnxFi6US6CUJvJzKyUkT8cuSzkPues41hJe+Jw@mail.gmail.com>
	<CAL1qeaGCLw0LSE_Oy_VteAyWLHS9D4y-U8+6Mu+cGKEUp3T3GQ@mail.gmail.com>
	<CAODwPW_=aoCB3K_cFvEKvztNjo=qHXCwmY4mwXMXRaJ+gzSogw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAODwPW_=aoCB3K_cFvEKvztNjo=qHXCwmY4mwXMXRaJ+gzSogw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

+Gregory

On Mon, Jul 14, 2014 at 11:36 AM, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> Nope - since CONFIG_USB_XHCI_MVEBU can be 'y' or 'm' we need the ifneq
>> here (which matches against both) to ensure xhci-mvebu.o is built is
>> part of xhci-plat-hcd.o.
>
> Oh... does it make sense to have it tristate at all, then? Looks like
> was never really buildable as an independent module (and still won't
> be after this patch), so I bet that was just a mistake when the
> Kconfig for it was first written that should be fixed.

Making it a bool wouldn't really be accurate either since it could
still be built as part of the xhci-plat-hcd loadable module.  Gregory,
do you have a preference?  I could also re-spin making xhci-mvebu and
independently-loadable module.

> (Ideally, xhci-plat.c should probably go away in favor of dwc3/host.c
> and xhci-mvebu.c implementing the wrapper to xhci_init_driver()
> directly, but that is a longer-term goal.)

Well I don't think xhci-plat can ever go away (it's possible that
there are XHCI platform devices that need no extra platform-specific
setup), but yes, I agree that dwc3 and xhci-mvebu should be converted
over to use xhci_init_driver().
