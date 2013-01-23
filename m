From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] ARM: tegra: add clocks properties to USB PHY nodes
Date: Wed, 23 Jan 2013 12:13:29 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E1B13B847@BGMAIL02.nvidia.com>
References: <1358900903-27654-1-git-send-email-swarren@wwwdotorg.org>
 <1358900903-27654-2-git-send-email-swarren@wwwdotorg.org>
 <50FF2FD0.2090003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50FF2FD0.2090003-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, January 23, 2013 6:03 AM
> To: Venu Byravarasu
> Cc: Alan Stern; Greg Kroah-Hartman; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Stephen Warren
> Subject: Re: [PATCH 2/2] ARM: tegra: add clocks properties to USB PHY nodes
> 
> On 01/22/2013 05:28 PM, Stephen Warren wrote:
> > The patch to add USB PHY nodes to device tree was written before Tegra
> > supported the clocks property in device tree. Now that it does, add the
> > required clocks properties to these nodes.
> >
> > This will allow all clk_get_sys() calls in tegra_usb_phy.c to be replaced
> > by clk_get(phy->dev, clock_name), as part of converting the PHY driver to
> > a platform driver.
> 
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi
> b/arch/arm/boot/dts/tegra20.dtsi
> 
> > +		clocks = <&tegra_car 22>, <&tegra_car 127>;
> > +		clock-names = "utmi", "pll_u";
> ...
> > +		clocks = <&tegra_car 94>, <&tegra_car 127>;
> > +		clock-names = "ulpi", "pll_u";
> 
> Hmmm. Thinking about that first clock more, if we name it just "phy" in
> both the UTMI and ULPI PHY nodes, we could make tegra_phy_init() perform
> the clk_get() for all PHY types, and use the same clock name everywhere,
> and hence remove the type-specific clk_get()s from tegra_phy_init() and
> utmip_pad_open().
> 
> Venu, will this work for other chips such as Tegra30/Tegra114 and so on
> into the future, or do chips after Tegra20 introduce any new clocks, and
> hence break this scheme?
 
Should be fine, as same clocks are used across all chips.
Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
