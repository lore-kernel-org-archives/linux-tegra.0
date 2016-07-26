From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Tue, 26 Jul 2016 16:15:50 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1607261613161.19896@nanos>
References: <20160711122450.923603742@linutronix.de> <20160711122535.775201614@linutronix.de> <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com> <20160725153543.GB10939@linutronix.de> <0b5a7bb5-6670-606b-e33d-63cd8b0fcedd@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0b5a7bb5-6670-606b-e33d-63cd8b0fcedd@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: rcochran@linutronix.de, Anna-Maria Gleixner <anna-maria@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Jon,

On Tue, 26 Jul 2016, Jon Hunter wrote:
> On 25/07/16 16:35, rcochran@linutronix.de wrote:
> > Just to be sure, this problem didn't exist before the HP rework, that
> > is, suspend worked fine with and without CONFIG_PREEMPT, right?
> 
> Correct. I test suspend on Tegra with both multi_v7_defconfig
> (CONFIG_PREEMPT disabled) and tegra_defconfig (CONFIG_PREEMPT enabled).
> Looking at the git history for these configs I don't see any changes in
> this regard since they were added (unless some underlying Kconfig files
> have changed).

Is that fully reproducible, i.e on every suspend?

Can you please check whether this issue happens with just cpu offline as
well? I.e. set a cpu (or all non-boot cpus) offline, wait long enough that the
stall detector can trigger, set the cpu(s) online again and repeat.

Thanks

	tglx
