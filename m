From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Mon, 30 Jun 2014 10:44:29 +0100
Message-ID: <20140630094429.GD28951@arm.com>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <20140627232757.GB26184@ulmo>
 <53AEF81D.3080408@ti.com>
 <5279186.O063V9ZcHh@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5279186.O063V9ZcHh@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 30, 2014 at 08:23:45AM +0100, Arnd Bergmann wrote:
> On Saturday 28 June 2014 13:15:09 Santosh Shilimkar wrote:
> > >> For SMP boot, ARMv8 expecting to have either PSCI based implementation or
> > >> device tree based boot scheme. you can move towards that model if possible.
> > > 
> > > But we also have the code for SMP on 32-bit ARM. Should that remain in
> > > arch/arm/mach-tegra or can it move to drivers/soc/tegra?
> > > 
> > You answered yourself. I don't see any point moving such a code to drivers
> > which is really SMP bring up code for ARM 32 bit. For ARM 64 bit, as
> > outline by maintainers (Catalin, Arnd), you should use PSCI or DT based
> > boot scheme.
> 
> I was hoping that one day we could unify the SMP bootup code with the
> cpuidle infrastructure, as a lot of the underlying functions are shared
> on the majority of SoCs. I have no plans to work on that myself though,
> and it would have to be agreed on by the cpuidle maintainers.

If you look at the arm64 implementation and Lorenzo's generic cpuidle
code, that's not far off. Basically for arm64 we have a cpu_operations
structure which implements boot, suspend, disable etc., placing SMP
booting, hotplug and cpuidle together.

While PSCI is the (strongly) recommended way, the current structure
allows for other implementations and spin-table is an example (though
this lacks any form of parking CPUs back to firmware). What I don't want
to see is every platform implementing its own booting method for no good
reasons and especially when functionality is duplicated with other
platforms.

In the tegra case, I suppose the arm32 implementation assumes Linux
running in secure mode. On arm64 we don't support this (though it may
work for certain configurations) and once you realise you need SMC calls
for CPU up/down/suspend, I would rather standardise on PSCI (unless a
better standard appears ;)).

> For ARM64, the hope was indeed to use PSCI for all SoCs. I just have no
> idea how that would be enforced for mobile SoCs that get shipped to
> system integrators with an bootloader and kernel tree that doesn't even
> get reviewed anywhere first.

We can't enforce this but at least with enough "marketing" support, we
can sell this as a good idea. For example, if one implements PSCI you
get (generic) cpuidle for free (just DT bindings). That's definitely not
enough and other things like a comprehensive validation suite for PSCI
also helps (currently ARM only works on bare metal but it would be good
to have a kernel-based test suite as well).

-- 
Catalin
