From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Tue, 26 Jul 2016 10:23:02 +0100
Message-ID: <6f2fe6d4-38bf-4feb-1d5e-e2705c333670@nvidia.com>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
 <20160725153543.GB10939@linutronix.de> <20160725204648.GA22830@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160725204648.GA22830-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: Anna-Maria Gleixner <anna-maria-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 25/07/16 21:46, rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org wrote:
> On Mon, Jul 25, 2016 at 05:35:43PM +0200, rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org wrote:
>> I see if I can find a tegra system to test with...
> 
> I tried the tip:smp/hotplug branch under kvm x86_64, and I didn't see
> any problems with suspend or hibernate, even with CONFIG_PREEMPT_NONE.
> I'll see if I can get my hands on a tegra system tomorrow.  Until
> then, two questions:
> 
> 1. The issue appears with suspend (echo mem > /sys/power/state), as
>    opposed to hibernate, right?

Yes. I have been using rtcwake to test suspend with the following
arguments ...

# rtcwake -d rtc1 -m mem -s 3

> 2. CONFIG_PREEMPT_NONE is good, but CONFIG_PREEMPT is bad, right?

The other way around.

Cheers
Jon

-- 
nvpublic
