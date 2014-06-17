From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] USB: EHCI: tegra: Fix use-after-free in .remove()
Date: Tue, 17 Jun 2014 15:30:34 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1406171423120.1187-100000@iolanthe.rowland.org>
References: <53A0653F.7090001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53A0653F.7090001@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tuomas Tynkkynen <ttynkkynen@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Jun 2014, Stephen Warren wrote:

> On 06/17/2014 08:17 AM, Tuomas Tynkkynen wrote:
> > The tegra_ehci_hcd structure is located in the private space allocated
> > by the core USB code so it must not be accessed after the HCD is
> > freed.
> 
> > diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> 
> This seems to be a persistent problem. Witness commit ecc8a0cdca18 "usb:
> host: tegra: fix warning messages in ehci_remove". So, I wonder if ...
> 
> > @@ -479,10 +479,11 @@ static int tegra_ehci_remove(struct platform_device *pdev)
> >  
> >  	usb_phy_shutdown(hcd->phy);
> >  	usb_remove_hcd(hcd);
> > -	usb_put_hcd(hcd);
> >  
> >  	clk_disable_unprepare(tegra->clk);
> >  
> 
> It's worth putting a comment here:
> 
> 	/* This must be last, since *tegra is part of *hcd */
> > +	usb_put_hcd(hcd);
> > +
> >  	return 0;
> >  }

Well, maybe.  At this stage it's not too likely that anything will be 
added after the usb_put_hcd().

> Of course, that could be a separate commit if you want.

This affects more than ehci-tegra.  The same concept applies to all the 
EHCI and OHCI platform drivers that use the platform-private area.

Alan Stern
