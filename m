From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/4] Allow xHCI drivers to be built as separate modules
Date: Mon, 21 Jul 2014 16:41:08 -0700
Message-ID: <CAL1qeaEDSUmh8p___T5HVp7ERGRHDR3BSBoA2Bb+WCz+=RoM3w@mail.gmail.com>
References: <1404954350-26343-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404954350-26343-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 9, 2014 at 6:05 PM, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> It was suggested in the review of the Tegra xHCI driver [1] that we
> allow xHCI drivers to be built as individual modules (like EHCI) instead
> of building them all into the single xhci-hcd module as they are today.
>
> Patches 1-3 prepare for making the xHCI PCI and platform drivers able
> to be built as individual modules and patch 4 actually creates the 3
> separate modules (core, platform, PCI).
>
> Based on 3.16-rc4.
>
> [1] http://patchwork.ozlabs.org/patch/361265/
>
> Andrew Bresticker (4):
>   xhci: Introduce xhci_init_driver()
>   xhci: Check for XHCI_COMP_MODE_QUIRK when disabling D3cold
>   xhci: Export symbols used by host-controller drivers
>   xhci: Allow xHCI drivers to be built as separate modules

Ping.  I was hoping to get these in for 3.17 (though it may be too
late now...) as they're a dependency for the upcoming Tegra XHCI
driver.

Thanks!
Andrew
