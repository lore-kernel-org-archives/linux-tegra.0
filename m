From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] arm64: tegra: Add Tegra210 support
Date: Fri, 15 May 2015 12:19:16 +0200
Message-ID: <20150515101913.GA20474@ulmo.nvidia.com>
References: <1431529065-20128-1-git-send-email-thierry.reding@gmail.com>
 <1431529065-20128-3-git-send-email-thierry.reding@gmail.com>
 <20150513171114.GA18655@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150513171114.GA18655-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2015 at 06:11:15PM +0100, Catalin Marinas wrote:
> On Wed, May 13, 2015 at 04:57:42PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > NVIDIA Tegra210 (also known as Tegra X1) has four Cortex-A57 and four
> > Cortex-A53 CPUs. Compared to Tegra124 and Tegra132 it comes with a 256-
> > core Maxwell GPU. It supports processing videos of up to 4K resolutions
> > at 60 fps (H.265, VP9, H.264).
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm64/Kconfig                       |   9 +
> >  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 998 +++++++++++++++++++++++=
++++++++
> >  2 files changed, 1007 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210.dtsi
> >=20
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 7796af4b1d6f..bfdf064ada66 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -225,6 +225,15 @@ config ARCH_TEGRA_132_SOC
> >  	  but contains an NVIDIA Denver CPU complex in place of
> >  	  Tegra124's "4+1" Cortex-A15 CPU complex.
> > =20
> > +config ARCH_TEGRA_210_SOC
> > +	bool "NVIDIA Tegra210 SoC"
> > +	depends on ARCH_TEGRA
> > +	select PINCTRL_TEGRA210
> > +	select USB_ULPI if USB_PHY
> > +	select USB_ULPI_VIEWPORT if USB_PHY
> > +	help
> > +	  Enable support for the NVIDIA Tegra210 SoC.
> > +
>=20
> The previous ARCH_TEGRA_132_SOC escaped me. Do we need all these
> ARCH_TEGRA_*_SOC entries? Can we not have per-driver Kconfig options?
> For example, ARCH_TEGRA_132_SOC seems to be only used in
> drivers/clk/tegra, a specific Kconfig entry in there would suffice.

There are actually a couple of other places where this will be used in
subsequent patches (e.g. memory controller driver). The idea behind
having these is that each one of them is used to enable the essentials
out of the box, so that people don't have to go and enable a bunch of
driver-specific Kconfig options just to get a kernel configuration that
can actually boot.

This is also useful for integrators since they can simply omit all SoC
generations that they're not interested in. Having a per-SoC option
provides an easy way of doing so.

Thierry

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVVcgfAAoJEN0jrNd/PrOhHjsQAJp8xrR33HZozhoA3F2nyWOt
gqXpQ215Wy1tA/NXHmrKF1ix/RYDtMwY4JCoqg/h0+h28JTWMU6kGCcqIIAQP1Cd
X40cqmDxYxau4PNbWc1ifDlZLBEPFaERfIuZrZM2Ku43FDtN2LaJ4W1NUhvnA8Jw
KNYJ9+cMwylXinPuEmLm0uPZ+rb7TDbsLIE7dr1itqB+56GOZxJxN4MQfHMJNbE9
ZyzDPW4dw1eZJ455mIh0pfWxhyQEQLd2K7i4+hfncq4nYQKviMaPs6lyHN1llq0g
9nMlR23w9U1+18//hlcSW1AqMW07ajxqFLzmS/5SfUB5aQV6k4kWiVCJ2hfMVG3w
w0hU+X1SVcmijDX+z22hDfZ3/D8JdcxZuTXN9pNZpCUrXlok4JH92kxBSlY6u+jH
K9CQy42BzhVJ2gV5u7Ex3IgK6mkQGZEo+R9GPs4NlAdGD+RB6aOBouuO2LDtonMm
PY5VkzZAaY3XtHjZehYDwVzyqKemkgUi0chJvc8w+Fw5DmEyPLYs5RZ8IcOv6i9k
bzjkMmWE1iwMPOC/Zp8Av7a9rMWz+WFgXXnCBvQgIuxlXTldOAZuE1MAx7tkw6Lr
4UGuOimGnpjLDc2B8hrT3Cq/waEb6uGSl84E/0w3w01VOdke/jDzbi/K0NJtetks
5hkNeUngdwxBAzczeqV1
=PpHI
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
