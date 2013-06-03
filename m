From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 3/6] USB: EHCI: expand struct ehci_driver_overrides
Date: Mon, 3 Jun 2013 16:47:50 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1306031642310.1304-100000@iolanthe.rowland.org>
References: <1370287290-21579-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370287290-21579-4-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 3 Jun 2013, Stephen Warren wrote:

> From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Some EHCI HCD drivers may need to override additional fields in struct
> hc_driver, such as map_urb_for_dma, unmap_urb_for_dma, hub_control. Add
> fields to struct ehci_driver_overrides to allow them to do so.
> 
> These new overrides will be used at least by the Tegra EHCI driver.

This is not a good approach.  ehci-tegra is the only driver that needs 
to muck around with these things, so they should not be part of a 
standardized override structure.

Indeed, so strong is my feeling that platforms shouldn't have to do 
this sort of thing that I want to make it difficult, not easy.

Instead of adding extra fields to ehci_driver_overrides, let's force 
ehci-tegra to manually insert its own values into the 
tegra_ehci_hc_driver structure.  Then this patch won't be necessary at 
all.

Alan Stern
