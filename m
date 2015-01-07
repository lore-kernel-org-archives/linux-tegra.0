From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/2] arm64: first set of Kconfig patches for Tegra132
 support
Date: Wed, 7 Jan 2015 11:07:38 +0000
Message-ID: <20150107110738.GF7485@arm.com>
References: <20150107081638.14381.42444.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150107081638.14381.42444.stgit-orwA252wQtA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 07, 2015 at 08:17:29AM +0000, Paul Walmsley wrote:
> Hi Catalin & Will,

Hi Paul,

> These patches start the ARM64 Kconfig and defconfig changes to
> support the Tegra132 (aka Tegra K1 64-bit) SoC and the NVIDIA
> Norrin64 FFD board.
> 
> Tegra132 support is made conditional on CONFIG_BROKEN, since
> there are some patches pending for other maintainers to fix
> compilation when CONFIG_ARCH_TEGRA is set during an ARM64 build.
> Once those patches have been merged, a subsequent patch will be
> sent to remove the CONFIG_BROKEN dependency and to make a few other
> defconfig changes that are dependent on CONFIG_ARCH_TEGRA.
> 
> These patches apply on the arm64 fixes/core branch, commit
> 5d96e0cba263.  They have been boot-tested on QEMU 2.2.0 AArch64,
> and (after other patches have been applied) have been boot-tested
> on the Tegra132 Norrin64 FFD board.

Whilst I'm happy to take the second patch for 3.20 (getting those
dependencies building and keeping them building is a Good Thing), can we
hold off on the first patch until it's not broken? Having an unconditional
depends on BROKEN isn't really that useful.

Cheers,

Will
