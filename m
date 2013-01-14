From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Use DT /cpu node to detect number of
 CPU core
Date: Mon, 14 Jan 2013 10:49:25 +0100
Message-ID: <20130114.114925.1476619399284636466.hdoyu@nvidia.com>
References: <1358149970-28156-1-git-send-email-hdoyu@nvidia.com><1358149970-28156-2-git-send-email-hdoyu@nvidia.com><20130114092720.GX23505@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130114092720.GX23505-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Russell,

Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote @ Mon, 14 Jan 2013 10:27:20 +0100:

> On Mon, Jan 14, 2013 at 09:52:50AM +0200, Hiroshi Doyu wrote:
> > +	if (!arm_dt_cpu_map_valid())
> > +		set_cpu_possible(0, true);
> 
> You don't need to do any of this (and, therefore, I don't think you even
> need the first patch.)
> 
> The generic boot code will set CPU0 as possible, present and online.  Think
> about it: you're booting on that very CPU so it better be possible, present
> and online.  If it isn't, what CPU is executing your code?
> 
> arm_dt_init_cpu_maps() will only ever set _additional_ CPUs in the possible
> map.
> 
> Ergo, by the time the above code is run, CPU0 will already be marked as
> possible.  Therefore, the above code and arm_dt_cpu_map_valid() is not
> required.

Right.

In Tegra, we've decided to not use SCU based detection at all any more
and to continue with a single core even when DT cpu detection
fails. For Tegra, "arm_dt_cpu_map_valid()" is not necessary. For other
SoCs, this would be necessary when they want to detect again with
SCU.

Now this original Tegra patch would be independet of the 1st patch as
below:

From 36061aff7a772524a1d1785884889619042d4445 Mon Sep 17 00:00:00 2001
From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Mon, 26 Nov 2012 12:25:14 +0200
Subject: [PATCH 1/1] ARM: tegra: Use DT /cpu node to detect number of CPU
 core

SCU based detection only works with Cortex-A9 MP and it doesn't
support ones with multiple clusters. The only way to detect number of
CPU core correctly is with DT /cpu node.

Tegra SoCs decided to use DT detection as the only way and to not use
SCU based detection at all. Even if DT /cpu node based detection
fails, it continues with a single core

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Based on the discussion:
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/140608.html
---
 arch/arm/mach-tegra/platsmp.c |   15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index 6867030..689ee4b 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -177,23 +177,8 @@ done:
 	return status;
 }
 
-/*
- * Initialise the CPU possible map early - this describes the CPUs
- * which may be present or become present in the system.
- */
 static void __init tegra_smp_init_cpus(void)
 {
-	unsigned int i, ncores = scu_get_core_count(scu_base);
-
-	if (ncores > nr_cpu_ids) {
-		pr_warn("SMP: %u cores greater than maximum (%u), clipping\n",
-			ncores, nr_cpu_ids);
-		ncores = nr_cpu_ids;
-	}
-
-	for (i = 0; i < ncores; i++)
-		set_cpu_possible(i, true);
-
 	set_smp_cross_call(gic_raise_softirq);
 }
 
-- 
1.7.9.5
