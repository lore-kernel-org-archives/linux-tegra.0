From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: v7 setup function should invalidate L1 cache
Date: Tue, 19 May 2015 23:07:21 +0100
Message-ID: <20150519220721.GK2067@n2100.arm.linux.org.uk>
References: <E1Yuk8W-0001tC-IK@rmk-PC.arm.linux.org.uk>
 <6452458.LAJUB33YSi@phil>
 <2080993.BUNZpO9uLL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2080993.BUNZpO9uLL@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, =?iso-8859-1?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michael =?iso-8859-1?Q?Niew=F6hner?= <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>linux-
List-Id: linux-tegra@vger.kernel.org

On Tue, May 19, 2015 at 11:55:12PM +0200, Arnd Bergmann wrote:
> On Tuesday 19 May 2015 23:44:58 Heiko Stuebner wrote:
> > 
> > Michael Niewoehner tested this on a rk3188 (Cortex-A9) and wrote in [0]
> > > Tested-by: Michael Niewoehner <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>
> > > 
> > > Tested on Radxa Rock Pro with RK3188.
> > > The kernel panics on reboot I had before and also a kernel BUG when running
> > > "memtester 1900M" went away and the rock seems to run stable now.
> > 
> 
> We should probably create a separate fix for that and add it to the stable
> kernels then. I would suggest something like the untested patch below,
> which takes advantage of the fact that we already have separate assignments
> for the start_secondary function pointer for A9 and A17.

Your patch is also continuing the pattern with this code...

> diff --git a/arch/arm/mach-rockchip/headsmp.S b/arch/arm/mach-rockchip/headsmp.S
> index 46c22dedf632..ae0077e8fe98 100644
> --- a/arch/arm/mach-rockchip/headsmp.S
> +++ b/arch/arm/mach-rockchip/headsmp.S
> @@ -16,9 +16,6 @@
>  #include <linux/init.h>
>  
>  ENTRY(rockchip_secondary_startup)
> -	mrc	p15, 0, r0, c0, c0, 0	@ read main ID register
> -	ldr	r1, =0x00000c09		@ Cortex-A9 primary part number
> -	teq	r0, r1
>  	beq	v7_invalidate_l1
>  	b	secondary_startup

If you look carefully at this, you'll notice that it's utter crap.
(Sorry, but it is.)  It has two problems:

1. It'll never match a Cortex-A9 CPU.  Cortex-A9 has a MIDR value of
   0x412fc09a, not 0x00000c09.  The bit position of the part number
   field isn't even right.

2. If it does match, then we branch to "v7_invalidate_l1" without setting
   the link register: we'll never return back here (we'll return to whatever
   random value the link register contains) and so we'll never make it to
   secondary_startup.  *Thankfully*, because of (1), this branch will
   never be taken - this is it's saving grace.

Your patch introduces a /third/ form of crapiness:

3. If the PSR happens to have Z=1, the "beq" instruction will be taken,
   thereby crashing the system because of (2).

The /simplest/ change which would fix this problem is to just change
proc-v7.S.  The remainder is effectively a cleanup removing redundant
code.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
