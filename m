From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Fri, 14 Oct 2011 17:29:41 +0200
Message-ID: <201110141729.41515.arnd@arndb.de>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com> <20111014071500.GP21648@n2100.arm.linux.org.uk> <74CDBE0F657A3D45AFBB94109FB122FF173BE1A260@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A260-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 14 October 2011, Stephen Warren wrote:
> Russell King wrote at Friday, October 14, 2011 1:15 AM:
> > On Thu, Oct 13, 2011 at 04:38:46PM -0700, Olof Johansson wrote:
> > 
> > I'll point out that this makes Tegra incompatible with ZBOOT_ROM, which
> > can still be enabled.  ZBOOT_ROM=y AUTO_ZRELADDR=y is an invalid
> > configuration at runtime.
> 
> I see that at least one machine solves that by doing:
> 
> config ARCH_EP93XX
> ...
>         select AUTO_ZRELADDR if !ZBOOT_ROM
> 
> That said, given the way Tegra works, ZBOOT_ROM isn't useful; typically,
> systems don't use NOR flash for storage of the kernel, so I don't think
> ZBOOT_ROM is likely to be used. Perhaps we should just depend on !ZBOOT_ROM?

That sounds like a correct fix, but also confusing because the top-level
subarchitecture selection should not depend on too many things that are
not obvious to someone configuring the kernel. From the perspective
of least suprise I would think that instead ZBOOTROM should depend on
!ARCH_TEGRA, but there is no precedent for this in the current Kconfig.

You mention that tegra30 will require AUTO_ZRELADDR. Does that mean that
with tegra30 merged you would no longer be able to build any tegra
kernel? If not, the best solution for now would probably be to
put AUTO_ZRELADDR into the defconfig for now (provided that tegra20 can
still boot without it) and make tegra30 depend on AUTO_ZRELADDR within
the tegra Kconfig.

This is only a temporary solution I think, because it is one of the
areas that we will have to revisit once we make it possible to combine
multiple subarchitectures into a single kernel. I have some ideas how
I would express that in Kconfig but I'm sure that we will have a lot
of debate over it before we coem to a solution that works for everyone.

	Arnd
