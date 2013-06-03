From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 4/6] USB: EHCI: export symbols for ehci-hcd sub-drivers
Date: Mon, 3 Jun 2013 16:57:15 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1306031647590.1304-100000@iolanthe.rowland.org>
References: <1370287290-21579-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370287290-21579-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 3 Jun 2013, Stephen Warren wrote:

> From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> In order to split ehci-hcd.c into separate modules, various symbols must
> be exported. Also, rename the symbols to add an ehci_ prefix, to avoid
> any naming clashes.

I have my doubts about this.  Some of the exports are okay, but not 
others.  Renaming and exporting ehci_handshake is fine.  ehci_tdi_reset 
maybe; I'm not sure.  ehci_reset and ehci_halt are rather doubtful, and 
ehci_hub_control is definitely wrong.

A better idea is to export ehci_hc_driver.  Then the tegra module could 
call ehci_hc_driver->hub_control rather than directly accessing 
ehci_hub_control (this is another example of something which should be 
difficult, not easy).

As for ehci_reset and ehci_halt (and possible ehci_tdi_reset), I rather
suspect that ehci-tegra shouldn't be calling them at all.  In fact, the
whole implementation of suspend/resume in ehci-tegra (which is where
these things get used) looks pretty dodgy.  If the controller can't be
suspended without invoking these private routines, then ... well, maybe
it shouldn't be suspended, period.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
