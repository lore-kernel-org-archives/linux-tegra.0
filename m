From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: RE: [PATCH 3/7] usb: phy: tegra: Get PHY mode using DT
Date: Wed, 20 Mar 2013 17:54:27 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E5092FFF0@BGMAIL02.nvidia.com>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com>
 <1363609781-4045-4-git-send-email-vbyravarasu@nvidia.com>
 <5148C367.6050606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5148C367.6050606@wwwdotorg.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "balbi@ti.com" <balbi@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren@wwwdotorg.org]
> Sent: Wednesday, March 20, 2013 1:29 AM
> To: Venu Byravarasu
> Cc: gregkh@linuxfoundation.org; stern@rowland.harvard.edu;
> balbi@ti.com; linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-tegra@vger.kernel.org; devicetree-discuss@lists.ozlabs.org
> Subject: Re: [PATCH 3/7] usb: phy: tegra: Get PHY mode using DT
> 
> On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
> > Added a new PHY mode to support OTG.
> > Obtained Tegra USB PHY mode using DT property.
> 
> > diff --git a/drivers/usb/phy/tegra_usb_phy.c
> b/drivers/usb/phy/tegra_usb_phy.c
> 
> > @@ -713,6 +712,16 @@ struct tegra_usb_phy
> *tegra_usb_phy_open(struct device *dev, int instance,
> >  	else
> >  		phy->is_ulpi_phy = true;
> >
> > +	err = of_property_match_string(np, "dr_mode", "otg");
> > +	if (err < 0) {
> > +		err = of_property_match_string(np, "dr_mode", "gadget");
> > +		if (err < 0)
> 
> The binding says the 3 legal values for this property are "host",
> "peripheral", or "otg". This agrees with the usage in
> Documentation/devicetree/bindings/usb/fsl-usb.txt and
> drivers/usb/host/fsl-mph-dr-of.c. So, "gadget" is not something the code
> should be checking for.

Agree, will correct it. 

> 
> I'm sure I pointed this out before.
