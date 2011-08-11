From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix <mach/gpio.h> to have necessary
	#includes
Date: Thu, 11 Aug 2011 21:02:10 +0100
Message-ID: <20110811200210.GB24166@n2100.arm.linux.org.uk>
References: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD0@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD0-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 11, 2011 at 12:49:47PM -0700, Stephen Warren wrote:
> Russell King wrote at Thursday, August 11, 2011 1:36 PM:
> > On Thu, Aug 11, 2011 at 12:05:52PM -0600, Stephen Warren wrote:
> > > Without this, EINVAL isn't defined, and type bool isn't declared.
> > > This leads to compilation failures.
> > 
> > An alternative approach would be to convert tegra to be able to use
> > the gpiolib __gpio_to_irq() for the on-SoC stuff, and eliminate
> > irq_to_gpio().
> > 
> > Would it be possible to do that instead?
> 
> That should work too.
> 
> I posted a couple patches last Friday to remove irq_to_gpio:
> 
> https://lkml.org/lkml/2011/8/5/343
> https://lkml.org/lkml/2011/8/5/342
> 
> Later in the thread, you said you would merge them into your branch to
> avoid merge conflicts with the other GPIO work you were doing.

I suggested it would be a good idea.  Now that I've published those
changes, any chance of having some updated patches in the patch system
please?

> For gpio_to_irq, yes, I believe we get rid of it pretty easily; we'd
> just need to implement gpio-tegra.c's gpio_chip.to_irq function. Should
> I cook up a patch based on top of linux-next plus the two patches above
> to do that instead?

Yes please, again eventually to the patch system once Grant has acked it
to avoid the otherwise certain conflicts.

Thanks for doing this.
