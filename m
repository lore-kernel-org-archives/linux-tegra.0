From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] arm64: tegra: Add Tegra210 support
Date: Tue, 19 May 2015 17:17:42 +0200
Message-ID: <20150519151740.GA28161@ulmo.nvidia.com>
References: <1431529065-20128-1-git-send-email-thierry.reding@gmail.com>
 <1431529065-20128-3-git-send-email-thierry.reding@gmail.com>
 <20150513171114.GA18655@e104818-lin.cambridge.arm.com>
 <20150515101913.GA20474@ulmo.nvidia.com>
 <20150519145211.GX21251@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150519145211.GX21251-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 03:52:11PM +0100, Catalin Marinas wrote:
> On Fri, May 15, 2015 at 12:19:16PM +0200, Thierry Reding wrote:
> > On Wed, May 13, 2015 at 06:11:15PM +0100, Catalin Marinas wrote:
> > > On Wed, May 13, 2015 at 04:57:42PM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > NVIDIA Tegra210 (also known as Tegra X1) has four Cortex-A57 and fo=
ur
> > > > Cortex-A53 CPUs. Compared to Tegra124 and Tegra132 it comes with a =
256-
> > > > core Maxwell GPU. It supports processing videos of up to 4K resolut=
ions
> > > > at 60 fps (H.265, VP9, H.264).
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  arch/arm64/Kconfig                       |   9 +
> > > >  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 998 +++++++++++++++++++=
++++++++++++
> > > >  2 files changed, 1007 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > >=20
> > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > index 7796af4b1d6f..bfdf064ada66 100644
> > > > --- a/arch/arm64/Kconfig
> > > > +++ b/arch/arm64/Kconfig
> > > > @@ -225,6 +225,15 @@ config ARCH_TEGRA_132_SOC
> > > >  	  but contains an NVIDIA Denver CPU complex in place of
> > > >  	  Tegra124's "4+1" Cortex-A15 CPU complex.
> > > > =20
> > > > +config ARCH_TEGRA_210_SOC
> > > > +	bool "NVIDIA Tegra210 SoC"
> > > > +	depends on ARCH_TEGRA
> > > > +	select PINCTRL_TEGRA210
> > > > +	select USB_ULPI if USB_PHY
> > > > +	select USB_ULPI_VIEWPORT if USB_PHY
> > > > +	help
> > > > +	  Enable support for the NVIDIA Tegra210 SoC.
> > > > +
> > >=20
> > > The previous ARCH_TEGRA_132_SOC escaped me. Do we need all these
> > > ARCH_TEGRA_*_SOC entries? Can we not have per-driver Kconfig options?
> > > For example, ARCH_TEGRA_132_SOC seems to be only used in
> > > drivers/clk/tegra, a specific Kconfig entry in there would suffice.
> >=20
> > There are actually a couple of other places where this will be used in
> > subsequent patches (e.g. memory controller driver). The idea behind
> > having these is that each one of them is used to enable the essentials
> > out of the box, so that people don't have to go and enable a bunch of
> > driver-specific Kconfig options just to get a kernel configuration that
> > can actually boot.
>=20
> We debated whether to have ARCH_* options at all on arm64 and we settled
> for the middle ground - only add them for SoC families, not individual
> SoCs. As for the kernel configuration that actually boots, we want the
> arm64 defconfig to include all the supported SoCs and drivers (though
> longer term I'd like to see more drivers built as modules by default).
>=20
> > This is also useful for integrators since they can simply omit all SoC
> > generations that they're not interested in. Having a per-SoC option
> > provides an easy way of doing so.
>=20
> The integrators could just select a SoC family and trim down unwanted
> options, I don't think they rely on the kernel defconfig for a final
> product. If this becomes an issue, I would rather have per-SoC
> defconfigs than lots of Kconfig entries.

I understand the desire to start with a clean plate on a new
architecture, but Tegra has worked like this for the past 5 years and
it's worked out really well for us. So I'm reluctant to introduce these
inconsistencies merely because 64-bit ARM now lives in a different
directory.

Are you concerned about arch/arm64/Kconfig growing wild? If so we could
easily move these configuration options outside to something like
drivers/soc/tegra/Kconfig. While at it, we could move existing options
=66rom arch/arm/mach-tegra over to that as well.

Thierry

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVW1QRAAoJEN0jrNd/PrOhBTwQAJ7EcJldW6N9kt71JQ0esHcJ
cty6r1ycxMES/sJ0rDlnAuOFDST3J7LkHFX7f1YKGFfp89ptveVbFkk/d6OvwbCZ
VLuXmRswOnEkI8lER+gevGGHkjvlGH0qTXg43Aw6btLeuEZ61zoGfkmMU8KdpN21
y5bQhcUAez/V5O5Lu/0hRUQfJ6dB11ho7mif+v5hsitcvOS+d6CBputmXDA3WSfm
ZYqZGAqJOYXyHPL7F1hruNigYsR+MFOfP3G5z8ohpCFf9lyTbZAYiFhvZd8cC45M
OeisAMqYwBhKdtC0lqNP/qHH/NNJChQrpgJs2j6jP5vjwuFGpXeHcu3TXEfKb2Vs
7Iq2T7weaW4Trq7tW+dF4g3cA8QCp/foC4wGkG2f2adiHt1iZe+ACu4eWE8gIGGV
7D2jdNJoAZoBF6AVXg/f9aMjTDzL2O2F3cL9XY3VVAlMNXg7Bpq0AusYpbQpVrUN
sst5O7QoD5XH+GxqHtOac3Pj5uFnTORgIjivWWFD9ckkSKGawQQ4vm2Y9wiZZhnP
LL3Do+rJwlBwaO/R19a9H3aLB4+MyB5NAbYpH9oQSdo5drE0zWuOEql+/8KZDNdd
euxoNVIUfcTBIv9EhLXT7sp9/RPnT9MlSJk5GHBQHgugxpCCJhoZEWI3CURZH/bP
TUjJuPIBIaj6D9EKPNWy
=2cOg
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
