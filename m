From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 7/8] arm/tegra: implement support for tegra30
Date: Mon, 7 Nov 2011 14:47:46 +0200
Message-ID: <20111107124746.GP29978@tbergstrom-lnx.Nvidia.com>
References: <1320242948-21061-1-git-send-email-pdeschrijver@nvidia.com>
 <1320242948-21061-8-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173F9A4E4F@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173F9A4E4F-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 04, 2011 at 09:43:57PM +0100, Stephen Warren wrote:
> Peter De Schrijver wrote at Wednesday, November 02, 2011 8:09 AM:
> > Add support for tegra30 SoC. This includes a device tree compatible type for
> > this SoC ("nvidia,tegra30") and adds L2 cache initialization for this new SoC.
> > The clock framework is still missing, which prevents most drivers from working.
> ...
> > diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> ...
> > @@ -17,7 +14,18 @@ config ARCH_TEGRA_2x_SOC
> >  	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
> >  	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller
> > 
> > -endchoice
> > +config ARCH_TEGRA_3x_SOC
> 
> Wasn't that config option already used earlier in the series, e.g. in
> [PATCH v2 6/8] arm/tegra: pinmux tables and definitions for tegra30.

It is. Is that a problem?

Cheers,

Peter.
