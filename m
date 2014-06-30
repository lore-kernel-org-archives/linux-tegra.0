From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Mon, 30 Jun 2014 15:13:34 +0100
Message-ID: <20140630141334.GK28951@arm.com>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53ADAA1C.70407@ti.com>
 <20140627232757.GB26184@ulmo>
 <20140630102512.GE28951@arm.com>
 <20140630114621.GT3679@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140630114621.GT3679-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 30, 2014 at 12:46:21PM +0100, Peter De Schrijver wrote:
> On Mon, Jun 30, 2014 at 12:25:12PM +0200, Catalin Marinas wrote:
> > On Sat, Jun 28, 2014 at 12:27:58AM +0100, Thierry Reding wrote:
> > > On Fri, Jun 27, 2014 at 01:30:04PM -0400, Santosh Shilimkar wrote:
> > > > On Friday 27 June 2014 12:58 PM, Thierry Reding wrote:
> > > > >  rename {arch/arm/mach-tegra => drivers/soc/tegra}/cpuidle-tegra114.c (100%)
> > > > >  rename {arch/arm/mach-tegra => drivers/soc/tegra}/cpuidle-tegra20.c (100%)
> > > > >  rename {arch/arm/mach-tegra => drivers/soc/tegra}/cpuidle-tegra30.c (100%)
> > > > >  rename {arch/arm/mach-tegra => drivers/soc/tegra}/cpuidle.c (100%)
> > > > >  rename {arch/arm/mach-tegra => drivers/soc/tegra}/cpuidle.h (91%)
> > > > This should go into drivers/idle/*. if you have dependencies, please sort
> > > > them out.
> > > 
> > > What exactly is the difference between drivers/idle and drivers/cpuidle?
> > > There's an intel_idle driver in drivers/idle that includes cpuidle.h and
> > > registers with that subsystem. But there's also an i7300_idle driver
> > > that doesn't.
> > > 
> > > drivers/cpuidle seems like a better fit. I'll look into moving the code
> > > there.
> > 
> > Actually, please look at Lorenzo's generic cpuidle series. Basically
> > most cpuidle drivers simply define some C states and call the
> > corresponding platform back-end. On arm64, we aim to separate the
> > back-end in the cpu_operations structure and just have a generic cpuidle
> > driver with states defined in the DT (and passed to the back-end).
> > 
> > As for the back-end, what about using PSCI?
> > 
> > > > >  rename {arch/arm/mach-tegra => drivers/soc/tegra}/reset-handler.S (100%)
> > > > >  rename {arch/arm/mach-tegra => drivers/soc/tegra}/reset.c (100%)
> > > > >  rename {arch/arm/mach-tegra => drivers/soc/tegra}/reset.h (97%)
> > > > subsystem: drivers/power/reset/
> > > 
> > > drivers/power/reset seems to be for drivers that register functions to
> > > reset a board. The above code for Tegra doesn't do that. Rather it sets
> > > up the reset handlers for secondary CPUs and for suspend/resume.
> > 
> > PSCI again?
> 
> Not possible for boards where linux runs in NS (roth and tn7).

That's one of the main use-cases for PSCI - Linux running in NS mode.
AFAIK, the boards that you mentioned are not ARMv8? We don't intend to
enforce PSCI on ARMv7 platforms, mainly because of the legacy firmware
(though where starting from scratch it would be nice). That means that
the code won't be shared with arm64 and you can leave it under arch/arm
(it's a lot of AArch32 assembly anyway).

> The secure monitor on those is outside our control and does not
> implement PSCI.

As I said, I don't think we should change firmware on existing ARMv7
SoCs but for a new ARMv8 SoC I strongly recommend PSCI. The firmware
needs to be written anyway (different AArch64 exception model), so you
can raise such requirement with your firmware provider (ARM also
provides Trusted Firmware freely as a quick start which implements PSCI,
though you can only use it as an example).

> There might be some value for Tegra114 and Tegra124 if we would like
> to use HYP mode, but that's not on the radar today. It's a waste of
> time for Tegra20 and Tegra30.

I think you should keep the Hyp support in mind anyway and test Linux
booting in NS mode on your platforms. It may not be on your radar today
for a SoC but if you later decide that it is, we end up with needing
different code paths in Linux for the same SoC depending on how it boots
(and you can't easily detect this at boot time, nor you can pass it via
DT).

-- 
Catalin
