From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Usb: host - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 20:37:10 +0100
Message-ID: <20170130193710.GA27138@kroah.com>
References: <CGME20170130050640epcas2p1f856bc12df5d1ee6b9e0c66cf9dd6339@epcas2p1.samsung.com>
 <1485752789-30374-1-git-send-email-shailendra.v@samsung.com>
 <20170130064521.GC4324@kroah.com>
 <20170130070323.GD3585@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170130070323.GD3585@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Shailendra Verma <shailendra.v@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 30, 2017 at 08:03:23AM +0100, Thierry Reding wrote:
> On Mon, Jan 30, 2017 at 07:45:21AM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Jan 30, 2017 at 10:36:29AM +0530, Shailendra Verma wrote:
> > > of_device_get_match_data could return NULL, and so can cause
> > > a NULL pointer dereference later.
> > > 
> > > Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
> > > ---
> > >  drivers/usb/host/xhci-tegra.c |    4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> > > index a59fafb..890c778 100644
> > > --- a/drivers/usb/host/xhci-tegra.c
> > > +++ b/drivers/usb/host/xhci-tegra.c
> > > @@ -903,6 +903,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
> > >  		return -ENOMEM;
> > >  
> > >  	tegra->soc = of_device_get_match_data(&pdev->dev);
> > > +	if (!tegra->soc) {
> > 
> > How would the driver be loaded and the probe function called if this
> > returns NULL?
> > 
> > Is this ever possible?
> 
> No, it isn't. I've been NAK'ing this kind of patch for a while now.
> There are two variants of this patch going about:
> 
>   1) checking the return value of of_match_device()
>   2) checking the return value of of_device_get_match_data()
> 
> The same may also apply to of_match_node(), but I haven't seen that used
> very much lately.
> 
> For of_match_device() the problem could technically occur if used in non
> OF setups, because the device could be instantiated by hand in board
> setup code. Tegra has been OF-only for a couple of years now, so there
> is no way this can happen today.
> 
> of_device_get_match_data() is somewhat more complicated because it could
> still return NULL if the OF table entry had its .data field set to NULL.
> However in all drivers that I know that would be considered a bug, so
> might as well let things crash at this point to make it immediately
> obvious.
> 
> I had once been tempted to write a checkpatch rule for this, but I'm not
> sure it's as easy as just warning if there's a check, because there are
> some legitimate cases, even if they're very rare.

Thanks for the info, patch is now dropped.

Shailendra, please be more careful.

greg k-h
