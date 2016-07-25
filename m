From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Mon, 25 Jul 2016 15:56:48 +0100
Message-ID: <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160711122535.775201614-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anna-Maria Gleixner <anna-maria-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Richard,

On 11/07/16 13:29, Anna-Maria Gleixner wrote:
> From: Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 
> When tearing down, call timers_dead_cpu before notify_dead.
> There is a hidden dependency between:
>
> - timers
> - Block multiqueue
> - rcutree
>
> If timers_dead_cpu() comes later than blk_mq_queue_reinit_notify()
> that latter function causes a RCU stall.

After this change is applied I am seeing RCU stalls during suspend
on Tegra. I guess I am hitting the case mentioned above? How should
this be avoided?

[    5.321824] PM: Syncing filesystems ... done.
[    5.349746] Freezing user space processes ... (elapsed 0.001 seconds) done.
[    5.358122] Double checking all user space processes after OOM killer disable... (elapsed 0.000 seconds) 
[    5.367817] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[    5.376746] Suspending console(s) (use no_console_suspend to debug)
[    5.427213] PM: suspend of devices complete after 42.812 msecs
[    5.429909] PM: late suspend of devices complete after 2.680 msecs
[    5.431968] PM: noirq suspend of devices complete after 2.049 msecs
[    5.431973] Disabling non-boot CPUs ...
[    5.432861] CPU1: shutdown
[    5.467806] CPU2: shutdown
[    5.506925] IRQ17 no longer affine to CPU3
[    5.507294] CPU3: shutdown
[   26.509992] INFO: rcu_sched detected stalls on CPUs/tasks:
[   26.510005]  3-O.N: (0 ticks this GP) idle=e13/140000000000000/0 softirq=86/86 fqs=0 
[   26.510016]  (detected by 0, t=4202 jiffies, g=-225, c=-226, q=23)
[   26.510020] Task dump for CPU 3:
[   26.510033] swapper/3       R running      0     0      1 0x00000000
[   26.510063] [<c0b79fac>] (__schedule) from [<c033b808>] (tegra_cpu_die+0x30/0x48)
[   26.510080] [<c033b808>] (tegra_cpu_die) from [<c030dd4c>] (arch_cpu_idle_dead+0x44/0x88)
[   26.510094] [<c030dd4c>] (arch_cpu_idle_dead) from [<c03794bc>] (cpu_startup_entry+0x1c0/0x220)
[   26.510106] [<c03794bc>] (cpu_startup_entry) from [<80301c2c>] (0x80301c2c)
[   26.510116] rcu_sched kthread starved for 4202 jiffies! g4294967071 c4294967070 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1
[   26.510128] rcu_sched       S c0b79fac     0     7      2 0x00000000
[   26.510139] [<c0b79fac>] (__schedule) from [<c0b7a434>] (schedule+0x38/0x9c)
[   26.510152] [<c0b7a434>] (schedule) from [<c0b7cf3c>] (schedule_timeout+0x158/0x21c)
[   26.510166] [<c0b7cf3c>] (schedule_timeout) from [<c03922e0>] (rcu_gp_kthread+0x414/0x99c)
[   26.510179] [<c03922e0>] (rcu_gp_kthread) from [<c035cdb8>] (kthread+0xd8/0xf4)
[   26.510191] [<c035cdb8>] (kthread) from [<c0307fb8>] (ret_from_fork+0x14/0x3c)
[   26.531238] Enabling non-boot CPUs ...
[   26.546568] CPU1 is up
[   26.566858] CPU2 is up
[   26.587169] CPU3 is up
[   26.588470] PM: noirq resume of devices complete after 1.290 msecs
[   26.591329] PM: early resume of devices complete after 2.574 msecs
[   26.696785] PM: resume of devices complete after 105.439 msecs
[   26.876814] Restarting tasks ... done.

Interestingly I am only seeing the above when using the ARM
multi_v7_defconfig kernel configuration and not with the tegra_defconfig.
One key difference between these is that the multi_v7_defconfig does not
have CONFIG_PREEMPT enabled. Initial testing shows enabling CONFIG_PREEMPT
for multi_v7_defconfig makes the problem go away.

Cheers
Jon
