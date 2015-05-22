From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] arm64: tegra: Add Tegra210 support
Date: Fri, 22 May 2015 17:05:16 +0200
Message-ID: <20150522150514.GD19922@ulmo.nvidia.com>
References: <1431529065-20128-1-git-send-email-thierry.reding@gmail.com>
 <1431529065-20128-3-git-send-email-thierry.reding@gmail.com>
 <20150513171114.GA18655@e104818-lin.cambridge.arm.com>
 <20150515101913.GA20474@ulmo.nvidia.com>
 <20150519145211.GX21251@e104818-lin.cambridge.arm.com>
 <20150519151740.GA28161@ulmo.nvidia.com>
 <20150522133800.GY29424@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150522133800.GY29424-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2015 at 02:38:00PM +0100, Catalin Marinas wrote:
> On Tue, May 19, 2015 at 05:17:42PM +0200, Thierry Reding wrote:
> > On Tue, May 19, 2015 at 03:52:11PM +0100, Catalin Marinas wrote:
> > > On Fri, May 15, 2015 at 12:19:16PM +0200, Thierry Reding wrote:
> > > > On Wed, May 13, 2015 at 06:11:15PM +0100, Catalin Marinas wrote:
> > > > > On Wed, May 13, 2015 at 04:57:42PM +0200, Thierry Reding wrote:
> > > > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > > >=20
> > > > > > NVIDIA Tegra210 (also known as Tegra X1) has four Cortex-A57 an=
d four
> > > > > > Cortex-A53 CPUs. Compared to Tegra124 and Tegra132 it comes wit=
h a 256-
> > > > > > core Maxwell GPU. It supports processing videos of up to 4K res=
olutions
> > > > > > at 60 fps (H.265, VP9, H.264).
> > > > > >=20
> > > > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > > > ---
> > > > > >  arch/arm64/Kconfig                       |   9 +
> > > > > >  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 998 +++++++++++++++=
++++++++++++++++
> > > > > >  2 files changed, 1007 insertions(+)
> > > > > >  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > > > >=20
> > > > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > > > index 7796af4b1d6f..bfdf064ada66 100644
> > > > > > --- a/arch/arm64/Kconfig
> > > > > > +++ b/arch/arm64/Kconfig
> > > > > > @@ -225,6 +225,15 @@ config ARCH_TEGRA_132_SOC
> > > > > >  	  but contains an NVIDIA Denver CPU complex in place of
> > > > > >  	  Tegra124's "4+1" Cortex-A15 CPU complex.
> > > > > > =20
> > > > > > +config ARCH_TEGRA_210_SOC
> > > > > > +	bool "NVIDIA Tegra210 SoC"
> > > > > > +	depends on ARCH_TEGRA
> > > > > > +	select PINCTRL_TEGRA210
> > > > > > +	select USB_ULPI if USB_PHY
> > > > > > +	select USB_ULPI_VIEWPORT if USB_PHY
> > > > > > +	help
> > > > > > +	  Enable support for the NVIDIA Tegra210 SoC.
> > > > > > +
> > > > >=20
> > > > > The previous ARCH_TEGRA_132_SOC escaped me. Do we need all these
> > > > > ARCH_TEGRA_*_SOC entries? Can we not have per-driver Kconfig opti=
ons?
> > > > > For example, ARCH_TEGRA_132_SOC seems to be only used in
> > > > > drivers/clk/tegra, a specific Kconfig entry in there would suffic=
e.
> > > >=20
> > > > There are actually a couple of other places where this will be used=
 in
> > > > subsequent patches (e.g. memory controller driver). The idea behind
> > > > having these is that each one of them is used to enable the essenti=
als
> > > > out of the box, so that people don't have to go and enable a bunch =
of
> > > > driver-specific Kconfig options just to get a kernel configuration =
that
> > > > can actually boot.
> > >=20
> > > We debated whether to have ARCH_* options at all on arm64 and we sett=
led
> > > for the middle ground - only add them for SoC families, not individual
> > > SoCs. As for the kernel configuration that actually boots, we want the
> > > arm64 defconfig to include all the supported SoCs and drivers (though
> > > longer term I'd like to see more drivers built as modules by default).
> > >=20
> > > > This is also useful for integrators since they can simply omit all =
SoC
> > > > generations that they're not interested in. Having a per-SoC option
> > > > provides an easy way of doing so.
> > >=20
> > > The integrators could just select a SoC family and trim down unwanted
> > > options, I don't think they rely on the kernel defconfig for a final
> > > product. If this becomes an issue, I would rather have per-SoC
> > > defconfigs than lots of Kconfig entries.
> >=20
> > I understand the desire to start with a clean plate on a new
> > architecture, but Tegra has worked like this for the past 5 years and
> > it's worked out really well for us. So I'm reluctant to introduce these
> > inconsistencies merely because 64-bit ARM now lives in a different
> > directory.
>=20
> That's a good time to start cleaning this up, especially since we
> mandate single image from the beginning.
>=20
> > Are you concerned about arch/arm64/Kconfig growing wild? If so we could
> > easily move these configuration options outside to something like
> > drivers/soc/tegra/Kconfig. While at it, we could move existing options
> > from arch/arm/mach-tegra over to that as well.
>=20
> I think the whole ARCH_TEGRA_*_SOC approach is wrong. You don't bother
> introducing Kconfig entries for individual drivers but instead add an
> obj-*_SOC in various Makefiles under drivers/. If we ever get to a point
> where we can build (part of) the SoCs as modules (and I'm not talking
> about kernels shipped with end products but those distro kernel
> targeting development boards), we have to go back and add such Kconfig
> entries for specific drivers.

We can cross that bridge when we get to it. Currently we only use them
in the fashion you describe for essential drivers that can't be built as
modules. If that ever changes we can easily add the Kconfig entry. This
isn't as much churn as you make it out to be, after all if the Kconfig
entry already existed we'd still have to change it from bool to tristate
to make them build as modules.

Another situation in which we use these Kconfig symbols is for drivers
that have an own Kconfig entry but that support more than one SoC
generation so that we automatically strip support for SoCs for which
support isn't selected. This is especially useful to avoid building code
that will only ever work on 32-bit Tegra on 64-bit builds.

> So if you do it properly from the beginning with per-driver Kconfig
> entry, I no longer see the point of an ARCH_TEGRA_*_SOC option. It may
> be more convenient for people building end products but they should know
> better what components are required, defconfig is rarely meant for them.

Your proposal also means that we'll have to go and add separate Kconfig
entries for each SoC generation that a driver supports so that the SoC
specific bits can be disabled.

So in order to get rid of one per-SoC Kconfig entry you'd prefer us to
add per-SoC options per driver? Don't you think that's going to make
things worse rather than improve them?

There are currently three drivers (off the top of my head) where we do
this and each of them supports five existing generations plus the new
Tegra210. So rather than having six symbols to select SoC generation
support we'd be needing 18, and that's only counting existing drivers.

> I'm looking forward to a patch removing ARCH_TEGRA_132_SOC as well (you
> can keep the 32-bit arm options if you'd like).

Given the above, will you reconsider? I already proposed that we move
these under drivers/soc/tegra (though I'd like to hear Arnd's opinion on
that first), that way you wouldn't have to concern yourself with them.

Thierry

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVX0WoAAoJEN0jrNd/PrOhrvcQALxmcoMhKAgCckvE4cRDRfOX
HVWOGVpBsswKBbkuhI8Lkrn6ZePsGEsgdWzxiEisEUnmfbh0OhZeBMKCKCOSW4hB
+HVxgtohgwSfmQDZO/hbhFo2g5PvmHja+Huis/A9imYjN5r6xMngQeZukCkddhOK
JvSgDpDR78M6db00WjSTSQIwlAtWUDYF46fM4OLDOfZDf4V4CEHtzgwiMVK55Wpf
h5hOz35VPIQxJ0xXJdf+F2jKRmVWy9gSI24qsfPzYMHlVYU3sNjjTDCcwBsVji8A
hT67seqcaLxZndo3CC6nr7ChRQZwzuOR+iVLYXyMkHY+IboQGT+zSFQTIM26+pZ3
wDG50Rn6jIOzDC2UHiq58PnuOMCcBjJmtTVC2gr8dtJHg95/dLiy/lyDT3MvkW45
UbcfftVwbXTxIRJbur23nOQLxmCVv2k1QRtGj1mL6a9jHhUR1mptUbImWl4nhQWZ
O2h8YnoZlFhKBQZcSsTnzusrG24+Lv+XSjyjY3ESDbmIeh7i2iraZHyRZO/VDJWY
hIf2vhktG4P3oN4T1ODPU/VqRnrLvpdlLqqFatNGEFAPFKxl/cfQbNdnYhpeg4Sa
FagZ6Eut3bs6kWuSa375vpal0lJl7i+/LTd+UorlLAr9L2Zy2lLSG1JwA38DNnrJ
Wp99OlvGF1693iT6UYk8
=sZV4
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
