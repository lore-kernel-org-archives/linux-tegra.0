From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Mon, 30 Jun 2014 17:42:17 +0300
Message-ID: <20140630144217.GV3679@tbergstrom-lnx.Nvidia.com>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53ADAA1C.70407@ti.com> <20140627232757.GB26184@ulmo>
 <20140630102512.GE28951@arm.com>
 <20140630114621.GT3679@tbergstrom-lnx.Nvidia.com>
 <20140630141334.GK28951@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140630141334.GK28951-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> > > PSCI again?
> > 
> > Not possible for boards where linux runs in NS (roth and tn7).
> 
> That's one of the main use-cases for PSCI - Linux running in NS mode.
> AFAIK, the boards that you mentioned are not ARMv8? We don't intend to

They are v7 indeed...

> enforce PSCI on ARMv7 platforms, mainly because of the legacy firmware
> (though where starting from scratch it would be nice). That means that
> the code won't be shared with arm64 and you can leave it under arch/arm
> (it's a lot of AArch32 assembly anyway).
> 
> > The secure monitor on those is outside our control and does not
> > implement PSCI.
> 
> As I said, I don't think we should change firmware on existing ARMv7
> SoCs but for a new ARMv8 SoC I strongly recommend PSCI. The firmware
> needs to be written anyway (different AArch64 exception model), so you
> can raise such requirement with your firmware provider (ARM also
> provides Trusted Firmware freely as a quick start which implements PSCI,
> though you can only use it as an example).

For v8 this should be fine yes...

> 
> > There might be some value for Tegra114 and Tegra124 if we would like
> > to use HYP mode, but that's not on the radar today. It's a waste of
> > time for Tegra20 and Tegra30.
> 
> I think you should keep the Hyp support in mind anyway and test Linux
> booting in NS mode on your platforms. It may not be on your radar today
> for a SoC but if you later decide that it is, we end up with needing
> different code paths in Linux for the same SoC depending on how it boots
> (and you can't easily detect this at boot time, nor you can pass it via
> DT).

You can just look for a psci DT node? If this node is missing, fallback to
the existing tegra specific mechanism. At least, that's how I envision doing
PSCI for HYP mode on v7 based boards where linux today runs in secure mode.
u-boot loads a minimal secure monitor which only does PSCI (we don't care about
any security as there are no keys available for signing on those boards
anyway), adds the PSCI node to the DT and then boots linux in HYP mode. 
tegra_cpu_reset_handler_enable() checks for a PSCI node and uses it if
available. Else it will fallback to the existing methods. Similar for cpuidle.
No guarantees that this will ever be implemented though :) Maybe.

Cheers,

Peter.
