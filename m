From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 1/3] ARM: tegra114: Reprogram GIC CPU interface to
 bypass IRQ on CPU PM entry
Date: Wed, 26 Jun 2013 19:19:27 +0800
Message-ID: <1372245567.2986.27.camel@jlo-ubuntu-64.nvidia.com>
References: <1372152242-16373-1-git-send-email-josephl@nvidia.com>
	 <1372152242-16373-2-git-send-email-josephl@nvidia.com>
	 <51CA2173.7060407@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CA2173.7060407-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-06-26 at 07:02 +0800, Stephen Warren wrote:
> On 06/25/2013 03:23 AM, Joseph Lo wrote:
> > There is a difference between GICv1 and v2 when CPU in power management
> > mode (aka CPU power down on Tegra). For GICv1, IRQ/FIQ interrupt lines
> > going to CPU are same lines which are also used for wake-interrupt.
> > Therefore, we cannot disable the GIC CPU interface if we need to use same
> > interrupts for CPU wake purpose. This creates a race condition for CPU
> > power off entry. Also, in GICv1, disabling GICv1 CPU interface puts GICv1
> > into bypass mode such that incoming legacy IRQ/FIQ are sent to CPU, which
> > means disabling GIC CPU interface doesn't really disable IRQ/FIQ to CPU.
> > 
> > GICv2 provides a wake IRQ/FIQ (for wake-event purpose), which are not
> > disabled by GIC CPU interface. This is done by adding a bypass override
> > capability when the interrupts are disabled at the CPU interface. To
> > support this, there are four bits about IRQ/FIQ BypassDisable in CPU
> > interface Control Register. When the IRQ/FIQ not being driver by the
> > CPU interface, each interrupt output signal can be deasserted rather
> > than being driven by the legacy interrupt input.
> > 
> ...
> > diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
> 
> > +static int tegra_gic_notifier(struct notifier_block *self,
> > +			      unsigned long cmd, void *v)
> > +{
> > +	switch (cmd) {
> > +	case CPU_PM_ENTER:
> > +		writel_relaxed(0x1E0, tegra_gic_cpu_base + GIC_CPU_CTRL);
> 
> I assume that 0x1e0 is the "four bits" for IRQ/FIQ bypass disable that
> are mentioned in the commit description. are there #defines that can be
> used instead of literal 0x1e0 here?

The common "arm-gic.h" didn't have the new define for GICv2 yet. So I
didn't define something like GIC_CPU_{FIQ,IRQ}BypDisGrp{0,1} for Tegra.

Thanks,
Joseph
