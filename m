From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Tue, 26 Jul 2016 19:20:11 +0100
Message-ID: <be311f69-cc65-419c-371e-45e987303792@nvidia.com>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
 <20160725153543.GB10939@linutronix.de>
 <0b5a7bb5-6670-606b-e33d-63cd8b0fcedd@nvidia.com>
 <alpine.DEB.2.11.1607261613161.19896@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1607261613161.19896@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: rcochran@linutronix.de, Anna-Maria Gleixner <anna-maria@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thomas,

On 26/07/16 15:15, Thomas Gleixner wrote:
> Jon,
> 
> On Tue, 26 Jul 2016, Jon Hunter wrote:
>> On 25/07/16 16:35, rcochran@linutronix.de wrote:
>>> Just to be sure, this problem didn't exist before the HP rework, that
>>> is, suspend worked fine with and without CONFIG_PREEMPT, right?
>>
>> Correct. I test suspend on Tegra with both multi_v7_defconfig
>> (CONFIG_PREEMPT disabled) and tegra_defconfig (CONFIG_PREEMPT enabled).
>> Looking at the git history for these configs I don't see any changes in
>> this regard since they were added (unless some underlying Kconfig files
>> have changed).
> 
> Is that fully reproducible, i.e on every suspend?

No not every suspend. I run 10 suspend cycles on each Tegra board (5
boards total) and typically between 3 and 5 boards would see the stall
in the 10 suspend cycles. So it does appear to be timing sensitive.

> Can you please check whether this issue happens with just cpu offline as
> well? I.e. set a cpu (or all non-boot cpus) offline, wait long enough that the
> stall detector can trigger, set the cpu(s) online again and repeat.

I can, but it appears like Richard's patch has fixed this. I am happy to
do more testing if necessary.

Cheers
Jon

-- 
nvpublic
