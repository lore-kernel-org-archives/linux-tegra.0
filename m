From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Fri, 14 Oct 2011 07:45:15 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A260@HQMAIL01.nvidia.com>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173955580F@HQMAIL01.nvidia.com>
 <CAOesGMiuzF47kdmaaFny9Fg1ieox6a75tMFfLRAptvDxz_QPMg@mail.gmail.com>
 <20111014071500.GP21648@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111014071500.GP21648@n2100.arm.linux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "Colin Cross (ccross@android.com)" <ccross@android.com>, Erik Gilling <konkers@android.com>, "Arnd Bergmann (arnd@arndb.de)" <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

Russell King wrote at Friday, October 14, 2011 1:15 AM:
> On Thu, Oct 13, 2011 at 04:38:46PM -0700, Olof Johansson wrote:
> > Hi,
> >
> > On Wed, Sep 28, 2011 at 10:50 AM, Stephen Warren <swarren@nvidia.co=
m> wrote:
> > > Peter De Schrijver wrote at Tuesday, September 27, 2011 7:08 PM:
> > >> This patch causes the kernel uncompressor to determine the physi=
cal address
> > >> of the SDRAM at runtime. This allows the kernel to boot on both =
tegra20 and
> > >> tegra30 even though SDRAM is at different physical addresses on =
both SoCs.
> > >>
> > >> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > >
> > > An alternative would be to simply add that config option to the r=
elevant
> > > defconfig/.config file. I see both cases in use in the kernel. St=
ill, the
> > > code change this enables looks fine to just turn on all the time,=
 and will
> > > be needed for Tegra30 support, so I'm fine just selecting it as y=
ou have.
> > >
> > > Acked-by: Stephen Warren <swarren@nvidia.com>
> > >
> > >> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > >> index 472a7f8..474737b 100644
> > >> --- a/arch/arm/Kconfig
> > >> +++ b/arch/arm/Kconfig
> > >> @@ -596,6 +596,7 @@ config ARCH_TEGRA
> > >> =A0 =A0 =A0 select HAVE_CLK
> > >> =A0 =A0 =A0 select HAVE_SCHED_CLOCK
> > >> =A0 =A0 =A0 select ARCH_HAS_CPUFREQ
> > >> + =A0 =A0 select AUTO_ZRELADDR
> > >> =A0 =A0 =A0 help
> > >> =A0 =A0 =A0 =A0 This enables support for NVIDIA Tegra based syst=
ems (Tegra APX,
> > >> =A0 =A0 =A0 =A0 Tegra 6xx and Tegra 2 series).
> > >
> > > P.S. Since this patch relates to Tegra, you should CC the Tegra m=
aintainers
> > > and list; I've done so on this message. I also added Arnd; he mig=
ht take
> > > this through the arm-soc tree.
> >
> > While it does touch a file outside of arch/arm/mach-tegra, it's for
> > the tegra options and is not likely to cause conflicts upstream. I'=
ll
> > apply it with the rest of tegra patches for 3.2 here.
> >
> > So: Applied, thanks.
>=20
> I'll point out that this makes Tegra incompatible with ZBOOT_ROM, whi=
ch
> can still be enabled.  ZBOOT_ROM=3Dy AUTO_ZRELADDR=3Dy is an invalid
> configuration at runtime.

I see that at least one machine solves that by doing:

config ARCH_EP93XX
=2E..
        select AUTO_ZRELADDR if !ZBOOT_ROM

That said, given the way Tegra works, ZBOOT_ROM isn't useful; typically=
,
systems don't use NOR flash for storage of the kernel, so I don't think
ZBOOT_ROM is likely to be used. Perhaps we should just depend on !ZBOOT=
_ROM?

--=20
nvpublic
