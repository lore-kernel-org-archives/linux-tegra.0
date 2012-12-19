From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: tegra_cpu_die() dead code?
Date: Wed, 19 Dec 2012 11:11:05 -0700
Message-ID: <50D20339.4090402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Joseph,

In next-20121217, I see:

void __ref tegra_cpu_die(unsigned int cpu)
{
        cpu = cpu_logical_map(cpu);

        /* Flush the L1 data cache. */
        flush_cache_all();

        /* Shut down the current CPU. */
        tegra_hotplug_shutdown();

        /* Clock gate the CPU */
        tegra_wait_cpu_in_reset(cpu);
        tegra_disable_cpu_clock(cpu);
	
        /* Should never return here. */
        BUG();

Given that both implementations (Tegra20/30) of tegra_hotplug_shutdown
include:

        bl      tegra20_cpu_shutdown
        mov     pc, lr                  @ should never get here

why does tegra_cpu_die() include the calls to tegra_wait_cpu_in_reset()
and tegra_disable_cpu_clock() after calling tegra_hotplug_shutdown()?
(and how can a CPU wait for itself to be in reset anyway)?

Perhaps this is fixed by the various patches you've posted but are
awaiting being applied?
