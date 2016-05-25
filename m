From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Fix "scheduling while atomic"
Date: Wed, 25 May 2016 16:09:30 +0100
Message-ID: <5745C02A.20308@nvidia.com>
References: <1460900051-3065-1-git-send-email-digetx@gmail.com>
 <572B47DE.1090804@nvidia.com>
 <c4a3fb3f-adb8-c167-d660-55d3f803c9c3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c4a3fb3f-adb8-c167-d660-55d3f803c9c3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 05/05/16 15:24, Dmitry Osipenko wrote:
> Hello, Jon!
> 
> On 05.05.2016 16:17, Jon Hunter wrote:
>>
>> Thanks for the report. I have been unable to reproduce this, but then I
>> don't see my tegra20 entering LP2 during cpuidle. I did force my tegra20
>> into LP2 during suspend which will exercise the same code but I did not
>> trigger this either. However, from looking at the code it does appear
>> that we could hit this.
>>
> 
> As I wrote before, it's quite difficult to reproduce.

So far I have been unable to reproduce this. I did noticed that in the
upstream kernel we disable LP2 on Tegra20 if PCIE is enabled (see
arch/arm/mach-tegra/cpuidle-tegra20.c) ...

 /*
  * Tegra20 HW appears to have a bug such that PCIe device interrupts, whether
  * they are legacy IRQs or MSI, are lost when LP2 is enabled. To work around
  * this, simply disable LP2 if the PCI driver and DT node are both enabled.
  */
 void tegra20_cpuidle_pcie_irqs_in_use(void)
 {
         pr_info_once(
                 "Disabling cpuidle LP2 state, since PCIe IRQs are in use\n");
         tegra_idle_driver.states[1].disabled = true;
 }

Even if I remove this and verify that I can enter LP2, I have been unable
to reproduce this. I know that you said that it is difficult to reproduce
and there needs to be a specific workload, however, from looking at the 
code I am trying to understand the situation that would trigger this. 

Your backtrace shows ...

[    3.430853] [<c0850fcc>] (dump_stack) from [<c00411f8>] (__schedule_bug+0x50/0x64)
[    3.431079] [<c00411f8>] (__schedule_bug) from [<c08553a8>] (__schedule+0x5c8/0x688)
[    3.431453] [<c08553a8>] (__schedule) from [<c08558f4>] (schedule_preempt_disabled+0x24/0x34)
[    3.431835] [<c08558f4>] (schedule_preempt_disabled) from [<c0856f24>] (__mutex_lock_slowpath+0xbc/0x170)
[    3.432204] [<c0856f24>] (__mutex_lock_slowpath) from [<c0857024>] (mutex_lock+0x4c/0x50)
[    3.432427] [<c0857024>] (mutex_lock) from [<c0610368>] (clk_prepare_lock+0x88/0xfc)
[    3.432800] [<c0610368>] (clk_prepare_lock) from [<c0611034>] (clk_get_rate+0xc/0x60)
[    3.433177] [<c0611034>] (clk_get_rate) from [<c034f10c>] (tegra_pmc_enter_suspend_mode+0x188/0x20c)
[    3.433580] [<c034f10c>] (tegra_pmc_enter_suspend_mode) from [<c0020d48>] (tegra_idle_lp2_last+0xc/0x40)
[    3.433795] [<c0020d48>] (tegra_idle_lp2_last) from [<c0021e1c>] (tegra20_idle_lp2_coupled+0x118/0x1fc)
[    3.434171] [<c0021e1c>] (tegra20_idle_lp2_coupled) from [<c055ec24>] (cpuidle_enter_state+0x3c/0x160)
[    3.434551] [<c055ec24>] (cpuidle_enter_state) from [<c0560ce8>] (cpuidle_enter_state_coupled+0x3dc/0x3f4)
[    3.434959] [<c0560ce8>] (cpuidle_enter_state_coupled) from [<c0055f1c>] (cpu_startup_entry+0x240/0x288)
[    3.435340] [<c0055f1c>] (cpu_startup_entry) from [<c0b29c84>] (start_kernel+0x3b4/0x3c0)
[    3.435557] [<c0b29c84>] (start_kernel) from [<00008074>] (0x8074)

... however, when we call tegra_idle_lp2_last(), CPU1 should be down and
so I would not expect that the call to mutex_trylock() in clk_get_rate() 
would fail (ie. return 0 for contention) at this point and cause us to
call mutex_lock and sleep. Therefore, I am wondering if there could be
another bug in the v3.18 kernel that you are using that could be
triggering this. 

If you are able to reproduce this on v3.18, then it would be good if you
could trace the CCF calls around this WARNING to see what is causing the 
contention.

Cheers
Jon

-- 
nvpublic
