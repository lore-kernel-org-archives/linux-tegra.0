From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH V3 4/7] USB: EHCI: tegra: remove all power management
Date: Wed, 5 Jun 2013 16:19:14 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1306051618440.1078-100000@iolanthe.rowland.org>
References: <1370462589-3090-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370462589-3090-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 5 Jun 2013, Stephen Warren wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The PM routines in ehci-tegra.c use APIs such as ehci_reset(),
> ehci_halt(), and ehci_tdi_reset() that would need to be exported to
> convert ehci-tegra.c into a separate module from ehci-hcd.c. However,
> we'd prefer not to export them.
> 
> Instead, simply remove all power management functionality. Runtime PM
> was disabled since it didn't work correctly, and system suspend isn't
> yet supported in a meaningful way. So, this change doesn't lose any
> functionality.
> 
> Hopefully the power management logic can be reimplemented in a cleaner
> way in the future.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> v3:
> * Also remove tegra_ehci_power_up(), tegra_ehci_shutdown(), struct
>   tegra_ehci_hcd.host_resumed.
> * Add back .bus_{suspend,resume} entries in tegra_ehci_hc_driver.
> v2: New patch.

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
