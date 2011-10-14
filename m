From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Fri, 14 Oct 2011 08:15:00 +0100
Message-ID: <20111014071500.GP21648@n2100.arm.linux.org.uk>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF173955580F@HQMAIL01.nvidia.com> <CAOesGMiuzF47kdmaaFny9Fg1ieox6a75tMFfLRAptvDxz_QPMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMiuzF47kdmaaFny9Fg1ieox6a75tMFfLRAptvDxz_QPMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Arnd Bergmann (arnd-r2nGTMty4D4@public.gmane.org)" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 13, 2011 at 04:38:46PM -0700, Olof Johansson wrote:
> Hi,
>=20
> On Wed, Sep 28, 2011 at 10:50 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
> > Peter De Schrijver wrote at Tuesday, September 27, 2011 7:08 PM:
> >> This patch causes the kernel uncompressor to determine the physica=
l address
> >> of the SDRAM at runtime. This allows the kernel to boot on both te=
gra20 and
> >> tegra30 even though SDRAM is at different physical addresses on bo=
th SoCs.
> >>
> >> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > An alternative would be to simply add that config option to the rel=
evant
> > defconfig/.config file. I see both cases in use in the kernel. Stil=
l, the
> > code change this enables looks fine to just turn on all the time, a=
nd will
> > be needed for Tegra30 support, so I'm fine just selecting it as you=
 have.
> >
> > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> >> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> >> index 472a7f8..474737b 100644
> >> --- a/arch/arm/Kconfig
> >> +++ b/arch/arm/Kconfig
> >> @@ -596,6 +596,7 @@ config ARCH_TEGRA
> >> =A0 =A0 =A0 select HAVE_CLK
> >> =A0 =A0 =A0 select HAVE_SCHED_CLOCK
> >> =A0 =A0 =A0 select ARCH_HAS_CPUFREQ
> >> + =A0 =A0 select AUTO_ZRELADDR
> >> =A0 =A0 =A0 help
> >> =A0 =A0 =A0 =A0 This enables support for NVIDIA Tegra based system=
s (Tegra APX,
> >> =A0 =A0 =A0 =A0 Tegra 6xx and Tegra 2 series).
> >
> > P.S. Since this patch relates to Tegra, you should CC the Tegra mai=
ntainers
> > and list; I've done so on this message. I also added Arnd; he might=
 take
> > this through the arm-soc tree.
>=20
> While it does touch a file outside of arch/arm/mach-tegra, it's for
> the tegra options and is not likely to cause conflicts upstream. I'll
> apply it with the rest of tegra patches for 3.2 here.
>=20
> So: Applied, thanks.

I'll point out that this makes Tegra incompatible with ZBOOT_ROM, which
can still be enabled.  ZBOOT_ROM=3Dy AUTO_ZRELADDR=3Dy is an invalid
configuration at runtime.
