From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: v7 setup function should invalidate L1 cache
Date: Tue, 19 May 2015 23:55:12 +0200
Message-ID: <2080993.BUNZpO9uLL@wuerfel>
References: <E1Yuk8W-0001tC-IK@rmk-PC.arm.linux.org.uk> <6452458.LAJUB33YSi@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6452458.LAJUB33YSi@phil>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, =?ISO-8859-1?Q?S=C3=B6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michael =?ISO-8859-1?Q?Niew=F6hner?= <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 19 May 2015 23:44:58 Heiko Stuebner wrote:
> 
> Michael Niewoehner tested this on a rk3188 (Cortex-A9) and wrote in [0]
> > Tested-by: Michael Niewoehner <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>
> > 
> > Tested on Radxa Rock Pro with RK3188.
> > The kernel panics on reboot I had before and also a kernel BUG when running
> > "memtester 1900M" went away and the rock seems to run stable now.
> 

We should probably create a separate fix for that and add it to the stable
kernels then. I would suggest something like the untested patch below,
which takes advantage of the fact that we already have separate assignments
for the start_secondary function pointer for A9 and A17.

	Arnd

diff --git a/arch/arm/mach-rockchip/headsmp.S b/arch/arm/mach-rockchip/headsmp.S
index 46c22dedf632..ae0077e8fe98 100644
--- a/arch/arm/mach-rockchip/headsmp.S
+++ b/arch/arm/mach-rockchip/headsmp.S
@@ -16,9 +16,6 @@
 #include <linux/init.h>
 
 ENTRY(rockchip_secondary_startup)
-	mrc	p15, 0, r0, c0, c0, 0	@ read main ID register
-	ldr	r1, =0x00000c09		@ Cortex-A9 primary part number
-	teq	r0, r1
 	beq	v7_invalidate_l1
 	b	secondary_startup
 ENDPROC(rockchip_secondary_startup)
diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index 5b4ca3c3c879..5f46724cca2f 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -149,8 +149,7 @@ static int __cpuinit rockchip_boot_secondary(unsigned int cpu,
 		 * sram_base_addr + 8: start address for pc
 		 * */
 		udelay(10);
-		writel(virt_to_phys(rockchip_secondary_startup),
-			sram_base_addr + 8);
+		writel(virt_to_phys(secondary_startup), sram_base_addr + 8);
 		writel(0xDEADBEAF, sram_base_addr + 4);
 		dsb_sev();
 	}
