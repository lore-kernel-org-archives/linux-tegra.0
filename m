From: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: Tegra I2C driver compilation failure (was: RE: [PATCH] dt: add
	empty of_get_property for non-dt)
Date: Fri, 12 Aug 2011 01:47:32 +0100
Message-ID: <20110812004732.GF19115@trinity.fluff.org>
References: <74CDBE0F657A3D45AFBB94109FB122FF04A0687289@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04A0687289-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 09, 2011 at 09:21:31AM -0700, Stephen Warren wrote:
> Stephen Warren wrote at Monday, August 08, 2011 1:26 PM:
> > Rob Herring wrote at Sunday, August 07, 2011 8:38 AM:
> > > On 08/05/2011 05:50 PM, Stephen Warren wrote:
> > > > The patch adds empty function of_get_property for non-dt build, so that
> > > > drivers migrating to dt can save some '#ifdef CONFIG_OF'.
> > > >
> > > > This also fixes the current Tegra compile problem in linux-next.
> > >
> > > You could just use of_property_read_u32 in the driver. It already has
> > > empty version and will simplify the driver code some.
> > 
> > Yes, that would also work.
> > 
> > Grant, Ben, do you have a preference for which option to choose?
> 
> Well, all three possible fixes have been posted now:
> 
> Add ifdef to i2c driver:
> http://www.spinics.net/lists/linux-tegra/msg01720.html
> 
> Implement empty of_get_property:
> http://www.spinics.net/lists/linux-tegra/msg01881.html
> 
> Switch i2c driver to use of_property_read_u32:
> http://permalink.gmane.org/gmane.linux.ports.arm.kernel/127807
> 
> Ben, please could you please pick one of the changes and apply it, so
> that linux-next compiles for Tegra? Thanks!

I'll look into this at the weekend, of_property_read_u32 is probably
a better function to call.
 
> -- 
> nvpublic
> 

-- 
Ben Dooks, ben-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
