From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH V3 6/7] USB: EHCI: make ehci-tegra a separate driver
Date: Wed, 5 Jun 2013 16:19:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1306051619220.1078-100000@iolanthe.rowland.org>
References: <1370462589-3090-7-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370462589-3090-7-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 5 Jun 2013, Stephen Warren wrote:

> From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Separate the Tegra on-chip host controller driver from
> ehci-hcd host code so that it can be built as a separate driver module.
> This work is part of enabling multi-platform kernels on ARM.
> 
> Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> [swarren, reworked Manjunath's patches to split them more logically,
> minor re-order of added lines to better match layout of other split-up
> HCD drivers and existing code, add MODULE_DEVICE_TABLE, fix
> MODULE_LICENSE, adapted to change in earlier patches which removed the
> ehci_driver_overrides addition, removed all PM code and solved circular
> dependencies.]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> v3:
> * Removed use of tegra_ehci_power_up() from egra_ehci_hcd_shutdown().
> * Made tegra_overrides const/initconst not initdata.
> * Added comment re: need for overrides in ehci_tegra_init().
> v2:
> * Set non-standard fields in tegra_ehci_hc_driver manually, rather than
>   relying on an expanded struct ehci_driver_overrides.
> * Save orig_hub_control rather than relying on ehci_hub_control being
>   exported.
> * Rebased on new versions of earlier patches.

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
