From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Initialize interrupt controller from
 DT
Date: Fri, 29 Aug 2014 17:04:28 +0200
Message-ID: <20140829150422.GA11035@ulmo>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com>
 <1409239879-12376-3-git-send-email-thierry.reding@gmail.com>
 <3056623.fB9uqpleQ5@wuerfel>
 <20140829073139.GG13106@ulmo>
 <20140829142408.GA31264@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140829142408.GA31264@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2014 at 04:24:10PM +0200, Thierry Reding wrote:
> On Fri, Aug 29, 2014 at 09:31:40AM +0200, Thierry Reding wrote:
> > On Thu, Aug 28, 2014 at 06:10:55PM +0200, Arnd Bergmann wrote:
> > > On Thursday 28 August 2014 17:31:17 Thierry Reding wrote:
> > >=20
> > > >  void __init tegra_init_irq(void)
> > > >  {
> > > > -	int i;
> > > > -	void __iomem *distbase;
> > > > +	unsigned int max_ictlrs =3D ARRAY_SIZE(ictlr_regs), i;
> > > > +	const struct of_device_id *match;
> > > > +	struct device_node *np;
> > > > +	struct resource res;
> > > > +
> > > > +	np =3D of_find_matching_node_and_match(NULL, ictlr_matches, &matc=
h);
> > > > +	if (np) {
> > > > +		const struct tegra_ictlr_soc *soc =3D match->data;
> > > > +
> > > > +		for (i =3D 0; i < soc->num_ictlrs; i++) {
> > > > +			if (of_address_to_resource(np, i, &res) < 0)
> > > > +				break;
> > > > +
> > > > +			ictlr_regs[i] =3D res;
> > > > +		}
> > > > +
> > > > +		WARN(i !=3D soc->num_ictlrs,
> > > > +		     "Found %u interrupt controllers in DT; expected %u.\n",
> > > > +		     i, soc->num_ictlrs);
> > > > +
> > > > +		max_ictlrs =3D soc->num_ictlrs;
> > > > +		of_node_put(np);
> > > > +	} else {
> > > > +		/*
> > > > +		 * If no matching device node was found, fall back to using
> > > > +		 * the chip ID.
> > > > +		 */
> > > > +
> > > > +		/* Tegra30 and later have five interrupt controllers, ... */
> > > > +		max_ictlrs =3D ARRAY_SIZE(ictlr_regs);
> > > > +
> > > > +		/* ..., but Tegra20 only has four. */
> > > > +		if (of_machine_is_compatible("nvidia,tegra20"))
> > > > +			max_ictlrs--;
> > > > +	}
> > >=20
> > > How about moving the entire file to drivers/irqchip and using the
> > > IRQCHIP_DECLARE() helper for the DT case?
> > >=20
> > > For the fallback, you can have an entry into that file that just takes
> > > the address and number, which you can call from platform code here.
> >=20
> > I think I did try that at some point, but there were issues that I don't
> > remember. I'll give it another shot.
>=20
> So I got pretty far with this and the system still boots. But for some
> reason suspend/resume is now broken. The difference seems to be that
> earlier the legacy interrupt controller would be registered first, and
> the GIC second. When the legacy interrupt controller is initialized
> after the GIC (which happens when I use IRQCHIP_DECLARE), then suspend
> and resume won't work (for some yet unknown reason). Unfortunately the
> of_irq_init() code is too clever, so I can't even work around it by
> changing link order or device tree order.
>=20
> I'll see if I can find out what causes this combination to malfunction
> when initialized in the opposite order.

The reason for why ordering matters is this line from the GIC driver
(see drivers/irqchip/irq-gic.c):

	static int gic_init_bases(...)
	{
		...
		gic_chip.flags |=3D gic_arch_extn.flags;
		...
	}

So there's an implicit dependency on having the architecture-specific
extension initialized before the GIC.

If I manually add in the flags set by the LIC (IRQCHIP_MASK_ON_SUSPEND)
the suspend/resume issue that I observed goes away.

Perhaps a better way to handle this would be to add an API that GIC IRQ
extensions can use to register with the GIC independent of the
initialization order?

In this particular case something like:

	void gic_arch_register(unsigned long flags)
	{
		gic_chip.flags |=3D flags;
	}

would work irrespective of the ordering. But perhaps something more
elaborate would be more futureproof:

	void gic_arch_register(const struct irqchip *extn)
	{
		gic_chip.flags |=3D extn->flags;
		gic_arch_extn =3D *extn;
	}

Or perhaps gic_arch_extn could be turned into a pointer so that checks
for already registered extension drivers can be more easily done. That
is:

	static struct irq_chip *extn;

	void gic_arch_register(const struct irqchip *chip)
	{
		if (WARN(extn !=3D NULL))
			return;

		gic_chip.flags |=3D chip->flags;
		extn =3D chip;
	}

Any preferences, or other ideas? Adding Thomas and Jason, perhaps they
can provide more input on how to solve this.

Thierry

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUAJZ1AAoJEN0jrNd/PrOhRswQALDveqAmo8UgI3S3J97ppeHc
tnwr7zghGMiEU8Gst5+neRvDt2dM4vm4yLliuopY0DNDNg6UpSWI/rTDYC3/V+D6
101RX6//SPSbZ3BJ649bwVncvYDjjzfgcxqJGBSmTUa4NUxzSQjQJWKEyu0d3kwW
af+0ATeB2hLTD64qFhufe5lWaOxvnuBJP9Mx7Wf6T0s84vnY0qgdKWRbCjK74qU7
Ee6HQsztpQ0jhbEr6ujzf1rE3KCt6Qkre99uT0K0RF2QkgRnffNfgu/3h7jy6bvv
or0TgU4cOhdvXU3CDKERfaD6ddHDLHQyKs2l80ioHgzMZji9Dd8VCmY7Om2JVj8O
zxspDGVGMWOmgSQ6k7YaVQaexeQhBQfuSRCGulIWzbzT6gCHodIx1RHierczON0q
NDFjVolbzGvbINqCWM4sT3w3DEUF/aBt8v6ioagVCkmkbb/L/7MqvY5aXzt6r9ss
BEaEUFd1LmGLQBcBy9axPKYKQxHNNaMMIW2dtIHM1hki7EYvRpPcGmAQeCX8mqmY
ko8sfwul36jspN8ZJUBwZLr/Cb9k6Tk0vmbp7RNYmSCQtiesMpA4ZwPhsRr83lGC
DCAHEF3JptxMEt3bMF+wkv1cbx5JZ5eVhIP2zJO8N7QpRp0jpra9Lj0UJ8in/nF+
iIkt1URSwMS0P0mL9UdE
=9z+0
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
