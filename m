From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] i2c: tegra: Add CONFIG_OF guards for device tree bits
Date: Fri, 5 Aug 2011 15:33:53 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049F172098@HQMAIL01.nvidia.com>
References: <1312527921.21955.2.camel@phoenix>
 <20110805081444.GC19115@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110805081444.GC19115-SMNkleLxa3Z6Wcw2j4pizdi2O/JbrIOy@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "Jean Delvare (PC drivers, core)" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Ben Dooks wrote at Friday, August 05, 2011 2:15 AM:
> On Fri, Aug 05, 2011 at 03:05:21PM +0800, Axel Lin wrote:
> > The device tree bits need to be protected by CONFIG_OF guards.
> > This patch fixes below build error with "make tegra_defconfig;make".
> >
> >   CC      drivers/i2c/busses/i2c-tegra.o
> > drivers/i2c/busses/i2c-tegra.c: In function 'tegra_i2c_probe':
> > drivers/i2c/busses/i2c-tegra.c:615: error: implicit declaration of function 'of_get_property'
> > drivers/i2c/busses/i2c-tegra.c:616: warning: assignment makes pointer from integer without a cast
> 
> It might be worth asking Grant if providing stubs for the of_ calls are
> as good idea, I'd like to avoid having #ifdef CONFIG_OF splattered around
> the place (it leads to errors).

When I first proposed the patch below, Grant said:

> ... I've been avoiding creating a
> dummy inline of of_get_property(), but not for any particularly strong
> reason other than to avoid bloating linux/of.h.  I probably would
> accept a patch that added it.

So, I'll go ahead and whip up a patch to do that instead, since Ben
would prefer not to have the ifdefs in the I2C driver.

> > make[3]: *** [drivers/i2c/busses/i2c-tegra.o] Error 1
> > make[2]: *** [drivers/i2c/busses] Error 2
> > make[1]: *** [drivers/i2c] Error 2
> > make: *** [drivers] Error 2
> >
> > Signed-off-by: Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> > index 0c6e840..1bfe85e 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -548,7 +548,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
> >  	struct resource *iomem;
> >  	struct clk *clk;
> >  	struct clk *i2c_clk;
> > -	const unsigned int *prop;
> >  	void *base;
> >  	int irq;
> >  	int ret = 0;
> > @@ -611,11 +610,15 @@ static int tegra_i2c_probe(struct platform_device *pdev)
> >  	if (pdata) {
> >  		i2c_dev->bus_clk_rate = pdata->bus_clk_rate;
> >
> > +#ifdef CONFIG_OF
> >  	} else if (i2c_dev->dev->of_node) {    /* if there is a device tree node ... */
> > +		const unsigned int *prop;
> > +
> >  		prop = of_get_property(i2c_dev->dev->of_node,
> >  				"clock-frequency", NULL);
> >  		if (prop)
> >  			i2c_dev->bus_clk_rate = be32_to_cpup(prop);
> > +#endif
> >  	}
> >
> >  	if (pdev->id == 3)
> > --
> > 1.7.4.1

-- 
nvpublic
