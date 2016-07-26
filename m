From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Tue, 26 Jul 2016 19:22:31 +0100
Message-ID: <42c161a2-fbb8-47ce-8ec4-a2ccfac3bfc7@nvidia.com>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
 <20160725153543.GB10939@linutronix.de>
 <0b5a7bb5-6670-606b-e33d-63cd8b0fcedd@nvidia.com>
 <20160726144039.GB23707@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160726144039.GB23707@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: rcochran@linutronix.de
Cc: Anna-Maria Gleixner <anna-maria@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Richard,

On 26/07/16 15:40, rcochran@linutronix.de wrote:
> Jon,
> 
> On Tue, Jul 26, 2016 at 10:20:58AM +0100, Jon Hunter wrote:
>> Thanks. I have not tried another ARM based device, but I would be
>> curious if another ARM device sees this or not.
> 
> I do see this stall on socfpga and on zynq, but in both cases the
> suspend mechanism is flakey in other ways, too.  At least I can
> reproduce the stall sometimes.
> 
> In your other mail you wrote that you test it like this:
> 
>    rtcwake -d rtc1 -m mem -s 3
> 
> But the stall appears only after 20 seconds.  So the resume event
> after three seconds (-s 3) is getting lost, right?

I don't think so. I noticed that when the stall occurs, I don't see the
board attempt to transition to the Tegra LP1 power state in suspend and
appears to wake up straight away. So I think the wake-up is seen, but
the stall prevents it from transitioning all the way to LP1.

Cheers
Jon

-- 
nvpublic
