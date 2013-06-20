From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] irqchip: gic: call gic_cpu_init() as well in
 CPU_STARTING_FROZEN case
Date: Thu, 20 Jun 2013 10:09:29 +0800
Message-ID: <1371694169.2155.12.camel@jlo-ubuntu-64.nvidia.com>
References: <1371036627-13529-1-git-send-email-shawn.guo@linaro.org>
	 <20130612151748.GC31646@arm.com>
	 <20130614123357.GB4489@S2101-09.ap.freescale.net>
	 <20130619070253.GA3405@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130619070253.GA3405-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-06-19 at 15:02 +0800, Shawn Guo wrote:
> On Fri, Jun 14, 2013 at 08:33:59PM +0800, Shawn Guo wrote:
> > On Wed, Jun 12, 2013 at 04:17:49PM +0100, Catalin Marinas wrote:
> > > On Wed, Jun 12, 2013 at 12:30:27PM +0100, Shawn Guo wrote:
> > > > diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> > > > index 1760ceb..19ceaa6 100644
> > > > --- a/drivers/irqchip/irq-gic.c
> > > > +++ b/drivers/irqchip/irq-gic.c
> > > > @@ -705,7 +705,7 @@ static int gic_irq_domain_xlate(struct irq_domain *d,
> > > >  static int __cpuinit gic_secondary_init(struct notifier_block *nfb,
> > > >  					unsigned long action, void *hcpu)
> > > >  {
> > > > -	if (action == CPU_STARTING)
> > > > +	if (action == CPU_STARTING || action == CPU_STARTING_FROZEN)
> > > >  		gic_cpu_init(&gic_data[0]);
> > > >  	return NOTIFY_OK;
> > > >  }
> > > 
> > > Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> > 
> > Thomas,
> > 
> > Can you please send the fix for 3.10?  Or are you fine with that I ask
> > arm-soc folks to send it?
> 
> Arnd, Olof,
> 
> Can you help send the fix for 3.10?
> 

The commit c011470 also break suspend/resume for Tegra platform on all 3.10-rcX.

> Commit c011470 (irqchip: gic: Perform the gic_secondary_init() call via
> CPU notifier) moves gic_secondary_init() that used to be called in
> .smp_secondary_init hook into a notifier call.  But it changes the
> system behavior a little bit.  Before the commit, gic_cpu_init()
> is called not only when kernel brings up the secondary cores but also
> when system resuming procedure hot-plugs the cores back to kernel.
> While after the commit, the function will not be called in the latter
> case, where the 'action' will not be CPU_STARTING but
> CPU_STARTING_FROZEN.  This behavior difference at least causes the
> following suspend/resume regression on imx6q.
> 

Shawn's patch fix the suspend/resume regression for Tegra also.

Tested-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks,
Joseph
