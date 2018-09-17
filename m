From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Multi-parent IRQ domains
Date: Mon, 17 Sep 2018 11:52:22 +0200
Message-ID: <20180917095222.GA27927@ulmo>
References: <20180913155945.GA19903@ulmo>
 <alpine.DEB.2.21.1809141211200.1473@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1809141211200.1473@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2018 at 12:31:18PM +0200, Thomas Gleixner wrote:
> On Thu, 13 Sep 2018, Thierry Reding wrote:
> > I've been trying to implement a feature on recent Tegra chips that's
> > called "wake events". These wake events are implemented as part of the
> > power management controller (PMC) and they control which events can be
> > used to wake the system from suspend. Events include things like an
> > alarm interrupt from an RTC, or the GPIO interrupt hooked up to a
> > power button for example.
> >=20
> > We already have a driver for a couple of other things that the PMC does,
> > so I thought it'd be natural to implement this functionality as an IRQ
> > chip in the PMC driver. The way that this would work is that for all the
> > devices that are wakeup sources, we'd end up specifying the PMC as the
> > interrupt parent and the PMC would then itself have the main GIC as its
> > parent. That way, the hierarchical IRQ domain infrastructure would take
> > care of pretty much everything.
> >=20
> > Unfortunately I've run into some issues here. One problem that I'm
> > facing is that PMC could have more than one parent. For example, the RTC
> > alarm interrupt goes straight to the GIC, but the power button GPIO goes
> > through the GPIO controller first and then to the GIC. This doesn't seem
> > to be something that's currently possible.
>=20
> So what you are saying is that the RTC is directly wired up to the GIC and
> the GPIO interrupts are demultiplxed by a single GIC interrupt first, but
> at the same time have the requirement to talk to the PMC.

Yes, that's correct. Technically the GPIO controllers can have multiple
parent interrupts at the GIC, but I don't think that's relevant to the
discussion. Just mentioning it for completeness.

> Lets look at the current implementation without taking PMC into account.
>=20
> - RTC gets its interrupt directly from the GIC domain
>=20
> - GPIO gets its interrupt from the GPIO domain. The GPIO domain does not
>   have a parent domain. It is stand alone because it sets up a demultiplex
>   interrupt from the GIC domain.
>=20
>   So there is absolutely no irqdomain relationship between a single GPIO
>   and the GIC. The indirection through the demultiplex interrupt does not
>   create one, really.
>=20
> Now, you need the PMC for both, the GPIOs and the RTC. What you can do he=
re
> is to provide two irq domains in PMC. One which has GIC as its parent and
> one which has no parent. Surely they need to share some resources, but
> that should be a solvable problem.

I think I have this working to some degree, finally. GPIO is still
proving difficult, but RTC seems to be working fine. I've currently
solved this by making the PMC an interrupt controller and then have
an interrupt-map property in its device tree node that lists those
wake events that we're interested in. It looks something like this:

	pmc: pmc@c360000 {
		compatible =3D "nvidia,tegra194-pmc";
		reg =3D <0x0c360000 0x10000>,
		      <0x0c370000 0x10000>,
		      <0x0c380000 0x10000>,
		      <0x0c390000 0x10000>,
		      <0x0c3a0000 0x10000>;
		reg-names =3D "pmc", "wake", "aotag", "scratch", "misc";

		#interrupt-cells =3D <1>;
		interrupt-controller;

		interrupt-map =3D /*<29 &gpio_aon TEGRA194_AON_GPIO(EE, 4)
					      IRQ_TYPE_LEVEL_HIGH>,*/
				<73 &gic GIC_SPI 10
					 IRQ_TYPE_LEVEL_HIGH>;
	};

Note that I've commented out the GPIO wake event (this is for the power
button) because that currently crashes in the GPIO driver, probably
because I misunderstood how to properly implement this.

> Now you connect RTC to the GIC parented one and let the PMC irq chip just
> hand through, except for the set_wake() functionality.

I've solved this in the following way:

	for (i =3D 0; i < pmc->num_wake_parents; i++) {
		struct tegra_wake_parent *parent;
		struct irq_chip *chip;

		parent =3D &pmc->wake_parents[i];

		chip =3D &parent->chip;
		chip->name =3D dev_name(pmc->dev);
		chip->irq_eoi =3D irq_chip_eoi_parent;
		chip->irq_mask =3D irq_chip_mask_parent;
		chip->irq_unmask =3D irq_chip_unmask_parent;
		chip->irq_retrigger =3D irq_chip_retrigger_hierarchy;
		chip->irq_set_wake =3D tegra_pmc_irq_set_wake;
		chip->irq_set_type =3D irq_chip_set_type_parent;
		chip->irq_set_affinity =3D irq_chip_set_affinity_parent;

		parent->domain =3D irq_domain_add_hierarchy(parent->domain, 0,
							  parent->num_events,
							  pmc->dev->of_node,
							  &tegra_pmc_irq_domain_ops,
							  pmc);
		if (!parent->domain) {
			dev_err(pmc->dev, "failed to allocate domain\n");
			return -ENOMEM;
		}
	}

The pmc->num_wake_parents is the number of unique wake parents that we
have in the interrupt-map property.

I think this is what you were suggesting, we override ->irq_set_wake()
and pass through everything else.

> The GPIO domain is connected to the parentless PMC domain and the irq chip
> merily provides the set_wake() stuff and everything else is a noop.
>=20
> So GPIO ends up as a hierarchy which is still not connected to the GIC
> directly.

When I use the above code on the PMC/GPIO domain, then I see crashes
because the GPIO controller doesn't implement things like the ->alloc()
callback for its IRQ domain. But perhaps this is what I misunderstand.
Are you saying that for the case of GPIO I can just *not* pass through
all other operations and just let them be NULL? So that the only
callback will be ->irq_set_wake()? What I don't quite understand is how
the IRQ code would know how to properly set up the GPIO interrupt in
that case. For example, if I have this:

	gpio_aon: gpio@c2f0000 {
		...
	};

	pmc: pmc@c360000 {
		...
	};

	gpio-keys {
		...

		power {
			...
			gpios =3D <&gpio_aon TEGRA194_AON_GPIO(EE, 4)
					   GPIO_ACTIVE_LOW>;
			interrupt-parent =3D <&pmc>;
			interrupts =3D <29>;
			...
		};
	};

In the above, gpio-keys will only set up a handler for the PMC interrupt
and will therefore not process any interrupts from the GPIO line. If we
don't set up a parent/child relationship between PMC and GPIO, how does
the IRQ code know how to translate the PMC/29 interrupt to the one from
the GPIO controller? The PMC controller itself doesn't generate any
interrupts for wake events, so there's no interrupt handler from which
we could do any demultiplexing.

Thierry

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlufeVMACgkQ3SOs138+
s6EnaQ//dY0WOtYrg+p3kJeAVoqOyBmtcp1oESZz/InO53nQdtVb3D+kJMKYq0NK
/LhyBxeLonDxUKayf7HGZdleExMMRX6EkuKg7Vl7t3X+BBnnFvL8KiwIVkrHr79d
3ZxwUFKLrcP5aD/a42JWH4m48rR9g50g4BfETjgOpiT23e4AKfF+BUuAF3pylSeh
pK4ir9KSlE9Ns4BK6jmnfFhrfOa5FLtrLcZe2Y7hqBq0qWfI05ItC1p3c5JD2Tch
PTJf4IXUC75gLUXqpbgg9JRTESO7C4iYTWrlwZmUdJueTcJwwxuNmhO9kzggoGvw
843T+fkZib87TOYfVjhZKCwC6U1TXxaYLcqaYuIPBM4k/pcgYCKpl7TC31+UEIRX
IwgEapCvOMYMaq8dpO5iqxtDFEOuI/k5DtQM4YDYlVq/3WFwYgSyN2Y0eBYwWXuY
2EZN9l1rI/0+QVOhZRSqcNT+4K9njS6ceH2FwIDI1adKWSQrppx1aHZaZxSZW2+f
2Y5r/vN1QmTY3a5FoxiZuSMyY8813ie5zoVJWzrfgvGks5v0yyG5YEmWNgYTK8H4
YSWSObB/6WiuDevoUcUXS8m3Rez8UYXuDkK3XdnSvKw6tsjlXFx0FshA+A/Iadoh
yN5MHNQPjCRTSdrVAPIOJtYCicV/ZKcI09ClaZqvqsbb82eAISY=
=+DVE
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
