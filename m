From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 6/9] gpio: Add support for hierarchical IRQ domains
Date: Tue, 25 Sep 2018 13:17:16 +0200
Message-ID: <20180925111716.GA7925@ulmo>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <20180921102546.12745-7-thierry.reding@gmail.com>
 <CACRpkdYnrf7FknvnZyFSgfT5aCrcWT4hxSnQo0UqxYfR6Fkqwg@mail.gmail.com>
 <20180925093315.GB7097@ulmo>
 <CACRpkdbOpVPB5MqgCyF5x_ENzLscz5oYEstYqwVceqeKZq2w5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbOpVPB5MqgCyF5x_ENzLscz5oYEstYqwVceqeKZq2w5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 12:33:54PM +0200, Linus Walleij wrote:
> On Tue, Sep 25, 2018 at 11:33 AM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Tue, Sep 25, 2018 at 10:11:06AM +0200, Linus Walleij wrote:
>=20
> > > While I think it is really important that we start supporting hierarc=
hical
> > > irqdomains in the gpiolib core, I want a more complete approach,
> > > so that drivers that need hierarchical handling of irqdomains
> > > can get the same support from gpiolib as they get for simple
> > > domains.
> (...)
> > > I can't see if you need to pull more stuff into the core to accomplish
> > > that, but I think in essence the core gpiolib needs to be more helpful
> > > with hierarchies.
> >
> > This is not as trivial as it sounds. I think we could probably provide a
> > simple helper in the core that may work for the majority of GPIO
> > controllers, and would be similar to irq_domain_xlate_twocell(). The
> > problem is that ->gpio_to_irq() effectively needs to convert the offset
> > of the pin in the GPIO controller to an IRQ specifier. If the IRQ domain
> > can use irq_domain_xlate_twocell(), that should be easy, but if it does
> > not, then we likely need a custom implementation as well.
>=20
> This sounds a lot like the "gpio-ranges" we have in the
> gpiochip DT bindings, mapping gpio offsets to pin offsets.
>=20
> I assume that we could just introduce a cross-mapping
> array from IRQ to IRQ in struct gpio_irq_chip for the
> hierarchical irqchip? Is it any
> more complicated than an array of [(int, int)] tuples?
>=20
> I guess this is what you have in mind for twocell?

For twocell I think it would be even easier, because the IRQ specifier
can just be reconstructed from (offset, irq_type). That's all the simple
two-cell does, right? It's a 1:1 mapping of specifier to GPIO offset to
IRQ offset.

> > For example, as you may remember, the Tegra186 GPIO controller is
> > somewhat quirky in that it has a number of banks, each of which can have
> > any number of pins up to 8. However, in order to prevent users from
> > attempting to use one of the non-existent GPIOs, we resorted to
> > compacting the GPIO number space so that the GPIO specifier uses
> > basically a (bank, pin) pair that is converted into a GPIO offset. The
> > same is done for interrupt specifiers.
>=20
> I guess this stuff is what you refer to?
>=20
> #define TEGRA_MAIN_GPIO_PORT(port, base, count, controller)     \
>         [TEGRA_MAIN_GPIO_PORT_##port] =3D {                       \
>                 .name =3D #port,                                  \
>                 .offset =3D base,                                 \
>                 .pins =3D count,                                  \
>                 .irq =3D controller,                              \
>         }
>=20
> static const struct tegra_gpio_port tegra186_main_ports[] =3D {
>         TEGRA_MAIN_GPIO_PORT( A, 0x2000, 7, 2),
>         TEGRA_MAIN_GPIO_PORT( B, 0x3000, 7, 3),
>         TEGRA_MAIN_GPIO_PORT( C, 0x3200, 7, 3),
>         TEGRA_MAIN_GPIO_PORT( D, 0x3400, 6, 3),
> (...)
>=20
> Maybe things have changed slightly.
>=20
> As I see it there are some ways to go about this:
>=20
> 1. Create one gpiochip per bank and just register the number of
> GPIOs actually accessible per bank offset from 0. This works
> if one does not insist on having one gpiochip covering all pins,
> and as long as all usable pins are stacked from offset 0..n.
> (Tegra186 doesn't do this, it is registering one chip for all.)
>=20
> 2. If the above cannot be met, register enough pins to cover all
> (e.g. 32 pins for a 32bit GPIO register) then mask off the
> unused pins in .valid_mask in the gpio_chip. This was fairly
> recently introduced to add ACPI support for Qualcomm, as
> there were valid, but unusable GPIO offsets, but it can be
> used to cut arbitrary holes in any range of offsets.
>=20
> 3. Some driver-specific way. Which seems to be what Tegra186
> is doing.
>=20
> Would you consider to move over to using method (2) to
> get a more linear numberspace? I.e. register 8 GPIOs/IRQs
> per port/bank and then just mask off the invalid ones?
> .valid_mask in gpio_chip can be used for the GPIOs and
> .valid_mask in the gpio_irq_chip can be used for IRQs.
>=20
> Or do you think it is nonelegant?

This is all pretty much the same discussion that I remember we had
earlier this year. Nothing's changed so far.

Back at the time I had pointed out that we'd be wasting a lot of memory
by registering 8 GPIOs/IRQs per bank, because on average only about 60-
75% of the GPIOs are actually used. In addition we waste processing
resources by having to check the GPIO offset against the valid mask
every time we want to access a GPIO.

I think that's inelegant, but from the rest of what you're saying you
don't see it that way.

> > Since there is no 1:1 relationship between the value in the specifier
> > and the GPIO offset, we can't use irq_domain_xlate_twocell().
>=20
> Am I right that if you switch to method (2) above this is solved
> and we get rid of the custom tegra186 xlate function =3D=3D big win?
>=20
> > I think we can probably just implement the simple two-cell version in
> > gpiochip_to_irq() directly and leave it up to drivers that require
> > something more to override ->to_irq().
>=20
> And if what I assume (in my naive thinking) you can do with
> .valid_mask is correct, then you can convert tegra186 to use
> common twocell translation.
>=20
> Sorry for being a pest, I just have a feeling we are reinventing
> wheels here, I really want to pull as many fringe cases as
> possible into gpiolib if I can so the maintenance gets
> simpler.

Like I said, we had this very discussion a couple of months ago, and I
don't think I want to go through all of it again. I think, yes, I could
make Tegra186 work with .valid_mask, even if I consider it wasteful. So
if that's what you want, I'll go rewrite the driver so we'll never have
to repeat this again.

Thierry

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluqGToACgkQ3SOs138+
s6ERHw//XDTW9nxwCPEzsbYFKRwbfu9e7mm8/PI/iu5Gxu1K+4SMa9F++wDJ7OB/
/NoUJU3+dzs+Gft0BqtuTuNzaLXh/J7uTo8KOmUM321oG5zsg/iYbfNDmLgTBVlP
1gDymYvzoKgqhpEoj7dFpLk7UINeJ74mYRJGqdHIqJ2nh9MN+GLM9m/Lbi4mbv42
g3w9/Muuv4U3tVrT1pEiBfDyTCmHwKzqP+Vj7i+t8Z2xoyR3PJBYKK4EXO4d40u7
NnrWmudrzDnchj41GG5Ufpe/VwLtqmsiAfCXIZBMWItFDpTosc8E+6/l1Loq6YvQ
MJd+ASxp0qteKmWXwaJPGfM4X9zT4YmM6w+hCc6thAZ+UtOCnnFAHioEobYwvODw
0taQFrNh/iLtpX29Zrwyl1vArG9yKPtFJBD6xT3O2fU3ZVAQPZyp2kvQ62xwVToT
1620TgkIR1OoSobvUPBsVNZetoaENV3UaRULb+Vf/yfGFHC/vmTKXIwZk1m7ELvc
mhZH1bQFg9TAcBqt8jva5Yz0yKAoYA8wiMcMCrb2oIi80iH3wDROxaBbGH3intiV
ju7F1tH7PHlbLbMwxfNqx96BFnsYJ6H3vP+aqohpJdgqmMKUAbnBkbuBNa8toeeQ
vFULXxlIhIFuuD4Hfw4a3gP1BpCOQT+Nzhnq7sUf1nPA+pRKK2o=
=+PDr
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
