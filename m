From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 0/3] ARM: tegra114: cpuidle: add power down state
Date: Tue, 2 Jul 2013 08:49:48 +0800
Message-ID: <1372726188.2874.6.camel@jlo-ubuntu-64.nvidia.com>
References: <1372152242-16373-1-git-send-email-josephl@nvidia.com>
	 <51D1BEAD.6060003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51D1BEAD.6060003-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2013-07-02 at 01:38 +0800, Stephen Warren wrote:
> On 06/25/2013 03:23 AM, Joseph Lo wrote:
> > This series introduce CPU core power down state for CPU idle. When CPU go
> > into this state, it saves it's context and needs a proper configuration
> > in flow controller to power gate the CPU when CPU runs into WFI
> > instruction. And the CPU also needs to set the IRQ as CPU power down idle
> > wake up event in flow controller.
> > 
> > To prevent race conditions and ensure proper interrupt routing on
> > Cortex-A15 CPUs when they are power-gated, add a CPU PM notifier
> > call-back to reprogram the GIC CPU interface on PM entry. The
> > GIC CPU interface will be reset back to its normal state by
> > the common GIC CPU PM exit callback when the CPU wakes up.
> > 
> > This series depends on the patch of "tick:  Fix
> > tick_broadcast_pending_mask not cleared".
> 
> Joseph, I applied all 3 of your patches/series on top of next-20130701,
> which does include dependency "tick:  Fix tick_broadcast_pending_mask
> not cleared":
> 
> * ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
> * This series
> * ARM: tegra114: add support for system suspend
> 
> I find that at least on on Tegra114/Dalmore, CPU hotplug doesn't work
> correctly.
> 
Yes, it's due to the CPU hotplug function broken in next-20130701. The
last working version was next-20130624 that I had tested and verified.
It also breaks the resume function when enable non-boot CPUs. You can
verify the suspend function by un-plug secondary CPUs first. I am
checking what cause the CPU hotplug function broken on next-20130701.

Thanks,
Joseph
