From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 09/10] pwm: Add PXA support
Date: Thu, 15 Mar 2012 10:05:40 +0100
Message-ID: <20120315090540.GW3852@pengutronix.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-10-git-send-email-thierry.reding@avionic-design.de>
 <4F61343A.80103@gmail.com>
 <20120315065631.GB20502@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120315065631.GB20502-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 15, 2012 at 07:56:31AM +0100, Thierry Reding wrote:
> * Ryan Mallon wrote:
> > On 15/03/12 02:56, Thierry Reding wrote:
> > 
> > > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > > ---
> > > Changes in v3:
> > >   - update PWM ops for changes in patch 2
> > 
> > Couple of quick notes, mostly for future work.
> > 
> > > +	/* NOTE: the clock to PWM has to be enabled first
> > > +	 * before writing to the registers
> > > +	 */
> > > +	clk_enable(pc->clk);
> > 
> > 
> > Should be fixed to also call clk_prepare (and clk_unprepare after
> > clk_disable). Could be done in a follow up patch.
> > 
> > > +	__raw_writel(prescale, pc->mmio_base + offset + PWMCR);
> > > +	__raw_writel(dc, pc->mmio_base + offset + PWMDCR);
> > > +	__raw_writel(pv, pc->mmio_base + offset + PWMPCR);
> > 
> > 
> > Should we fix this driver to use readl/writel instead of the __raw
> > variants? The memory is properly ioremaped, and to my understanding the
> > __raw memory accessors should be avoided outside of core code. This
> > could be done in a follow up patch if you want to keep this patch as
> > mostly just a move of the code.
> 
> Actually I wasn't planning on keeping this patch at all. Sascha already has
> the existing PWM providers converted to his original framework and offered to
> rebase them onto this series once the dust settles. I only used them as
> testbed to see how the driver interface works out for different hardware. But
> I also think that if Sascha hasn't cleaned the driver up yet it should either
> be done in his conversion patches or as follow ups.

All I have is a simple conversion to the new framework, nothing more.  I
rebased my patches yesterday onto this series (unfortunately due to the
additional argument pwm_device the patches do not look like just moving
the drivers anymore). I also skipped the PXA patch since I saw that you
already have this one. I just posted the patches to the list.

> 
> Sascha: how do you plan on going forward with this? It seems like the driver
> interface is pretty much done now and I expect the next round to be the last,
> unless I forget to properly work through the TODO list again. If you are busy
> with other stuff I can probably find some time to help with porting your
> converted drivers.

I haven't done drivers/mfd/twl6030-pwm.c. This one needs a bit more work
as it currently does not register itself as a subdriver to the twl6030
but just uses a globally available twl_i2c_write_u8() function. So if
you have some time to spare it would be great if you could do this.

> 
> I'm also wondering which tree this will go in through. Does it make sense to
> have an extra tree just for the PWM framework or can it go in via some other
> general purpose tree? Who do I need to prod?

Good question, I don't know.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
