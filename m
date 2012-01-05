From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: select required CPU and L2 errata options
Date: Thu, 5 Jan 2012 10:40:48 -0800
Message-ID: <CAD=FV=V3qO-=DOz5Qc95fyYJC4656WvmUYGXMAHgXcGf96+aeQ@mail.gmail.com>
References: <1325719752-818-1-git-send-email-olof@lixom.net>
	<6121078.4q2inFFXlB@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6121078.4q2inFFXlB@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I can't comment on the L2 stuff (haven't looked there), but just going
by Cortex-A9 revisions (T25 has roughly r1p1 and T30 has r2p7), I've
got this table:

Errata=A0=A0 =A0 =A0 =A0 =A0 =A0 T25 (A9 ~r1p1) =A0 T30 (A9 r2p7) =A0 =A0=
Applies to
ARM_ERRATA_364296 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0pre A8
ARM_ERRATA_411920 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0pre A8
ARM_ERRATA_430973 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0A8
ARM_ERRATA_458693 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0A8
ARM_ERRATA_460075 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0A8
ARM_ERRATA_720789 =A0yes =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 A9 (prior to r2p0)
ARM_ERRATA_742230 =A0yes =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 A9 (r1p0..r2p2)
ARM_ERRATA_742231 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0A9 (r2p0..r2p2)
ARM_ERRATA_743622 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0A9 (r2p0..r2p2)
ARM_ERRATA_751472 =A0yes =A0 =A0 =A0 =A0 =A0 =A0 =A0yes =A0 =A0 =A0 =A0=
 =A0 =A0 =A0A9 (prior to r3p0)
ARM_ERRATA_754322 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 yes =A0 =A0 =A0 =A0=
 =A0 =A0 =A0A9 (r2p*, r3p*)
ARM_ERRATA_754327 =A0yes =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 A9 (prior to r2p0)
ARM_ERRATA_764369 =A0yes =A0 =A0 =A0 =A0 =A0 =A0 =A0yes =A0 =A0 =A0 =A0=
 =A0 =A0 =A0A9 MPCore (all revs)

=2E..so that means we should also be adding in=A0720789 (T2x),=A0751472
(T2x, T30),=A0754322 (T30),=A0754327 (T2x),=A0764369 (T2x, T30).


Certainly appreciate anyone checking my work and definitely appreciate
input from nVidia.

-Doug

---

On Thu, Jan 5, 2012 at 8:30 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
>
> Hi,
>
> Am Mittwoch, 4. Januar 2012, 15:29:12 schrieb Olof Johansson:
> > Only one of the L2 erratas are needed on T30, but T20/25
> > needs a few more.
>
> can we have a word from someone from NVIDIA about which Tegra version=
s/revisions need
> which erratum applied?
>
> Currently the kernel has selections for the following errata (on ARM)=
:
>
> =A0 =A0 =A0 =A0T2x =A0 =A0 =A0 =A0 =A0 =A0 T30
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_430973 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Stale predict=
ion on replaced interworking branch
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_458693 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Processor dea=
dlock when a false hazard is created
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_460075 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Data written =
to the L2 cache can be overwritten
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0with stale data
> =A0 =A0 =A0 =A0x =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ERRATA_742230 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMB operation=
 may be faulty
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_742231 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Incorrect haz=
ard handling in the SCU may lead to
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data corruption
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0PL310_ERRATA_588369 =A0 =A0 Clean & Invalidate maintenance oper=
ations do not
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0invalidate clean lines
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_720789 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 TLBIASIDIS an=
d TLBIMVAIS operations can broadcast
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0a faulty ASID
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0PL310_ERRATA_727915 =A0 =A0 Background Clean & Invalidate by Wa=
y operation
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0can cause data corruption
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_743622 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Faulty hazard=
 checking in the Store Buffer may
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lead to data corruption
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_751472 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Interrupted I=
CIALLUIS may prevent completion of
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0broadcasted operation
> =A0 =A0 =A0 =A0x =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 PL310_ERRATA_753970 =A0 =A0 cache sync operation may be faulty
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_754322 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 possible faul=
ty MMU translations following an ASID
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_754327 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 no automatic =
Store Buffer drain
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0ERRATA_764369 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Data cache li=
ne maintenance operation by MVA may
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0not succeed
> =A0 =A0 =A0 =A0x =A0 =A0 =A0 =A0 =A0 =A0 =A0 x =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 PL310_ERRATA_769419 =A0 =A0 no automatic Store Buffer drain
>
> With Olofs patch, the following errata are enabled by tegra_defconfig=
:
>
> 742230(T2x), 753970(T2x), 769419(T2x + T30)
>
> I have the feeling that at least 764369 also needs to be enabled. Fro=
m the
> description: ... affecting Cortex-A9 MPCore with two or more processo=
rs (all
> current revisions). I wonder if this includes multi *cores*.
>
> The TRM is not very detailed about this topic. Having this info will =
likely remove
> some headache for non OEM custumers.
>
> Marc
>
>
> >
> > Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> > ---
> > =A0arch/arm/mach-tegra/Kconfig | =A0 =A04 ++++
> > =A01 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kcon=
fig
> > index 373652d..a2c76ee 100644
> > --- a/arch/arm/mach-tegra/Kconfig
> > +++ b/arch/arm/mach-tegra/Kconfig
> > @@ -10,6 +10,9 @@ config ARCH_TEGRA_2x_SOC
> > =A0 =A0 =A0 select USB_ARCH_HAS_EHCI if USB_SUPPORT
> > =A0 =A0 =A0 select USB_ULPI if USB_SUPPORT
> > =A0 =A0 =A0 select USB_ULPI_VIEWPORT if USB_SUPPORT
> > + =A0 =A0 select ARM_ERRATA_742230
> > + =A0 =A0 select PL310_ERRATA_753970 if CACHE_PL310
> > + =A0 =A0 select PL310_ERRATA_769419 if CACHE_L2X0
> > =A0 =A0 =A0 help
> > =A0 =A0 =A0 =A0 Support for NVIDIA Tegra AP20 and T20 processors, b=
ased on the
> > =A0 =A0 =A0 =A0 ARM CortexA9MP CPU and the ARM PL310 L2 cache contr=
oller
> > @@ -23,6 +26,7 @@ config ARCH_TEGRA_3x_SOC
> > =A0 =A0 =A0 select USB_ULPI if USB_SUPPORT
> > =A0 =A0 =A0 select USB_ULPI_VIEWPORT if USB_SUPPORT
> > =A0 =A0 =A0 select USE_OF
> > + =A0 =A0 select PL310_ERRATA_769419 if CACHE_L2X0
> > =A0 =A0 =A0 help
> > =A0 =A0 =A0 =A0 Support for NVIDIA Tegra T30 processor family, base=
d on the
> > =A0 =A0 =A0 =A0 ARM CortexA9MP CPU and the ARM PL310 L2 cache contr=
oller
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
