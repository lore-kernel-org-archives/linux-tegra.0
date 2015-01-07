From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] mtd: nand: add NVIDIA Tegra NAND Flash controller
 driver
Date: Wed, 7 Jan 2015 14:45:47 +0100
Message-ID: <20150107134545.GC6988@ulmo>
References: <1420403960-26626-1-git-send-email-dev@lynxeye.de>
 <54AC290B.5000606@vanguardiasur.com.ar>
 <1420590278.25483.14.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420590278.25483.14.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 01:24:38AM +0100, Lucas Stach wrote:
> Am Dienstag, den 06.01.2015, 15:27 -0300 schrieb Ezequiel Garcia:
> > On 01/04/2015 05:39 PM, Lucas Stach wrote:
[...]
> > > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > > index 7d0150d..1eafd4e 100644
> > > --- a/drivers/mtd/nand/Kconfig
> > > +++ b/drivers/mtd/nand/Kconfig
> > > @@ -524,4 +524,10 @@ config MTD_NAND_SUNXI
> > >  	help
> > >  	  Enables support for NAND Flash chips on Allwinner SoCs.
> > > =20
> > > +config MTD_NAND_TEGRA
> > > +	tristate "Support for NAND on NVIDIA Tegra"
> > > +	depends on ARCH_TEGRA || COMPILE_TEST

I think you're going to need a bunch more dependencies if you use
COMPILE_TEST. Otherwise we're going to get all kinds of build failure
reports.

> > > diff --git a/drivers/mtd/nand/tegra_nand.c b/drivers/mtd/nand/tegra_n=
and.c
[...]
> > > +struct tegra_nand {
> > > +	void __iomem *regs;
> > > +	int irq;
> >=20
> > Seems like you don't need to store irq.
> >=20
> > > +	struct clk *clk;
> > > +	struct reset_control *rst;
> > > +	int wp_gpio;
> > > +	int buswidth;
> >=20
> > And also you don't seem to need either wp_gpio or buswidth stored
> > in the struct. You only use them at probe time.
> >=20
>=20
> I'll keep the wp_gpio, as I still hope to use this to WP the NAND when
> no write is pending. I'll fix the others.

Maybe use the gpiod_*() API since the old one is new deprecated?

> > > +static const struct of_device_id tegra_nand_of_match[] =3D {
> > > +	{ .compatible =3D "nvidia,tegra20-nand" },
> > > +	{ .compatible =3D "nvidia,tegra30-nand" },
> >=20
> > AFAIK, having two compatible strings, but making no distinction between
> > them is typically frowned upon by devicetree maintainers.
> >=20
> > Is the controller any different in tegra20 and tegra30?
> >=20
> > If you are not sure about the controllers being different, you can
> > try the following approach. The devicetree is written like this:
> >=20
> > nand@foo {
> >    compatible =3D "nvidia,tegra20-nand", "nvidia,tegra-nand";
> > };
> >=20
> > So you only deal with "nvidia,tegra-nand" in the driver, yet the
> > devicetree files are prepared to deal with a difference.

I think it's been more common to have something like this:

	tegra20.dtsi:

		nand-controller@70008000 {
			compatible =3D "nvidia,tegra20-nand";
			...
		};

	tegra30.dtsi:

		nand-controller@70008000 {
			compatible =3D "nvidia,tegra30-nand", "nvidia,tegra20-nand";
			...
		};

The idea being that if the Tegra30 variant is indeed compatible with the
Tegra20 variant, the driver can match on "nvidia,tegra20-nand". But at
the same time the DTB has the more specific compatible in case the
driver ever needs to handle generation-specific quirks, or implement any
additional functionality added in Tegra30 that wasn't available in early
generations.

> I believe that tegra30-nand is actually a bit different from tegra20 (at
> least on more clock I know about), but obviously this driver doesn't
> handle those differences and I don't know if I ever get to see Tegra30
> hardware with NAND. Given that I think it's best to just remove the
> tegra30-nand compatible for now and add it back if someone has hardware
> to test with.

Yes, that sounds like the best option for now.

Thierry

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrTiJAAoJEN0jrNd/PrOhFjQP/1KGx087z3ndzd7vWdqL5kvS
a/2DNzDhC6qheZzE8K3JLOHHsonQr+kM4sbzApamdA0DxHwEtMUuvTBvERnmywSV
Uu8iTN7MGpZETfQm7T+yU9j7P4vjoetAwozv7kF+RZIMo9hwxdmTh7quFaM6xRVU
WNV0ZhL9bFXNHsrDmOA1z3AisaMpbt3fCbqC+oIksWcxVQ3jImoSqvzeiEvqf5l5
cKNO7E3v3sCG9pahlhKMczDdXL4I6zYr1qaNT4v9C4YcJj2RoqAyOxX78++wf8MR
dLdQEfZfXs+ItFunv5CR7wd6Sh+1pz+z/srXKjWoBCKmm8akyTF5JNcvid836Fia
DnnUycuvtFwOA+RdlzO2+wNQOl4KPY8z8afmJdElC+eezfaIZPXL/T7J+eraf9B/
kNlQYAhZhNPokDR4AuRaZKlVFNBlGwGlS2rxET4rUEpxRptfJPUN1r0o95eggiaQ
69XBePgZYlEyusmZ8wavyiKpXOYT0s9wnHT4WmdLgieNN1Xtl7e8ENWun1aqc1FO
kXaNTO0S+sxiN4m8x+Hp0G6vB2joFCoXgAJ5fvtVmznySzcrdhg6ALIRpV+dUkCj
nBOIbrCd7x65EuVv3ATqZtVshOQKM7HAXNBrUBESnm+Y7nhP9pKj/kMkVSm7hDzi
bGoNd/s8wCFjaYYtfTK7
=ypgE
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
