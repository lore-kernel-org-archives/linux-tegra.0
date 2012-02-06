From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2 1/4] i2c: tegra: Add __devinit/exit to probe/removeG
Date: Mon, 6 Feb 2012 08:52:22 -0800
Message-ID: <20120206165222.GA25597@quad.lixom.net>
References: <1324189772-26914-1-git-send-email-swarren@nvidia.com>
 <20111220015634.GA27789@quad.lixom.net>
 <CAM=Q2cs8K4vraWPNqervcmxEqUGiAbng+44+L9OhD3ijPw9tAA@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92E21@HQMAIL01.nvidia.com>
 <20120106162615.GA8441@trinity.fluff.org>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE39E15@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF177EE39E15-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 06, 2012 at 08:47:11AM -0800, Stephen Warren wrote:
> Ben Dooks wrote at Friday, January 06, 2012 9:26 AM:
> > On Tue, Dec 20, 2011 at 01:47:29PM -0800, Stephen Warren wrote:
> > > Shubhrajyoti Datta wrote at Monday, December 19, 2011 11:15 PM:
> > > ...
> > > > Hi Stephen ,
> > > > could you check this one also
> > > > thanks.
> > > >
> > > > From: Shubhrajyoti D <shubhrajyoti-l0cyMroinI0@public.gmane.org>
> > > > Date: Tue, 20 Dec 2011 11:40:51 +0530
> > > > Subject: [PATCH] I2C : tegra : devexit in remove
> > > >
> > > > Adding I2C __devexxit in remove
> > > >
> > > > Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > Signed-off-by: Shubhrajyoti D <shubhrajyoti-l0cyMroinI0@public.gmane.org>
> > >
> > > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > Ben or Olof,
> > >
> > > > -       .remove  = tegra_i2c_remove,
> > > > +       .remove  =__devexit_p(tegra_i2c_remove),
> > >
> > > When you apply this, can you fix it up to add a space after the = in
> > > the modified line? If you want, I can post an updated version to do that.
> > 
> > Let me know if you want anything applying or a pull-request processed.
> > 
> > I think once fixed the patches would be fine and I ack them:
> > 
> > Acked-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
> 
> Olof, since you took the original through the Tegra tree, I think it
> makes sense for us to take this fix through there too, and for 3.3?
> The patch above is http://patchwork.ozlabs.org/patch/132349/

Done, applied, sorry for the delay.

The patch has whitespace damage but I fixed it up manually.


-Olof
