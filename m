From: rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Mon, 25 Jul 2016 17:35:43 +0200
Message-ID: <20160725153543.GB10939@linutronix.de>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7d37714e-b072-ee90-f14f-364f4fd01f0d-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anna-Maria Gleixner <anna-maria-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 25, 2016 at 03:56:48PM +0100, Jon Hunter wrote:
> > There is a hidden dependency between:
> >
> > - timers
> > - Block multiqueue
> > - rcutree
> >
> > If timers_dead_cpu() comes later than blk_mq_queue_reinit_notify()
> > that latter function causes a RCU stall.
> 
> After this change is applied I am seeing RCU stalls during suspend
> on Tegra. I guess I am hitting the case mentioned above? How should
> this be avoided?

The problem that I had found was a hidden dependency.  When I
initially placed the timers callback into the new HP state list, that
caused a stall because the dependency was broken.  The old code worked
by luck, based on the order of the notifier registrations.  The new
code makes the old implicit ordering explicit, so it should work just
as well as before (famous last words).

> Interestingly I am only seeing the above when using the ARM
> multi_v7_defconfig kernel configuration and not with the tegra_defconfig.
> One key difference between these is that the multi_v7_defconfig does not
> have CONFIG_PREEMPT enabled. Initial testing shows enabling CONFIG_PREEMPT
> for multi_v7_defconfig makes the problem go away.

Just to be sure, this problem didn't exist before the HP rework, that
is, suspend worked fine with and without CONFIG_PREEMPT, right?

I see if I can find a tegra system to test with...

Thanks,
Richard
