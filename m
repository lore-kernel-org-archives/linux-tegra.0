From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: add support for tegra30 interrupts
Date: Wed, 2 Nov 2011 19:21:12 +0000
Message-ID: <20111102192112.GC12913@n2100.arm.linux.org.uk>
References: <1320248292-22736-1-git-send-email-pdeschrijver@nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF173F9A46E5@HQMAIL01.nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF173F9A4758@HQMAIL01.nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF173F9A47A7@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173F9A47A7-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 02, 2011 at 12:09:36PM -0700, Stephen Warren wrote:
> To solve this, I recommend definining ARCH_NR_GPIOs for Tegra, to something
> large; I see that arch/arm/mach-shmobile defines it to 1024. Failing any
> disadvantage of using a number that large, I'd go for that...

I'd suggest that we immediately start solving the ARCH_NR_GPIO
definition a single zImage friendly way - rather than throwing a
definition into mach/gpio.h, add this into asm/gpio.h:

#if CONFIG_ARCH_NR_GPIO > 0
#define ARCH_NR_GPIO CONFIG_ARCH_NR_GPIO
#endif

and in arch/arm/Kconfig:

config ARCH_NR_GPIO
	int
	default 1024 if ARCH_SHMOBILE || ARCH_TEGRA
	... etc ...
	default 0

The list should be sorted in numeric order, largest first.

This then gives us a path to eliminate the ARCH_NR_GPIO definitions
from mach/gpio.h - and should allow more mach/gpio.h to become empty.
