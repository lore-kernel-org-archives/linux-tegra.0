From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Tue, 26 Jul 2016 19:16:38 +0100
Message-ID: <cca321cf-9a03-852f-1fb8-efdadcd76ba8@nvidia.com>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
 <20160726154227.GC23707@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160726154227.GC23707-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: Anna-Maria Gleixner <anna-maria-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Richard,

On 26/07/16 16:42, rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org wrote:
> Jon,
> 
> On Mon, Jul 25, 2016 at 03:56:48PM +0100, Jon Hunter wrote:
>>> When tearing down, call timers_dead_cpu before notify_dead.
>>> There is a hidden dependency between:
>>>
>>> - timers
>>> - Block multiqueue
>>> - rcutree
>>>
>>> If timers_dead_cpu() comes later than blk_mq_queue_reinit_notify()
>>> that latter function causes a RCU stall.
>>
>> After this change is applied I am seeing RCU stalls during suspend
>> on Tegra. I guess I am hitting the case mentioned above? How should
>> this be avoided?
> 
> Contrary to the commit message, this callback ended up in the wrong
> place within the sequence.  (It was correct in an earlier version, but
> the series has been through many changes.)
> 
> Can you try this patch to see if it avoids the stall, please?

I have included the patch and I am no longer seeing any RCU stalls and
so this does look like it fixed it.

Thanks!
Jon

-- 
nvpublic
