From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [RFC PATCH 06/10] usb: xhci: Add Tegra XHCI host-controller
 driver
Date: Thu, 15 May 2014 17:16:01 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1405151709100.887-100000@iolanthe.rowland.org>
References: <CAL1qeaHm7U2NVDeVZS-Tiz5ntkk4c13RR_1ws9MTYGGoGCOB5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaHm7U2NVDeVZS-Tiz5ntkk4c13RR_1ws9MTYGGoGCOB5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant>
List-Id: linux-tegra@vger.kernel.org

On Thu, 15 May 2014, Andrew Bresticker wrote:

> > This does not feel appropriate at all: Rather than creating a child device,
> > you should have a specific driver that hooks into functions exported
> > by the xhci core. See Documentation/driver-model/design-patterns.txt
> 
> This is how DWC3, currently the only in-tree non-PCI XHCI host driver,
> is structured - see drivers/usb/dwc3/host.c.  The recently proposed
> Armada XHCI driver [1] just adds clock support and a hook in
> xhci-plat's probe() to do the platform-specific initialization.
> Tegra's XHCI driver initialization is quite a bit more complicated,
> mainly due to the need for external firmware and specific ordering
> (e.g. firmware messages should only be enabled after the HCD is
> created).  I could do away with the xhci-plat sub-device and just
> create a Tegra hc_driver, but it seems silly to have three XHCI
> platform drivers structured in three different ways.  USB folks, do
> you have an opinion on how this should be done?

Felipe and I have differing opinions.  I prefer not to create an extra 
device level, and he does (that's why the non-PCI EHCI drivers don't do 
it and the dwc3 driver does).  I consider Felipe's approach to be an 
example of the "Midlayer Mistake" anti-pattern from the LWN 
article mentioned earlier in this thread -- I don't know what he thinks 
about my approach.

Anyway, unless I'm totally mistaken, you wouldn't end up with three
platform drivers structured in three different ways.  Either way, your
new driver would be structured like one of the existing two.

Alan Stern
