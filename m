From: rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Mon, 25 Jul 2016 22:46:48 +0200
Message-ID: <20160725204648.GA22830@linutronix.de>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
 <20160725153543.GB10939@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160725153543.GB10939-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anna-Maria Gleixner <anna-maria-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 25, 2016 at 05:35:43PM +0200, rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org wrote:
> I see if I can find a tegra system to test with...

I tried the tip:smp/hotplug branch under kvm x86_64, and I didn't see
any problems with suspend or hibernate, even with CONFIG_PREEMPT_NONE.
I'll see if I can get my hands on a tegra system tomorrow.  Until
then, two questions:

1. The issue appears with suspend (echo mem > /sys/power/state), as
   opposed to hibernate, right?

2. CONFIG_PREEMPT_NONE is good, but CONFIG_PREEMPT is bad, right?

Thanks,
Richard
