From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 7/7] usb: phy: registering tegra USB PHY as platform
 driver
Date: Wed, 20 Mar 2013 18:13:07 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E5092FFFA@BGMAIL02.nvidia.com>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com>
 <1363609781-4045-8-git-send-email-vbyravarasu@nvidia.com>
 <5148C8B6.90303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5148C8B6.90303-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, March 20, 2013 1:51 AM
> To: Venu Byravarasu
> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
> balbi-l0cyMroinI0@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH 7/7] usb: phy: registering tegra USB PHY as platform
> driver
> 
> On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
> > Registered tegra USB PHY as a separate platform driver.
> >
> > diff --git a/drivers/usb/phy/tegra_usb_phy.c
> b/drivers/usb/phy/tegra_usb_phy.c
> 
> >  static void tegra_usb_phy_close(struct usb_phy *x)
> >  {
> >  	if (phy->is_ulpi_phy)
> >  		clk_put(phy->clk);
> 
> phy->clk is obtained using devm_clk_get(). This typically means you
> never need to clk_put() it, and if for some reason you really have to,
> you should use devm_clk_put() instead of plain clk_put().

Agree, will remove clk_put.
 
> 
> > @@ -774,23 +667,53 @@ struct tegra_usb_phy
> *tegra_usb_phy_open(struct device *dev, int instance,
> 
> > +		err = gpio_request(phy->reset_gpio, "ulpi_phy_reset_b");
> 
> I think you can use devm_gpio_request() here to simplify the error-handling.

Sure, will do. 

> 
> I wonder why in the ULPI case, all the code is inline here, whereas in
> the UTMI case, this simply calls a function. Wouldn't it be more
> consistent to have the following code here:
> 
> 	if (phy->is_ulpi_phy)
> 		err = ulpi_open();
> 	else
> 		err = utmip_open();
> 	if (err)
> 		goto fail;

Sure, will take care of this in next patch. 

> 
> > +static int tegra_usb_phy_probe(struct platform_device *pdev)
> 
> Hmmm. Note that in order to make deferred probe work correctly, all the
> gpio_request(), clk_get(), etc. calls that acquire resources from other
> drivers must happen here in probe() and not in tegra_usb_phy_open().
 
In present code tegra_usb_phy_open() is indirectly called via usb_phy_init() from ehci-tegra.c.
Between obtaining PHY handle (and hence getting into deferred probe, when it is not available)
and calling usb_phy_init, no other USB registers were accessed. Hence I was doing this way.

Do you still think it would be better to move gpio and clk APIs to probe?

> 
> > +	err = of_property_match_string(np, "dr_mode", "otg");
> > +	if (err < 0) {
> > +		err = of_property_match_string(np, "dr_mode", "gadget");
> 
> Again, use "peripheral", not "gadget".

Will do. 

> 
> > +struct usb_phy *tegra_usb_get_phy(struct device_node *dn)
> > +{
> > +	struct device *dev;
> > +	struct tegra_usb_phy *tegra_phy;
> > +
> > +	dev = driver_find_device(&tegra_usb_phy_driver.driver, NULL, dn,
> > +				 tegra_usb_phy_match);
> > +	if (!dev)
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +
> > +	tegra_phy = dev_get_drvdata(dev);
> > +
> > +	return &tegra_phy->u_phy;
> > +}
> 
> I think you need a module_get() somewhere in there, and also need to add
> a tegra_usb_put_phy() function too, so you can call module_put() from it.

Am not clear on why to add module_get here. Can you plz provide more details?
 
Thanks Stephen, for the review.
