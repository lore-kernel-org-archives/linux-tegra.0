From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Tue, 26 Jul 2016 10:20:58 +0100
Message-ID: <0b5a7bb5-6670-606b-e33d-63cd8b0fcedd@nvidia.com>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
 <20160725153543.GB10939@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160725153543.GB10939@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: rcochran@linutronix.de
Cc: Anna-Maria Gleixner <anna-maria@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 25/07/16 16:35, rcochran@linutronix.de wrote:
> On Mon, Jul 25, 2016 at 03:56:48PM +0100, Jon Hunter wrote:
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
> The problem that I had found was a hidden dependency.  When I
> initially placed the timers callback into the new HP state list, that
> caused a stall because the dependency was broken.  The old code worked
> by luck, based on the order of the notifier registrations.  The new
> code makes the old implicit ordering explicit, so it should work just
> as well as before (famous last words).

I see.

>> Interestingly I am only seeing the above when using the ARM
>> multi_v7_defconfig kernel configuration and not with the tegra_defconfig.
>> One key difference between these is that the multi_v7_defconfig does not
>> have CONFIG_PREEMPT enabled. Initial testing shows enabling CONFIG_PREEMPT
>> for multi_v7_defconfig makes the problem go away.
> 
> Just to be sure, this problem didn't exist before the HP rework, that
> is, suspend worked fine with and without CONFIG_PREEMPT, right?

Correct. I test suspend on Tegra with both multi_v7_defconfig
(CONFIG_PREEMPT disabled) and tegra_defconfig (CONFIG_PREEMPT enabled).
Looking at the git history for these configs I don't see any changes in
this regard since they were added (unless some underlying Kconfig files
have changed).

> I see if I can find a tegra system to test with...

Thanks. I have not tried another ARM based device, but I would be
curious if another ARM device sees this or not.

Cheers
Jon

-- 
nvpublic
